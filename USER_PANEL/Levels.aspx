<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Levels.aspx.cs" Inherits="Levels" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .back
        {
            float:right;
        }
        .label
        {
            float:left;
        }
        .level_button
        {
            margin-top:5%;
            width:15%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label CssClass="label" ID="lblDomain" runat="server"></asp:Label>
    <asp:Button CssClass="back" ID="btnBack" OnClick="Back_Click" runat="server" Text="Back"/>
    <br />
    <br />
        <asp:Button CssClass="level_button" ID="btnL1" OnClick="L1_Click" runat="server" Text="LEVEL 1" />
        <br />
        <asp:Button CssClass="level_button" ID="btnL2" Onclick="L2_Click" runat="server" Text="LEVEL 2" />
        <br />
        <asp:Button CssClass="level_button" ID="btnL3" Onclick="L3_Click" runat="server" Text="LEVEL 3" />
        <br />
        <asp:Button CssClass="level_button" ID="btnL4" Onclick="L4_Click" runat="server" Text="LEVEL 4" />
        <br />
        <asp:Button CssClass="level_button" ID="btnL5" Onclick="L5_Click" runat="server" Text="LEVEL 5" />
    </div>
    </form>
</body>
</html>
