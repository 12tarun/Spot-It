<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PlayPage.aspx.cs" Inherits="PlayPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .Question {
            width: 800px;
            height: 450px;
        }

        .buttonBack {
            float: right;
        }

        .buttonHome {
            float: right;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 150px; float: right">
            <asp:Button ID="btnBack" OnClick="btnBack_Click" CssClass="buttonBack" Text="back" runat="server" />
            <asp:Button ID="btnHome" OnClick="btnHome_Click" CssClass="buttonHome" Text="Home" runat="server" />
        </div>
        <div style="width: 500px; height: 281px">
            <asp:ImageButton CssClass="Question" ID="imgQuestion" OnClick="imgQuestion_Click" runat="server" />
            <br />
            <br />
            <asp:Label ID="lblSuccess" Text="SUCCESSFUL !" Visible="false" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
