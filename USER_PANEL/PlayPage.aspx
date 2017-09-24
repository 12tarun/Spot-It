<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PlayPage.aspx.cs" Inherits="PlayPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .Question {
            width: 400px;
            height: 500px;
        }

        .buttonBack {
            float: right;
        }

        .buttonHome {
            float: right;
        }

        .fileupload {
            margin-left: 420px;
        }

        .Solution
         {
            margin-left: 420px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 200px; float: right">
            <asp:Button ID="btnBack" OnClick="btnBack_Click" CssClass="buttonBack" Text="back" runat="server" />
            <asp:Button ID="btnHome" OnClick="btnHome_Click" CssClass="buttonHome" Text="Home" runat="server" />
        </div>
        <div style="width: 400px; height: 500px">
            <asp:Image CssClass="Question" ID="imgQuestion" runat="server" />
        </div>
        <div style="width: 400px; height: 500px">
            <asp:GridView ID="GridViewSolution" runat="server" AutoGenerateColumns="false" ShowHeader="false">
                <Columns>
                    <asp:ImageField DataImageUrlField="Value" ControlStyle-Height="500" ControlStyle-Width="400" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:FileUpload CssClass="fileupload" ID="fupdSolution" runat="server" />
        <asp:Button ID="btnSolutionUpload" OnClick="btnSolutionUpload_Click" Text="UPLOAD" runat="server" />
    </form>
</body>
</html>
