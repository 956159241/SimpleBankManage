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
                            location.reload();
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
                    data: { money: money, otherCard: otherCard, cnumber: cnumber },
                    success: function (data) {
                        if (data != '') {
                            alert(data);
                            alert("转账成功");
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
    <script type="text/javascript">
        //选项卡js
        //    选项卡js代码
        window.onload = function () {
            $(".draw").css("display", "none"); 
            $(".trans").css("display", "none");}
        function showSave() {
            $("#lbSave").css("background-color", "red");
            $("#lbDraw").css("background-color", "");
            $("#lbTrans").css("background-color", "");
            $(".save").css("display", "block");
            $(".draw").css("display", "none");
            $(".trans").css("display", "none");
        }
        function showDraw() {
            $("#lbSave").css("background-color", "");
            $("#lbDraw").css("background-color", "red");
            $("#lbTrans").css("background-color", "");
            $(".save").css("display", "none");
            $(".draw").css("display", "block");
            $(".trans").css("display", "none");
        }
        function showTrans() {
            $("#lbSave").css("background-color", "");
            $("#lbDraw").css("background-color", "");
            $("#lbTrans").css("background-color", "red");
            $(".save").css("display", "none");
            $(".draw").css("display", "none");
            $(".trans").css("display", "block");
        }


    </script>
     <style type="text/css">
         *{margin:5px;}
        body{background-color:#646464;}
        .my_login{width:400px;margin:100px auto;color:White}
        #btnSaveMoney,#btnDrawMoney,#btnTransMoney{display: inline-block;outline: none;cursor: pointer;text-align: center;
	                 text-decoration: none;font: 14px/100% Arial, Helvetica, sans-serif;padding: .5em 2em .5em;
	                 text-shadow: 0 1px 1px rgba(0,0,0,.3);-webkit-border-radius: .5em; -moz-border-radius: .5em;
	                 border-radius: 0em;-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	                 box-shadow: 0 1px 2px rgba(0,0,0,.2);}
	    #lbSave,#lbDraw,#lbTrans{cursor:pointer;padding:5px 5px 5px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="my_login">
        <asp:Label ID="Label1" runat="server" Text="选择自己卡号"></asp:Label>
        <asp:DropDownList ID="ddlCNumber" runat="server"></asp:DropDownList>
        <%--顶部的选项卡指示--%>
        <asp:Label ID="lbSave" runat="server" Text="存钱" onmouseover = "showSave()"></asp:Label>
        <asp:Label ID="lbDraw" runat="server" Text="取钱" onmouseover = "showDraw()"></asp:Label>
        <asp:Label ID="lbTrans" runat="server" Text="转账" onmouseover = "showTrans()"></asp:Label>
        <br/>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="save" style="text-align:center;">
                    <asp:TextBox ID="txtSaveMoney" runat="server"></asp:TextBox><br/>
                    <asp:Button ID="btnSaveMoney" runat="server" Text="存钱" 
                    onclick="btnSaveMoney_Click" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="draw" style="text-align:center;display:none;">
                    <asp:TextBox ID="txtDrawMoney" runat="server"></asp:TextBox><br/>
                    <asp:Button ID="btnDrawMoney" runat="server" Text="取钱" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div class="trans" style="text-align:center;display:none;">
                    <asp:Label ID="Label2" runat="server" Text="对方账号"></asp:Label>
                    <asp:TextBox ID="txtOtherCard" runat="server"></asp:TextBox><br/>
                    <asp:Label ID="Label3" runat="server" Text="转入金额"></asp:Label>
                    <asp:TextBox ID="txtTransMoney" runat="server"></asp:TextBox><br/>
                    <asp:Button ID="btnTransMoney" runat="server" Text="转账" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
