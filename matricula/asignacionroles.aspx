<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="asignacionroles.aspx.cs" Inherits="matricula.asignacionroles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Asignación roles</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.6.3/dist/css/foundation.min.css" integrity="sha256-ogmFxjqiTMnZhxCqVmcqTvjfe1Y/ec4WaRj/aQPvn+I=" crossorigin="anonymous" />

    <%-- Para el header --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>

        body{
            font-family:'Times New Roman';
        }

        .bs-example {
            margin: 20px;
        }

           /*Para el header*/
        #navbarCollapse .navbar-nav a{
            color:white;
        }

        /*Callout luego del header*/
        #encabezado{
            /*height:130px;*/
        }

        #gvMostrarUsrSinRol{
            width:70%;
            margin-left:15%;
        }

        #pnlAsigRol{
            width:70%;
            margin-left:15%;
        }

        #txtidentAsigRol {
            float: left;
            width: 35%
        }

        #DropDownList1 {
            float: left;
            width: 25%;
            margin-left:2%;
        }

        #pnlAsigRol:hover{
            background-color:lightgray;
        }

        .a{
            margin:5px
        }

        .a:hover{
            color:brown;
        }

        .btnAsignarRol{
            color:#1dd1a1;
            font-size:22px;
            background-color:#f5f6fa;
            text-shadow: 1px 1px 1px black
        }

         #encabezado{
           /* height:130px;*/
            background-image: url("imgs/Vine.jpg");
        }


        @media only screen and (max-width:600px) {
            #gvMostrarUsrSinRol,#pnlAsigRol {
                width: 100%;
                margin-left: 0%;
            }
        }

         @media only screen and (max-width:600px) {
            #txtidentAsigRol,#pnlAsigRol,#DropDownList1, #btnAsignar {
                width: 100%;
            }
        }

    </style>

</head>
<body style="text-align: center; min-width:442px">
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
        </div>

        <br />
        <br />
        <h3 style="color:#1dd1a1">Lista de usuarios a la espera de un rol en el sistema</h3>
        <br />

       <%-- <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
        <asp:Label ID="lblMensajeActRol" Text="..." runat="server" />
        <asp:GridView AutoGenerateColumns="false" CssClass="table" runat="server" ID="gvMostrarUsrSinRol" DataKeyNames="identificacion" OnRowCommand="UsrsSinRol_Rowcomand">
            <Columns>
                <asp:BoundField DataField="identificacion" HeaderText="Identificación" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="apellidos" HeaderText="Apellidos" />
                <%--<asp:BoundField DataField="id_rol" HeaderText="Id rol" />--%>

                <asp:ButtonField ControlStyle-CssClass="btnAsignarRol" Text="Asignar" CommandName="Asignar" />
            </Columns>
        </asp:GridView>
                

        <br />
        <br />
        <br />
        <asp:Panel CssClass="callout primary" ID="pnlAsigRol" runat="server">
            <asp:TextBox CssClass="form-control" ID="txtidentAsigRol" runat="server" />
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Seleccione...</asp:ListItem>
                <asp:ListItem>Docente</asp:ListItem>
                <asp:ListItem>Estudiante</asp:ListItem>
                <asp:ListItem Value="MantenerSinRol">Mantener sin rol</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnAsignar" CssClass="button alert" Text="Asignar" runat="server" OnClick="btnAsignar_Click" />
        </asp:Panel>
        <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
        
    </form>
</body>
</html>
