<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .logout
        {
            float:right;
        }
        .domain
        {
            margin-top:10%;
            width:200px;
        }
        .DP
        {
            height:200px;
            width:150px;
        }
        .label
        {
            float:left;
        }
        .button
        {
            width:200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label CssClass="label" ID="lblUsername" runat="server" Text="Welcome "></asp:Label>
<asp:Button CssClass="logout" ID="btnLogout" runat="server" OnClick="LogoutButton_Click" Text="Logout"/>
        <br />
        <br />
        <h3>Profile Picture</h3>
        <asp:Image CssClass="DP" ID="ImgProfilePic" alt="No profile picture selected" runat="server" />
        <br />
        <br />
    </div>
        <table>
            <tr>
                <td>
        <asp:Repeater ID="rptDomainSelect" runat="server" OnItemCommand="rptDomain_ItemCommand">
            <HeaderTemplate>
                <table border ="0">
                    <tr>
                        <th class="domain" scope="col" style="width:200px;justify-content:center" >
                            SELECT DOMAIN
                        </th>
                    </tr>
            </HeaderTemplate>
                  <itemtemplate>
                        <tr>
                            <td>
                                <asp:Button CssClass="button" ID="btnSelectDomain" runat="server" Text='<%# Eval("DomainName") %>' CommandArgument='<%# Eval("DomainId") %>' />
                            </td>
                        </tr>
                  </itemtemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>      
        </asp:Repeater>
                    </td>
                </tr>
            </table>
    </form>
</body>
</html>
