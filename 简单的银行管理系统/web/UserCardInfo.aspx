<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserCardInfo.aspx.cs" Inherits="web.UserCardInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        *{margin:5px;padding:5px;}
        body{background-color:#646464;}
        .my_login{width:600px;margin:100px auto;color:White}
        #btnLost,#btnLostOff{display: inline-block;outline: none;cursor: pointer;text-align: center;
	                 text-decoration: none;font: 14px/100% Arial, Helvetica, sans-serif;padding: .5em 2em .5em;
	                 text-shadow: 0 1px 1px rgba(0,0,0,.3);-webkit-border-radius: .5em; -moz-border-radius: .5em;
	                 border-radius: 0em;-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	                 box-shadow: 0 1px 2px rgba(0,0,0,.2);margin-left:20px;}
	   a{color:white;font-size:28px;}
	    a:visited{color:White;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="my_login">
        <a target="_blank" href='AddCard.aspx'>开户</a>
        <asp:Button ID="btnLost" runat="server" Text="挂失" onclick="btnLost_Click"  style="margin-left:180px;"/>
        <asp:Button ID="btnLostOff" runat="server" Text="取消挂失" 
            onclick="btnLostOff_Click" />
        <asp:gridview ID="gvCard" runat="server" DataKeyNames="id" 
            AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="选择">
                    <ItemTemplate>
                        <asp:CheckBox ID="cbSelection" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="cnumber" HeaderText="卡号" />
                <asp:BoundField DataField="cpassword" HeaderText="密码" />
                <asp:BoundField DataField="balance" HeaderText="余额" />
                <asp:CheckBoxField DataField="islost" HeaderText="挂失" />
                <asp:BoundField DataField="opendate" HeaderText="开户日期" />
                <%--<asp:TemplateField HeaderText="开户">
                    <ItemTemplate>
                       <a target="_blank" href='AddCard.aspx?uid=<%# Eval("userid") %>'>开户</a>
                    </ItemTemplate>
                </asp:TemplateField>--%>
            </Columns>    
            
        </asp:gridview>
    </div>
    </form>
</body>
</html>

