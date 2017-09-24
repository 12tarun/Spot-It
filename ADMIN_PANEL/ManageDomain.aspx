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
            <table>
                <tr>
                    <td>
                        <asp:Repeater ID="rptDomainSelect" runat="server" OnItemCommand="rptDomain_ItemCommand">
                            <HeaderTemplate>
                                <table border="1">
                                    <tr>
                                        <th scope="col" style="width: 200px">Domain Name
                                        </th>
                                        <th scope="col" style="width: 100px">Select
                                        </th>
                                        <th scope="col" style="width: 100px">Select
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
                    </td>
                </tr>
            </table>
            <br />
            <asp:TextBox ID="TbxDomainName" placeholder="Insert Domain" runat="server" Width="300px" />
            <asp:Button ID="btnInsertDomain" runat="server" OnClick="InsertDomain_Click" Text="OK" />
        </div>
    </form>
</body>
</html>
