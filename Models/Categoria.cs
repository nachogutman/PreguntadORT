using System.Dynamic;
using Microsoft.VisualBasic.CompilerServices;
using System;
using System.Collections.Generic;

namespace PreguntadORT.Models{
    public class Categoria{
        
        private int _idCategoria;
        private string _nombre;
        private string _foto;

        public Categoria(string pnombre, string pfoto){

            _nombre = pnombre;
            _foto = pfoto;
            
        }

        public Categoria(){
            _nombre = "";
            _foto = "";
        }

        public int IdCategoria{
            get{return _idCategoria;}
            set{_idCategoria = value;}
        }

        public string Nombre{
            get{return _nombre;}
            set{_nombre = value;}
        }  

        public string Foto{
            get {return _foto;}
            set{_foto = value;}
        }


    }
}