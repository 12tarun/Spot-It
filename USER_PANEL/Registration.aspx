<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css?family=Varela+Round|Roboto|Muli|Raleway" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="../Css/Spot-It-style.css" />
</head>
<body>
    <script type="text/javascript" src="../Js/modals2.js"></script>
    <div class="corousel-container">
        <div class="corousel">
            <div class="corousel-img img-1"></div>
            <div class="corousel-img img-2"></div>
            <div class="corousel-img img-3"></div>
            <div class="corousel-img img-4"></div>
        </div>
        <div class="intro-txt-box">
            <h1>SPOT <span><i class="fa fa-hand-pointer-o"></i>T</span></h1>
            <h2 onclick="openSignModal()">Start-Here</h2>
        </div>
    </div>
    <div id="signModal">
        <div class="sign-log-box">
            <i onclick="closeModal()" id="close-button" class="fa fa-times"></i>
            <h1>SIGN-UP</h1>
            <form id="form1" runat="server">
                <asp:TextBox ID="tbxUsername" runat="server" placeholder="Enter Username" />
                <br />
                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="tbxUsername"
                    runat="server" />
                <br />
                <asp:TextBox ID="tbxPassword" runat="server" TextMode="Password" placeholder="Enter Password" />
                <br />
                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="tbxPassword"
                    runat="server" />
                <br />
                <asp:TextBox ID="tbxConfirmPassword" runat="server" TextMode="Password" placeholder="Re-enter Password" />
                <br />
                <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="tbxPassword"
                    ControlToValidate="tbxConfirmPassword" runat="server" />
                <br />
                <asp:TextBox ID="tbxEmail" runat="server" placeholder="Enter Email-Id" />
                <br />
                <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                    ControlToValidate="tbxEmail" runat="server" />
                <br />
                <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="tbxEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                <hr />
                <p>Upload Profile Picture</p>
                <asp:FileUpload ID="ProfilePicUpload" runat="server" />
                <br />
                <asp:Button CssClass="buttonDesign" Text="Submit" runat="server" OnClick="RegisterUser" />
                <br />
                <asp:HyperLink ID="HplLogin" runat="server" NavigateUrl="~/USER_PANEL/Login.aspx">Click here after successful registration.</asp:HyperLink>
                <br />
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </form>
        </div>
    </div>
</body>
</html>
