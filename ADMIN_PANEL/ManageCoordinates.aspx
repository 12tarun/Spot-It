<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageCoordinates.aspx.cs" Inherits="ADMIN_PANEL_ManageCoordinates" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .imageButton
        {
            width:400px;
            height:500px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:ImageButton ID="imgBtnQuestion" runat="server" OnClick="imgBtnQuestion_Click" CssClass="imageButton" />

    </div>
    </form>
</body>
</html>
