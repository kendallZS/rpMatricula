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

        SqlDataReader leer;
        DataTable tabla = new DataTable();
        SqlCommand comando = new SqlCommand();

        Conexion conn = new Conexion();
        public void Insertar(decimal n1, decimal n2, decimal n3,
            int ident, decimal prom)
        {
            comando.Connection = conn.AbrirConexion();
            comando.CommandText = "InsertaNotas";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nota1", n1);
            comando.Parameters.AddWithValue("@nota2", n2);
            comando.Parameters.AddWithValue("@nota3", n3);
            comando.Parameters.AddWithValue("@identificacion", ident);
            comando.Parameters.AddWithValue("@promedio", prom);
            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            conn.CerrarConexion();
        }
    }
}
