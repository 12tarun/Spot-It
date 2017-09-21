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
        <asp:Image CssClass="DP" ID="ImgProfilePic" alt="No profile picture selected" runat="server" />
        <br />
        <br />
    </div>
        <asp:Repeater ID="rptDomain" runat="server" OnItemCommand="rptDomain_ItemCommand" DataSourceID="SqlDataSource1">
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
                                <asp:Button CssClass="button" ID="btnDeleteDomain" runat="server" Text='<%# Eval("DomainName") %>' CommandArgument='<%# Eval("DomainName") %>' />
                            </td>
                        </tr>
                  </itemtemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>      
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT * FROM [TblDomain]"></asp:SqlDataSource>
    </form>
</body>
</html>
