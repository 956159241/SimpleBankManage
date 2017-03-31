using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using RL.DBUtility;
using System.Data.SqlClient;

namespace web
{
    public partial class AdministratorIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }


        }
        public void BindData()
        {
            //用户选项
            //编辑查询语句
            StringBuilder sbsqlusers = new StringBuilder();
            sbsqlusers.AppendLine("SELECT id,username,usertype,password,sex,userID,");
            sbsqlusers.AppendLine("CONVERT(varchar,birthday,23) AS birthday,phone FROM Users WHERE usertype='普通用户';");
            //执行查询
            DataSet ds = DbHelperSQL.Query(sbsqlusers.ToString());
            gvUsers.DataSource = ds.Tables[0];
            gvUsers.DataBind();
            //卡选项
            StringBuilder sbsqlcards= new StringBuilder();
            sbsqlcards.AppendLine("SELECT B.cnumber,U.username,U.userID,B.opendate,B.islost FROM ");
            sbsqlcards.AppendLine("	Users AS U INNER JOIN BankAccount AS B ON U.id = B.userid;");
            //执行查询
            DataSet ds1 = DbHelperSQL.Query(sbsqlcards.ToString());
            gvCards.DataSource = ds1.Tables[0];
            gvCards.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string userID = txtUserID.Text;
            string username = txtUserName.Text;
            string cnumber = txtCNumber.Text;
            StringBuilder sbsql = new StringBuilder();
            sbsql.AppendLine("SELECT B.cnumber,U.username,U.userID,B.opendate,B.islost FROM ");
            sbsql.AppendLine("Users AS U INNER JOIN BankAccount AS B ON U.id = B.userid");
            sbsql.AppendLine("WHERE 1=1");
            if (username != "")
            {
                sbsql.AppendLine("AND U.username LIKE @username");
            }
            if (userID != "")
            {
                sbsql.AppendLine("AND U.userID = @userID");
            }
            if (cnumber != "")
            {
                sbsql.AppendLine("AND B.cnumber LIKE @cnumber");
            }
            SqlParameter[] pms = { 
                                    new SqlParameter("@username",SqlDbType.NVarChar,50),
                                    new SqlParameter("@userID",SqlDbType.NVarChar,30),
                                    new SqlParameter("@cnumber",SqlDbType.NVarChar,30)
                                 };
            pms[0].Value = "%" + username + "%";
            pms[1].Value = userID;
            pms[2].Value = "%" + cnumber + "%";
            DataSet ds1 = DbHelperSQL.Query(sbsql.ToString(),pms);
            gvCards.DataSource = ds1;
            gvCards.DataBind();
        }
    }
}