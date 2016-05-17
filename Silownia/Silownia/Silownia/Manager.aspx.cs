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
    public partial class Manager : System.Web.UI.Page
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
            string entity;
            entity = DropDownListUserType.SelectedValue;

            switch (entity)
            {
                case "Coach":

                    Guid newCoachGUID = Guid.NewGuid(); ;
                    SqlConnection CoachConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                    CoachConn.Open();
                    string CoachUser = "insert into Coach (ID,UserName,Password,Imie,Nazwisko,Email,DataUrodzenia,Telefon) values (@ID,@UserName,@Password,@Imie,@Nazwisko,@Email,@DataUrodzenia,@Telefon)";
                    SqlCommand CoachCommand = new SqlCommand(CoachUser, CoachConn);
                    CoachCommand.Parameters.AddWithValue("@ID", newCoachGUID.ToString());
                    CoachCommand.Parameters.AddWithValue("@UserName", TextBoxName.Text + "_" + TextBoxSurname.Text);
                    CoachCommand.Parameters.AddWithValue("@Password", "Default" + TextBoxName.Text);
                    CoachCommand.Parameters.AddWithValue("@Imie", TextBoxName.Text);
                    CoachCommand.Parameters.AddWithValue("@Nazwisko", TextBoxSurname.Text);
                    CoachCommand.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
                    CoachCommand.Parameters.AddWithValue("@DataUrodzenia", DropDownListDay.Text + "." + DropDownListMonth.Text + "." + DropDownListYear.Text);
                    CoachCommand.Parameters.AddWithValue("@Telefon", TextBoxPhone.Text);
                    CoachCommand.ExecuteNonQuery();
                    CoachConn.Close();
                    GridViewCoach.DataBind();
                    break;

                case "Dietician":

                    Guid newDieticianGUID = Guid.NewGuid(); ;
                    SqlConnection DieticianConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                    DieticianConn.Open();
                    string DieticianUser = "insert into Dietician (ID,UserName,Password,Imie,Nazwisko,Email,DataUrodzenia,Telefon) values (@ID,@UserName,@Password,@Imie,@Nazwisko,@Email,@DataUrodzenia,@Telefon)";
                    SqlCommand DieticianCommand = new SqlCommand(DieticianUser, DieticianConn);
                    DieticianCommand.Parameters.AddWithValue("@ID", newDieticianGUID.ToString());
                    DieticianCommand.Parameters.AddWithValue("@UserName", TextBoxName.Text + "_" + TextBoxSurname.Text);
                    DieticianCommand.Parameters.AddWithValue("@Password", "Default" + TextBoxName.Text);
                    DieticianCommand.Parameters.AddWithValue("@Imie", TextBoxName.Text);
                    DieticianCommand.Parameters.AddWithValue("@Nazwisko", TextBoxSurname.Text);
                    DieticianCommand.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
                    DieticianCommand.Parameters.AddWithValue("@DataUrodzenia", DropDownListDay.Text + "." + DropDownListMonth.Text + "." + DropDownListYear.Text);
                    DieticianCommand.Parameters.AddWithValue("@Telefon", TextBoxPhone.Text);
                    DieticianCommand.ExecuteNonQuery();
                    DieticianConn.Close();
                    GridViewDietician.DataBind();
                    break;

                case "Receptionist":

                    Guid newReceptionistGUID = Guid.NewGuid(); ;
                    SqlConnection ReceptionistConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                    ReceptionistConn.Open();
                    string ReceptionistUser = "insert into Receptionist (ID,UserName,Password,Imie,Nazwisko,Email,DataUrodzenia,Telefon) values (@ID,@UserName,@Password,@Imie,@Nazwisko,@Email,@DataUrodzenia,@Telefon)";
                    SqlCommand ReceptionistCommand = new SqlCommand(ReceptionistUser, ReceptionistConn);
                    ReceptionistCommand.Parameters.AddWithValue("@ID", newReceptionistGUID.ToString());
                    ReceptionistCommand.Parameters.AddWithValue("@UserName", TextBoxName.Text + "_" + TextBoxSurname.Text);
                    ReceptionistCommand.Parameters.AddWithValue("@Password", "Default" + TextBoxName.Text);
                    ReceptionistCommand.Parameters.AddWithValue("@Imie", TextBoxName.Text);
                    ReceptionistCommand.Parameters.AddWithValue("@Nazwisko", TextBoxSurname.Text);
                    ReceptionistCommand.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
                    ReceptionistCommand.Parameters.AddWithValue("@DataUrodzenia", DropDownListDay.Text + "." + DropDownListMonth.Text + "." + DropDownListYear.Text);
                    ReceptionistCommand.Parameters.AddWithValue("@Telefon", TextBoxPhone.Text);
                    ReceptionistCommand.ExecuteNonQuery();
                    ReceptionistConn.Close();
                    GridViewReceptionist.DataBind();
                    break;
            }
        }

        protected void GridViewCoach_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewCoach_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        }

        protected void ButtonCoachRefresh_Click(object sender, EventArgs e)
        {
            GridViewCoach.DataBind();
        }

        protected void ButtonDieticianRefresh_Click(object sender, EventArgs e)
        {
            GridViewDietician.DataBind();
        }

        protected void ButtonReceptionistRefresh_Click(object sender, EventArgs e)
        {
            GridViewReceptionist.DataBind();
        }
    }
}