<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addnotes.aspx.cs" Inherits="matricula.addnotes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Ingreso de notas</title>

    <style>
        .header1 a {
            color: white;
            text-decoration: none;
            margin: 4%;
        }

            .header1 a:hover {
                background: #D9D7D7;
                color: #010D00;
            }

            .gv{
                margin-left:40%;
            }
    </style>
</head>
<body style="margin: 0;">
    <form id="form1" runat="server">
        <header class="header1" style="background: #010D00;">
            <br />
            <a class="a" href="#">content</a>
            <a class="a" href="#">content</a>
            <a class="a" href="#">content</a>
            <a class="a" href="#">content</a>
            <a class="a" href="#">content</a>
            <br />
            <br />
        </header>
        <header style="background: #D9D7D7; height: 85px"></header>

        <%--        <div style="background:blue; width:100%; height:200px; text-align:center;">--%>
        <div class="form" style="background-color: aqua">
            <h1>Ingrese los siguientes datos</h1>
            <asp:TextBox CssClass="btn" placeholder="Identificación estudiante" ID="txtIdentificacion" runat="server"></asp:TextBox>
            <asp:TextBox CssClass="btn" placeholder="Nota 1" ID="txtNota1" runat="server"></asp:TextBox>
            <asp:TextBox CssClass="btn" placeholder="Nota 2" ID="txtNota2" runat="server"></asp:TextBox>
            <asp:TextBox CssClass="btn" placeholder="Nota 3" ID="txtNota3" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button CssClass="btn" Text="Ingresar" runat="server" />
        </div>
        <%--</div>--%>
        <%--        </div>--%>
        <br />
        <br />
      
        usuarios: <br /> <br />
        <asp:GridView CssClass="gv" ID="gvUsrs" runat="server"></asp:GridView>
            
    </form>

      <style>
        @media only screen and (max-width: 600px) {
            
            .btn{
                width:100%;
            }
        }
        @media only screen and (max-width: 600px) {
            body{
                 background-color:aquamarine;
            }
        }
    </style>
</body>
</html>
