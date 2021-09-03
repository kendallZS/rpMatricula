<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addnotes.aspx.cs" Inherits="matricula.addnotes" %>

<!DOCTYPE html>

<html>
<head>

    <title>Ingreso de notas</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.6.3/dist/css/foundation.min.css" integrity="sha256-ogmFxjqiTMnZhxCqVmcqTvjfe1Y/ec4WaRj/aQPvn+I=" crossorigin="anonymous">
    
    <link rel="shortcut icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtwqLEhOP7jsw7yv3WPqTSluT6C_0Je_PF5w&usqp=CAU"/>

     <style>
        
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
    </style>
    <style>
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
    </style>


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

            #btnActualizarNotasEst{
                background-color:#FC4B2D;
                width:55px;
                border-radius:44px;
                margin-left:35.2%;
                /*font-size:15px;*/
            }
            #btnActualizarNotasEst:hover{
                background:green;
            }
            #btnCerraModal{
                background-color:#FC4B2D;
               /*width:60px;*/
                border-radius:44px;
                /*margin-left:40%;*/
                /*font-size:15px;*/
            }

            #btnCerraModal:hover{
                background:green;
            }


            #btnModalActNotas:hover{
                background-color:lightgray;
                border-radius:4px;
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

                <h2 style="color:lightyellow;text-shadow: 2px 2px 2px #FC4B2D;
                    font-family:Verdana">Módulo del docente</h2>

                <br />
            </div>
        </header>

        <br />

        <asp:Panel ID="pnlFrm" CssClass="callout" runat="server">
            <h3 style="color: #FC4B2D;">Ingrese los siguientes datos</h3>
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:TextBox CssClass="txt" type="number" placeholder="Identificación estudiante" ID="txtIdentificacion" runat="server"></asp:TextBox>
                    <asp:TextBox CssClass="txt" type="number" placeholder="Nota 1" ID="txtNota1" runat="server"></asp:TextBox>
                    <asp:TextBox CssClass="txt" type="number" placeholder="Nota 2" ID="txtNota2" runat="server"></asp:TextBox>
                    <asp:TextBox CssClass="txt" type="number" placeholder="Nota 3" ID="txtNota3" runat="server"></asp:TextBox>
                    <br />
                    <br />
                   <asp:Button CssClass="button" ID="btnGuardarNotas" Text="Agregar" runat="server" OnClick="btnGuardarNotas_Click" />
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

        



    <script>

        function myFunction2() {
            var x = document.getElementById("window-notice");
            var y = document.getElementById("btnCerraModal");
            var z = document.getElementById("btnModalActNotas");
            if (x.style.display === "none") {
                y.style.display = "block";
                x.style.display = "block";
                z.style.display = "none";
            } else {
                x.style.display = "none";
                y.style.display = "none";
                z.style.display = "block";
            }
        }
    </script>



          
<%--        </div>--%>
          
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

            <%-- Modal Actualizacion notas --%>
        <div class="window-notice" style="display: none;" id="window-notice">
            <div class="content">
                <header style="background-color:#FC4B2D">
                    <h3 style="color:white;font-size:27px">Actualización de notas</h3>
                    <p style="font-size:15px;color:white">Ingrese lo que se le solicita acontinuación</p>
                </header>
                <br />
                <asp:TextBox CssClass="txt" type="number" placeholder="Identificación estudiante" ID="txtIdentActualizar" runat="server"></asp:TextBox>
                <asp:TextBox CssClass="txt" type="number" placeholder="Nota 1" ID="txtNota1Actualizar" runat="server"></asp:TextBox>
                <asp:TextBox CssClass="txt" type="number" placeholder="Nota 2" ID="txtNota2Actualizar" runat="server"></asp:TextBox>
                <asp:TextBox CssClass="txt" type="number" placeholder="Nota 3" ID="txtNota3Actualizar" runat="server"></asp:TextBox>
                <br />
                <asp:Button CssClass="button" ID="btnActualizarNotasEst" Text="Actualizar" runat="server" OnClick="btnActualizarNotasEst_Click" />
               <asp:Label ID="lblActualizaNotas" Text="Se actualizó correctamente" runat="server" />
                <br />

            </div>
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

    <div style="position: absolute; top: 80%; left: 44%" class="cont-modal">
    
        <button style="position:relative;color: darkcyan" id="btnModalActNotas" onclick="myFunction2()">Actualizar notas estudiante</button>
          
    </div>

    <button style="position:fixed;top:53.5%;left:51.2%;display:none" class="button" ID="btnCerraModal" onClick="myFunction2()">Cancelar</button>

</body>
</html>
