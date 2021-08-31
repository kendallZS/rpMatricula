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

        //Verifica si ya un usuario tiene asignada su nota
        //public DataTable MostrarExistencia(int id)
        //{
        //    DataTable tabla = new DataTable();
        //    tabla = notas.Mostrar(id);
        //    return tabla;
        //}
    }
}
