<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Levels.aspx.cs" Inherits="Levels" %>

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
    <form id="form1" runat="server">
        <script src="../Js/sidemenu.js"></script>
        <div id="sideMenu">
            <i onclick="closeMenu()" id="close-button" class="fa fa-times"></i>
            <div>
            <div class="img"></div>
            </div>
            <h4>You Have Entered
                <asp:Label ID="lblDomain" runat="server"></asp:Label>
                Domain</h4>
            <h4>SCORE:
                </h4>
            <h4>RANK:
                </h4>
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
                        <asp:Button class="button" ID="btnBack" OnClick="Back_Click" runat="server" Text="Back" />
                    </span>
                </div>
            </nav>
            <div id="secondary-cont">
                <div class="row">
                    <div class="header col-12">
                        <div>
                            <h1>SELECT LEVEL</h1>
                        </div>
                    </div>
                    <div class="domain-area col-12">
                        <div class="row">
                            <asp:Repeater ID="rptLevelSelect" runat="server" OnItemCommand="rptLevel_ItemSelect">
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
                                                            <asp:Button CssClass="button" ID="btnSelectDomain" runat="server" CommandName="Select" Text='<%# Eval("LevelName") %>' CommandArgument='<%# Eval("LevelId") %>' /></h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <
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
