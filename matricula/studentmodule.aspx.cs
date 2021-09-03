using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace matricula
{
    public partial class studentmodule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            opHorarioMatricula horarioMatricula = new opHorarioMatricula();
            //lblMostrarHorario.Text = horarioMatricula.MostrarHorario(364829517).ToString();
            gvhorario.DataSource = horarioMatricula.MostrarHorario(364829517);
            gvhorario.DataBind();

        }
    }
}