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
    public partial class Dietician : System.Web.UI.Page
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
            GridViewRow row = GridViewGym_member_Diet.SelectedRow;

            if (row != null) {
                SqlConnection Gym_member_DietConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                Gym_member_DietConn.Open();
                string Gym_memberDiet = "update [Gym_member_Diet] set [DietDescription]=@DietDescription WHERE UserName like '" + row.Cells[2].Text + "'";
                SqlCommand Gym_member_DietCommand = new SqlCommand(Gym_memberDiet, Gym_member_DietConn);
                Gym_member_DietCommand.Parameters.AddWithValue("@DietDescription", TextBoxDiet.Text);
                Gym_member_DietCommand.ExecuteNonQuery();
                Gym_member_DietConn.Close();
                GridViewGym_member_Diet.DataBind();
            } else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Najpierw musisz wybrać członka siłowni !!!');", true);
            }
        }

        protected void GridViewGym_member_Diet_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewGym_member_Diet.SelectedRow;
            MessageLabel.Text = row.Cells[2].Text;
        }
    }
}