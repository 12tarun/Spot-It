<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
      <form id="form1" runat="server">
        <div>
        <br />
        Username:<br />
        <asp:TextBox ID="username" runat="server" Width="200px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please enter a username" ControlToValidate="username" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        Password:<br />
        <asp:TextBox ID="password" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="please enter the password" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="Login_Button" runat="server" OnClick="ValidateUser" Text="Login" Width="100px" />
        <br />
        <asp:Label ID="Warning" runat="server"></asp:Label>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registration.aspx">new user register here</asp:HyperLink>
        </div>
      </form> 
    
</body>
</html>
