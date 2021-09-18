using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
namespace matricula
{
    public partial class asignacionroles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pnlAsigRol.Visible = false;

            opAsignarRol opAsignarRol = new opAsignarRol();

            gvMostrarUsrSinRol.DataSource = opAsignarRol.RolUsrs();
            gvMostrarUsrSinRol.DataBind();

            //GridView1.DataSource = opAsignarRol.RolUsrs();
            //GridView1.DataBind();
        }

        protected void UsrsSinRol_Rowcomand(object sender, GridViewCommandEventArgs e)
        {
            gvMostrarUsrSinRol.Visible = false;
            pnlAsigRol.Visible = true;

            if (e.CommandName == "Asignar")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int ident = int.Parse(gvMostrarUsrSinRol.DataKeys[index].Value.ToString());

                txtidentAsigRol.Text = ident.ToString();

            }
        }

        //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "Select")
        //    {
        //        //Determine the RowIndex of the Row whose Button was clicked.
        //        int rowIndex = Convert.ToInt32(e.CommandArgument);

        //        //Reference the GridView Row.
        //        GridViewRow row = GridView1.Rows[rowIndex];

        //        //Fetch value of Name.
        //        string name = (row.FindControl("txtName") as TextBox).Text;

        //        //Fetch value of Country
        //        string country = row.Cells[1].Text;

        //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Name: " + name + "\\nCountry: " + country + "');", true);
        //    }
        //}
    }
}