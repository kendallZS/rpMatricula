using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Drawing;

namespace matricula
{
    public partial class studentmodule : System.Web.UI.Page
    {
        private SqlConnection connection2 = new SqlConnection("Server=.\\SQLEXPRESS;DataBase= Matricula;Integrated Security=true");

        protected void Page_Load(object sender, EventArgs e)
        {
            OpUsuarios opUsuarios = new OpUsuarios();
            try
            {
                //Muestra la sesión
                if (Session["misesion"] != null)
                {
                    lblGuardaSesion.Text = Session["misesion"].ToString();
                }

                lblMostrarIdentificacion.Text = lblGuardaSesion.Text;
                lblMostrarNombre.Text = " | "+opUsuarios.MostrarNombre(Convert.ToInt32(lblGuardaSesion.Text));

                opHorarioMatricula horarioMatricula = new opHorarioMatricula();
                opNotas opNotas = new opNotas();

                gvDesglose.DataSource = opNotas.MostrarNotasEstudiantes(Convert.ToInt32(lblGuardaSesion.Text));
                gvDesglose.DataBind();

                lblMostrar.Text = horarioMatricula.MostrarHorario(Convert.ToInt32(lblGuardaSesion.Text));
            }
            catch (Exception)
            {
                lblMostrarIdentificacion.ForeColor = Color.Red;
                lblMostrarIdentificacion.Text = "Información inaccesible ya que no existe sesión o esta se ha cerrado.";
            }

        }
    }
}