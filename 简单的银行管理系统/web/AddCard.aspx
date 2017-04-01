<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCard.aspx.cs" Inherits="web.AddCard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新增卡号</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="卡号"></asp:Label>
        <asp:TextBox ID="txtCNmuber" runat="server"></asp:TextBox><br/><br/>
        <asp:Label ID="Label2" runat="server" Text="密码"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br/><br/>
        <asp:Label ID="Label3" runat="server" Text="存入"></asp:Label>
        <asp:TextBox ID="txtBalance" runat="server"></asp:TextBox><br/><br/>
        <asp:Button ID="btnSave" runat="server" Text="保存" onclick="btnSave_Click" />
    </div>
    </form>
</body>
</html>
