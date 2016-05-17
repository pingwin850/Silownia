using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Silownia
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string entity;
            entity = DropDownListUserType.SelectedValue;

            switch (entity)
            {

                case "Manager":

                    SqlConnection ManagerConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                    ManagerConn.Open();
                    string ManagerUser = "select count(*) from Manager where UserName='" + TextBoxUserName.Text + "'";
                    SqlCommand ManagerCommand = new SqlCommand(ManagerUser, ManagerConn);
                    int ManagerTemp = Convert.ToInt32(ManagerCommand.ExecuteScalar().ToString());
                    ManagerConn.Close();

                    if (ManagerTemp == 1)
                    {
                        ManagerConn.Open();
                        string checkPasswordQuery = "select Password from Manager where UserName='" + TextBoxUserName.Text + "'";
                        SqlCommand passComm = new SqlCommand(checkPasswordQuery, ManagerConn);
                        string password = passComm.ExecuteScalar().ToString().Replace(" ", "");

                        if (password == TextBoxPassword.Text)
                        {
                            Session["New"] = TextBoxUserName.Text;
                            //Response.Write("Password is correct");
                            Response.Redirect("Manager.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Nieprawidłowe hasło !!!');", true);
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Nieprawidłowa nazwa użytkownika !!!')", true);
                    }
                    break;



                case "Receptionist":

                    SqlConnection ReceptionistConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                    ReceptionistConn.Open();
                    string ReceptionistUser = "select count(*) from Receptionist where UserName='" + TextBoxUserName.Text + "'";
                    SqlCommand ReceptionistCommand = new SqlCommand(ReceptionistUser, ReceptionistConn);
                    int ReceptionistTemp = Convert.ToInt32(ReceptionistCommand.ExecuteScalar().ToString());
                    ReceptionistConn.Close();

                    if (ReceptionistTemp == 1)
                    {
                        ReceptionistConn.Open();
                        string checkPasswordQuery = "select Password from Receptionist where UserName='" + TextBoxUserName.Text + "'";
                        SqlCommand passComm = new SqlCommand(checkPasswordQuery, ReceptionistConn);
                        string password = passComm.ExecuteScalar().ToString().Replace(" ", "");

                        if (password == TextBoxPassword.Text)
                        {
                            Session["New"] = TextBoxUserName.Text;
                            //Response.Write("Password is correct");
                            Response.Redirect("Receptionist.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Nieprawidłowe hasło !!!');", true);
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Nieprawidłowa nazwa użytkownika !!!')", true);
                    }
                    break;



                case "Coach":

                    SqlConnection CoachConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                    CoachConn.Open();
                    string CoachUser = "select count(*) from Coach where UserName='" + TextBoxUserName.Text + "'";
                    SqlCommand CoachCommand = new SqlCommand(CoachUser, CoachConn);
                    int CoachTemp = Convert.ToInt32(CoachCommand.ExecuteScalar().ToString());
                    CoachConn.Close();

                    if (CoachTemp == 1)
                    {
                        CoachConn.Open();
                        string checkPasswordQuery = "select Password from Coach where UserName='" + TextBoxUserName.Text + "'";
                        SqlCommand passComm = new SqlCommand(checkPasswordQuery, CoachConn);
                        string password = passComm.ExecuteScalar().ToString().Replace(" ", "");

                        if (password == TextBoxPassword.Text)
                        {
                            Session["New"] = TextBoxUserName.Text;
                            //Response.Write("Password is correct");
                            Response.Redirect("Coach.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Nieprawidłowe hasło !!!');", true);
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Nieprawidłowa nazwa użytkownika !!!')", true);
                    }
                    break;



                case "Dietician":

                    SqlConnection DieticianConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                    DieticianConn.Open();
                    string DieticianUser = "select count(*) from Dietician where UserName='" + TextBoxUserName.Text + "'";
                    SqlCommand DieticianCommand = new SqlCommand(DieticianUser, DieticianConn);
                    int DieticianTemp = Convert.ToInt32(DieticianCommand.ExecuteScalar().ToString());
                    DieticianConn.Close();

                    if (DieticianTemp == 1)
                    {
                        DieticianConn.Open();
                        string checkPasswordQuery = "select Password from Dietician where UserName='" + TextBoxUserName.Text + "'";
                        SqlCommand passComm = new SqlCommand(checkPasswordQuery, DieticianConn);
                        string password = passComm.ExecuteScalar().ToString().Replace(" ", "");

                        if (password == TextBoxPassword.Text)
                        {
                            Session["New"] = TextBoxUserName.Text;
                            //Response.Write("Password is correct");
                            Response.Redirect("Dietician.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Nieprawidłowe hasło !!!');", true);
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Nieprawidłowa nazwa użytkownika !!!')", true);
                    }
                    break;



                case "Gym_Member":

                    SqlConnection Gym_MemberConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                    Gym_MemberConn.Open();
                    string Gym_MemberUser = "select count(*) from Gym_member where UserName='" + TextBoxUserName.Text + "'";
                    SqlCommand Gym_MemberCommand = new SqlCommand(Gym_MemberUser, Gym_MemberConn);
                    int Gym_MemberTemp = Convert.ToInt32(Gym_MemberCommand.ExecuteScalar().ToString());
                    Gym_MemberConn.Close();

                    if (Gym_MemberTemp == 1)
                    {
                        Gym_MemberConn.Open();
                        string checkPasswordQuery = "select Password from Gym_member where UserName='" + TextBoxUserName.Text + "'";
                        SqlCommand passComm = new SqlCommand(checkPasswordQuery, Gym_MemberConn);
                        string password = passComm.ExecuteScalar().ToString().Replace(" ", "");

                        if (password == TextBoxPassword.Text)
                        {
                            Session["New"] = TextBoxUserName.Text;
                            //Response.Write("Password is correct");
                            Response.Redirect("Gym_member.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Nieprawidłowe hasło !!!');", true);
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Nieprawidłowa nazwa użytkownika !!!')", true);
                    }
                    break;
            }

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}