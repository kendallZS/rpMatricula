using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace matricula
{
    public partial class studentmodule : System.Web.UI.Page
    {
        private SqlConnection connection2 = new SqlConnection("Server=.\\SQLEXPRESS;DataBase= Matricula;Integrated Security=true");

        protected void Page_Load(object sender, EventArgs e)
        {
           
            opHorarioMatricula horarioMatricula = new opHorarioMatricula();
            opNotas opNotas = new opNotas();
            //lblMostrarHorario.Text = horarioMatricula.MostrarHorario(364829517).ToString();

            //gvhorario.DataSource = horarioMatricula.MostrarHorario(364829517);
            //gvhorario.DataBind();

            //lblMostrar.Text = horarioMatricula.MostrarHorario(364829517).ToString();

            gvDesglose.DataSource = opNotas.MostrarNotasEstudiantes(365987542);
            gvDesglose.DataBind();

            lblMostrar.Text = horarioMatricula.MostrarHorario(365987542);

            //Prueba mostrar en label

            //SqlCommand comando = new SqlCommand("select Matricula.fecha from Matricula inner join Notas on Matricula.id_matricula = Notas.id_matricula where Notas.identificacion = @identificacion", connection2);

            ////comando.CommandType = CommandType.StoredProcedure;
            //comando.Parameters.AddWithValue("@identificacion", 364829517);
            //connection2.Open();
            //SqlDataReader usr = comando.ExecuteReader();

            //if (usr.Read())
            //{
            //    lblMostrar.Text = usr["fecha"].ToString();
            //}

         

            //connection2.Close();
            //return tabla;
        
    }
    }
}