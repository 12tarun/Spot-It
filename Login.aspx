<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
      <form id="form1" runat="server">
      <asp:Login ID = "Login1" runat = "server" OnAuthenticate="ValidateUser" DisplayRememberMe="false"></asp:Login>
      <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registration.aspx">new user register here</asp:HyperLink>
      </form> 
    
</body>
</html>
