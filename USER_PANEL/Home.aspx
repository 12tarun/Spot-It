<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .logout {
            float: right;
        }

        .domain {
            margin-top: 10%;
            width: 200px;
        }

        .DP {
            height: 200px;
            width: 150px;
        }

        .label {
            float: left;
        }

        .button {
            width: 200px;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css?family=Varela+Round|Roboto|Muli|Raleway" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Css/Admin_User.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
<body>
    <script src="../Js/sidemenu.js"></script>
    <form id="form1" runat="server">
        <nav id="navBar">
            <div>
                <span onclick="openMenu()">
                    <i id="menu-button" class="fa fa-bars"></i>
                </span>
                <h1>SPOT <i class="fa fa-hand-pointer-o"></i>T</h1>
                <asp:Button CssClass="logout" ID="btnLogout" runat="server" OnClick="LogoutButton_Click" Text="Logout" />
            </div>
        </nav>

        <div>
            <br />
            <br />

            <asp:Label CssClass="label" ID="lblUsername" runat="server" Text="Welcome "></asp:Label>
            <br />
            <br />
            <asp:Image CssClass="DP" ID="ImgProfilePic" AlternateText="No profile picture selected" runat="server" />
            <br />

        </div>
        <asp:Repeater ID="rptDomainSelect" runat="server" OnItemCommand="rptDomain_ItemCommand">
            <HeaderTemplate>
                <table border="0">
                    <tr>
                        <th class="domain" scope="col" style="width: 200px; justify-content: center">SELECT DOMAIN
                        </th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Button CssClass="button" ID="btnSelectDomain" runat="server" Text='<%# Eval("DomainName") %>' CommandArgument='<%# Eval("DomainId") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </form>
</body>
</html>
