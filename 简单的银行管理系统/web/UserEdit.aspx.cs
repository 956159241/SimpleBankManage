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
    public partial class UserEdit : System.Web.UI.Page
    {
        private int uId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.AllKeys.Contains("uid"))
            {
                uId = int.Parse(Request.QueryString["uid"]);
            }
            if (!IsPostBack)
            {
                ShowInfo(uId);    
            }

        }
        private void ShowInfo(int id)
        {
            StringBuilder sbsqlusers = new StringBuilder();
            sbsqlusers.AppendLine("SELECT id,username,usertype,password,sex,userID,");
            sbsqlusers.AppendLine("CONVERT(varchar,birthday,23) AS birthday,phone FROM Users WHERE id = @id;");
            SqlParameter[] pms = { 
                                 new SqlParameter("@id",SqlDbType.Int)
                               };
            pms[0].Value = id;
            //执行查询
            DataSet ds = DbHelperSQL.Query(sbsqlusers.ToString(),pms);
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow drCurrent = ds.Tables[0].Rows[0];
                txtUserName.Text = drCurrent["username"].ToString();
                txtPassword.Text = drCurrent["password"].ToString();
                txtSex.Text = drCurrent["sex"].ToString();
                txtUserID.Text = drCurrent["userID"].ToString();
                txtBirthday.Text = drCurrent["birthday"].ToString();
                txtPhone.Text = drCurrent["phone"].ToString();
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //获取参数变量值
            uId = Convert.ToInt32(Request.QueryString["uid"]);
            string name = txtUserName.Text;
            string pass = txtPassword.Text;
            string sex = txtSex.Text;
            string userID = txtUserID.Text;
            DateTime birthday = Convert.ToDateTime(txtBirthday.Text);
            string phone = txtPhone.Text;
            //设置参数并赋值
            SqlParameter[] pms = { 
                                    new SqlParameter("@username",SqlDbType.NVarChar,50),
                                    new SqlParameter("@password",SqlDbType.NVarChar,30),
                                    new SqlParameter("@sex",SqlDbType.NVarChar,10),
                                    new SqlParameter("@userID",SqlDbType.NVarChar,30),
                                    new SqlParameter("@birthday",SqlDbType.DateTime),
                                    new SqlParameter("@phone",SqlDbType.NVarChar,30),
                                    new SqlParameter("@id",SqlDbType.Int),
                                 };
            pms[0].Value = name;
            pms[1].Value = pass;
            pms[2].Value = sex;
            pms[3].Value = userID;
            pms[4].Value = birthday;
            pms[5].Value = phone;
            pms[6].Value = uId;
            //修改
            if (uId != 0)
            {
                
                //编写数据查询语句
                StringBuilder sbsqlupdate = new StringBuilder();
                sbsqlupdate.AppendLine("UPDATE Users SET username=@username,password=@password,");
                sbsqlupdate.AppendLine("sex=@sex,userID=@userID,birthday=@birthday,phone=@phone WHERE id=@id");
                
                //执行数据库语句
                DbHelperSQL.ExecuteSql(sbsqlupdate.ToString(), pms);
                Response.Redirect("AdministratorIndex.aspx");
            }
            //添加
            else 
            {
                //编写数据查询语句
                StringBuilder sbsqlupdate = new StringBuilder();
                sbsqlupdate.AppendLine("INSERT INTO Users(username,usertype,password,sex,userID,birthday,phone)");
                sbsqlupdate.AppendLine("VALUES(@username,'普通用户',@password,@sex,@userID,@birthday,@phone)");

                //执行数据库语句
                DbHelperSQL.ExecuteSql(sbsqlupdate.ToString(), pms);
                Response.Redirect("AdministratorIndex.aspx");
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministratorIndex.aspx");
        }


    }
}