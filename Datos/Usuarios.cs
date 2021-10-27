using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
   public class Usuarios
    {
        //static string strConn = "Server= .\\SQLEXPRESS; database= Matricula;" +
        // "integrated security= true";
        //SqlConnection Conexion = new SqlConnection(strConn);

        SqlDataReader leer;
        DataTable tabla = new DataTable();
        SqlCommand comando = new SqlCommand();
        string valor;
        string nombre;

        Conexion conn = new Conexion();
        public DataTable Mostrar()
        {
            comando.Connection = conn.AbrirConexion();
            comando.CommandText = "Sp_mostrar_usuarios";
            comando.CommandType = CommandType.StoredProcedure;
            leer = comando.ExecuteReader();
            tabla.Load(leer);
            conn.CerrarConexion();
            return tabla;

        }




        public DataTable BuscarUsr(string nombre)
        {
            comando.Connection = conn.AbrirConexion();
            comando.CommandText = "SP_buscar_estudiante";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nombre", SqlDbType.VarChar).Value= nombre;
            leer = comando.ExecuteReader();
            tabla.Load(leer);
            conn.CerrarConexion();
            return tabla;

        }


        public DataTable BuscarUsrNotas(string nombre)
        {
            comando.Connection = conn.AbrirConexion();
            comando.CommandText = "SP_buscar_estudiante_notas";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nombre", SqlDbType.VarChar).Value = nombre;
            leer = comando.ExecuteReader();
            tabla.Load(leer);
            conn.CerrarConexion();
            return tabla;

        }


        public DataTable Mostrar_estado_usrs()
        {
            comando.Connection = conn.AbrirConexion();
            comando.CommandText = "Mostrar_estado_usuarios";
            comando.CommandType = CommandType.StoredProcedure;
            leer = comando.ExecuteReader();
            tabla.Load(leer);
            conn.CerrarConexion();
            return tabla;
        }




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


        //Inactivar usuarios
        public void InactivarUsrs(int identificacion)
        {
            comando.Connection = conn.AbrirConexion();
            comando.CommandText = "Inactivar_usrs";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@identificacion", identificacion);
            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            conn.CerrarConexion();
        }

        //Activar usuarios
        public void ActivarUsrs(int identificacion)
        {
            comando.Connection = conn.AbrirConexion();
            comando.CommandText = "Activar_usrs";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@identificacion", identificacion);
            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            conn.CerrarConexion();
        }


        //Inserta las registro de usuario
        public void InsertarUsuario(int ident, string nombre, string apellidos,
            int idRol, string contrasena)
        {
            comando.Connection = conn.AbrirConexion();
            comando.CommandText = "Sp_registra_usuario";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@identificacion", ident);
            comando.Parameters.AddWithValue("@nombre", nombre);
            comando.Parameters.AddWithValue("@apellidos", apellidos);
            comando.Parameters.AddWithValue("@id_rol", idRol);
            comando.Parameters.AddWithValue("@contrasena", contrasena);
            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            conn.CerrarConexion();
        }


        public string Desencriptar(int identificacion)
        {
            SqlCommand comando = new SqlCommand("Select contrasena,libre= convert(varchar(100),DecryptByPassPhrase('key',contrasena)) from Usuarios as Decrypt where identificacion = @identificacion", conn.AbrirConexion());
            //comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@identificacion", identificacion);

            SqlDataReader usr = comando.ExecuteReader();

            if (usr.Read())
            {
                valor = usr["libre"].ToString();
            }
            return valor;
            conn.CerrarConexion();
        }


        //Muestra Nombre del usuario en sesión
        public string MostrarNombreUsr(int identificacion)
        {
            SqlCommand comando = new SqlCommand("select nombre from Usuarios where identificacion=@identificacion", conn.AbrirConexion());
            //comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@identificacion", identificacion);

            SqlDataReader usr = comando.ExecuteReader();

            if (usr.Read())
            {
                nombre = usr["nombre"].ToString();
            }
            return nombre;
            conn.CerrarConexion();
        }





        public void EditarRol(int rol, int id)
        {
            comando.Connection = conn.AbrirConexion();
            comando.CommandText = "Sp_actualizar_rol";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idRol", rol);
            comando.Parameters.AddWithValue("@identificacion", id);
            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            conn.CerrarConexion();
        }


        //public void Eliminar(int id)
        //{
        //    comando.Connection = conn.AbrirConexion();
        //    comando.CommandText = "EliminarProducto";
        //    comando.CommandType = CommandType.StoredProcedure;
        //    comando.Parameters.AddWithValue("@idpro", id);
        //    comando.ExecuteNonQuery();
        //    comando.Parameters.Clear();
        //    conn.CerrarConexion();
        //}

    }
}
