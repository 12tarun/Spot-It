<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageDomain.aspx.cs" Inherits="ManageDomain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    INSERT DOMAIN:
    <asp:TextBox ID="TbxDomainName" runat="server"/>
    <asp:Button ID="TbnInsertDomain" runat="server" OnClick="InsertDomain_Click" Text="OK"/>
    <br />
    <br />
    DELETE DOMAIN:
    <asp:TextBox ID="Domain_Id" runat ="server" />
    <asp:Button ID="DeleteDomain" runat="server" OnClick="DeleteDomain_Click" Text="OK"/>
    </div>
    </form>
</body>
</html>
