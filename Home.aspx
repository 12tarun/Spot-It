<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Welcome
    <asp:LoginName ID="LoginName1" runat="server" Font-Bold = "true" />
    <br />
    <br />
    <asp:LoginStatus ID="LoginStatus1" runat="server" />
    </div>
    </form>
</body>
</html>

