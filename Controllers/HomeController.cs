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
        return View();
    }


    public IActionResult ConfigurarJuego(){
        BD.InicializarJuego();
        ViewBag.Categorias = BD.ObtenerCategorias();
        ViewBag.Dificultades = BD.ObtenerDificultades();
        return View();
    }

    public IActionResult Comenzar(string userName, int dificultad, int categoria){
        Juego.CargarPartida(userName, dificultad, categoria);
        return RedirectToAction("Jugar","Home");
    }

    public IActionResult Jugar(){
        if(BD.ObtenerProximaPregunta() != " "){
            ViewBag.Pregunta = BD.ObtenerProximaPregunta();
            ViewBag.Respuesta = BD.ObtenerProximasRespuestas();
            return View("Juego");
        }

        return View("Fin");
    }

    [HttpPost] IActionResult VerificarRespuesta(int idPregunta, int idRespuesta){
        ViewBag.Respuesta = Juego.VerificarRespuesta(idPregunta, idRespuesta);
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
