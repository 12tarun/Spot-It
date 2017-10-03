<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageCoordinatesAgain.aspx.cs" Inherits="ADMIN_PANEL_ManageCoordinatesAgain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="back" Style="float: right" />
        <asp:Button ID="btnHome" runat="server" OnClick="btnHome_Click" Text="Home" Style="float:right" />
        <h2>Choose second coordinates</h2>
        <div>
            <asp:ImageButton ID="imgBtnQuestion" runat="server" OnClick="imgBtnQuestion_Click" CssClass="imageButton" />
            <br />
            <br />
            <asp:Label ID="lblCommand" runat="server" Text="Click on the image to update second coordinates." ></asp:Label>
            <br />
            <asp:Label ID="lblMessage" Visible="false" Text="Coordinates updated !" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
