﻿using System.ComponentModel.Design;
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using PreguntadORT.Models;

namespace PreguntadORT.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
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
        Juego.FinalizarTimer();
        return View("Fin");
    }

    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta){

        Pregunta pregunta = Juego.ObtenerProximaPregunta(); 
        List<Respuesta> resp = Juego.ObtenerProximasRespuestas(pregunta.IdPregunta);

        BD.ActualizarContadorSeleccionada(idRespuesta);

        if(Juego.VerificarRespuesta(idPregunta, idRespuesta)){
            ViewBag.RespuestaCorrecta = idRespuesta;
            ViewBag.RespuestaIncorrecta = -1;
        }
        else{
            ViewBag.RespuestaIncorrecta = idRespuesta;
            foreach(Respuesta respu in resp){
                if(respu.Correcta == true){
                    ViewBag.RespuestaCorrecta = respu.IdRespuesta;
                }
            }
        }

        ViewBag.Respuestas = resp;
        ViewBag.Pregunta = pregunta;
        ViewBag.FueRespondida = true;

        
        
        return View("Jugar");
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
