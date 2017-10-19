<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageCoordinatesAgain.aspx.cs" Inherits="ADMIN_PANEL_ManageCoordinatesAgain" %>

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
            <h4>COORDINATES</h4>
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
                        <asp:Button class="button" ID="btnBack" runat="server" OnClick="btnBack_Click" Text="back" Style="float: right" />
                        <asp:Button class="button" ID="btnHome" runat="server" OnClick="btnHome_Click" Text="Home" Style="float: right" />
                    </span>
                </div>
            </nav>
            <br />
            <br />
            <br />
                        <div id="secondary-cont">
                <div class="row">
                    <div class="header col-12">
                        <h1>Click on the image to update second coordinates.</h1>
                    </div>
                    <br />
                    <br />

                    <div>
                        <div class="col-12">
                            <div class="image">
                                <asp:ImageButton ID="imgBtnQuestion" Height="450px" Width="800px" runat="server" OnClick="imgBtnQuestion_Click" />
                            </div>
                        </div>
                        <div class="col-12" >
                            <asp:Label ID="lblMessage" Visible="false" Text="Coordinates updated !" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
