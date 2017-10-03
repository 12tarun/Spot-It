﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css?family=Varela+Round|Roboto|Muli|Raleway" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Css/Admin_User.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
<body id="main" onload="openMenu()">
    <script src="../Js/sidemenu.js"></script>
    <form id="form1" runat="server">
        <div id="sideMenu">
            <i onclick="closeMenu()" id="close-button" class="fa fa-times"></i>
            <h1>USER PANEL</h1>
            <h1>
                <asp:Label ID="lblUsername" runat="server" Text="Welcome "></asp:Label></h1>
            <asp:Image class="img" ID="ImgProfilePic" AlternateText="No profile picture selected" runat="server" />
            <h4>SCORE:
                <asp:Label ID="lblScore" runat="server"></asp:Label></h4>
            <h4>RANK:
                <asp:Label ID="lblRank" runat="server"></asp:Label></h4>
            <h4>
                <asp:Button class="button" runat="server" ID="btnLeaderBoard" Text="Leader Board" OnClick="btnLeaderBoard_Click" /></h4>
        </div>
        <div id="layer"></div>
        <div id="prime-cont">
            <nav>
                <div>
                    <span onclick="openMenu()">
                        <i id="menu-button" class="fa fa-bars"></i>
                    </span>
                    <h1>SPOT <i class="fa fa-hand-pointer-o"></i>T</h1>
                    <span id="navBtn">
                        <asp:Button class="button" ID="btnLogout" runat="server" OnClick="LogoutButton_Click" Text="Logout" />
                    </span>
                </div>
            </nav>
            <div id="secondary-cont">
                <div class="row">
                    <div class="header col-12">
                        <div>
                            <h1>SELECT DOMAIN</h1>
                        </div>
                    </div>
                    <div class="domain-area col-12">
                        <div class="row">
                            <asp:Repeater ID="rptDomainSelect" runat="server" OnItemCommand="rptDomain_ItemCommand">
                                <HeaderTemplate>
                                    <table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="col-12 col-md-6 col-lg-4">
                                        <div class="dom-container">
                                            <div class="dom-body">
                                                <div class="select-dom">
                                                    <div>
                                                        <h2>
                                                            <asp:Button class="button" ID="btnSelectDomain" runat="server" Text='<%# Eval("DomainName") %>' CommandArgument='<%# Eval("DomainId") %>' /></h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                               </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
