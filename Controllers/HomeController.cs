using System;
using System.Net;
using System.ComponentModel.Design;
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using PreguntadORT.Models;
using System.Linq.Expressions;
using System.IO;
using Microsoft.AspNetCore.Hosting;

namespace PreguntadORT.Controllers;

public class HomeController : Controller
{
    private IWebHostEnvironment Environment;
    private readonly ILogger<HomeController> _logger;
    public HomeController(IWebHostEnvironment _environment)
    {        
        Environment = _environment;
    }

    public IActionResult Index()
    {
        Juego.InicializarJuego();
        ViewBag.Categorias = Juego.ObtenerCategorias();
        ViewBag.Dificultades = Juego.ObtenerDificultades();
        return View();
    }

    [HttpGet] public IActionResult Comenzar(string userName, int dificultad, int categoria){
        
        Juego.CargarPartida(userName, dificultad, categoria);
        Juego.ComenzarTimer();
        return RedirectToAction("Jugar","Home");
    }

    public IActionResult Jugar(){  
        Pregunta pregunta = Juego.ObtenerProximaPregunta(); 
        if(pregunta != null){
            List<Respuesta> resp = Juego.ObtenerProximasRespuestas(pregunta.IdPregunta);
            ViewBag.Respuestas = resp;
            ViewBag.Pregunta = pregunta;            
            return View();
        }
        Juego.Fin = true;
        DateTime now = DateTime.Now;
        Puntaje newPuntaje = new Puntaje(Juego.PuntajeActual, Juego.Username, now, Juego.Segundos);
        BD.AgregarPuntaje(newPuntaje);
        Juego.FinalizarTimer();
        
        return View("Fin");
    }    

    public bool VerificarRespuesta(int idPregunta, int idRespuesta){

        bool resultado = Juego.VerificarRespuesta(idPregunta, idRespuesta);
        BD.ActualizarContadorSeleccionada(idRespuesta);
        return resultado;

        

        /*

        if(Juego.VerificarRespuesta(idPregunta, idRespuesta)){
            
            return ViewBag.RespuestaCorrecta = idRespuesta;   
            //ViewBag.RespuestaIncorrecta = -1;
        }
        else{
            //ViewBag.RespuestaIncorrecta = idRespuesta;
            foreach(Respuesta respu in resp){
                if(respu.Correcta == true){
                    return ViewBag.RespuestaCorrecta = respu.IdRespuesta;
                }
            }
        }

        return -1; */
        

        //ViewBag.Respuestas = resp;
        //ViewBag.Pregunta = pregunta;         
        
    }

    public IActionResult Highscores(){
        ViewBag.listaPuntajes = BD.ObtenerPuntajes();
        Juego.Fin = true;
        return View();
    }

    public IActionResult Preguntas(){

        ViewBag.Preguntas = BD.ObtenerPreguntas(-1,-1);
        ViewBag.Categorias = BD.ObtenerCategorias();
        ViewBag.Dificultades = BD.ObtenerDificultades();
        return View();
    }

    public IActionResult EliminarPregunta(int IdPregunta){
        BD.EliminarPregunta(IdPregunta);             
        return RedirectToAction("Preguntas","Home");
    }

    public IActionResult AgregarPregunta(){

        ViewBag.Categorias = BD.ObtenerCategorias();
        ViewBag.Dificultades = BD.ObtenerDificultades();      
        return View();
    }

    public IActionResult AgregarRespuesta(int IdPregunta){

        ViewBag.IdPregunta = IdPregunta;   
        return View();
    }

    [HttpPost] public IActionResult GuardarPregunta(int IdCategoria, int IdDificultad, string Enunciado, IFormFile Foto){         

        if(Foto.Length > 0)
        {
            string wwwRootLocal = this.Environment.ContentRootPath + @"\wwwroot\preguntas\" + Foto.FileName;
            using(var stream = System.IO.File.Create(wwwRootLocal)){
                
                Foto.CopyToAsync(stream);
            }
        } 

        Pregunta newPreg = new Pregunta(IdCategoria, IdDificultad, Enunciado, ("/preguntas/" + Foto.FileName));
        BD.AgregarPregunta(newPreg);

        return RedirectToAction("Preguntas","Home");
        
    }   

    [HttpPost] public IActionResult GuardarRespuesta(int IdPregunta, string Contenido, bool Correcta){         
        
        int cont = 0;
        List<Pregunta> listaPreguntas = new List<Pregunta>();
        listaPreguntas = BD.ObtenerPreguntas(-1,-1);
        ViewBag.listaRespuestas = BD.ObtenerRespuestas(listaPreguntas);        
        foreach(Respuesta resp in ViewBag.listaRespuestas){
            if(resp.IdPregunta == IdPregunta){
                cont++;
            }
        }        

        Respuesta newResp = new Respuesta(IdPregunta, cont+1, Contenido, "", Correcta, 0);
        BD.AgregarRespuesta(newResp);    
        return RedirectToAction("Preguntas","Home");
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
