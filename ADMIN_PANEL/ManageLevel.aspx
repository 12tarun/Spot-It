<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageLevel.aspx.cs" Inherits="ManageLevel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnBack" Text="Back" runat="server" Style="float: right" OnClick="btnBack_Click" />
            <h2>Welcome Admin !</h2>
            <asp:Label ID="lblDisplayDomain" Text="You have entered in domain " Visible="true" runat="server"></asp:Label>
            <br />
            <br />
            INSERT LEVEL NAME:
    <asp:TextBox ID="TbxLevelName" runat="server" />
            <asp:RequiredFieldValidator ErrorMessage="Required" ValidationGroup="insert" ForeColor="Red" ControlToValidate="TbxLevelName" runat="server" />
            <br />
            <br />
            INSERT LEVEL NUMBER:
            <asp:TextBox ID="TbxLevelNumber" runat="server" />
            <asp:RequiredFieldValidator ErrorMessage="Required" ValidationGroup="insert" ForeColor="Red" ControlToValidate="TbxLevelNumber" runat="server" />
            <br />
            <br />
            UPLOAD QUESTION:
    <asp:FileUpload ID="flupQuestionUpload" runat="server" />
            <asp:RequiredFieldValidator ErrorMessage="Required" ValidationGroup="insert" ForeColor="Red" ControlToValidate="flupQuestionUpload" runat="server" />
            <br />
            <asp:Label ID="lblWarning" ForeColor="Red" runat="server"></asp:Label>
            <br />
            <asp:Button ID="btnInsertLevel" runat="server" OnClick="InsertLevel_Click" Text="INSERT" />
            <br />
            <br />
            <table>
                <tr>
                    <td>
                        <asp:Repeater ID="rptLevelSelect" runat="server" OnItemCommand="rptLevel_ItemCommand">
                            <HeaderTemplate>
                                <table border="1">
                                    <tr>
                                        <th scope="col" style="width: 300px">Level Name
                                        </th>
                                        <th scope="col" style="width: 300px">Image Name
                                        </th>
                                        <th scope="col" style="width: 300px">X Coordinate
                                        </th>
                                        <th scope="col" style="width: 300px">Y Coordinate
                                        </th>
                                        <th scope="col" style="width: 300px">Level Number
                                        </th>
                                        <th scope="col" style="width: 100px">Select
                                        </th>

                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblLevelName" runat="server" CommandArgument='<%# Eval("LevelName") %>' Text='<%# Eval("LevelName") %>' />
                                        <br />
                                        <br />
                                        <asp:TextBox ID="TbxUpdateLevel" placeholder="Enter new name to update" runat="server" />
                                        <asp:Button ID="btnUpdateLevel" runat="server" CommandName="UpdateLevelName" Text="UPDATE" CommandArgument='<%# Eval("LevelId") %>' />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="linkBtnImageName" runat="server" CommandName="Select" CommandArgument='<%# Eval("LevelId") %>' Text='<%# Eval("ImageName") %>' />
                                        <br />
                                        click to update coordinates
                                        <br />
                                        <br />
                                        <asp:FileUpload ID="flupQuestionUpdate" runat="server" />
                                        <br />
                                        <br />
                                        <asp:Button ID="btnUpdateQuestion" runat="server" CommandName="UpdateQuestion" Text="UPDATE" CommandArgument='<%# Eval("LevelId") %>' />
                                        <br />
                                        <asp:Label ID="lblUpdateWarning" Visible="false" Text="Only .jpg or .png extensions allowed" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%# Eval("X") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%# Eval("Y") %>'></asp:Label>

                                    </td>
                                    <td>
                                        <asp:Label ID="lblLevelNumber" Text='<%# Eval("LevelNumber") %>' runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:TextBox ID="TbxUpdateLevelNum" placeholder="Enter new number" runat="server" />
                                        <asp:Button ID="btnUpdateLevelNum" runat="server" CommandName="UpdateLevelNum" Text="UPDATE" CommandArgument='<%# Eval("LevelId") %>' />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnDeleteDomain" runat="server" CommandName="Delete" Text="DELETE" CommandArgument='<%# Eval("LevelId") %>' />
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
