<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addnotes.aspx.cs" Inherits="matricula.addnotes" %>

<!DOCTYPE html>

<html>
<head>

    <title>Ingreso de notas</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.6.3/dist/css/foundation.min.css" integrity="sha256-ogmFxjqiTMnZhxCqVmcqTvjfe1Y/ec4WaRj/aQPvn+I=" crossorigin="anonymous">

    <style>
        .header1 .callout a {
            color: white;
            text-decoration: none;
            margin: 1%;
        }

            .header1 a:hover {
                background: #24F2EF;
                color: black;
            }

            .txt{
                margin-left:25%;
               width:50%;
            }

            .gv-cont{
                overflow-y:scroll;
                height:300px;
            }
    </style>
</head>
<body style="margin: 0; text-align:center">
    <form id="form1" runat="server">
        <header class="header1" style="background: #4EEB83;">
           
             
            <div class="callout" style="background-color: #4EEB83; border: none">
                <a class="a" href="#">content</a>
                <a class="a" href="#">content</a>
                <a class="a" href="#">content</a>
                <a class="a" href="#">content</a>
                <a class="a" href="#">content</a>
            </div>
             <br />
           
            <div class="primary callout" style="border: none">
                <br />
                <br />
  
                <br />
                <br />
            </div>
        </header>

        <br />
        <div class="medium-gray callout" style="text-align: center">

            <h2 style="color:#3BD499">Ingrese los siguientes datos</h2>
            <asp:TextBox CssClass="txt" placeholder="Identificación estudiante" ID="txtIdentificacion" runat="server"></asp:TextBox>
            <asp:TextBox CssClass="txt" placeholder="Nota 1" ID="txtNota1" runat="server"></asp:TextBox>
            <asp:TextBox CssClass="txt" placeholder="Nota 2" ID="txtNota2" runat="server"></asp:TextBox>
            <asp:TextBox CssClass="txt" placeholder="Nota 3" ID="txtNota3" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button CssClass="success button" ID="btnGuardarNotas" Text="Agregar" runat="server" />

        </div>
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
</body>
</html>
