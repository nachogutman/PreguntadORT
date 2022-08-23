using System.Dynamic;
using Microsoft.VisualBasic.CompilerServices;
using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace PreguntadORT.Models{

    public static class Juego{

        private static string _username = "";
        private static int _puntajeActual = 0;
        private static int _cantidadPreguntasCorrectas = 0;
        private static List<Pregunta> _preguntasSinMezclar = new List<Pregunta>();
        private static List<Pregunta> _preguntas = new List<Pregunta>();
        private static List<Respuesta> _respuestas = new List<Respuesta>();     

                         
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

            _username = "";
            _puntajeActual = 0;
            _cantidadPreguntasCorrectas = 0;
            _preguntas.Clear();
            _respuestas.Clear();            

        }

        public static List<Categoria> ObtenerCategorias(){
            return BD.ObtenerCategorias();
        }

        public static List<Dificultad> ObtenerDificultades(){
            return BD.ObtenerDificultades();
        }         

        public static void CargarPartida(string username, int dificultad, int categoria){

            int indiceAleatorio;
            Pregunta temporal = new Pregunta();
            _preguntasSinMezclar = BD.ObtenerPreguntas(dificultad, categoria);

            int longitudLista = _preguntasSinMezclar.Count();
            for(int i = 0; i < longitudLista; i++){
                Random random = new Random();
                indiceAleatorio = random.Next(1,longitudLista);
                temporal = _preguntasSinMezclar[i];
                _preguntasSinMezclar[i] = _preguntasSinMezclar[indiceAleatorio];
                _preguntasSinMezclar[indiceAleatorio] = temporal;
            }

            _preguntas = _preguntasSinMezclar;
            _respuestas = BD.ObtenerRespuestas(_preguntas);   
            _username = username;
        }

        public static Pregunta ObtenerProximaPregunta(){

            return _preguntas[0];

        }

        public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta){

            List<Respuesta> listaProximasRespuestas = new List<Respuesta>();    

            foreach(Respuesta resp in _respuestas){
                if(resp.IdPregunta == idPregunta){
                    listaProximasRespuestas.Add(resp);
                }
            }
            return listaProximasRespuestas;

        }

        public static bool VerificarRespuesta(int idPregunta, int idRespuesta){
            
            foreach(Respuesta resp in _respuestas){
                if(resp.IdRespuesta == idRespuesta){
                    if(resp.Correcta == true){

                        _puntajeActual += 500;
                        _cantidadPreguntasCorrectas++;                     

                        return true;
                    }
                }
            }

            foreach(Pregunta preg in _preguntas){
                if(preg.IdPregunta == idPregunta){
                    int indicePreguntaContestada = _preguntas.IndexOf(preg);
                    _preguntas.RemoveAt(indicePreguntaContestada);
                }
            }

            return false;            

        }        

    }
}