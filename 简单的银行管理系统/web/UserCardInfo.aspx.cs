using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using RL.DBUtility;
using System.Text;
using System.Data.SqlClient;

namespace web
{
    public partial class UserCardInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }

        }
        private void BindData()
        {
            string sql = "SELECT id,userid,cnumber,cpassword,balance,islost,CONVERT(VARCHAR,opendate,20) opendate FROM BankAccount;";
            DataSet ds = DbHelperSQL.Query(sql);
            gvCard.DataSource = ds;
            gvCard.DataBind();
        }
        //挂失
        protected void btnLost_Click(object sender, EventArgs e)
        {
            StringBuilder sbIds = new StringBuilder();
            //获取gridview里的checkbox是否被选中
            foreach (GridViewRow gvr in gvCard.Rows)
            {
                CheckBox cbSelect = gvr.FindControl("cbSelection") as CheckBox;
                if (cbSelect.Checked)
                {
                    sbIds.Append(gvCard.DataKeys[gvr.RowIndex]["id"] + ",");
                }
                
            }
            //todo update
            sbIds.Remove(sbIds.Length - 1, 1);//移除最后一个逗号
            if (sbIds.Length - 1 > 1)
            {
                sbIds.Insert(0, "UPDATE dbo.BankAccount SET islost='true' WHERE id in (");
                sbIds.Insert(sbIds.Length, ")");
            }
            else
            {
                sbIds.Insert(0, "UPDATE dbo.BankAccount SET islost='true' WHERE id = ");
            }
            DbHelperSQL.ExecuteSql(sbIds.ToString());
            //记录挂失日志
            int ruserid = Convert.ToInt32(Session["id"]);
            string username = Convert.ToString(Session["username"]);
            //测试使用，如果没有登录，ruserid = 1，username='zzh'
            if (ruserid == 0)
            {
                ruserid = 1;
            }
            if (username == "")
            {
                username = "zzh";
            }

            string ip = HttpContext.Current.Request.UserHostAddress; 
            StringBuilder sblog = new StringBuilder();
            sblog.AppendLine("INSERT INTO Log(logtype,ruserid,username,details,ip)");
            sblog.AppendLine("VALUES('挂失',@ruserid,@username,'挂失',@ip)");
            SqlParameter[] pms = {
                                    new SqlParameter("@ruserid",SqlDbType.Int),
                                    new SqlParameter("@username",SqlDbType.NVarChar,50),
                                    new SqlParameter("@ip",SqlDbType.NVarChar,50)
                                 };
            pms[0].Value = ruserid;
            pms[1].Value = username;
            pms[2].Value = ip;
            DbHelperSQL.ExecuteSql(sblog.ToString(),pms);
            //刷新本页面
            Response.Redirect("UserCardInfo.aspx");
        }
        //取消挂失
        protected void btnLostOff_Click(object sender, EventArgs e)
        {
            StringBuilder sbIds = new StringBuilder();
            //获取gridview里的checkbox是否被选中
            foreach (GridViewRow gvr in gvCard.Rows)
            {
                CheckBox cbSelect = gvr.FindControl("cbSelection") as CheckBox;
                if (cbSelect.Checked)
                {
                    sbIds.Append(gvCard.DataKeys[gvr.RowIndex]["id"] + ",");
                }

            }
            //todo update
            sbIds.Remove(sbIds.Length - 1, 1);//移除最后一个逗号
            if (sbIds.Length - 1 > 1)
            {
                sbIds.Insert(0, "UPDATE dbo.BankAccount SET islost='false' WHERE id in (");
                sbIds.Insert(sbIds.Length, ")");
            }
            else
            {
                sbIds.Insert(0, "UPDATE dbo.BankAccount SET islost='false' WHERE id = ");
            }
            DbHelperSQL.ExecuteSql(sbIds.ToString());
            //记录取消挂失日志
            int ruserid = Convert.ToInt32(Session["id"]);
            string username = Convert.ToString(Session["username"]);
            //测试使用，如果没有登录，ruserid = 1，username='zzh'
            if (ruserid == 0)
            {
                ruserid = 1;
            }
            if (username == "")
            {
                username = "zzh";
            }

            string ip = HttpContext.Current.Request.UserHostAddress;
            StringBuilder sblog = new StringBuilder();
            sblog.AppendLine("INSERT INTO Log(logtype,ruserid,username,details,ip)");
            sblog.AppendLine("VALUES('取消挂失',@ruserid,@username,'取消挂失',@ip)");
            SqlParameter[] pms = {
                                    new SqlParameter("@ruserid",SqlDbType.Int),
                                    new SqlParameter("@username",SqlDbType.NVarChar,50),
                                    new SqlParameter("@ip",SqlDbType.NVarChar,50)
                                 };
            pms[0].Value = ruserid;
            pms[1].Value = username;
            pms[2].Value = ip;
            DbHelperSQL.ExecuteSql(sblog.ToString(), pms);
            Response.Redirect("UserCardInfo.aspx");
        }
    }
}