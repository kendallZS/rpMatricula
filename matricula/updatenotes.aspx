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

        * {
            font-family: 'Times New Roman';
            font-size: 18px;
            /*font-family:Tahoma;*/
            /*font-family:Comic Sans MS;*/
        }

        body{
            text-align:center;
            min-width:505px;
        }

          .bs-example {
            margin: 20px;
        }
       

         /*Para el header*/
        #navbarCollapse .navbar-nav a{
            color:white;
        }


        #pnlFormActualizar{
            width:60%;
            margin-left:20%;
        }

        #GridView1{
            width:85%;
            margin-left:8.5%;
        }

        .primary {
            border-radius: 10px;
            color: red;
            border: none;
            font-weight: bold;
        }

        #txtNombreBuscar {
            float: right;
            border-radius: 13px;
        }

         #btnbuscar{
             margin-right:6.3%;
            float:right;
            border-radius:20px;
        }

          #encabezado{
           /* height:130px;*/
            background-image: url("imgs/Vine.jpg");
        }

        @media only screen and (max-width:600px){
            #GridView1{
                margin-left:0%;
                width:100%;
            }
        }

    </style>

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

</head>
<body>
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
            <h2 style="color: lightyellow; text-shadow: 2px 2px 2px #55E6C1; font-family: Verdana">Módulo del gestor</h2>
            <br />
        </div>  <%-- Fin header --%>



        <br />
        
     <h3 style="color: #10ac84">Edite el registro requerido</h3>
        <p style="color:gray">En caso de que la cifra tenga decimales utilice una coma (,).</p>
        <br />
        <asp:Button CssClass="btn btn-info" Text="Buscar" ID="btnbuscar" runat="server" OnClick="btnbuscar_Click" /> &nbsp;&nbsp;&nbsp;
        <asp:TextBox CssClass="form-control" Width="20%" runat="server" ID="txtNombreBuscar" placeholder="Búsqueda por nombre" />
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
                <asp:TextBox MaxLength="6" ID="txtn1" Text='<%# Eval("nota_1") %>'  runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Nota 2" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:TextBox MaxLength="6" ID="txtn2" Text='<%# Eval("nota_2") %>'  runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Nota 3" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:TextBox MaxLength="6" ID="txtn3" Text='<%# Eval("nota_3") %>'  runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button CssClass="button primary" Text="Actualizar" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


        <br />
        <asp:Label hidden="" Text="valor matricula" ID="lblpruebaValorHorario" runat="server" /> <br />
        <br />



    </form>
</body>
</html>
