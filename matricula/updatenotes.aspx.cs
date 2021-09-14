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
            pnlFormActualizar.Visible = false;

            opNotas opNotas = new opNotas();

            gvEstNotasAsignadas.DataSource = opNotas.MostrarNotas();
            gvEstNotasAsignadas.DataBind();
        }

        protected void Update_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            pnlFormActualizar.Visible = true;
            if (e.CommandName == "Editar")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int id = int.Parse(gvEstNotasAsignadas.DataKeys[index].Value.ToString());

                txtIdentActualizar.Text = id.ToString();

                gvEstNotasAsignadas.Visible = false;
            }
        }

        protected void btnActualizarNotasEst_Click(object sender, EventArgs e)
        {
            gvEstNotasAsignadas.Visible = true;

            opNotas opNotas = new opNotas();

            int hora_matriculaAct;

            //verifica que no hayan campos vacíos.

            if (txtIdentActualizar.Text == "" || txtNota1Actualizar.Text == "" ||
                txtNota2Actualizar.Text == "" || txtNota3Actualizar.Text == "")
            {
                lblCorrectoError.Visible = true;
                lblCorrectoError.ForeColor = Color.Red;
                lblCorrectoError.Text = "Verifique que no haya ningún espacio en blanco.";
            }
            else
            {
                try
                {

                    decimal n1, n2, n3, promedio;
                    n1 = Convert.ToDecimal(txtNota1Actualizar.Text);
                    n2 = Convert.ToDecimal(txtNota2Actualizar.Text);
                    n3 = Convert.ToDecimal(txtNota3Actualizar.Text);

                    promedio = (n1 + n2 + n3) / 3;



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

                    opNotas.EditarNotas(Convert.ToDouble(txtNota1Actualizar.Text), Convert.ToDouble(txtNota2Actualizar.Text),
                                Convert.ToDouble(txtNota3Actualizar.Text), Convert.ToInt32(txtIdentActualizar.Text), 0,
                                Convert.ToInt32(lblpruebaValorHorario.Text));

                    opNotas.EditarProm(promedio, Convert.ToInt32(txtIdentActualizar.Text));

                    lblActualizaNotas.Visible = true;
                    lblActualizaNotas.ForeColor = Color.Green;
                    lblActualizaNotas.Text = "Notas y promedio actualizado: " + promedio.ToString("#.##");



                }
                catch (Exception)
                {

                    lblActualizaNotas.Visible = true;
                    lblActualizaNotas.ForeColor = Color.Red;
                    lblActualizaNotas.Text = "No se ha podido realizar la actualización.";

                }

            }
        }

        protected void btnCancelarEdicion_Click(object sender, EventArgs e)
        {
            gvEstNotasAsignadas.Visible = true;
        }
    }
}