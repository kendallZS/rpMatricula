using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
namespace matricula
{
    public partial class asignacionroles : System.Web.UI.Page
    {
        OpUsuarios OpUsuarios = new OpUsuarios();

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMensajeActRol.Visible = false;

            pnlAsigRol.Visible = false;

            opAsignarRol opAsignarRol = new opAsignarRol();

            gvMostrarUsrSinRol.DataSource = opAsignarRol.RolUsrs();
            gvMostrarUsrSinRol.DataBind();

            //GridView1.DataSource = opAsignarRol.RolUsrs();
            //GridView1.DataBind();
        }

        protected void UsrsSinRol_Rowcomand(object sender, GridViewCommandEventArgs e)
        {
            gvMostrarUsrSinRol.Visible = false;


            if (e.CommandName == "Asignar")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int ident = int.Parse(gvMostrarUsrSinRol.DataKeys[index].Value.ToString());

                txtidentAsigRol.Text = ident.ToString();

                pnlAsigRol.Visible = true;
            }
        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            string nombreRol = DropDownList1.SelectedValue;

            if (nombreRol == "Seleccione...")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Por favor, seleccione el rol correspondiente');", true);
            }
            else if (nombreRol == "Docente")
            {
                OpUsuarios.EditarRolUsr(1, Convert.ToInt32(txtidentAsigRol.Text));
                Response.Redirect("asignacionroles.aspx");
                lblMensajeActRol.Text = "Rol Docente asignado con éxito a: "+txtidentAsigRol.Text;
                lblMensajeActRol.ForeColor = Color.Green;
                lblMensajeActRol.Visible = true;
            }
            else if (nombreRol == "Estudiante")
            {
                OpUsuarios.EditarRolUsr(2, Convert.ToInt32(txtidentAsigRol.Text));
                Response.Redirect("asignacionroles.aspx");
                lblMensajeActRol.Text = "Rol Estudiante asignado con éxito a: " + txtidentAsigRol.Text;
                lblMensajeActRol.ForeColor = Color.Green;
                lblMensajeActRol.Visible = true;
            }
            else if (nombreRol == "MantenerSinRol")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No se ha realizado ningún cambio');", true);
            }

            gvMostrarUsrSinRol.Visible = true;
        }
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Identificación: " + identificacion + "\\nNombre: " + nombre + "\\nNotas y promedio (" + promedio + ") actualizados" + "');", true);

    }
}