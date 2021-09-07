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
        //private SqlConnection connection2 = new SqlConnection("Server=.\\SQLEXPRESS;DataBase= Matricula;Integrated Security=true");

        SqlDataReader leer;
        DataTable tabla = new DataTable();
        SqlCommand comando = new SqlCommand();
        string valor;

        Conexion conexion = new Conexion();

        //Se muestra en label por lo que es inecesario el datatable
        public void Mostrar(int identificacion)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "Sp_Muestra_horario_matricula";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@identificacion", identificacion);
            leer = comando.ExecuteReader();
            tabla.Load(leer);
            conexion.CerrarConexion();

        }

        public string MostrarFecha(int identificacion)
        {
            SqlCommand comando = new SqlCommand("select Matricula.fecha from Matricula inner join Notas on Matricula.id_matricula = Notas.id_matricula where Notas.identificacion = @identificacion", conexion.AbrirConexion());
            //comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@identificacion", identificacion);

            SqlDataReader usr = comando.ExecuteReader();

            if (usr.Read())
            {
                valor = usr["fecha"].ToString();
            }
            return valor;
            conexion.CerrarConexion();
        }
    }
}
