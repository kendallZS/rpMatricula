using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace matricula
{
    public partial class pruebasession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["misesion"] != null)
            {
                lblmuestraSesion.Text = Session["misesion"].ToString();
            }
            
        }
    
    }
}