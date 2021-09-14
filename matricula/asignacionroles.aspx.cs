using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
namespace matricula
{
    public partial class asignacionroles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            opAsignarRol opAsignarRol = new opAsignarRol();

            gvMostrarUsrSinRol.DataSource = opAsignarRol.RolUsrs();
            gvMostrarUsrSinRol.DataBind();
        }

        protected void UsrsSinRol_Rowcomand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Asignar")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int ident = int.Parse(gvMostrarUsrSinRol.DataKeys[index].Value.ToString());

                //txtIdentActualizar.Text = id.ToString();
                //txtIdentificacion.Text = ident.ToString();

            }
        }
    }
}