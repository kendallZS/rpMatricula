<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="teachermodule.aspx.cs" Inherits="matricula.iniciodocente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Docente</title>

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
             text-align:center
        }
       

         /*Para el header*/
        #navbarCollapse .navbar-nav a{
            color:white;
        }

        /*Callout luego del header*/
        #encabezado{
            height:130px;
        }

/*Tarjetas*/
  #cont-cards #card-1 {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
            width: 35%;
            margin-left: 17%;
            float:left;
        }

        #cont-cards #card-1:hover {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }


        #cont-cards #card-2 {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
            width: 35%;
            float:left;
            margin-left:5px
            /*margin-left:2%;*/
        }

        #cont-cards #card-2:hover {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }


        @media only screen and (max-width:600px) {
            /* For mobile phones: */
            #cont-cards #card-1,
            #cont-cards #card-2{
                width: 100%;
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
        <div id="encabezado" class="alert callout" style="border: none;">
            <br />
            <h2 style="color: lightyellow; text-shadow: 2px 2px 2px #FC4B2D; font-family: Verdana">Módulo del docente</h2>
            <br />
        </div>
     
        <br />
        <br />
        <br />

        <%--Tarjetas--%>
            <div id="cont-cards";width:100%">

                <div id="card-1" class="card">
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                            <h5 style="color:#cc4b37" class="card-title">Asignación de notas</h5>
                            <p class="card-text">Realice la asignación de notas a sus estudiantes mediante este ítem</p>
                            <a href="addnotes.aspx" class="btn btn-primary">Asignaciones</a>
                        </div>
                    </div>
                </div>

                <div id="card-2" class="card">
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                            <h5 style="color:#cc4b37" class="card-title">Actualización de notas</h5>
                            <p class="card-text">Cambie las notas asignadas a sus estudiantes en caso de requerirlo</p>
                            <a href="updatenotes.aspx" class="btn btn-primary">Actualizaciones</a>
                        </div>
                    </div>
                </div>
            </div>
    </form>

</body>
</html>
