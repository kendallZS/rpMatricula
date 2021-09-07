<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addnotes.aspx.cs" Inherits="matricula.addnotes" %>

<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Ingreso de notas</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.6.3/dist/css/foundation.min.css" integrity="sha256-ogmFxjqiTMnZhxCqVmcqTvjfe1Y/ec4WaRj/aQPvn+I=" crossorigin="anonymous">
    
    <%-- Icono en la pestaña --%>
    <link rel="shortcut icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtwqLEhOP7jsw7yv3WPqTSluT6C_0Je_PF5w&usqp=CAU"/>

    <%-- Para el header --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .bs-example {
            margin: 20px;
        }
    </style>

     <style>
        
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
    </style>
    <style>
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
    </style>


    <style>
      

        body {
            font-family:Garamond;
            /*font-family: Didot;*/
             /*font-family:Perpetua;*/
        }
        #frm {
            font-family: Garamond;
           /*font-family:Didot;*/
        }

            #frm h2 {
                font-family: Garamond;
            }

        .header1 .callout a {
            padding:15px;
            font-size:18px;
            color: white;
            text-decoration: none;
            margin: 1%;
        }

            .header1 a:hover {
                background: #3493FA;
                color: white;
            }
            #btnGuardarNotas{
                border-radius:17px;
                background:#cc4b37;
                color:white;
            }
            .txt{
                margin-left:25%;
               width:50%;
            }

            .gv-cont{
                overflow-y:scroll;
                height:300px;
            }

            #btnActualizarNotasEst{
                background-color:#cc4b37;
                width:55px;
                border-radius:44px;
                margin-left:43%;
                /*font-size:15px;*/
            }
            #btnActualizarNotasEst:hover{
                background:green;
            }
            #btnCerraModal{
                background-color:#FC4B2D;
               /*width:60px;*/
                border-radius:44px;
                /*margin-left:40%;*/
                /*font-size:15px;*/
            }

            #btnCerraModal:hover{
                background:green;
            }


            #btnModalActNotas:hover{
                background-color:lightgray;
                border-radius:4px;
            }


            /*Para el header*/
        #navbarCollapse .navbar-nav a{
            color:white;
        }

        #encabezado{
            height:130px;
        }
    </style>
    
    <%-- Abrir o cerrar la modal --%>
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
<body style="margin: 0; text-align:center">
    <form id="form1" runat="server">
        <div style="margin: 0px" class="bs-example">
            <nav style="background-color: #cc4b37; margin: 0px" class="navbar navbar-expand-md navbar-light">
                <a href="#" class="navbar-brand">Bienvenido</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarCollapse">
                    Ha ingresado como:...
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

        <asp:Panel ID="pnlFrm" CssClass="callout" runat="server">
            <h3 style="color: #cc4b37;">Ingrese los siguientes datos</h3>
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:TextBox CssClass="txt" MaxLength="9" onkeypress="ValidaSoloNumeros()" placeholder="Identificación estudiante" ID="txtIdentificacion" runat="server"></asp:TextBox>
                    <asp:TextBox CssClass="txt" placeholder="Nota 1" ID="txtNota1" runat="server"></asp:TextBox>
                    <asp:TextBox CssClass="txt" placeholder="Nota 2" ID="txtNota2" runat="server"></asp:TextBox>
                    <asp:TextBox CssClass="txt" placeholder="Nota 3" ID="txtNota3" runat="server"></asp:TextBox>
                  
                    <a style="color:#1779ba" onclick="myFunction2()">Actualización de notas</a>
                    <br />
                    <br />
                   <asp:Button CssClass="button" ID="btnGuardarNotas" Text="Agregar" runat="server" OnClick="btnGuardarNotas_Click" />
                    <br />
                    <br />
                    <asp:Label ID="lblCorrectoError" Text="..." runat="server" />
                    <br />
                    <asp:Label ID="lblPromedio" Text="El promedio de este alumno es: " runat="server" />
                    <br />
                    <asp:Label Text="text" ID="lblpruebaValorHorario" runat="server" />
                  </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        





          
<%--        </div>--%>
          
        <%--</div>--%>
        <%--        </div>--%>
        <br />
        <br />

        Usuarios:
        <br />
        <br />
        <div class="gv-cont">
        <asp:GridView CssClass="gv" ID="gvUsrs" runat="server"></asp:GridView>
        </div>

            <%-- Modal Actualizacion notas --%>
        <div class="window-notice" style="display: none;" id="window-notice">
            <div class="content">
                <header style="background-color:#cc4b37">
                    <h3 style="color:white;font-size:27px">Actualización de notas</h3>
                    <p style="font-size:15px;color:white">Ingrese lo que se le solicita acontinuación <br />
                    (Las cifras con decimales deben separarse mediante una coma (,)</p>
                </header>
                <br />
                <asp:TextBox CssClass="txt" MaxLength="9" onkeypress="ValidaSoloNumeros()" placeholder="Identificación estudiante" ID="txtIdentActualizar" runat="server"></asp:TextBox>
                <asp:TextBox CssClass="txt" placeholder="Nota 1" ID="txtNota1Actualizar" runat="server"></asp:TextBox>
                <asp:TextBox CssClass="txt" placeholder="Nota 2" ID="txtNota2Actualizar" runat="server"></asp:TextBox>
                <asp:TextBox CssClass="txt" placeholder="Nota 3" ID="txtNota3Actualizar" runat="server"></asp:TextBox>
                <br />
                <asp:Button CssClass="button" ID="btnActualizarNotasEst" Text="Actualizar" runat="server" OnClick="btnActualizarNotasEst_Click" />
               <asp:Label ID="lblActualizaNotas" Text="Se actualizó correctamente" runat="server" />
                <a onclick="myFunction2()" href="#">Cerrar</a>
                <br />

            </div>
        </div>
    </form>

   

    <style>
        @media only screen and (max-width: 600px) {

            .btn {
                width: 100%;
            }
        }

        @media only screen and (max-width: 600px) {
            .txt {
                margin-left: 0%;
                width: 100%;
            }
        }

        @media only screen and (max-width: 600px) {
            .a {
                width: 100%;
            }
        }
    </style>

   <%-- <div style="position: absolute; top: 80%; left: 44%" class="cont-modal">
    
        <button style="position:relative;color: darkcyan" id="btnModalActNotas" onclick="myFunction2()">Actualizar notas estudiante</button>
          
    </div>--%>

  <%--  <button style="position:fixed;top:53.5%;left:51.2%;display:none" class="button" ID="btnCerraModal" onClick="myFunction2()">Cancelar</button>--%>


</body>
</html>
