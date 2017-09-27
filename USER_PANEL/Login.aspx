<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
    <script type="text/javascript" src="../Js/modals.js"></script>
    <div class="corousel-container">
        <div class="corousel">
            <div class="corousel-img img-1"></div>
            <div class="corousel-img img-2"></div>
            <div class="corousel-img img-3"></div>
            <div class="corousel-img img-4"></div>
        </div>
        <div class="intro-txt-box">
            <h1>SPOT <span><i class="fa fa-hand-pointer-o"></i>T</span></h1>
            <h2 onclick="openLogModal()">Start-Here</h2>
        </div>
    </div>
    <div id="logModal">
        <div class="sign-log-box">
            <i onclick="closeModal()" id="close-button" class="fa fa-times"></i>
            <h1>LOG-IN</h1>
            <form id="form1" runat="server">
                <div>
                    <img src="../Images/user.png" />
                </div>
                <asp:TextBox ID="tbxEmailId" runat="server" Width="200px" placeholder="Enter Email Id"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please enter an Email Id" ControlToValidate="tbxEmailId" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="tbxPassword" runat="server" TextMode="Password" Width="200px" placeholder="Enter Password"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxPassword" ErrorMessage="please enter the password" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Button CssClass="buttonDesign" ID="btnLogin" runat="server" OnClick="ValidateUser" Text="Login" Width="100px" />
                <hr />
                <p>DON'T HAVE AN ACCOUNT ?</p>
                <asp:Label ID="lblWarning" runat="server"></asp:Label>
                <br />
                <asp:HyperLink onclick="openSignModal()" ID="HplRegistration" runat="server" NavigateUrl="~/USER_PANEL/Registration.aspx">Register Here</asp:HyperLink>
            </form>
        </div>
    </div>

</body>
</html>
