using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    class Conexion
    {
       private SqlConnection connection = new SqlConnection("Server=.\\SQLEXPRESS;DataBase= Matricula;Integrated Security=true");
        public SqlConnection AbrirConexion()
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            return connection;
        }
        public SqlConnection CerrarConexion()
        {
            if (connection.State == ConnectionState.Open)
                connection.Close();
            return connection;
        }
    }
}
