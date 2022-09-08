using System.Dynamic;
using Microsoft.VisualBasic.CompilerServices;
using System;
using System.Collections.Generic;

namespace PreguntadORT.Models{
    public class Puntaje{
        
        private int _idPuntaje, _puntos;

        private string _userName;

        private DateTime _fechaHora;

        public int IdPuntaje{
            get{return _idPuntaje;}
        }

        public int Puntos{
            get{return _puntos;}
        }

        public string UserName{
            get{return _userName;}
        }

        public DateTime FechaHora{
            get{return _fechaHora;}
        }

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
    }
}