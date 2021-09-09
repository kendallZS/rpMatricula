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
            //pnlFrm.Visible = false;
            lblActualizaNotas.Visible = false;

            lblpruebaValorHorario.Visible = false;

            lblCorrectoError.Visible = false;

            gvNotas.DataSource = opNotas.MostrarNotas();
            gvNotas.DataBind();

            if (Session["misesion"]!=null)
            {
                lblMostrarUsuario.Text =Session["misesion"].ToString();
                               
            }
        }

        protected void btnGuardarNotas_Click(object sender, EventArgs e)
        {
            opNotas notas = new opNotas();
            int hora_matricula;

            //verifica que no hayan campos vacíos.

            if (txtIdentificacion.Text == "" || txtNota1.Text == "" ||
                txtNota2.Text == "" || txtNota3.Text == "")
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
                    n1 = Convert.ToDecimal(txtNota1.Text);
                    n2 = Convert.ToDecimal(txtNota2.Text);
                    n3 = Convert.ToDecimal(txtNota3.Text);

                    promedio = (n1 + n2 + n3) / 3;



                    if (promedio <= 100 && promedio >= 90)
                    {
                        hora_matricula = 3;
                        lblpruebaValorHorario.Text = hora_matricula.ToString();
                    }
                    else if (promedio <= 90 && promedio >= 80)
                    {
                        hora_matricula = 4;
                        lblpruebaValorHorario.Text = hora_matricula.ToString();
                    }
                    else if (promedio <= 80 && promedio >= 70)
                    {
                        hora_matricula = 5;
                        lblpruebaValorHorario.Text = hora_matricula.ToString();
                    }
                    else if (promedio <= 70 && promedio >= 60)
                    {
                        hora_matricula = 6;
                        lblpruebaValorHorario.Text = hora_matricula.ToString();
                    }
                    else if (promedio <= 60 && promedio >= 50)
                    {
                        hora_matricula = 7;
                        lblpruebaValorHorario.Text = hora_matricula.ToString();
                    }
                    else if (promedio <= 50 && promedio >= 40)
                    {
                        hora_matricula = 8;
                        lblpruebaValorHorario.Text = hora_matricula.ToString();
                    }
                    else if (promedio <= 40 && promedio >= 30)
                    {
                        hora_matricula = 9;
                        lblpruebaValorHorario.Text = hora_matricula.ToString();
                    }
                    else if (promedio <= 30 && promedio >= 20)
                    {
                        hora_matricula = 10;
                        lblpruebaValorHorario.Text = hora_matricula.ToString();
                    }



                    notas.InsertarNotas(Convert.ToDouble(txtNota1.Text), Convert.ToDouble(txtNota2.Text),
                        Convert.ToDouble(txtNota3.Text), Convert.ToInt32(txtIdentificacion.Text), 0, Convert.ToInt32(lblpruebaValorHorario.Text));


                    //MessageBox.Show("se inserto correctamente");
                    lblCorrectoError.Visible = true;
                    lblCorrectoError.ForeColor = Color.Green;
                    lblCorrectoError.Text = "Se ha ingresado correctamente";



                    lblPromedio.Text = "Promedio: " + promedio.ToString("#.##");


                    //Actualizar el promedio del estudiante.
                    notas.EditarProm(promedio, Convert.ToInt32(txtIdentificacion.Text));

                    pnlFrm.Visible = false;
                }
                catch (Exception ex)
                {
                    lblCorrectoError.Visible = true;
                    lblCorrectoError.ForeColor = Color.Red;
                    lblCorrectoError.Text = "Error. Verifique que haya ingresado los datos correctos: "+ex ;
                }

                txtIdentificacion.Text = "";
                txtNota1.Text = "";
                txtNota2.Text = "";
                txtNota3.Text = "";
            }
        }

        protected void btnActualizarNotasEst_Click(object sender, EventArgs e)
        {
            opNotas opNotas = new opNotas();

            int hora_matriculaAct;

            //verifica que no hayan campos vacíos.

            //if (txtIdentActualizar.Text == "" || txtNota1Actualizar.Text == "" ||
            //    txtNota2Actualizar.Text == "" || txtNota3Actualizar.Text == "")
            //{
            //    lblCorrectoError.Visible = true;
            //    lblCorrectoError.ForeColor = Color.Red;
            //    lblCorrectoError.Text = "Verifique que no haya ningún espacio en blanco.";
            //}
            //else
            //{
            //    try
            //    {

            //        decimal n1, n2, n3, promedio;
            //        n1 = Convert.ToDecimal(txtNota1Actualizar.Text);
            //        n2 = Convert.ToDecimal(txtNota2Actualizar.Text);
            //        n3 = Convert.ToDecimal(txtNota3Actualizar.Text);

            //        promedio = (n1 + n2 + n3) / 3;



            //        if (promedio <= 100 && promedio >= 90)
            //        {
            //            hora_matriculaAct = 3;
            //            lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
            //        }
            //        else if (promedio <= 90 && promedio >= 80)
            //        {
            //            hora_matriculaAct = 4;
            //            lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
            //        }
            //        else if (promedio <= 80 && promedio >= 70)
            //        {
            //            hora_matriculaAct = 5;
            //            lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
            //        }
            //        else if (promedio <= 70 && promedio >= 60)
            //        {
            //            hora_matriculaAct = 6;
            //            lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
            //        }
            //        else if (promedio <= 60 && promedio >= 50)
            //        {
            //            hora_matriculaAct = 7;
            //            lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
            //        }
            //        else if (promedio <= 50 && promedio >= 40)
            //        {
            //            hora_matriculaAct = 8;
            //            lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
            //        }
            //        else if (promedio <= 40 && promedio >= 30)
            //        {
            //            hora_matriculaAct = 9;
            //            lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
            //        }
            //        else if (promedio <= 30 && promedio >= 20)
            //        {
            //            hora_matriculaAct = 10;
            //            lblpruebaValorHorario.Text = hora_matriculaAct.ToString();
            //        }

            //        opNotas.EditarNotas(Convert.ToDouble(txtNota1Actualizar.Text), Convert.ToDouble(txtNota2Actualizar.Text),
            //                    Convert.ToDouble(txtNota3Actualizar.Text), Convert.ToInt32(txtIdentActualizar.Text), 0,
            //                    Convert.ToInt32(lblpruebaValorHorario.Text));

            //        opNotas.EditarProm(promedio, Convert.ToInt32(txtIdentActualizar.Text));

            //        lblPromedio.Text = "Promedio actualizado: " + promedio.ToString("#.##");
            //        lblPromedio.ForeColor = Color.Green;
            //    }
            //    catch (Exception)
            //    {

            //        lblCorrectoError.Visible = true;
            //        lblCorrectoError.ForeColor = Color.Red;
            //        lblCorrectoError.Text = "No se ha podido realizar la actualización.";
               
            //    }

            //}
        }

        protected void gvTablaUno_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int id = int.Parse(gvNotas.DataKeys[index].Value.ToString());

                txtIdentificacion.Text = id.ToString();

                pnlFrm.Visible = true;
            }
        }

        //protected void btnMostrarTabla_Click(object sender, EventArgs e)
        //{
        //    pnlTablaNotasEst.Visible = true;
        //}

        //protected void btnCerrarTabla_Click(object sender, EventArgs e)
        //{
        //    pnlTablaNotasEst.Visible = false;
        //}
    }
}