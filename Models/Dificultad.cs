using System.Dynamic;
using Microsoft.VisualBasic.CompilerServices;
using System;
using System.Collections.Generic;

namespace PreguntadORT.Models{
    public class Dificultad{        
        private int _idDificultad;        
        private string _nombre;

        public Dificultad(int pidDificultad, string pnombre){

            _idDificultad = pidDificultad;
            _nombre = pnombre;       
        }

        public Dificultad(){
            _idDificultad = 0;
            _nombre = ""; 
        }

        public int IdDifucultad{
            get{return _idDificultad;}
            set{_idDificultad = value;}
        }

        public string Nombre{
            get{return _nombre;}
            set{_nombre = value;}
        }         

    }
}