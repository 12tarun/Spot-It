<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeaderBoard.aspx.cs" Inherits="USER_PANEL_LeaderBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="grid1" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="RANK">
                        <ItemTemplate>
                            <asp:Label ID="lblRank" runat="server" Text='<%#Bind("Rank") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="USERNAME">
                        <ItemTemplate>
                            <asp:Label ID="lblUsername" runat="server" Text='<%#Bind("Username") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SCORE">
                        <ItemTemplate>
                            <asp:Label ID="LblScore" runat="server" Text='<%#Bind("Score") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
