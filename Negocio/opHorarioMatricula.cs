using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Negocio
{
   public class opHorarioMatricula
    {
        HorarioMatricula HorarioMatricula = new HorarioMatricula();
        public DataTable MostrarHorario(int ident)
        {
            DataTable tabla = new DataTable();
            tabla = HorarioMatricula.Mostrar(ident);
            return tabla;
        }
    }
}
