using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Negocio
{
   public class opNotas
    {

        //INSERTA LAS NOTAS:
        private Notas notas = new Notas();
        public void InsertarNotas(decimal n1, decimal n2, decimal n3,
            int ident, decimal prom)
        {
            notas.Insertar(n1, n2, n3, ident, prom);
        }
    }
}
