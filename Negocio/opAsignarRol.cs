using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Datos;

namespace Negocio
{    
    public class opAsignarRol
    {
        AsignarRol AsignarRol = new AsignarRol();
        DataTable table = new DataTable();

        public DataTable RolUsrs()
        {
            table = AsignarRol.MostrarUsrsSinRol();
            return table;
        }
    }
}
