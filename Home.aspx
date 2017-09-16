<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="Label_username" runat="server" Text="Welcome "></asp:Label>
    <br />
    <br />
    <asp:Button ID="Logout_Button" runat="server" OnClick="LogoutButton_Click" Text="Logout" Width="100px" />
    </div>
    </form>
</body>
</html>
