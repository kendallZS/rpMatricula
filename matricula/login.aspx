<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="matricula.login" %>
<!doctype html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login</title>

     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.6.3/dist/css/foundation.min.css" integrity="sha256-ogmFxjqiTMnZhxCqVmcqTvjfe1Y/ec4WaRj/aQPvn+I=" crossorigin="anonymous">

    <%-- header --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .bs-example {
            margin: 20px;
        }
    </style>

    <style>
        body{
            text-align:center
        }

         #navbarCollapse .navbar-nav a{
            color:white;
        }

        #encabezado{
            height:130px;
        }


       /*formulario*/
       .cont-login{
           width:35%;
           margin-left:33%;
       }

       .callout .cont-login #cont-log2{
           background-color:lightgray;
           border:none;
       }

       .callout .cont-login #cont-log2 h3{
           color:#cc4b37;
       }

        .callout .cont-login #cont-log2 #btnlogin{
           border-radius:15px;
       }

          @media only screen and (max-width:1024px) {
        .cont-login {
            width:50%;
           margin-left:26.5%;
        }
    }

         @media only screen and (max-width:800px) {
        .cont-login {
            width:100%;
           margin-left:0%;
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
       
        <br />
        <br />
        <br />

        <div class="callout">
            <br />
            <br />
            <div class="cont-login">
                <div id="cont-log2" class="callout">
                    <h3>Inicio de sesión</h3>
                    <asp:TextBox placeholder="Identificación" ID="txtIdentificacion" runat="server"></asp:TextBox>
                    <asp:TextBox placeholder="Contraseña" ID="txtContrasena" runat="server"></asp:TextBox>
                    <asp:Button CssClass="button alert" ID="btnlogin" runat="server" Text="Ingresar" />
                </div>
            </div>
            <br />
            <br />
        </div>
    </form>

</body>
</html>
