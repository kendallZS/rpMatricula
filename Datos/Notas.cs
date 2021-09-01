using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
   public class Notas
    {

        SqlDataReader leer2;
        DataTable tabla = new DataTable();
        SqlCommand comando = new SqlCommand();

        int valor;

        Conexion conn = new Conexion();
        //Inserta las notas
        public void Insertar(double n1, double n2, double n3,
            int ident, double prom, int idmatricula)
        {
            comando.Connection = conn.AbrirConexion();
            comando.CommandText = "sp_inserta_si_no_existe";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nota1", n1);
            comando.Parameters.AddWithValue("@nota2", n2);
            comando.Parameters.AddWithValue("@nota3", n3);
            comando.Parameters.AddWithValue("@identificacion", ident);
            comando.Parameters.AddWithValue("@promedio", prom);
            comando.Parameters.AddWithValue("@idmatricula", idmatricula);
            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            conn.CerrarConexion();
        }

        //Para editar promedio.
        public void Editar(decimal promedio, int id)
        {
            comando.Connection = conn.AbrirConexion();
            comando.CommandText = "EditarPromedio";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@promedio", promedio);
            comando.Parameters.AddWithValue("@identificacion", id);
            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            conn.CerrarConexion();
        }

        //Verifica en la tabla notas si ya existe el usuario (identificacion) con sus notas
        //y promedio.
        //public void Mostrar(int id)
        //{
        //    comando.Connection = conn.AbrirConexion();
        //    comando.CommandText = "VerificaExistencia";
        //    comando.CommandType = CommandType.StoredProcedure;
        //    leer2 = comando.ExecuteReader();
        //    valor=Convert.ToInt32(leer2);
        //    conn.CerrarConexion();
        //    //return tabla;

        //}
    }
}
