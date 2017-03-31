<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerIndex.aspx.cs" Inherits="web.CustomerIndex" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script  language="javascript" type="text/javascript">
        $(function () {
            $("#btnDrawMoney").click(function () { //点击事件
                var money = $("#txtDrawMoney").val();
                var cnumber = $("#ddlCNumber").find("option:selected").text()
                $.ajax({
                    url: "DrawMoneyHandler.ashx",
                    type: "POST",
                    data: { money: money, cnumber: cnumber },
                    success: function (data) {
                        if (data != '') {
                            alert(data);
                        } else {
                            location.reload();
                        }
                    }

                }

                );
            });
            $("#btnTransMoney").click(function () { //点击转账事件
                var money = $("#txtTransMoney").val();
                var otherCard = $("#txtOtherCard").val();
                var cnumber = $("#ddlCNumber").find("option:selected").text()
                $.ajax({
                    url: "TransMoneyHandler.ashx",
                    type: "POST",
                    data: { money: money,otherCard:otherCard ,cnumber: cnumber },
                    success: function (data) {
                        if (data != '') {
                            alert(data);
                            location.reload();
                        } else {
                            location.reload();
                        }
                    }

                }

                );
            });
        });
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="选择自己卡号"></asp:Label>
        <asp:DropDownList ID="ddlCNumber" runat="server"></asp:DropDownList>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:TextBox ID="txtSaveMoney" runat="server"></asp:TextBox>
                <asp:Button ID="btnSaveMoney" runat="server" Text="存钱" 
                    onclick="btnSaveMoney_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
               <asp:TextBox ID="txtDrawMoney" runat="server"></asp:TextBox>
                <asp:Button ID="btnDrawMoney" runat="server" Text="取钱" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:Label ID="Label2" runat="server" Text="对方账号"></asp:Label>
               <asp:TextBox ID="txtOtherCard" runat="server"></asp:TextBox>
                <asp:Label ID="Label3" runat="server" Text="转入金额"></asp:Label>
               <asp:TextBox ID="txtTransMoney" runat="server"></asp:TextBox>
                <asp:Button ID="btnTransMoney" runat="server" Text="转账" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
