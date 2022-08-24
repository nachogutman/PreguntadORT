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


    public IActionResult ConfigurarJuego(){

        return View();
    }

    public IActionResult Comenzar(string userName, int dificultad, int categoria){
        Juego.CargarPartida(userName, dificultad, categoria);
        return RedirectToAction("Jugar","Home");
    }

    public IActionResult Jugar(){  
        if(Juego.ObtenerProximaPregunta() != null){     
            Pregunta pregunta = Juego.ObtenerProximaPregunta();     
            ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(pregunta.IdPregunta);
            ViewBag.Pregunta = pregunta;
            return View("Juego");
        }
        return View("Fin");
    }

    [HttpPost] IActionResult VerificarRespuesta(int idPregunta, int idRespuesta){
        ViewBag.EsCorrecta = Juego.VerificarRespuesta(idPregunta, idRespuesta);
        return View("Respuesta");
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
