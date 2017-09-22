<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageLevel.aspx.cs" Inherits="ManageLevel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>Welcome Admin !</h2>
        <br />
    INSERT LEVEL:
    <asp:TextBox ID="TbxLevelName" runat="server"/>
    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="tbxLevelName" runat="server" />
    <br />
    <br />
    INSERT DOMAIN NAME:
    <asp:TextBox ID="tbxDomainName" runat="server" />
    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="tbxDomainName" runat="server" />
    <br />
    <br />
    <asp:Button ID="BtnInsertLevel" runat="server" OnClick="InsertLevel_Click" Text="INSERT"/>
    <br />
    <br />
    </div>
    </form>
</body>
</html>
