<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addnotes.aspx.cs" Inherits="matricula.addnotes" %>

<!DOCTYPE html>

<html>
<head>

    <%-- RUTAS PARA ENLAZAR JS Y CSS, EN ESTE CASO ESTÁN EN ESTE MISMO DOM --%>
   <%-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/menu-acordeon.js"></script>
	<link type="text/css" rel="stylesheet" href="css/styles.css" />--%>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Asignación de notas</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.6.3/dist/css/foundation.min.css" integrity="sha256-ogmFxjqiTMnZhxCqVmcqTvjfe1Y/ec4WaRj/aQPvn+I=" crossorigin="anonymous">
    
    <%-- Icono en la pestaña --%>
    <link rel="shortcut icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtwqLEhOP7jsw7yv3WPqTSluT6C_0Je_PF5w&usqp=CAU"/>

    <%-- Para el header --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
       
    </style>

    <style>
     
       * {
            font-family: 'Times New Roman';
            font-size: 18px;
            /*font-family:Tahoma;*/
            /*font-family:Comic Sans MS;*/
        }

         .bs-example {
            margin: 20px;
        }

            /*Para el header*/
        #navbarCollapse .navbar-nav a{
            color:white;
        }

        #lblMostrarUsuario{
            font-size:x-large;
            text-shadow:1px 1px 1px gray;
        }

        #gvUsrs {
            width: 85%;
            margin-left: 8.5%;
        }

        .primary {
            border-radius: 10px;
            border: none;
            font-weight: bold;
        }


        #txtNombreBuscar {
            float: right;
            border-radius: 13px;
        }

         #btnbuscar{
             margin-right:6.3%;
            float:right;
            border-radius:20px;
        }

          #encabezado{
           /* height:130px;*/
            background-image: url("imgs/Vine.jpg");
        }

    </style>
  
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
<body style="margin: 0; text-align:center; min-width:605px">
    <form id="form1" runat="server">

        <div id="encabezado" class="alert callout" style="border: none;">
             <div style="margin: 0px" class="bs-example">
            <nav style="margin: 0px" class="navbar navbar-expand-md navbar-light">
                <a href="#" style="font-size:26px;color:#353b48" class="navbar-brand">Bienvenido</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div style="font-size:24px" class="navbar-nav">
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
            <h2 style="color: lightyellow; text-shadow: 2px 2px 2px #55E6C1; font-family: Verdana">Asignación de roles de usuario</h2>
            <br />
                 <asp:Label Font-Size="20px" ID="lblMostrarUsuario" ForeColor="#10ac84" Text="No existe sesión" runat="server" />
        </div>


        <%--<div style="margin: 0px" class="bs-example">
            <nav style="background-color: #cc4b37; margin: 0px" class="navbar navbar-expand-md navbar-light">
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
            <h2 style="color: lightyellow; text-shadow: 2px 2px 2px #FC4B2D; font-family: Verdana">Módulo de asignación de notas</h2>
            <br />
            <h6 style="color:white;text-shadow: 2px 2px 2px gray">Usuario:</h6>           
             <asp:Label Font-Size="20px" ID="lblMostrarUsuario" ForeColor="green" Text="No existe sesión" runat="server" />
        </div>--%>

        <asp:TextBox MaxLength="9" ID="txtRaiseError" Enabled="false" runat="server" />
        <br /> <br />
     <h3 style="color: #10ac84">Asigne las notas en la siguiente lista.</h3>
        <p style="color: gray">En caso de que la cifra tenga decimales utilice una coma (,).</p>
        <br />



        <asp:Button CssClass="btn btn-info" Text="Buscar" ID="btnbuscar" runat="server" OnClick="btnbuscar_Click" /> &nbsp;&nbsp;&nbsp;
        <asp:TextBox CssClass="form-control" Width="20%" runat="server" ID="txtNombreBuscar" placeholder="Búsqueda por nombre" />
        <br />
        <br />
        <%-- TABLA CON LOS USUARIOS A LOS QUE ASIGNAR NOTAS (estudiantes) --%>
        <asp:GridView AutoGenerateColumns="false" ID="gvUsrs" runat="server" OnRowCommand="gvUsrs_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="Identificación" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblIdentificacion" Text='<%# Eval("identificacion") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" Text='<%# Eval("nombre") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Apellidos" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblApellidos" Text='<%# Eval("apellidos") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nota 1" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:TextBox MaxLength="6" ID="txtn1" Text="00,00" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nota 2" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:TextBox MaxLength="6" ID="txtn2" Text="00,00" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nota 3" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:TextBox MaxLength="6" ID="txtn3" Text="00,00" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button CssClass="btn btn-primary" Text="Agregar" runat="server" CommandName="Notas" CommandArgument="<%# Container.DataItemIndex %>" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:Label hidden="" ID="lblpruebaValorHorario" Text="text" runat="server" />


        <%-- MENÚ DESPLEGABLE PARA LAS DOS OPCIONES DEL DOCENTE --%>
      <%--  <div class="dropdownMenu">
		<div class="title dropdownButton">
		    <p>Formulario para asignar notas a estudiantes</p>
		</div>
		<div class="dropdownContent">
		    <ul>
			<li>
          
			</li>--%>
			<%--<li><a href="#">ITEM II</a></li>--%>
		<%--    </ul>
		</div>
	</div>--%>   
    </form>

   

    <style>
        @media only screen and (max-width: 600px) {
            .a {
                width: 100%;
            }
        }

            @media only screen and (max-width:750px){
            #gvUsrs{
                margin-left:0%;
                width:100%;
            }
        }

    </style>

</body>
</html>
