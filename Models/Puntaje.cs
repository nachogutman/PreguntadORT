using System.Dynamic;
using Microsoft.VisualBasic.CompilerServices;
using System;
using System.Collections.Generic;

namespace PreguntadORT.Models{
    public class Puntaje{
        
        private int _idPuntaje, _puntos;

        private string _userName;

        private DateTime _fechaHora;

        private int _tiempo;

        public Puntaje(int ppuntos,string puserName,DateTime pfechaHora, int ptiempo){
            _puntos = ppuntos;
            _userName = puserName;
            _fechaHora = pfechaHora;
            _tiempo = ptiempo;
        }

        public Puntaje(){
            _puntos = 0;
            _userName = "";
            _fechaHora = DateTime.MinValue;
            _tiempo = 0;
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

        public int Tiempo{
            get{return _tiempo;}
            set{_tiempo = value;}
        }

    }
}