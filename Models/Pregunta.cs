using System.Dynamic;
using Microsoft.VisualBasic.CompilerServices;
using System;
using System.Collections.Generic;

namespace PreguntadORT.Models{
    public class Pregunta{
        
        int _idCategoria, _idPregunta, _idDificultad;
        string _enunciado, _foto;
        
        public Pregunta(int pidCategoria, int pidDificultad, string penunciado, string pfoto){

            _idCategoria = pidCategoria;
            _idDificultad = pidDificultad;
            _enunciado = penunciado;
            _foto = pfoto;
                        
        }

        public Pregunta(){
            _idCategoria = 0;
            _idDificultad = 0;
            _enunciado = "";
            _foto = "";
        }

    
        public int IdPregunta{
            get{return _idPregunta;}
            set{_idPregunta = value;}
        }  

        public int IdCategoria{
            get {return _idCategoria;}
            set{_idCategoria = value;}
        }

        public int IdDificultad{
            get {return _idDificultad;}
            set{_idDificultad = value;}
        }

        public string Enunciado{
            get {return _enunciado;}
            set{_enunciado = value;}
        }

        public string Foto{
            get {return _foto;}
            set{_foto = value;}
        }

    }
}