﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Negocio
{
    class OpUsuarios
    {
        private Usuarios usrs = new Usuarios();
        public DataTable MostrarProd()
        {
            DataTable tabla = new DataTable();
            tabla = usrs.Mostrar();
            return tabla;
        }
    }
}