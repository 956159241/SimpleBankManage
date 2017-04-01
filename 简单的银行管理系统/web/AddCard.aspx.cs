using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using RL.DBUtility;

namespace web
{
    public partial class AddCard : System.Web.UI.Page
    {
        private int uId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.AllKeys.Contains("uid"))
            {
                uId = int.Parse(Request.QueryString["uid"]);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //uId = int.Parse(Request.QueryString["uid"]);
            if (uId != 0)
            {
                string number = txtCNmuber.Text;
                string pass = txtPassword.Text;
                string balance = txtBalance.Text;
                StringBuilder sbsql = new StringBuilder();
                sbsql.AppendLine("INSERT INTO BankAccount(userid,cnumber,cpassword,balance,islost) ");
                sbsql.AppendLine("VALUES (@userid,@cnumber,@cpassword,@balance,'false');");
                SqlParameter[] pms = {
                                    new SqlParameter("@userid",SqlDbType.Int),
                                    new SqlParameter("@cnumber",SqlDbType.NVarChar,30),
                                    new SqlParameter("@cpassword",SqlDbType.NVarChar,30),
                                    new SqlParameter("@balance",SqlDbType.Money)
                                 };
                pms[0].Value = uId;
                pms[1].Value = number;
                pms[2].Value = pass;
                pms[3].Value = balance;
                DbHelperSQL.ExecuteSql(sbsql.ToString(), pms);
                Response.Redirect("UserCardInfo.aspx");
            }
        }
    }
}