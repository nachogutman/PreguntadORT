using System.Dynamic;
using Microsoft.VisualBasic.CompilerServices;
using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace PreguntadORT.Models{

    public static class Juego{

        static string _username = "";
        static int _puntajeActual = 0;
        static int _cantidadPreguntasCorrectas = 0;
        static List<Pregunta> _preguntas = new List<Pregunta>();
        static List<Respuesta> _respuestas = new List<Respuesta>();     
        
                         
        public static string Username{
            get{return _username;}           
        }

        public static int PuntajeActual{
            get{return _puntajeActual;}
        }

        public static int CantidadPreguntasCorrectas{
            get{return _cantidadPreguntasCorrectas;}
        }

        public static List<Pregunta> Preguntas{
            get{return _preguntas;}
            
        }

        public static List<Respuesta> Respuestas{
            get{return _respuestas;}
        }        

        
        public static void InicializarJuego(){



        }

        public static List<Categoria> ObtenerCategorias(){
            return BD.ObtenerCategorias();
        }

        public static List<Dificultad> ObtenerDificultades(){
            return BD.ObtenerDificultades();
        }         

        public static void CargarPartida(string username, int dificultad, int categoria){
            _preguntas = BD.ObtenerPreguntas(dificultad, categoria);
            _respuestas = BD.ObtenerRespuestas(_preguntas);            

        }

        public static Pregunta ObtenerProximaPregunta(){

        }

        public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta){

        }

        public static bool VerificarRespuesta(int idPregunta, int idRespuesta){
            if(_respuestas[idRespuesta].Correcta == true)
        }



        

    }
}