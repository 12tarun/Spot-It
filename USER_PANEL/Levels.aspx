<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Levels.aspx.cs" Inherits="Levels" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .back
        {
            float:right;
        }
        .label
        {
            float:left;
        }
        .level_button
        {
            width:15%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label CssClass="label" ID="lblDomain" runat="server"></asp:Label>
    <asp:Button CssClass="back" ID="btnBack" OnClick="Back_Click" runat="server" Text="Back"/>
    <br />
    <br />
        <table>
            <tr>
                <td>
        <asp:Repeater ID="rptLevelSelect" runat="server" OnItemCommand="rptLevel_ItemSelect">
            <HeaderTemplate>
                <table border ="0">
                    <tr>
                        <th scope="col" style="width:200px;justify-content:center" >
                            SELECT LEVEL
                        </th>
                    </tr>
            </HeaderTemplate>
                  <itemtemplate>
                        <tr>
                            <td>
                                <asp:Button CssClass="button" ID="btnSelectDomain" runat="server" CommandName="Select" Text='<%# Eval("LevelName") %>' CommandArgument='<%# Eval("LevelId") %>' />
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
    </div>
    </form>
</body>
</html>
