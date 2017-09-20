﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        *{
	box-sizing: border-box;
}

* {
	margin: 0;
	padding: 0;
}
/*font-family: 'Roboto', sans-serif;
font-family: 'Varela Round', sans-serif;
font-family: 'Muli', sans-serif;
font-family: 'Raleway', sans-serif;*/

[class*="col-"] {
    float: left;
    padding: 15px;
}

.row::after {
    content: "";
    clear: both;
    display: table;
}

/*For small screen*/
.col-1 {width: 8.33%;}
.col-2 {width: 16.66%;}
.col-3 {width: 25%;}
.col-4 {width: 33.33%;}
.col-5 {width: 41.66%;}
.col-6 {width: 50%;}
.col-7 {width: 58.33%;}
.col-8 {width: 66.66%;}
.col-9 {width: 75%;}
.col-10 {width: 83.33%;}
.col-11 {width: 91.66%;}
.col-12 {width: 100%;}

/*For Medium Screen*/
@media(min-width: 756px){
	.col-md-1 {width: 8.33%;}
	.col-md-2 {width: 16.66%;}
	.col-md-3 {width: 25%;}
	.col-md-4 {width: 33.33%;}
	.col-md-5 {width: 41.66%;}
	.col-md-6 {width: 50%;}
	.col-md-7 {width: 58.33%;}
	.col-md-8 {width: 66.66%;}
	.col-md-9 {width: 75%;}
	.col-md-10 {width: 83.33%;}
	.col-md-11 {width: 91.66%;}
	.col-md-12 {width: 100%;}
}

/*For Large Screens*/
@media(min-width: 960px){
	.col-lg-1 {width: 8.33%;}
	.col-lg-2 {width: 16.66%;}
	.col-lg-3 {width: 25%;}
	.col-lg-4 {width: 33.33%;}
	.col-lg-5 {width: 41.66%;}
	.col-lg-6 {width: 50%;}
	.col-lg-7 {width: 58.33%;}
	.col-lg-8 {width: 66.66%;}
	.col-lg-9 {width: 75%;}
	.col-lg-10 {width: 83.33%;}
	.col-lg-11 {width: 91.66%;}
	.col-lg-12 {width: 100%;}
}

.main{
	width: 100%;
	height: 100vh;
	background-image: linear-gradient(to bottom left, #00aa8d, #57dcdb), url(images/coresal-img1.jpg);
	background-size: cover;
    background-blend-mode: multiply;
	background-position: center, center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-repeat: no-repeat;
}

.text-center{
	text-align: center;
}

[class="main"] header{
	position: absolute;
	margin: auto;
	top: 30vh;
}

nav{
	background-color: #009688;
	text-align: left;
	padding: 20px;
	color: #f3f3f3;
	font-family: 'Varela Round', sans-serif;
}

nav ul{
	list-style-type: none;
	float: right;
	color: #fff;
}

nav ul li{
	display: inline;
}

.intro-txt{
	font-family: 'Varela Round', sans-serif;
	color: #f3f3f3;
}

[class="main"] header div img{
	width: 70%;
	height: auto;
	margin: auto;
}

.sign-log-bg{
	width: 100%;
	height: 100vh;
	/*background: linear-gradient(to bottom left, #263238, #546E7A), url(images/coresal-img1.jpg);*/
	background-image: linear-gradient(to bottom left, #00695C, #009688), url(images/coresal-img1.jpg);
	background-size: cover;
    background-blend-mode: multiply;
	background-position: center, center;
	background-attachment: fixed;
	background-repeat: no-repeat;
}

.sign-log-box{
	width: 320px;
	height: 600px;
	left: 0px;
	right: 0px;
	top: 0px;
	bottom: 0px;
	position: absolute;
	background-color: #fff;
	border-radius: 10px;
	margin: auto;
}

[class="sign-log-box"] h1{
	background-color: #009688;
	font-family: 'Varela Round', sans-serif;
	color: #f3f3f3;
	border-top-right-radius: 10px;
	border-top-left-radius: 10px;
	padding: 10px; 
}

[class="sign-log-box"] input[type=text]{
    width: 70%;
    height: 40px;
    padding: 0 10px;
    margin: 10px;
    border: 1px solid #00695c;
    border-radius: 30px;
}

[class="sign-log-box"] input[type=password]{
    width: 70%;
    height: 40px;
    padding: 0 10px;
    margin: 10px;
    border: 1px solid #00695c;
    border-radius: 30px;
}

[class="sign-log-box"] input[type=file]{
	width: 70%;
    height: 40px;
    padding: 0 10px;
    margin: 10px;
}

[class="sign-log-box"] hr{
	width: 80%;
	margin: auto;
	padding: 1px;
}

[class="sign-log-box"] input[type=button]{
	border: 1px solid #004d40;
    border-radius: 10px;
    margin: 10px;
    padding: 10px;
    background-color: #009688;
    color: #f3f3f3;
    font-family: 'Noto Sans', sans-serif;
    text-align: center;
    text-decoration: none;
    font-size: 14px;
    transition-duration: 0.4s;
    cursor: pointer;
}

[class="sign-log-box"] input[type=button]:hover{
	background-color: #004d40;
	font-size: 15px;
	color: #fff;
}

[class="sign-log-box"] img{
	background-color: #009688;
	border-radius: 2px;
	position: absolute;
	left: 285px;
	top:5px;
	width: 25px;
	height: 25px;
}

[class="sign-log-box"] img:hover{
	background-color: #004840;
}
.buttonDesign
{
	border: 1px solid #004d40;
    border-radius: 10px;
    margin: 10px;
    padding: 10px;
    background-color: #009688;
    color: #f3f3f3;
    font-family: 'Noto Sans', sans-serif;
    text-align: center;
    text-decoration: none;
    font-size: 14px;
    transition-duration: 0.4s;
    cursor: pointer;
}
.buttonDesign:hover
{
	background-color: #004d40;
	font-size: 15px;
	color: #fff;
}
    </style>
</head>
<body class="text-center sign-log-bg">
    <nav>
        <h1>SPOT IT</h1>
    </nav>
    <div class="sign-log-box">
        <h1>Sign Up</h1>
    <form id="form1" runat="server">
    <div>
            <asp:TextBox ID="tbxUsername" runat="server" placeholder="Username..." />
        <br />
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="tbxUsername"
                runat="server" />
        <br />
            <asp:TextBox ID="tbxPassword" runat="server" TextMode="Password" placeholder="Password" />
        <br />
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="tbxPassword"
                runat="server" />
        <br />
            <asp:TextBox ID="tbxConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password..." />
        <br />
            <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="tbxPassword"
                ControlToValidate="tbxConfirmPassword" runat="server" />
        <br />
            <asp:TextBox ID="tbxEmail" runat="server" placeholder="Email-Id..." />
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
    </div>
    </form>
        </div>
</body>
</html>
