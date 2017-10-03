<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageLevel.aspx.cs" Inherits="ManageLevel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css?family=Varela+Round|Roboto|Muli|Raleway" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Css/Admin_User.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
<body>
    <script src="../Js/sidemenu.js"></script>
    <form id="form1" runat="server">
        <nav id="navBar">
            <div>
                <span onclick="openMenu()">
                    <i id="menu-button" class="fa fa-bars"></i>
                </span>
                <h1>SPOT <i class="fa fa-hand-pointer-o"></i>T</h1>
                <asp:Button ID="btnBack" Text="Back" runat="server" Style="float: right" OnClick="btnBack_Click" />
            </div>
        </nav>
        <div>
            <br />
            <br />
            <br />
            <br />

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
            <asp:Repeater ID="rptLevelSelect" runat="server" OnItemCommand="rptLevel_ItemCommand">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th scope="col">Level Name
                            </th>
                            <th scope="col">Image Name
                            </th>
                            <th scope="col">X1 Coordinate
                            </th>
                            <th scope="col">Y1 Coordinate
                            </th>
                            <th scope="col">X2 Coordinate
                            </th>
                            <th scope="col">Y2 Coordinate
                            </th>
                            <th scope="col">Level Number
                            </th>
                            <th scope="col">Select
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
                            <asp:Label runat="server" Text='<%# Eval("X1") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text='<%# Eval("Y1") %>'></asp:Label>

                        </td>
                        <td>
                            <asp:Label runat="server" Text='<%# Eval("X2") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text='<%# Eval("Y2") %>'></asp:Label>

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
        </div>
    </form>
</body>
</html>
