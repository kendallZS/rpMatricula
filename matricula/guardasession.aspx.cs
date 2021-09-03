using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace matricula
{
    public partial class guardasession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["misesion"]!=null)
            //{
                //Session["misesion"] = txtvalorSesion.Text;
            
             
            /*  txtPruebasession.Text = ((int)Session["sesion"]).ToString()*/

        }

       
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            Session["misesion"] = txtvalorSesion.Text;
        }
    }
}