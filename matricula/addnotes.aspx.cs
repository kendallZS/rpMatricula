using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace matricula
{
    public partial class addnotes : System.Web.UI.Page
    {
        OpUsuarios ob = new OpUsuarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvUsrs.DataSource = ob.MostrarUsrs();
            gvUsrs.DataBind();
        }
    }
}