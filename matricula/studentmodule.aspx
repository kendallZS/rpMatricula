<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentmodule.aspx.cs" Inherits="matricula.studentmodule" %>


<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.6.3/dist/css/foundation.min.css" integrity="sha256-ogmFxjqiTMnZhxCqVmcqTvjfe1Y/ec4WaRj/aQPvn+I=" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .bs-example {
            margin: 20px;
        }
    </style>

    <title>Student</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

<style>
* {
  box-sizing: border-box;
}
.menu {
  float: left;
  width: 20%;
}
.menuitem {
  padding: 8px;
  margin-top: 7px;
  border-bottom: 1px solid #f1f1f1;
}
.main {
  float: left;
  width: 100%;
  padding: 0 20px;
  overflow: hidden;
}
.right {
  background-color: lightblue;
  float: left;
  width: 20%;
  padding: 10px 15px;
  margin-top: 7px;
}

#pnlFrm{
    width:70%;
    margin-left:15%;
    border:none;
}

    #pnlFrm .txt {
        width: 80%;
        margin-left: 15%;
    }


@media only screen and (max-width:700px) {
  /* For mobile phones: */
  .menu, .main, .right {
    width: 100%;
  }
}
@media only screen and (max-width:850px) {
  /* For mobile phones: */
  .main .txt{
    width: 100%;
  }
}
@media only screen and (max-width:850px) {
  /* For mobile phones: */
  #pnlFrm{
    width: 100%;
    margin-left:0%;
  }
}
@media only screen and (max-width:850px) {
  /* For mobile phones: */
  #pnlFrm .txt {
      width: 100%;
        margin-left: 0%;
    }
}

@media only screen and (max-width:600px) {
  /* For mobile phones: */
    header{
        /* Enable flex mode. */
        display: flex; 
        
        /* Spread out the elements inside the header. */
        justify-content: space-between;

        /* Align items vertically in the center. */
        align-items: center;

    }
}

@media (max-width: 1000px){
        .header1{
                /* Reverse the axis of the header, making it vertical. */
                flex-direction: column;
                
                /* Align items to the begining (the left) of the header. */
                align-items: flex-start;
        }
}

@media only screen and (max-width:600px) {
  /* For mobile phones: */
  .main .callout{
      width: 100%;      
    }
}

@media only screen and (max-width:600px) {
  /* For mobile phones: */
  .main .callout .card{
      width:100%;
    }
}

@media only screen and (max-width:600px) {
  /* For mobile phones: */
  .main .callout #card{
      width:100%;
      margin-left:15%;
    }
}

    @media only screen and (max-width:600px) {
        /* For mobile phones: */
        #encabezado {
            display: none;
        }
    }

    .header1 .callout button {
        padding: 9px;
        font-size: 18px;
        color: white;
        text-decoration: none;
        margin: 1%;
    }

    .header1 .callout button:hover {
        background: #3493FA;
        color: white;
    }


    .card {
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        transition: 0.3s;
        width: 70%;
        margin-left:30%;
    }

        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }

    .container {
        padding: 2px 16px;
    }

    footer h3{
        font-size:15px;
        color:white;
       /* margin-right:95%;*/
    }

      footer a{
       
        margin-right:95%;
    }

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

        #navbarCollapse .navbar-nav a{
            color:white;
        }

        #encabezado{
            height:130px;
        }
    </style>
</head>
<body style="font-family: Verdana; text-align:center">
    <form id="form1" runat="server">


        <div style="margin: 0px" class="bs-example">
            <nav style="background-color: #FC4B2D; margin: 0px" class="navbar navbar-expand-md navbar-light">
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
            <h2 style="color: lightyellow; text-shadow: 2px 2px 2px #FC4B2D; font-family: Verdana">Módulo del estudiante</h2>
            <br />
        </div>


        <br />

        <div class="main">
            <div style="word-wrap: break-word;" class="callout">
                <div id="cc2" style="width: 80%; border: none" class="callout">
                    <div id="card" class="card">
                        <img style="height: 60px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg6mTt1EIgit18bPwjA_OyzpeVDJkuiR2qOw&usqp=CAU" alt="Avatar">
                        <br />
                        <div class="container">
                            <h5><b>"nombre | identificacion"</b></h5>
                           <asp:GridView CssClass="callout primary" Height="10px" ForeColor="" BackColor="Red" ID="gvhorario" runat="server"></asp:GridView>
                            <br />
                            <br />
                            <a onclick="myFunction2()" style="float: right" href="#">Detalles</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <footer class="callout" style="background-color:black;margin-top:280px">
            <h3>Autor: @</h3> 
            <a href="#">content</a> <br />
            <a href="#">content</a> <br />
            <a href="#">content</a> <br />
        </footer>

            <%--  Modal visualizar desglose de notas --%>
        <div class="window-notice" style="display: none;" id="window-notice">
            <div class="content">
                <header style="background-color:#FC4B2D">
                    <h3 style="color:white;font-size:27px">Detalle de notas</h3>
                    <p style="font-size:15px;color:white">Desglose de resultados obtenidos</p>
                </header>
                <br />
                <asp:GridView ID="gvDesglose" runat="server"></asp:GridView>
                <br />
                <a onclick="myFunction2()" href="#">Cerrar</a>
                <br />

            </div>
        </div>

    </form>

    <%-- <div style="position: absolute; top: 72%; left: 47%" class="cont-modal">
    
        <button style="position:relative;" class="button alert" id="btnModalActNotas" onclick="myFunction2()">Desglose</button>
          
    </div>--%>

    <%--<button style="position:fixed;top:53.5%;left:51.2%;display:none" class="button" ID="btnCerraModal" onClick="myFunction2()">Cancelar</button>--%>



</body>
</html>
