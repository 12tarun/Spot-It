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

    <div id="sideMenu">
        <i onclick="closeMenu()" id="close-button" class="fa fa-times"></i>
        <h1>Welcome</h1>
        <h1>Admin</h1>
        <br />
        <br />
        <h4>You can configure the game.</h4>
    </div>
    <div id="layer"></div>
    <form id="form1" runat="server">
        <nav id="navBar">
            <div>
                <span onclick="openMenu()">
                    <i id="menu-button" class="fa fa-bars"></i>
                </span>
                <h1>SPOT <i class="fa fa-hand-pointer-o"></i>T</h1>
                <asp:Button ID="btnLogout" Text="Logout" OnClick="btnLogout_Click" Style="float: right" runat="server" />
            </div>
        </nav>
        <section id="Domain-header">
            <asp:TextBox ID="TbxDomainName" placeholder="Insert Domain" runat="server" style="height:40px;width:300px;margin-top:5%" />
            <asp:Button ID="btnInsertDomain" runat="server" OnClick="InsertDomain_Click" style="height:40px;width:60px" Text="OK" />
        </section>
        <br />
        <div>
            <asp:Repeater ID="rptDomainSelect" runat="server" OnItemCommand="rptDomain_ItemCommand">
                <HeaderTemplate>
                    <table class="table_admin">
                        <tr>
                            <th scope="col">Domain Name
                            </th>
                            <th scope="col">Select
                            </th>
                            <th scope="col">Select
                            </th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:LinkButton ID="linkBtnDomainName" runat="server" CommandName="Select" CommandArgument='<%# Eval("DomainName") %>' Text='<%# Eval("DomainName") %>' />
                            <br />
                            <asp:TextBox ID="TbxUpdateDomain" placeholder="Enter new name to update" runat="server" />
                            <br />
                        </td>
                        <td>
                            <asp:Button ID="btnDeleteDomain" runat="server" CommandName="Delete" Text="DELETE" CommandArgument='<%# Eval("DomainId") %>' />
                        </td>
                        <td>
                            <asp:Button ID="btnUpdateDomain" runat="server" CommandName="Update" Text="UPDATE" CommandArgument='<%# Eval("DomainId") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
