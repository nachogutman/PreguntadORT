using System.Dynamic;
using Microsoft.VisualBasic.CompilerServices;
using System;
using System.Collections.Generic;

namespace PreguntadORT.Models{
    public class Respuesta{
        
        int _idRespuesta, _idPregunta, _opcion;
        string _contenido, _foto;
        bool _correcta;

        public Respuesta(int pidPregunta, int popcion, string pcontenido, string pfoto, bool pcorrecta){

            _idPregunta = pidPregunta;
            _opcion = popcion;
            _contenido = pcontenido;
            _foto = pfoto;
            _correcta = pcorrecta;            
        }

        public Respuesta(){
            _idPregunta = 0;
            _opcion = 0;
            _contenido = "";
            _foto = "";
            _correcta = true;
        }

        public int IdRespuesta{
            get{return _idRespuesta;}
            set{_idRespuesta = value;}
        }

        public int IdPregunta{
            get{return _idPregunta;}
            set{_idPregunta = value;}
        }  

        public int Opcion{
            get {return _opcion;}
            set{_opcion = value;}
        }

        public string Contenido{
            get {return _contenido;}
            set{_contenido = value;}
        }

        public bool Correcta{
            get {return _correcta;}
            set{_correcta = value;}
        }

        public string Foto{
            get {return _foto;}
            set{_foto = value;}
        }

    }
}