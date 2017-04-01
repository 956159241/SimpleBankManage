using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using RL.DBUtility;
using System.Text;
using System.Web.SessionState;

namespace web
{
    /// <summary>
    /// TransMoneyHandler 的摘要说明
    /// </summary>
    public class TransMoneyHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //获取金额
            Double money = Convert.ToDouble(context.Request["money"]);
            //Double mone = Convert.ToDouble(money);
            string cnumber = context.Request["cnumber"];
            string otherCard = context.Request["otherCard"];
            //获取下拉选中账号
            string sql = "SELECT balance FROM BankAccount WHERE cnumber = @cnumber";
            SqlParameter[] pms = {
                                    new SqlParameter("@cnumber",SqlDbType.NVarChar,30)
                                 };
            pms[0].Value = cnumber;
            DataSet ds = DbHelperSQL.Query(sql, pms);
            Double balance = Convert.ToDouble(ds.Tables[0].Rows[0]["balance"]);
            //判断余额是否足够
            if (money > balance)
            {
                context.Response.Write("您的余额已不足");
            }
            else 
            {
                //本金减少
                string sqlUpdate = "UPDATE BankAccount SET balance = balance - @mone WHERE cnumber = @cnumber";
                SqlParameter[] pmsUpdate = { 
                                        new SqlParameter("@mone",SqlDbType.Money),
                                        new SqlParameter("@cnumber",SqlDbType.NVarChar,30)
                                     };
                pmsUpdate[0].Value = money;
                pmsUpdate[1].Value = cnumber;
                DbHelperSQL.ExecuteSql(sqlUpdate, pmsUpdate);
                //判断是否卡存在
                string sqlOther = "SELECT cnumber FROM BankAccount WHERE cnumber = @cnumber";
                SqlParameter[] pmsOther = { 
                                        new SqlParameter("@cnumber",SqlDbType.NVarChar,30)
                                     };
                pmsOther[0].Value = otherCard;
                DataSet dsOther = DbHelperSQL.Query(sqlOther,pmsOther);
                if (dsOther.Tables[0].Rows.Count <= 0)
                {
                    context.Response.Write("对方账户不存在");
                }

                //对方本金增加
                else
                {
                    string sqlAdd = "UPDATE BankAccount SET balance = balance + @money WHERE cnumber = @otherCard AND islost = 'False'";
                    SqlParameter[] pmsAdd = { 
                                        new SqlParameter("@money",SqlDbType.Money),
                                        new SqlParameter("@otherCard",SqlDbType.NVarChar,30)
                                     };
                    pmsAdd[0].Value = money;
                    pmsAdd[1].Value = otherCard;
                    DbHelperSQL.ExecuteSql(sqlAdd, pmsAdd);
                }
            }

            //记录转钱日志
            int ruserid = Convert.ToInt32(context.Session["id"]);
            string username = Convert.ToString(context.Session["username"]);
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
            sblog.AppendLine("VALUES('取钱',@ruserid,@username,@details,@ip)");
            SqlParameter[] pmslog = {
                                    new SqlParameter("@ruserid",SqlDbType.Int),
                                    new SqlParameter("@username",SqlDbType.NVarChar,50),
                                    new SqlParameter("@details",SqlDbType.NVarChar,200),
                                    new SqlParameter("@ip",SqlDbType.NVarChar,50)
                                 };
            pmslog[0].Value = ruserid;
            pmslog[1].Value = username;
            pmslog[2].Value = "转入：" +otherCard + "账户" + money + "元";
            pmslog[3].Value = ip;
            DbHelperSQL.ExecuteSql(sblog.ToString(), pmslog);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}