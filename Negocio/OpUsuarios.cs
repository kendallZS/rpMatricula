using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Negocio
{
    public class OpUsuarios
    {
        private Usuarios usrs = new Usuarios();
        public DataTable MostrarUsrs()
        {
            DataTable tabla = new DataTable();
            tabla = usrs.Mostrar();
            return tabla;
        }

        public void InsertarRegistraUrs(int ident, string nombre, string apellidos,
            int idRol, string contrasena)
        {
            usrs.InsertarUsuario(ident, nombre, apellidos, idRol, contrasena);
        }

        //retorna contrassena desencriptada
        public string MostrarDesencripcion(int ident)
        {
            string contr;
            contr = usrs.Desencriptar(ident);
            return contr;
        }

        public string MostrarNombre(int ident)
        {
           return usrs.MostrarNombreUsr(ident);
        }
    }
}
