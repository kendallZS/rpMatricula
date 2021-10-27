using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace matricula
{
    public partial class usersmanagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OpUsuarios obUsrs = new OpUsuarios();

            gvMostrarUsrEstado.DataSource = obUsrs.EstadoUsuarios();
            gvMostrarUsrEstado.DataBind();
        }

        protected void gvMostrarUsrEstado_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            OpUsuarios opUsuarios = new OpUsuarios();


            try
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int ident = int.Parse(gvMostrarUsrEstado.DataKeys[index].Value.ToString());

                if (e.CommandName == "Activar")
                {
                    opUsuarios.Activar_Usrs(ident);
                    Response.Redirect("usersmanagement.aspx");
                }

                if (e.CommandName == "Inactivar")
                {
                    opUsuarios.Inactivar_Usrs(ident);
                    Response.Redirect("usersmanagement.aspx");
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error al ejecutar');", true);
            }
        }
    }
}