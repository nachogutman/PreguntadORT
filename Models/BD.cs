using System;
using System.Data;
using System.Net;
using System.Dynamic;
using Microsoft.VisualBasic.CompilerServices;
using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;

namespace PreguntadORT.Models{
    
    public static class BD{        

        private static string server = Dns.GetHostName();
        private static string _connectionString = @$"Server={server};DataBase=PreguntadOrt;Trusted_Connection=True;";        

        public static List<Categoria> ObtenerCategorias(){
            List<Categoria> listaCategorias = new List<Categoria>();
            string SQL = "SELECT * FROM Categorias";
            using(SqlConnection db = new SqlConnection(_connectionString)){
                listaCategorias = db.Query<Categoria>(SQL).ToList();
            }
            return listaCategorias;
        }

        public static List<Dificultad> ObtenerDificultades(){
            List<Dificultad> listaDificultades = new List<Dificultad>();
            string SQL = "SELECT * FROM Dificultades";
            using(SqlConnection db = new SqlConnection(_connectionString)){
                listaDificultades = db.Query<Dificultad>(SQL).ToList();
            }
            return listaDificultades;
        }

        public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria){
            List<Pregunta> listaPreguntas = new List<Pregunta>();
            string SQL = "SELECT * FROM Preguntas WHERE IdCategoria = @pIdCategoria AND IdDificultad = @pIdDificultad";    

            if(dificultad == -1 && categoria =! -1){
                SQL = "SELECT * FROM Preguntas WHERE IdCategoria = @pIdCategoria";
            }
            else if(categoria == -1 && dificultad =! -1){
                SQL = "SELECT * FROM Preguntas WHERE IdDificultad = @pIdDificultad";
            }else if(dificultad == -1 && categoria == -1){
                SQL = "SELECT * FROM Preguntas";
            }else{
                SQL = "SELECT * FROM Preguntas WHERE IdDificultad = @pIdDificultad AND IdCategoria = @pIdCategoria";
            }

            using(SqlConnection db = new SqlConnection(_connectionString)){
                listaPreguntas = db.Query<Pregunta>(SQL, new{pIdCategoria = categoria, pIdDificultad = dificultad}).ToList();
            }
            return listaPreguntas;
        }

        public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas){
        
            List<Respuesta> listaRespuestas = new List<Respuesta>();
            
            foreach(Pregunta preg in preguntas){
                string SQL = "SELECT * FROM Respuestas WHERE IdPregunta = @pIdPregunta";
                using(SqlConnection db = new SqlConnection(_connectionString)){
                    listaRespuestas.AddRange(db.Query<Respuesta>(SQL, new{pIdPregunta = preg}));
                }
            }
            return listaRespuestas;
        }
    }

}