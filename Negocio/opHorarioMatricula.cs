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
        public string MostrarHorario(int ident)
        {
            string fecha;
            fecha = HorarioMatricula.MostrarFecha(ident);
            return fecha;
        }
    }
}
