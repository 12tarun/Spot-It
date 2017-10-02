<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageDomain.aspx.cs" Inherits="ManageDomain" %>

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
            <h1>ADMIN PANEL</h1>
            <h2>Manage</h2>
            <h4><a href="#">Domains</a></h4>
            <h4><a href="#">Levels</a></h4>
            <h4><a href="#">Co-Ordinates</a></h4>
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
                    <asp:Button class="button" ID="btnLogout" Text="LogOut" OnClick="btnLogout_Click" runat="server" />
                    </span>
                </div>
            </nav>
            <div id="secondary-cont">
                <div class="row">
                    <div class="header col-12">
                        <div class="row">
                            <div class="col-12">
                                <h1>Manage Domain</h1>
                            </div>
                            <div class="col-12">
                                <asp:TextBox ID="TbxDomainName" placeholder="Insert NEW Domain" runat="server" />
                                <asp:Button class="button" ID="btnInsertDomain" runat="server" OnClick="InsertDomain_Click" Text="OK" />
                            </div>
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
                                                <div class="dom-name">
                                                    <div>
                                                        <h2>
                                                            <asp:LinkButton ID="linkBtnDomainName" runat="server" CommandName="Select" CommandArgument='<%# Eval("DomainName") %>' Text='<%# Eval("DomainName") %>' /></h2>
                                                    </div>
                                                </div>
                                                <div class="edit-area">
                                                    <div class="update-name">
                                                        <asp:TextBox ID="TbxUpdateDomain" placeholder="Enter new name to update" runat="server" />
                                                    </div>
                                                    <div class="del-btn">
                                                        <asp:Button class="button" ID="btnDeleteDomain" runat="server" CommandName="Delete" Text="DELETE" CommandArgument='<%# Eval("DomainId") %>' />
                                                    </div>
                                                    <div class="update-btn">
                                                        <asp:Button class="button" ID="btnUpdateDomain" runat="server" CommandName="Update" Text="UPDATE" CommandArgument='<%# Eval("DomainId") %>' />
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
