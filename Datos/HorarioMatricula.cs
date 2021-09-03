using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
   public class HorarioMatricula
    {
        SqlDataReader leer;
        DataTable tabla = new DataTable();
        SqlCommand comando = new SqlCommand();

        Conexion conexion = new Conexion();
        public DataTable Mostrar(int identificacion)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "Sp_Muestra_horario_matricula";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@identificacion", identificacion);
            leer = comando.ExecuteReader();
            tabla.Load(leer);
            conexion.CerrarConexion();
            return tabla;

        }
    }
}
