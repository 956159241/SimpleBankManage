<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministratorIndex.aspx.cs" Inherits="web.AdministratorIndex" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        //    选项卡js代码
        window.onload = function () { $(".cardMInfo").css("display", "none"); }
        function showUser() {
            $("#lbUserM").css("background-color", "red");
            $("#lbCardM").css("background-color", "");
            $(".userMInfo").css("display", "block");
            $(".cardMInfo").css("display", "none");   
        }
        function showCard() {
            $("#lbCardM").css("background-color", "red");
            $("#lbUserM").css("background-color", "");
            $(".cardMInfo").css("display", "block");
            $(".userMInfo").css("display", "none");
         }
    </script>
    <style type="text/css">
        #lbCardM,#lbUserM{ cursor:pointer;}
        .cardMInfo{}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%--顶部的选项卡指示--%>
        <asp:Label ID="lbUserM" runat="server" Text="用户信息管理" onmouseover = "showUser()"></asp:Label>
        <asp:Label ID="lbCardM" runat="server" Text="银行卡信息管理" onmouseover = "showCard()"></asp:Label>
        <a href="UserEdit.aspx">新增用户</a>
        <br/>
        <%--用户信息--%>
        <div class="userMInfo">
            <asp:GridView ID="gvUsers" runat="server" DataKeyNames="id" 
                AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="用户名">
                        <ItemTemplate>
                             <a target="_blank" href='UserEdit.aspx?uid=<%# Eval("id") %>'>
                            <%#Eval("username") %>
                        </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="password" HeaderText="密码" />
                    <asp:BoundField DataField="sex" HeaderText="性别" />
                    <asp:BoundField DataField="userID" HeaderText="身份证号" />
                    <asp:BoundField DataField="birthday" HeaderText="生日" />
                    <asp:BoundField DataField="phone" HeaderText="手机号" />
                    <asp:TemplateField HeaderText="客户卡信息">
                        <ItemTemplate>
                        <a target="_blank" href='UserCardInfo.aspx?uid=<%# Eval("id") %>'>
                            客户信息    
                        </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>      
        </div>


        <%--银行卡信息--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="cardMInfo">
            <asp:Label ID="Label1" runat="server" Text="身份证号"></asp:Label>
            <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="用户名"></asp:Label>
            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Text="银行卡号"></asp:Label>
            <asp:TextBox ID="txtCNumber" runat="server"></asp:TextBox>   
            <asp:Button ID="btnSearch" runat="server" Text="搜索" onclick="btnSearch_Click" />

            <asp:GridView ID="gvCards" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="cnumber" HeaderText="卡号" />
                    <asp:BoundField DataField="username" HeaderText="用户名" />
                    <asp:BoundField DataField="userID" HeaderText="身份证号" />
                    <asp:BoundField DataField="opendate" HeaderText="开卡日期" />
                    <asp:CheckBoxField DataField="isLost" HeaderText="是否冻结" />
                </Columns>
            </asp:GridView>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>      
    </div>
    </form>
</body>
</html>
