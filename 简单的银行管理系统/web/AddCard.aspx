<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCard.aspx.cs" Inherits="web.AddCard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新增卡号</title>
    <style type="text/css">
    *{margin:5px;padding:5px;}
        body{background-color:#646464;}
        .my_login{width:600px;margin:100px auto;color:White}
        #btnSave{display: inline-block;outline: none;cursor: pointer;text-align: center;
	                 text-decoration: none;font: 14px/100% Arial, Helvetica, sans-serif;padding: .5em 2em .5em;
	                 text-shadow: 0 1px 1px rgba(0,0,0,.3);-webkit-border-radius: .5em; -moz-border-radius: .5em;
	                 border-radius: 0em;-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	                 box-shadow: 0 1px 2px rgba(0,0,0,.2);margin-left:20px;}
	    input{padding:0px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="my_login">
        <table>
            <tr>
                <td><asp:Label ID="Label4" runat="server" Text="开户人Id:"></asp:Label></td>
                <td><asp:TextBox ID="txtUserId" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="设置卡号:"></asp:Label></td>
                <td><asp:TextBox ID="txtCNmuber" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="卡号密码:"></asp:Label></td>
                <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label3" runat="server" Text="存入金额:"></asp:Label></td>
                <td><asp:TextBox ID="txtBalance" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;"><asp:Button ID="btnSave" runat="server" Text="保存" onclick="btnSave_Click" /></td>
            </tr>
        </table>
        
        
        
        
        
        
        
        
        
    </form>
</body>
</html>
