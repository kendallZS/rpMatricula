<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addnotes.aspx.cs" Inherits="matricula.addnotes" %>

<!DOCTYPE html>

<html>
<head>

    <title>Ingreso de notas</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.6.3/dist/css/foundation.min.css" integrity="sha256-ogmFxjqiTMnZhxCqVmcqTvjfe1Y/ec4WaRj/aQPvn+I=" crossorigin="anonymous">

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
                background:#FC4B2D;
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
    </style>
</head>
<body style="margin: 0; text-align:center">
    <form id="form1" runat="server">
        <header class="header1" style="background: #FC4B2D;">
           
             
            <div class="callout" style="background-color: #FC4B2D; border: none">
                <a class="a" href="#">content</a>
                <a class="a" href="#">content</a>
                <a class="a" href="#">content</a>
                <a class="a" href="#">content</a>
                <a class="a" href="#">content</a>
            </div>
          
           
            <div class="alert callout" style="border: none;">
                <br />
                <br />
  
                <br />
                <br />
            </div>
        </header>

        <br />

        <asp:Panel ID="pnlFrm" CssClass="callout" runat="server">
            <h2 style="color: #FC4B2D;">Ingrese los siguientes datos</h2>
            <h3 style="font-size:10px">Recuerde para cifras con DECIMALES colocar una coma "," y NO un punto "."  </h3>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:TextBox CssClass="txt" placeholder="Identificación estudiante" ID="txtIdentificacion" runat="server"></asp:TextBox>
                    <asp:TextBox CssClass="txt" placeholder="Nota 1" ID="txtNota1" runat="server"></asp:TextBox>
                    <asp:TextBox CssClass="txt" placeholder="Nota 2" ID="txtNota2" runat="server"></asp:TextBox>
                    <asp:TextBox CssClass="txt" placeholder="Nota 3" ID="txtNota3" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button CssClass="button" ID="btnGuardarNotas" Text="Agregar" runat="server" OnClick="btnGuardarNotas_Click" />
                    <br />
                    <br />
                    <asp:Label ID="lblCorrectoError" Text="..." runat="server" />
                    <br />
                    <asp:Label ID="lblPromedio" Text="El promedio de este alumno es: " runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <%--<div id="frm" class="callout" style="text-align: center">

          
        </div>--%>
          
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
