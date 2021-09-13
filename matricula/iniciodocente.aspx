<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iniciodocente.aspx.cs" Inherits="matricula.iniciodocente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Docente</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.6.3/dist/css/foundation.min.css" integrity="sha256-ogmFxjqiTMnZhxCqVmcqTvjfe1Y/ec4WaRj/aQPvn+I=" crossorigin="anonymous" />

    <%-- Materialize --%>
     <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            

    <%-- Para el header --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .bs-example {
            margin: 20px;
        }


        /*Para el header*/
        #navbarCollapse .navbar-nav a {
            color: white;
        }

        /*Callout luego del header*/
        #encabezado {
            height: 130px;
        }

/*Tarjetas*/
  #cont-cards #ct1 #card-1 {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
            width: 70%;
            margin-left: 30%;
        }

        #cont-cards #ct1 #card-1:hover {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }


        #cont-cards #ct2 #card-2 {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
            width: 70%;
            margin-left:2%;
        }

        #cont-cards #ct2 #card-2:hover {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }


        @media only screen and (max-width:600px) {
            /* For mobile phones: */
            .main .callout #card {
                width: 100%;
                margin-left: 15%;
            }
        }
      
    </style>

</head>
<body style="font-family: Verdana; text-align:center">
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
            <h2 style="color: lightyellow; text-shadow: 2px 2px 2px #FC4B2D; font-family: Verdana">Módulo del docente</h2>
            <br />
        </div>
        <br />


        <%--Tarjetas--%>
            <div id="cont-cards" style="word-wrap: break-word;display: flex !important;" class="callout">

                <div id="ct1" style="width: 80%; border: none" class="callout">
                    <div id="card-1" class="card">
                        <img style="height: 60px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg6mTt1EIgit18bPwjA_OyzpeVDJkuiR2qOw&usqp=CAU" alt="Avatar">
                        <br />
                        <div class="container">
                            <h5>
                                <asp:Label ID="lblMostrarIdentificacion" Text="text" runat="server" /><asp:Label ID="lblMostrarNombre" Text="text" runat="server" /></h5>
                            <asp:GridView CssClass="callout primary" Height="10px" ForeColor="" BackColor="Red" ID="gvhorario" runat="server"></asp:GridView>
                            <asp:Label ID="lblMostrar" Text="text" runat="server" />
                            <br />
                            <br />
                            <a onclick="myFunction2()" style="float: right" href="#">Detalles</a>
                        </div>
                    </div>
                </div>


                  <div id="ct2" style="width: 80%; border: none" class="callout">
                    <div id="card-2" class="card">
                        <img style="height: 60px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg6mTt1EIgit18bPwjA_OyzpeVDJkuiR2qOw&usqp=CAU" alt="Avatar">
                        <br />
                        <div class="container">
                            <h5>
                                <asp:Label ID="Label1" Text="text" runat="server" /><asp:Label ID="Label2" Text="text" runat="server" /></h5>
                            <asp:GridView CssClass="callout primary" Height="10px" ForeColor="" BackColor="Red" ID="GridView1" runat="server"></asp:GridView>
                            <asp:Label ID="Label3" Text="text" runat="server" />
                            <br />
                            <br />
                            <a onclick="myFunction2()" style="float: right" href="#">Detalles</a>
                        </div>
                    </div>
                </div>
            
            </div>
    </form>

</body>
</html>
