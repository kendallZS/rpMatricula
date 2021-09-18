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
    public partial class updatenotes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            opNotas opNotas = new opNotas();

            //gvEstNotasAsignadas.DataSource = opNotas.MostrarNotas();
            //gvEstNotasAsignadas.DataBind();
            if (!this.IsPostBack)
            {
                GridView1.DataSource = opNotas.MostrarNotas();
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            opNotas opNotas = new opNotas();

            int hora_matriculaAct;

            decimal promedio;

            if (e.CommandName == "Select")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = GridView1.Rows[rowIndex];

                //Fetch value of Name.
                string identificacion = (row.FindControl("lblIdentificacion") as Label).Text;

                //Fetch value of Country
                string nombre = row.Cells[1].Text;

                string n1 = (row.FindControl("txtn1") as TextBox).Text;
                string n2 = (row.FindControl("txtn2") as TextBox).Text;
                string n3 = (row.FindControl("txtn3") as TextBox).Text;

           

                //Calcula promedio y hora matricula
                try
                {
                    promedio = (Convert.ToDecimal(n1) + Convert.ToDecimal(n2) + Convert.ToDecimal(n3)) / 3;

                    if (promedio <= 100 && promedio >= 90)
                    {
                        hora_matriculaAct = 3;
                        lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
                    }
                    else if (promedio <= 90 && promedio >= 80)
                    {
                        hora_matriculaAct = 4;
                        lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
                    }
                    else if (promedio <= 80 && promedio >= 70)
                    {
                        hora_matriculaAct = 5;
                        lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
                    }
                    else if (promedio <= 70 && promedio >= 60)
                    {
                        hora_matriculaAct = 6;
                        lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
                    }
                    else if (promedio <= 60 && promedio >= 50)
                    {
                        hora_matriculaAct = 7;
                        lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
                    }
                    else if (promedio <= 50 && promedio >= 40)
                    {
                        hora_matriculaAct = 8;
                        lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
                    }
                    else if (promedio <= 40 && promedio >= 30)
                    {
                        hora_matriculaAct = 9;
                        lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
                    }
                    else if (promedio <= 30 && promedio >= 20)
                    {
                        hora_matriculaAct = 10;
                        lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
                    }
                    else if (promedio <= 20 && promedio >= 10)
                    {
                        hora_matriculaAct = 11;
                        lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
                    }
                    else if (promedio <= 10 && promedio >= 0)
                    {
                        hora_matriculaAct = 12;
                        lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
                    }


                    opNotas.EditarNotas(Convert.ToDecimal(n1), Convert.ToDecimal(n2),
                       Convert.ToDecimal(n3), Convert.ToInt32(identificacion), 0,
                       Convert.ToInt32(lblpruebaValorHorario.Text));
                    

                    opNotas.EditarProm(promedio, Convert.ToInt32(identificacion));

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Identificación: " + identificacion + "\\nNombre: " + nombre + "\\nNotas y promedio (" + promedio + ") actualizados" + "');", true);

                }
                catch (Exception)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error, verifique que haya ingresado valores numéricos correctos');", true);
                }

               
            }
        }
    }
}