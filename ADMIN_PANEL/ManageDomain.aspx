<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageDomain.aspx.cs" Inherits="ManageDomain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .tableData
        {
            justify-content:center;
        }
    </style>
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
    UPDATE DOMAIN:
    <asp:TextBox ID="TbxUpdateDomain" runat="server" placeholder="Enter new name"/>
    After entering click on update button of required row..
        <br />
        <br />
        <table>
            <tr>
                <td>
 <asp:Repeater ID="rptDomainDelete" runat="server" OnItemCommand="rptDomain_ItemDelete">
    <HeaderTemplate>
        <table border="0">
            <tr>
                <th scope="col" style="width: 200px">
                    Domain Name
                </th>
                <th scope="col" style="width: 100px">
                    Select
                </th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td >
                <asp:Label ID="lblDomainName" runat="server" Text='<%# Eval("DomainName") %>' />
                <br />
            </td>
            <td class="tableData">
                <asp:Button ID="btnDeleteDomain" runat="server" Text="DELETE" CommandArgument='<%# Eval("DomainId") %>' />
            </td>
        </tr>
    </ItemTemplate>
     <FooterTemplate>
        </table>
         </FooterTemplate>
</asp:Repeater>
                    </td>
                <td>
 <asp:Repeater ID="rptDomainUpdate" runat="server" OnItemCommand="rptDomain_ItemUpdate">
    <HeaderTemplate>
        <table border="0">
            <tr>
                <th scope="col" style="width: 100px">
                    Select
                </th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td class="tableData" >
                <asp:Button ID="btnUpdateDomain" runat="server" Text="UPDATE" CommandArgument='<%# Eval("DomainId") %>'/>
            </td>
        </tr>
    </ItemTemplate>
     <FooterTemplate>
        </table>
         </FooterTemplate>
</asp:Repeater>
                    </td>
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
