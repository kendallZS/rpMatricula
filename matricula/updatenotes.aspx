<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updatenotes.aspx.cs" Inherits="matricula.updatenotes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Actualizar notas</title>

     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.6.3/dist/css/foundation.min.css" integrity="sha256-ogmFxjqiTMnZhxCqVmcqTvjfe1Y/ec4WaRj/aQPvn+I=" crossorigin="anonymous" />
  
   <%-- Para el header --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body{
            text-align:center;
            min-width:470px;
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
            height:130px;
        }

        #pnlFormActualizar{
            width:60%;
            margin-left:20%;
        }

        #GridView1{
            width:85%;
            margin-left:8.5%;
        }

        @media only screen and (max-width:600px){
            #pnlFormActualizar{
                margin-left:0%;
                width:100%;
            }
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
       <%-- Header --%>
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
            <h2 style="color: lightyellow; text-shadow: 2px 2px 2px #FC4B2D; font-family: Verdana">Actualización de notas de estudiantes</h2>
            <br />
        </div>

        <br />
        <br />
     <h3 style="color: #FC4B2D">Complete los siguientes espacios</h3>
        <br />
        
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand">
    <Columns>
        <asp:TemplateField HeaderText="Identificación" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="lblIdentificacion" Text='<%# Eval("identificacion") %>' runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="nombre" HeaderText="Nombre" ItemStyle-Width="150px" />
          <asp:TemplateField HeaderText="Nota 1" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:TextBox ID="txtn1" Text='<%# Eval("nota_1") %>'  runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Nota 2" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:TextBox ID="txtn2" Text='<%# Eval("nota_2") %>'  runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Nota 3" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:TextBox ID="txtn3" Text='<%# Eval("nota_3") %>'  runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button Text="Actualizar" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


        <br />
          <asp:Label hidden="" Text="valor matricula" ID="lblpruebaValorHorario" runat="server" /> <br />
          <asp:Label ID="lblActualizaNotas" runat="server" />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
