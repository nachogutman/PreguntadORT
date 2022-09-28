using System.Dynamic;
using Microsoft.VisualBasic.CompilerServices;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Timers;

namespace PreguntadORT.Models{

    public static class Juego{

        private static string _username = "";
        private static int _puntajeActual = 0;
        private static int _cantidadPreguntasCorrectas = 0;   
        private static List<Pregunta> _preguntasSinMezclar = new List<Pregunta>();
        private static List<Pregunta> _preguntas = new List<Pregunta>();
        private static List<Respuesta> _respuestas = new List<Respuesta>();     
        private static System.Timers.Timer aTimer;
        private static int _segundos = 0;

        private static bool _fin = false;

        public static bool Fin{
            get{return _fin;}
            set{_fin = value;}
        }

        public static int Segundos{
            get{return _segundos;}
        }
                         
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
            _preguntasSinMezclar.Clear(); 
            _segundos = 0;       
            _fin = false;
        }

        public static List<Categoria> ObtenerCategorias(){
            return BD.ObtenerCategorias();
        }

        public static List<Dificultad> ObtenerDificultades(){
            return BD.ObtenerDificultades();
        }         

        public static void CargarPartida(string username, int dificultad, int categoria){

            Random random = new Random();       
            int indiceAleatorio;
                 
            _preguntas = BD.ObtenerPreguntas(dificultad, categoria);
            int longitudLista = _preguntas.Count();

            for(int i = 0; i < longitudLista; i++){
                indiceAleatorio = random.Next(0,longitudLista);
                Pregunta temporal = _preguntas[indiceAleatorio];
                _preguntas[indiceAleatorio] = _preguntas[i];
                _preguntas[i] = temporal;         
            }            
            _respuestas = BD.ObtenerRespuestas(_preguntas);   
            _username = username;
            _segundos = 0;
        }

        public static Pregunta ObtenerProximaPregunta(){            

            if(_preguntas.Count() == 0){
                return null;
            }
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
            
            for(int i = 0; i < _preguntas.Count();i++){
                if(_preguntas[i].IdPregunta == idPregunta){
                    _preguntas.RemoveAt(i);
                }
            }
                        
            foreach(Respuesta resp in _respuestas){
                if(resp.IdRespuesta == idRespuesta){
                    if(resp.Correcta == true){

                        _puntajeActual += 500;
                        _cantidadPreguntasCorrectas++;                                         

                        return true;
                    }                    
                }
            }
            
            return false;            

        }   

        public static void ComenzarTimer()
        {
            aTimer = new System.Timers.Timer(1000);
            aTimer.Elapsed += Tick;
            aTimer.AutoReset = true;
            aTimer.Enabled = true;
        }

        public static void FinalizarTimer()
        {
            aTimer.Stop();
            aTimer.Dispose();
        }

        public static void Tick(Object source, ElapsedEventArgs e)
        {
            _segundos++;
        }


    }
}