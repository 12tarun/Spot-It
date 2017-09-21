<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageDomain.aspx.cs" Inherits="ManageDomain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Welcome Admin !</h2>
        <br />
    <div>
    INSERT DOMAIN:
    <asp:TextBox ID="TbxDomainName" runat="server"/>
    <asp:Button ID="TbnInsertDomain" runat="server" OnClick="InsertDomain_Click" Text="OK"/>
    <br />
    <br />
 <asp:Repeater ID="rptDomain" runat="server" OnItemCommand="rptDomain_ItemCommand" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
        <table border="1">
            <tr>
                <th scope="col" style="width: 120px">
                    Domain Name
                </th>
                <th scope="col" style="width: 120px">
                    Select
                </th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td>
                <asp:Label ID="lblDomainName" runat="server" Text='<%# Eval("DomainName") %>' />
            </td>
            <td>
                <asp:Button ID="btnDeleteDomain" runat="server" Text="DELETE" CommandArgument='<%# Eval("DomainId") %>' />
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT * FROM [TblDomain]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
