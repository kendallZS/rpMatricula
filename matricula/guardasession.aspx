<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="guardasession.aspx.cs" Inherits="matricula.guardasession" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtvalorSesion" placeholder="identificacion" runat="server" />
            <asp:Button Text="log in" runat="server" id="btnlogin" OnClick="btnlogin_Click" />
        </div>
    </form>
</body>
</html>
