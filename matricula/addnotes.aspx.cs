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
        protected void Page_Load(object sender, EventArgs e)
        {
            //pnlFrm.Visible = false;

            lblCorrectoError.Visible = false;

            gvUsrs.DataSource = ob.MostrarUsrs();
            gvUsrs.DataBind();
        }

        protected void btnGuardarNotas_Click(object sender, EventArgs e)
        {
            opNotas notas = new opNotas();

            try
            {
                notas.InsertarNotas(Convert.ToDouble(txtNota1.Text), Convert.ToDouble(txtNota2.Text),
                    Convert.ToDouble(txtNota3.Text), Convert.ToInt32(txtIdentificacion.Text),0);
                

                //MessageBox.Show("se inserto correctamente");
                lblCorrectoError.Visible = true;
                lblCorrectoError.ForeColor = Color.Green;
                lblCorrectoError.Text = "Se ha ingresado correctamente";

                decimal n1,n2,n3, promedio;
                n1 = Convert.ToDecimal(txtNota1.Text);
                n2 = Convert.ToDecimal(txtNota2.Text);
                n3 = Convert.ToDecimal(txtNota3.Text);

                promedio = (n1 + n2 + n3)/3;

                lblPromedio.Text ="Promedio: "+ promedio.ToString("#.##");


                //Actualizar el promedio del estudiante.
                try
                {
                    notas.EditarProm(promedio, Convert.ToInt32(txtIdentificacion.Text));
                                     
                }
                catch (Exception ex)
                {
                    lblCorrectoError.Text = ex.ToString();
                }

            }
            catch (Exception ex)
            {
                lblCorrectoError.Visible = true;
                lblCorrectoError.ForeColor = Color.Red;
                lblCorrectoError.Text = "No se pudo ingresar los datos debido al error: "+ex;
            }

            txtIdentificacion.Text = "";
            txtNota1.Text = "";
            txtNota2.Text = "";
            txtNota3.Text = "";
        }
    }
}