<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageLevel.aspx.cs" Inherits="ManageLevel" %>

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
            <h2>
                <asp:Label ID="lblDisplayDomain" Text="You have entered in domain " Visible="true" runat="server"></asp:Label></h2>
            <h2>Manage</h2>
            <h4>Levels</h4>
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
                        <asp:Button class="button" ID="btnBack" Text="Back" runat="server" Style="float: right" OnClick="btnBack_Click" />
                    </span>
                </div>
            </nav>
            <div id="secondary-cont">
                <div class="row">
                    <div class="header col-12">
                        <div class="row">
                            <div class="col-12">
                                <h1>Manage Levels</h1>
                            </div>
                            <div class="col-12">
                                <div class="new-lev">
                                    <div class="col-12">
                                        <asp:TextBox ID="TbxLevelName" runat="server" placeholder="Insert NEW LEVEL name" />
                                        <asp:RequiredFieldValidator ErrorMessage="Required" ValidationGroup="insert" ForeColor="Red" ControlToValidate="TbxLevelName" runat="server" />
                                    </div>
                                    <div class="col-12">
                                        <asp:TextBox ID="TbxLevelNumber" runat="server" placeholder="Insert Level number" />
                                        <asp:RequiredFieldValidator ErrorMessage="Required" ValidationGroup="insert" ForeColor="Red" ControlToValidate="TbxLevelNumber" runat="server" />
                                    </div>
                                    <div class="col-12">
                                        <asp:FileUpload ID="flupQuestionUpload" runat="server" />
                                        <asp:RequiredFieldValidator ErrorMessage="Required" ValidationGroup="insert" ForeColor="Red" ControlToValidate="flupQuestionUpload" runat="server" />
                                    </div>
                                    <asp:Label ID="lblWarning" ForeColor="Red" runat="server"></asp:Label>
                                    <asp:Button class="button" ID="btnInsertLevel" runat="server" OnClick="InsertLevel_Click" Text="INSERT" />
                                </div>
                        </div>
                        </div>
                    </div>
                    <div class="domain-area col-12">
                        <div class="row">
                            <asp:Repeater ID="rptLevelSelect" runat="server" OnItemCommand="rptLevel_ItemCommand">
                                <HeaderTemplate>
                                    <table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="col-12">
                                        <div class="lev-container">
                                            <h4>Manage-Properties</h4>
                                            <div class="dropdown">
                                                <section>
                                                    <h4>LEVEL <i class="fa fa-caret-down"></i></h4>
                                                    <div class="dropdown-content">
                                                        <div>
                                                            <h4>Level Name:
                                                            <asp:Label ID="lblLevelName" runat="server" CommandArgument='<%# Eval("LevelName") %>' Text='<%# Eval("LevelName") %>' /></h4>
                                                            <div class="update">
                                                                <asp:TextBox ID="TbxUpdateLevel" placeholder="Enter NEW name to update" runat="server" />
                                                                <asp:Button class="button" ID="btnUpdateLevel" runat="server" CommandName="UpdateLevelName" Text="UPDATE" CommandArgument='<%# Eval("LevelId") %>' />
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <h4>Level Number:
                                                            <asp:Label ID="lblLevelNumber" Text='<%# Eval("LevelNumber") %>' runat="server"></asp:Label></h4>
                                                            <div class="update">
                                                                <asp:TextBox ID="TbxUpdateLevelNum" placeholder="Enter new number" runat="server" />
                                                                <asp:Button class="button" ID="btnUpdateLevelNum" runat="server" CommandName="UpdateLevelNum" Text="UPDATE" CommandArgument='<%# Eval("LevelId") %>' />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>
                                            </div>
                                            <div class="dropdown">
                                                <section>
                                                    <h4>Image <i class="fa fa-caret-down"></i></h4>
                                                    <div class="dropdown-content">
                                                        <div class="update">
                                                            <asp:LinkButton ID="linkBtnImageName" runat="server" CommandName="Select" CommandArgument='<%# Eval("LevelId") %>' Text='<%# Eval("ImageName") %>' />
                                                            click to update coordinates
                                                        </div>
                                                        <div class="update">
                                                            <asp:FileUpload ID="flupQuestionUpdate" runat="server" />
                                                        </div>
                                                        <div class="update">
                                                            <asp:Button class="button" ID="btnUpdateQuestion" runat="server" CommandName="UpdateQuestion" Text="UPDATE" CommandArgument='<%# Eval("LevelId") %>' />
                                                            <asp:Label ID="lblUpdateWarning" Visible="false" Text="Only .jpg or .png extensions allowed" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown-content">
                                                        <h4>CoOdinates</h4>
                                                        <h4>x:
                                                                <asp:Label runat="server" Text='<%# Eval("X") %>'></asp:Label></h4>
                                                        <h4>y:
                                                                <asp:Label runat="server" Text='<%# Eval("Y") %>'></asp:Label></h4>
                                                    </div>
                                                </section>
                                            </div>
                                            <div class="delete">
                                                <asp:Button class="button" ID="btnDeleteDomain" runat="server" CommandName="Delete" Text="DELETE LEVEL" CommandArgument='<%# Eval("LevelId") %>' />
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
