<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="web.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
         <script type="text/javascript">

             //        判断输入是否为空
             function checkUserInfo() {
                 if ($("#txtUserName").val() == "") {
                     alert("请输入用户名");
                     return false;
                 }
                 if ($("#txtPassword").val() == "") {
                     alert("请输入密码");
                     return false;
                 }
             }
    </script>
    <style type="text/css">
        body{background-color:#646464;}
        .my_login{width:300px;margin:100px auto;color:White}
        #buttonLogin{display: inline-block;outline: none;cursor: pointer;text-align: center;
	                 text-decoration: none;font: 14px/100% Arial, Helvetica, sans-serif;padding: .5em 2em .5em;
	                 text-shadow: 0 1px 1px rgba(0,0,0,.3);-webkit-border-radius: .5em; -moz-border-radius: .5em;
	                 border-radius: 0em;-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	                 box-shadow: 0 1px 2px rgba(0,0,0,.2);margin-left:120px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="my_login">
            <%--登录用户名--%>
            <asp:Label ID="labelUserName" runat="server" Text="用户名：&nbsp;"></asp:Label>
            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox><br/><br/>
            <%--登录密码--%>
            <asp:Label ID="labelPassword" runat="server" Text="密  码 ：&nbsp; "></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox><br/><br/>
            <%--登录按钮--%>
            <asp:Button ID="buttonLogin" runat="server" Text="登录" 
                onclientclick="return checkUserInfo()" onclick="buttonLogin_Click"/>
    </div>
    </form>
</body>
</html>
