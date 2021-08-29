<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addnotes.aspx.cs" Inherits="matricula.addnotes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    </style>
</head>
<body style="margin: 0; text-align: center">
    <form id="form1" runat="server">
        <header class="header1" style="background: #010D00;">
            <br />
            <a href="#">content</a>
            <a href="#">content</a>
            <a href="#">content</a>
            <a href="#">content</a>
            <a href="#">content</a>
            <br />
            <br />
        </header>
        <header style="background: #D9D7D7; height: 85px"></header>

        <%--        <div style="background:blue; width:100%; height:200px; text-align:center;">--%>

        <h1>Ingrese los siguientes datos</h1>
        <%--<div class="inputs" style="background:red;width:50%;">--%>
        <asp:TextBox placeholder="Identificación estudiante" ID="txtIdentificacion" runat="server"></asp:TextBox>
        <asp:TextBox placeholder="Nota 1" ID="txtNota1" runat="server"></asp:TextBox>
        <asp:TextBox placeholder="Nota 2" ID="txtNota2" runat="server"></asp:TextBox>
        <asp:TextBox placeholder="Nota 3" ID="txtNota3" runat="server"></asp:TextBox>
        <br /> <br />
        <asp:Button Text="Ingresar" runat="server" />
        <%--</div>--%>
        <%--        </div>--%>
    </form>

      <style>
        @media only screen and (max-width: 600px) {
            body {
                background-color:black;
            }
        }
    </style>
</body>
</html>
