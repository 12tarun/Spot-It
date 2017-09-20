<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageLevel.aspx.cs" Inherits="ManageLevel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    INSERT LEVEL:
    <asp:TextBox ID="TbxLevelName" runat="server"/>
    <asp:Button ID="BtnInsertLevel" runat="server" OnClick="InsertLevel_Click" Text="OK"/>
    <br />
    <br />
    DELETE LEVEL:
    <asp:TextBox ID="TbxLevelId" runat ="server" />
    <asp:Button ID="BtnDeleteLevel" runat="server" OnClick="DeleteLevel_Click" Text="OK"/>
    </div>
    </form>
</body>
</html>
