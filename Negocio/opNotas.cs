using System;
using System.Collections.Generic;
using System.Data;
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
        public void InsertarNotas(double n1, double n2, double n3,
            int ident, double prom, int idmatricula)
        {
            notas.Insertar(n1, n2, n3, ident, prom, idmatricula);
        }

        //Actualiza promedio
        public void EditarProm(decimal promedio, int id)
        {
            notas.Editar(promedio,id);
        }

        //Actualiza Notas
        public void EditarNotas(double n1, double n2, double n3,
            int ident, double prom, int idmatricula)
        {
            notas.EditaNotas(n1, n2, n3, ident, prom, idmatricula);
        }


        //Muestra desglose de notas para el usuario en sesion mod student
        public DataTable MostrarNotasEstudiantes(int identificacion)
        {
            DataTable tabla = new DataTable();
            tabla = notas.MostrarNotas(identificacion);
            return tabla;
        }

        //Muestra desglose de notas mod docente

        public DataTable MostrarNotas()
        {
            DataTable tabla = new DataTable();
            tabla = notas.MostrarNotasEst();
            return tabla;
        }

    }
}
