<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="web.UserEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="用户姓名:"></asp:Label>
        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox><br/>

        <asp:Label ID="Label2" runat="server" Text="密&nbsp;&nbsp;码:"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox><br/>

        <asp:Label ID="Label3" runat="server" Text="性&nbsp;&nbsp;别:"></asp:Label>
        <asp:TextBox ID="txtSex" runat="server"></asp:TextBox><br/>

        <asp:Label ID="Label4" runat="server" Text="身份证号:"></asp:Label>
        <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox><br/>

        <asp:Label ID="Label5" runat="server" Text="生&nbsp;&nbsp;日:"></asp:Label>
        <asp:TextBox ID="txtBirthday" runat="server"></asp:TextBox><br/>

        <asp:Label ID="Label6" runat="server" Text="手机号码:"></asp:Label>
        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox><br/>

        <asp:Button ID="btnSave" runat="server" Text="保存" onclick="btnSave_Click"/>
        <asp:Button ID="btnClose" runat="server" Text="关闭" onclick="btnClose_Click"/>
    </div>
    </form>
</body>
</html>
