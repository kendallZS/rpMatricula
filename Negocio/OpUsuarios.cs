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

        public DataTable MostrarUsrBuscado(string nombre)
        {
            DataTable tabla = new DataTable();
            tabla = usrs.BuscarUsr(nombre);
            return tabla;
        }

        public DataTable MostrarUsrBuscado2(string nombre)
        {
            DataTable tabla = new DataTable();
            tabla = usrs.BuscarUsrNotas(nombre);
            return tabla;
        }

        public void InsertarRegistraUrs(int ident, string nombre, string apellidos,
            int idRol, string contrasena)
        {
            usrs.InsertarUsuario(ident, nombre, apellidos, idRol, contrasena);
        }

        //Metodos activar / inactivar usrs
        public void Inactivar_Usrs(int ident)
        {
            usrs.InactivarUsrs(ident);
        }
        public void Activar_Usrs(int ident)
        {
            usrs.ActivarUsrs(ident);
        }

        public DataTable EstadoUsuarios()
        {
            return usrs.Mostrar_estado_usrs();
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

        //Editar rol en el mod asignacionrol
        public void EditarRolUsr(int rol,int identificacion)
        {
            usrs.EditarRol(rol, identificacion);
        }
    }
}
