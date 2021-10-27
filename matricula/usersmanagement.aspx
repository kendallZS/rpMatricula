<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="usersmanagement.aspx.cs" Inherits="matricula.usersmanagement" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manejo usuarios</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.6.3/dist/css/foundation.min.css" integrity="sha256-ogmFxjqiTMnZhxCqVmcqTvjfe1Y/ec4WaRj/aQPvn+I=" crossorigin="anonymous" />
  
   <%-- Para el header --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
        .bs-example {
            margin: 20px;
        }


        body{
            /* background: url("imgs/m5.jpg");*/
             font-family: Verdana;
             text-align:center;
             min-width:685px
        }
       

         /*Para el header*/
        #navbarCollapse .navbar-nav a{
            color:white;
        }

        /*Callout luego del header*/
        #encabezado{
            height:130px;
        }


           #gvMostrarUsrEstado{
            width:70%;
            margin-left:15%;
        }

           .btn-danger{
               border-radius:15px;
           }

           .btn-primary{
               border-radius:15px;
           }


     /*   @media only screen and (max-width:600px) {
            #gvMostrarUsrEstado {
                width: 100%;
                margin-left: 0%;
            }
        }*/

         @media only screen and (max-width:787px) {
            #gvMostrarUsrEstado {
                width: 100%;
                margin-left: 0%;
            }
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div style="margin: 0px" class="bs-example">
            <nav style="background-color: #cc4b37; margin: 0px" class="navbar navbar-expand-md navbar-light">
                <a href="#" class="navbar-brand">Bienvenido</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav">
                        <a href="#" class="nav-item nav-link active">Home</a>
                        <a href="#" class="nav-item nav-link">Profile</a>
                        <a href="#" class="nav-item nav-link">Messages</a>
                        <a href="#" class="nav-item nav-link disabled" tabindex="-1">Reports</a>
                    </div>
                    <div class="navbar-nav ml-auto">
                        <a href="#" class="nav-item nav-link">Log out</a>
                    </div>
                </div>
            </nav>
        </div>
        <div id="encabezado" class="alert callout" style="border: none;">
            <br />
            <h2 style="color: lightyellow; text-shadow: 2px 2px 2px #FC4B2D; font-family: Verdana">Activar / Inactivar cuentas de usuario</h2>
            <br />
        </div>

        <br />
     
        <asp:GridView AutoGenerateColumns="false" CssClass="table" runat="server" ID="gvMostrarUsrEstado" DataKeyNames="identificacion" OnRowCommand="gvMostrarUsrEstado_RowCommand">
            <Columns>
                <asp:BoundField DataField="identificacion" HeaderText="Identificación" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="apellidos" HeaderText="Apellidos" />
                <asp:BoundField DataField="estado" HeaderText="Estado" />
                <%--<asp:BoundField DataField="id_rol" HeaderText="Id rol" />--%>

                <asp:ButtonField ControlStyle-CssClass="btn btn-primary" Text="Activar" CommandName="Activar" />
                <asp:ButtonField ControlStyle-CssClass="btn btn-danger" Text="Inactivar" CommandName="Inactivar" />
            </Columns>
        </asp:GridView>

        <br />

    </form>

</body>
</html>
