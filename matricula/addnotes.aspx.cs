using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Drawing;

namespace matricula
{
    public partial class addnotes : System.Web.UI.Page
    {

        OpUsuarios ob = new OpUsuarios();
        opNotas opNotas = new opNotas();
        protected void Page_Load(object sender, EventArgs e)
        {

            gvUsrs.DataSource = ob.MostrarUsrs();
            gvUsrs.DataBind();

            if (Session["misesion"]!=null)
            {
                lblMostrarUsuario.Text =Session["misesion"].ToString();
                               
            }
        }
     
        protected void Tabla2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            //pnlAsignacionNotas.Visible = true;

            if (e.CommandName == "Asignar")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                //int ident = int.Parse(gvUsuarios.DataKeys[index].Value.ToString());

                //txtIdentActualizar.Text = id.ToString();
                //txtIdentificacion.Text = ident.ToString();
                
            }
        }
    }
}