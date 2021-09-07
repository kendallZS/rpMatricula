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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMensaj.Visible = false;

            
        }

        protected void btnRegistrarme_Click(object sender, EventArgs e)
        {
            OpUsuarios opUsuarios = new OpUsuarios();

            try
            {
                if (txtIdentificacionRegistro.Text == "" || txtNombre.Text == "" ||
                txtApellidos.Text == "" || txtContrasenaRegistro.Text == "")
                {
                    lblMensaj.Visible = true;
                    lblMensaj.ForeColor = Color.Red;
                    lblMensaj.Text = "Verifique que no haya ningún espacio en blanco.";
                }
                else
                {
                    opUsuarios.InsertarRegistraUrs(Convert.ToInt32(txtIdentificacionRegistro.Text), txtNombre.Text,
                   txtApellidos.Text, 3, txtContrasenaRegistro.Text);

                    lblMensaj.Visible = true;
                    lblMensaj.ForeColor = Color.Green;
                    lblMensaj.Text = "Se ha registrado con éxito";

                }
            
            }
            catch (Exception)
            {
                lblMensaj.Visible = true;
                lblMensaj.ForeColor = Color.Red;
                lblMensaj.Text = "No se ha podido realizar El registro";

            }
        }
    }
}