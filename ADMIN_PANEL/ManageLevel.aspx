<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageLevel.aspx.cs" Inherits="ManageLevel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>Welcome Admin !</h2>
        <asp:Label ID="lblDisplayDomain" Text="You have entered in domain " Visible="true" runat="server"></asp:Label>
        <br />
        <br />
    INSERT LEVEL:
    <asp:TextBox ID="TbxLevelName" runat="server"/>
    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="tbxLevelName" runat="server" />
    <br />
    <br />
    UPLOAD QUESTION:
    <asp:FileUpload ID="QuestionUpload" runat="server"/>
    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="QuestionUpload" runat="server" />
    <br />
    <asp:Label Id="lblWarning" ForeColor="Red" runat="server"></asp:Label>
    <br />
    <asp:Button ID="BtnInsertLevel" runat="server" OnClick="InsertLevel_Click" Text="INSERT"/>
    <br />
    <br />
    </div>
    </form>
</body>
</html>
