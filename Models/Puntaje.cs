using System.Dynamic;
using Microsoft.VisualBasic.CompilerServices;
using System;
using System.Collections.Generic;

namespace PreguntadORT.Models{
    public class Puntaje{
        
        private int _idPuntaje, _puntos;

        private string _userName;

        private DateTime _fechaHora;

        public Puntaje(int ppuntos,string puserName,DateTime pfechaHora){
            _puntos = ppuntos;
            _userName = puserName;
            _fechaHora = pfechaHora;
        }

        public Puntaje(){
            _puntos = 0;
            _userName = "";
            _fechaHora = DateTime.MinValue;
        }

        public int IdPuntaje{
            get{return _idPuntaje;}
            set{_idPuntaje = value;}
        }

        public int Puntos{
            get{return _puntos;}
            set{_puntos = value;}
        }

        public string UserName{
            get{return _userName;}
            set{_userName = value;}
        }

        public DateTime FechaHora{
            get{return _fechaHora;}
            set{_fechaHora = value;}
        }

    }
}