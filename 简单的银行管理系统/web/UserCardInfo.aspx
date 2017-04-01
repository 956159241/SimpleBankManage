<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserCardInfo.aspx.cs" Inherits="web.UserCardInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="btnLost" runat="server" Text="挂失" onclick="btnLost_Click" />
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
                <asp:TemplateField HeaderText="开户">
                    <ItemTemplate>
                       <a target="_blank" href='AddCard.aspx?uid=<%# Eval("userid") %>'>开户</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>    
            
        </asp:gridview>
    </div>
    </form>
</body>
</html>

