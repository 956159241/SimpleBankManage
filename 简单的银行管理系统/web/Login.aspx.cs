using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using RL.DBUtility;

namespace web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buttonLogin_Click(object sender, EventArgs e)
        {
            //编写sql语句，此处的top 1 就是选出查询的第一条记录，此处可避免查出内容相同的两条语句
            string sql = "SELECT TOP 1 * FROM Users  WHERE username = @username AND password = @password";
            //设置参数
            SqlParameter[] pms = { 
                                    new SqlParameter("@username",SqlDbType.NVarChar,50),
                                    new SqlParameter("@password",SqlDbType.NVarChar,30)
                                 };
            //为参数赋值
            pms[0].Value = txtUserName.Text;
            pms[1].Value = txtPassword.Text;
            DataSet ds = DbHelperSQL.Query(sql, pms);        //执行查询，并将数据放置在一个数据集中
            //判断表中是否存在数据，如果有数据则登录成功，如果没有数据，则登录失败
            if (ds.Tables[0].Rows.Count > 0)
            {
                //根据判断选择进入哪个主页,无论进来的管理员或者是普通用户都记录下操作者的ID，方便记录日志
                if (ds.Tables[0].Rows[0]["usertype"].ToString() == "管理员")
                {
                    Session["id"] = ds.Tables[0].Rows[0]["id"].ToString();
                    Session["username"] = ds.Tables[0].Rows[0]["username"].ToString();
                    Response.Redirect("AdministratorIndex.aspx");
                }
                else
                {
                    Session["id"] = ds.Tables[0].Rows[0]["id"].ToString();
                    Session["username"] = ds.Tables[0].Rows[0]["username"].ToString();
                    Response.Redirect("CustomerIndex.aspx");
                }
            }
            //验证失败弹出提示框
            else
            {
                Response.Write("<script>alert('用户名或密码错误，请重新登录');</script>");
            }
        }
    }
}