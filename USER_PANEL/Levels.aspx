<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Levels.aspx.cs" Inherits="Levels" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .back {
            float: right;
        }

        .label {
            float: left;
        }

        .level_button {
            width: 15%;
        }

        #rptLevelSelect {
            float: left;
            width: 40%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button CssClass="back" ID="btnBack" OnClick="Back_Click" runat="server" Text="Back" />
        <asp:Label CssClass="label" ID="lblDomain" runat="server"></asp:Label>
        <br />
        <br />

        <div>
            <div style="width: 10%; float: left">
                <asp:Repeater ID="rptLevelSelect" runat="server" OnItemCommand="rptLevel_ItemSelect">
                    <HeaderTemplate>
                        <table border="1">
                            <tr>
                                <th scope="col" style="width: 200px; justify-content: center">SELECT LEVEL
                                </th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Button CssClass="button" ID="btnSelectDomain" runat="server" CommandName='<%# Eval("LevelNumber") %>' Text='<%# Eval("LevelName") %>' CommandArgument='<%# Eval("LevelId") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <div style="width: 30%">
                <asp:GridView ID="grid1" runat="server" AutoGenerateColumns="False" GridLines="None">
                    <HeaderStyle Height="28px" />
                    <RowStyle Height="28px" />
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:Label ID="lblLock" runat="server" Style="color: red" Text="Locked"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
