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
            if (!this.IsPostBack)
            {
                gvUsrs.DataSource = ob.MostrarUsrs();
                gvUsrs.DataBind();
            }

            if (Session["misesion"]!=null)
            {
                lblMostrarUsuario.Text =Session["misesion"].ToString();
                               
            }
        }


        protected void gvUsrs_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            opNotas opNotas = new opNotas();

            

            decimal promedio;

            try
            {
                if (e.CommandName == "Notas")
                {
                    //Determine the RowIndex of the Row whose Button was clicked.
                    int rowIndex = Convert.ToInt32(e.CommandArgument);

                    //Reference the GridView Row.
                    GridViewRow row = gvUsrs.Rows[rowIndex];

                    //Fetch value of Name.
                    string identificacion = (row.FindControl("lblIdentificacion") as Label).Text;

                    //Fetch value of Country
                    string nombre = row.Cells[1].Text;

                    string n1 = (row.FindControl("txtn1") as TextBox).Text;
                    string n2 = (row.FindControl("txtn2") as TextBox).Text;
                    string n3 = (row.FindControl("txtn3") as TextBox).Text;



                    //Calcula promedio y hora matricula

                    opNotas.InsertarNotas(Convert.ToDouble(n1), Convert.ToDouble(n2),
                       Convert.ToDouble(n3), Convert.ToInt32(identificacion), 0,
                       3);

                    //CALCULO DE PROMEDIO OBSOLETO, AHORA SE HACE DESDE EL MISMO PROCEDURE
                    //opNotas.EditarProm(promedio, Convert.ToInt32(identificacion));

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Identificación: " + identificacion + "\\nNombre: " + nombre + "\\nNotas y promedio Asignados" + "');", true);

                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error. El usuario que indicó ya cuenta con sus notas asignadas');", true);
                //throw;
            }
        }
    }
}