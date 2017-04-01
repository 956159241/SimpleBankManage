using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using RL.DBUtility;
using System.Data.SqlClient;
using System.Text;

namespace web
{
    public partial class CustomerIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDrop();
            }
        }
        private void BindDrop()
        {
            int userid = Convert.ToInt32(Session["id"]);
            //测试用，这样就可以不用从头开始测试
            if (userid == 0)
            {
                userid = 2;
            }
            string sql = "SELECT cnumber,id FROM BankAccount WHERE islost = 'False' AND userid = @userid";
            SqlParameter[] pms = { 
                                    new SqlParameter("@userid",SqlDbType.Int)
                                 };
            pms[0].Value = userid;
            DataSet ds = DbHelperSQL.Query(sql,pms);
            ddlCNumber.DataSource = ds;
            ddlCNumber.DataTextField = "cnumber";
            ddlCNumber.DataValueField = "id";
            DataRow drNew = ds.Tables[0].NewRow();//方法，新建一行
            drNew["id"] = 0;//为新增的一行添加两个属性
            drNew["cnumber"] = "请选择";
            ds.Tables[0].Rows.InsertAt(drNew, 0);//将新增的一行添加到ds中
            ddlCNumber.DataBind();
        }
        //存钱并记录日志
        protected void btnSaveMoney_Click(object sender, EventArgs e)
        {
            string cnumber = ddlCNumber.SelectedItem.ToString();
            Double money = 0;
            if (txtSaveMoney.Text != "")
            {
                money = Convert.ToDouble(txtSaveMoney.Text);
            }
            string sqlUpdate = "UPDATE BankAccount SET balance = balance + @money WHERE cnumber = @cnumber";
            SqlParameter[] pmsUpdate = { 
                                        new SqlParameter("@money",SqlDbType.Money),
                                        new SqlParameter("@cnumber",SqlDbType.NVarChar,30)
                                     };
            pmsUpdate[0].Value = money;
            pmsUpdate[1].Value = cnumber;
            DbHelperSQL.ExecuteSql(sqlUpdate, pmsUpdate);
            //记录存钱日志
            int ruserid = Convert.ToInt32(Session["id"]);
            string username = Convert.ToString(Session["username"]);
            //测试使用，如果没有登录，ruserid = 1，username='zzh'
            if (ruserid == 0)
            {
                ruserid = 2;
            }
            if (username == "")
            {
                username = "marry";
            }

            string ip = HttpContext.Current.Request.UserHostAddress;
            StringBuilder sblog = new StringBuilder();
            sblog.AppendLine("INSERT INTO Log(logtype,ruserid,username,details,ip)");
            sblog.AppendLine("VALUES('存钱',@ruserid,@username,@details,@ip)");
            SqlParameter[] pms = {
                                    new SqlParameter("@ruserid",SqlDbType.Int),
                                    new SqlParameter("@username",SqlDbType.NVarChar,50),
                                    new SqlParameter("@details",SqlDbType.NVarChar,200),
                                    new SqlParameter("@ip",SqlDbType.NVarChar,50)
                                 };
            pms[0].Value = ruserid;
            pms[1].Value = username;
            pms[2].Value = "存入：" + money + "元";
            pms[3].Value = ip;
            DbHelperSQL.ExecuteSql(sblog.ToString(), pms);
            Response.Redirect("CustomerIndex.aspx");
            //Response.Write("<script type='text/javascript'>alert('存款成功');</script>");
        }
    }
}