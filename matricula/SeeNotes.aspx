<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeeNotes.aspx.cs" Inherits="matricula.SeeNotes" %>


<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.6.3/dist/css/foundation.min.css" integrity="sha256-ogmFxjqiTMnZhxCqVmcqTvjfe1Y/ec4WaRj/aQPvn+I=" crossorigin="anonymous">


    <title>responsive</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
</style>
</head>
<body style="font-family: Verdana; text-align:center">
    <form id="form1" runat="server">

        <div style="background-color: #f1f1f1; padding: 15px;">
            <h1>Cinque Terre</h1>
            <h3>Resize the browser window</h3>
        </div>

        <div style="overflow: auto">
            <%--<div class="menu">
                <div class="menuitem">The Walk</div>
                <div class="menuitem">Transport</div>
                <div class="menuitem">History</div>
                <div class="menuitem">Gallery</div>
            </div>--%>

            <div class="main">
                <asp:Panel ID="pnlFrm" CssClass="callout" runat="server">
                    <h2 style="color: #FC4B2D;">Ingrese los siguientes datos</h2>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:TextBox CssClass="txt" type="number" placeholder="Identificación estudiante" ID="txtIdentificacion" runat="server"></asp:TextBox>
                            <asp:TextBox CssClass="txt" type="number" placeholder="Nota 1" ID="txtNota1" runat="server"></asp:TextBox>
                            <asp:TextBox CssClass="txt" type="number" placeholder="Nota 2" ID="txtNota2" runat="server"></asp:TextBox>
                            <asp:TextBox CssClass="txt" type="number" placeholder="Nota 3" ID="txtNota3" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button CssClass="button" ID="btnGuardarNotas" Text="Agregar" runat="server" />
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
            </div>

       <%--     <div class="right">
                <h2>What?</h2>
                <p>Cinque Terre comprises five villages: Monterosso, Vernazza, Corniglia, Manarola, and Riomaggiore.</p>
                <h2>Where?</h2>
                <p>On the northwest cost of the Italian Riviera, north of the city La Spezia.</p>
                <h2>Price?</h2>
                <p>The Walk is free!</p>
            </div>--%>
        </div>


        <div style="background-color: #f1f1f1; text-align: center; padding: 10px; margin-top: 7px; font-size: 12px;">This web page is a part of a demonstration of fluid web design made by w3schools.com. Resize the browser window to see the content respond to the resizing.</div>
    </form>
</body>
</html>

