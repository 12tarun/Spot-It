<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PlayPage.aspx.cs" Inherits="PlayPage" %>

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
            <h1></h1>
            <h4>Score:

            </h4>
            <h4>RANK:
            </h4>
            <h4></h4>
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
                        <asp:Button class="button" ID="btnBack" OnClick="btnBack_Click" Text="back" runat="server" />
                        <asp:Button class="button" ID="btnHome" OnClick="btnHome_Click" Text="Home" runat="server" />
                    </span>
                </div>
            </nav>
            <div id="secondary-cont">
                <div class="row">
                    <div class="header col-12">
                        <h1>CAREFULLY! Select the Co-Ordinates</h1>
                    </div>
                    <div class="col-12">
                        <div class="image">
                            <asp:ImageButton ID="imgQuestion" OnClick="imgQuestion_Click" runat="server" />
                            <h4>
                                <asp:Label ID="lblPass" Text="Correct Answer!" Visible="false" runat="server"></asp:Label></h4>
                        </div>
                    </div>
                    <div class="col-12">
                        <h4>
                            <asp:Label ID="lblPlayedMessage" Visible="false" runat="server"></asp:Label></h4>
                    </div>
                    <div class="col-12">
                        <h4>
                            <asp:Label ID="lblFail" Text="Wrong Answer!" Visible="false" runat="server"></asp:Label></h4>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
