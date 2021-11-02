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
        body {
            text-align: center;
            font-family:'Times New Roman';
            background: url("imgs/m5.jpg");
        }

        #navbarCollapse .navbar-nav a {
            color: #10ac84;
            font-size:18px
        }

        #encabezado {
            height: 130px;
        }

        /*Modal*/
        .window-notice {
            background: rgba(33, 41, 52, .85);
            left: 0;
            bottom: 0;
            right: 0;
            top: 0;
            display: flex;
            position: fixed;
            /*  z-index: 999;*/
        }

            .window-notice .content {
                background: #fff;
                border-radius: 2px;
                box-shadow: 0 1px 3px rgba(33, 41, 52, .75);
                box-sizing: content-box;
                display: flex;
                flex-direction: column;
                margin: auto;
                max-width: 600px;
                min-width: 320px !important;
                overflow: hidden;
                position: relative;
                width: 100%;
                padding: 0;
                font-size: 1.3rem;
            }

        #btnRegistrarme {
            width: 120px;
            margin-left: 0%;
            border-radius: 30px;
            background-color:#10ac84;
        }


        #btnAbrirModal{
            background-color:white;
            color:#1779ba;
            border:none;
            border-radius:25px;
            font-size:14px
        }


        #txtIdentificacionRegistro {
            border-radius: 10px;
        }

        #txtNombre {
            border-radius: 10px;
        }

        #txtApellidos {
            border-radius: 10px;
        }

        #txtContrasenaRegistro {
            border-radius: 10px;
        }
        /*Fin modal*/


        /*formulario*/
        /*.callout {
            border-radius:30px;
        }*/

        .callout {
            background-color:ivory;
            width: 35%;
            margin-left: 33%;
            border-radius:30px;
        }

            #btnlogin {
                border-radius: 25px;
                background-color:#10ac84
            }

             #txtIdentificacion{
                border-radius:10px;
            }
             #txtContrasena{
                border-radius:10px;
            }



        @media only screen and (max-width:1024px) {
            .cont-login {
                width: 50%;
                margin-left: 26.5%;
            }
        }

        @media only screen and (max-width:800px) {
            .callout{
                width: 100%;
                margin-left: 0%;
            }
        }

/*Registro media screen*/
  @media only screen and (max-width:600px) {
            .window-notice .content #btnRegistrarme{
                width: 100%;
                margin-left: 0%;
            }
        }
    </style>

    <%-- Para la modal de registro --%>
    <script>

        function myFunction2() {
            var x = document.getElementById("window-notice");

            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }
    </script>

    <%-- EVITA EL PASTE Y COPY EN LAS CAJAS DE TEXTO --%>
<%--    <script type="text/javascript">
        $(document).ready(function () {
            $("#txtIdentificacion").bind('copy', function (e) {
                alert('copying text!');
            });
            $("#txtIdentificacion").bind('paste', function (e) {
                alert('pasting text!');
            });
            $("#txtIdentificacion").bind('cut', function (e) {
                alert('cut text!');
            });
        });
    </script>--%>





    <%-- Valida que ingrese solo numeros en campos como la identificacion --%>
     <script type="text/javascript" >
               //Función que permite solo Números
         function ValidaSoloNumeros() {
             if ((event.keyCode < 48) || (event.keyCode > 57))
                 event.returnValue = false;
         }

         //Valida solo texto
         function SoloTexto() {
             if ((event.keyCode != 32) && (event.keyCode < 65) || (event.keyCode > 90) && (event.keyCode < 97) || (event.keyCode > 122))
                 event.returnValue = false;
         }
     </script>





</head>
<body>

    <form id="form1" runat="server">
        <div style="margin: 0px" class="bs-example">
            <nav style="background-color:ivory; margin: 0px" class="navbar navbar-expand-md navbar-light">
                <a href="#" class="navbar-brand">Bienvenido</a>
                <br />
                <br />
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
                    </div>
                </div>
            </nav>
        </div>
        <asp:TextBox hidden="" ID="txtContDesencriptada" runat="server" />
        <br />
        <br />
        <br />



        <%--<div class="callout">--%>
        <br />
        <br />
        <div class="callout">
            <br />
            <h3 style="color: #10ac84">Inicio de sesión</h3>
            <asp:TextBox oncut="return false" oncopy="return false" onkeypress="ValidaSoloNumeros()" MaxLength="9" placeholder="Identificación" ID="txtIdentificacion" runat="server"></asp:TextBox>
            <asp:TextBox onpaste="return false" oncut="return false" oncopy="return false" placeholder="Contraseña" ID="txtContrasena" runat="server" TextMode="Password"></asp:TextBox>
            <asp:Button CssClass="button alert" ID="btnlogin" runat="server" Text="Ingresar" OnClick="btnlogin_Click" />
            <br />
            <%--<a style="color:#1779ba" onclick="myFunction2()">¿No tiene cuenta?</a>--%>
            <button id="btnAbrirModal" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">¿No tiene cuenta?</button>

            <br />
            <asp:Label ID="lblMensaj" Text="text" runat="server" />
        </div>
        <br />
        <br />
        <%--        </div>--%>



        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h3 style="color: #10ac84; font-size: 27px">Complete los siguientes datos para realizar el registro</h3>
                        <%-- <p style="font-size: 15px;">Pronto se le asignará el rol correspondiente</p>--%>
                    </div>
                    <div class="modal-body">
                        <asp:TextBox onpaste="return false" oncut="return false" oncopy="return false" onkeypress="ValidaSoloNumeros()" MaxLength="9" CssClass="form-control" ID="txtIdentificacionRegistro" placeholder="Identificación" runat="server" />
                        <asp:TextBox onpaste="return false" oncut="return false" oncopy="return false" onkeypress="SoloTexto()" CssClass="form-control" ID="txtNombre" placeholder="Nombre" runat="server" />
                        <asp:TextBox onpaste="return false" oncut="return false" oncopy="return false" onkeypress="SoloTexto()" CssClass="form-control" ID="txtApellidos" placeholder="Apellidos" runat="server" />
                        <asp:TextBox onpaste="return false" oncut="return false" oncopy="return false" TextMode="Password" CssClass="form-control" ID="txtContrasenaRegistro" placeholder="Contraseña" runat="server" />
                        <asp:Button CssClass="button alert" ID="btnRegistrarme" Text="Registrarme" runat="server" OnClick="btnRegistrarme_Click" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>




        <%-- Modal para formulario de registro --%>
        <div class="window-notice" style="display: none;" id="window-notice">
            <div class="content">
                <header style="background-color: #cc4b37">
                    <h3 style="color: white; font-size: 27px">Ingrese los siguientes datos</h3>
                    <p style="font-size: 15px; color: white">Pronto se le asignará el rol correspondiente</p>
                </header>
                <br />
                
                
                <a style="color:#1779ba" onclick="myFunction2()">Cerrar</a>
                <br />

            </div>
        </div>
    </form>
</body>
</html>
