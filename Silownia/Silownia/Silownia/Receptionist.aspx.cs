using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Silownia
{
    public partial class Receptionist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            if (!Page.IsPostBack)
            {
                if (Session["New"] != null)
                {
                    LabelWelcome.Text += Session["New"].ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void B_logout_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            Guid newGym_memberGUID = Guid.NewGuid();
            SqlConnection Gym_memberConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
            Gym_memberConn.Open();
            string Gym_memberUser = "insert into Gym_member (ID,UserName,Password,Imie,Nazwisko,Email,DataUrodzenia,Telefon) values (@ID,@UserName,@Password,@Imie,@Nazwisko,@Email,@DataUrodzenia,@Telefon); insert into Gym_member_Diet (ID,UserName,Imie,Nazwisko) values (@ID, @UserName,@Imie,@Nazwisko); insert into Gym_member_Exercises (ID,UserName,Imie,Nazwisko) values (@ID, @UserName,@Imie,@Nazwisko);";
            SqlCommand Gym_memberCommand = new SqlCommand(Gym_memberUser, Gym_memberConn);
            Gym_memberCommand.Parameters.AddWithValue("@ID", newGym_memberGUID.ToString());
            Gym_memberCommand.Parameters.AddWithValue("@UserName", TextBoxName.Text + "_" + TextBoxSurname.Text);
            Gym_memberCommand.Parameters.AddWithValue("@Password", "Default" + TextBoxName.Text);
            Gym_memberCommand.Parameters.AddWithValue("@Imie", TextBoxName.Text);
            Gym_memberCommand.Parameters.AddWithValue("@Nazwisko", TextBoxSurname.Text);
            Gym_memberCommand.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
            Gym_memberCommand.Parameters.AddWithValue("@DataUrodzenia", DropDownListDay.Text + "." + DropDownListMonth.Text + "." + DropDownListYear.Text);
            Gym_memberCommand.Parameters.AddWithValue("@Telefon", TextBoxPhone.Text);
            Gym_memberCommand.ExecuteNonQuery();
            Gym_memberConn.Close();
            GridViewGym_member.DataBind();
        }

        protected void ButtonRefresh_Click(object sender, EventArgs e)
        {
            GridViewGym_member.DataBind();
        }
    }
}