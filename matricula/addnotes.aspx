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
        .bs-example {
            margin: 20px;
        }
    </style>

     <style>
        
        .window-notice {
            background: rgba(33, 41, 52, .85);
            /*left: 0;
            bottom: 0;
            right: 0;*/
            top: 0;
/*            display: flex;
*/            position: fixed;
            width:100%;
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
                width:20%;
                border-radius:44px;
                margin-left:5%;
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
            /*height:130px;*/
        }

        #lblMostrarUsuario{
            font-size:x-large;
            text-shadow:1px 1px 1px gray;
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

    <script>
        $(document).ready(function () {

            //Botón de acción del acordeón
            $('.dropdownButton').click(function () {

                //Elimina la clase on de todos los botones
                $('.dropdownButton').removeClass('on');

                //Plegamos todo el contenido que esta abierto
                $('.dropdownContent').slideUp('slow');

                //Si el siguiente slide no esta abierto lo abrimos
                if ($(this).next().is(':hidden') == true) {

                    //Añade la clase on en el botón
                    $(this).addClass('on');

                    //Abre el slide
                    $(this).next().slideDown('slow');
                }

            });

            // Cerramos todo el contenido al cargar la página
            $('.dropdownContent').hide();

        });
    </script>

    <style>
        body{
	font-family: Arial, Verdana;
}
.dropdownMenu{
	width: 100%;
	margin-bottom: 3px;
}
.title{
	padding: 7px 10px;
	background-color: #994b4b;
	color: white;
	margin-bottom: 0;
}
.title:hover{
	background-color: #c26060;
}
.dropdownButton:hover{
	cursor: pointer;
}
.dropdownButton > p .fa{
	float: right;
}
.dropdownContent ul{
	margin: 0;
	padding: 0 10px;
}
.dropdownContent,
.dropdownButton{
	border: 1px solid #994b4b;
}
.dropdownContent{
	padding: 15px 8px;
	background-color: #fff;
	margin-top: -1px;
}
.dropdownContent ul li{
	list-style: none;
	padding: 5px 0;
}
.dropdownContent ul li a{
	text-decoration: none;
}
.dropdownContent ul li a:hover{
	color: blue;
}


        #gvUsrs {
            width: 85%;
            margin-left: 8.5%;
        }
    </style>


</head>
<body style="margin: 0; text-align:center; min-width:605px">
    <form id="form1" runat="server">
        <div style="margin: 0px" class="bs-example">
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
        </div>

        <%-- TABLA CON LOS USUARIOS A LOS QUE ASIGNAR NOTAS (estudiantes) --%>
        <asp:GridView AutoGenerateColumns="false" ID="gvUsrs" runat="server">
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
                <asp:TextBox MaxLength="6" ID="txtAsigN1" Text="00,00"  runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
                 <asp:TemplateField HeaderText="Nota 2" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:TextBox MaxLength="6" ID="txtAsigN2" Text="00,00"  runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
                 <asp:TemplateField HeaderText="Nota 3" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:TextBox MaxLength="6" ID="txtAsigN3" Text="00,00"  runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button CssClass="button primary" Text="Actualizar" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
        </asp:GridView>


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
