using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace matricula
{
    public partial class login : System.Web.UI.Page
    {
        private SqlConnection connection = new SqlConnection("Server=.\\SQLEXPRESS;DataBase= Matricula;Integrated Security=true");

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMensaj.Visible = false;

            OpUsuarios opurs = new OpUsuarios();

            txtContDesencriptada.Text = opurs.MostrarDesencripcion(364829572).ToString();
         
        }
     
        protected void btnRegistrarme_Click(object sender, EventArgs e)
        {
            OpUsuarios opUsuarios = new OpUsuarios();

            try
            {
                if (txtIdentificacionRegistro.Text == "" || txtNombre.Text == "" ||
                txtApellidos.Text == "" || txtContrasenaRegistro.Text == "")
                {
                    lblMensaj.Visible = true;
                    lblMensaj.ForeColor = Color.Red;
                    lblMensaj.Text = "Verifique que no haya ningún espacio en blanco.";
                }
                else
                {
                    opUsuarios.InsertarRegistraUrs(Convert.ToInt32(txtIdentificacionRegistro.Text), txtNombre.Text,
                   txtApellidos.Text, 3, txtContrasenaRegistro.Text);

                    lblMensaj.Visible = true;
                    lblMensaj.ForeColor = Color.Green;
                    lblMensaj.Text = "Se ha registrado con éxito";

                }
            
            }
            catch (Exception)
            {
                lblMensaj.Visible = true;
                lblMensaj.ForeColor = Color.Red;
                lblMensaj.Text = "No se ha podido realizar El registro";

            }
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            //Variable de sesión que identifica al usuario
            Session["misesion"] = txtIdentificacion.Text;


            try
            {
                connection.Open();
                string strCadSQL;

                SqlDataReader myReader = null;
                strCadSQL = "Select identificacion,id_rol,libre= convert(varchar(100),DecryptByPassPhrase('key',contrasena)) from Usuarios as Decrypt";
                SqlCommand myCommand = new SqlCommand(strCadSQL, connection);


                myReader = myCommand.ExecuteReader();

                int contador = 0;


                while (myReader.Read())
                {

                    String identificacion = myReader["identificacion"].ToString();
                    String contrasena = myReader["libre"].ToString();
                    String rol = myReader["id_rol"].ToString();


                    if (txtIdentificacion.Text == identificacion && txtContrasena.Text == contrasena)
                    {

                        if (rol.Contains("1"))
                        {
                            contador = 1;
                            //docente
                        }
                        else if (rol.Contains("2"))
                        {
                            contador = 2;
                            //estudiante
                        }
                        else if (rol.Contains("3"))
                        {
                            contador = 3;
                            //rol indefinido
                        }
                    }

                    if (contador == 1)
                    {
                        Response.Redirect("addnotes.aspx");

                    }

                    else if (contador == 2)
                    {
                        Response.Redirect("studentmodule.aspx");

                    }
                    else if (contador == 3)
                    {
                        lblMensaj.Text = "Aún no tiene un rol asignado en este sitema.";
                        lblMensaj.Visible = true;
                        lblMensaj.ForeColor = Color.DarkOrange;
                        lblMensaj.BackColor = Color.White;
                        //lblMensaj.BorderStyle = BorderStyle.Inset;
                    }
                    else
                    {
                        lblMensaj.Visible = true;
                        lblMensaj.Text = "Verifique sus credenciales";
                    }

                }
            }
            catch (Exception)
            {
                lblMensaj.Text = "Verifique que haya ingresado las credenciales correctas";
                lblMensaj.Visible = true;
                lblMensaj.ForeColor = Color.Red;
            }
        }
    }
}