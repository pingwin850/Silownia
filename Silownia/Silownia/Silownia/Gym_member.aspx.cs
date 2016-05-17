using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Silownia
{
    public partial class Gym_member : System.Web.UI.Page
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

            BuildSocialEventTable();
        }


        protected void B_logout_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
        }


        protected void FormView2_DataBound(object sender, EventArgs e)
        {
            Label test = ((Label)FormView2.FindControl("CwiczeniaLabel"));
            test.Text = test.Text.Replace(",", "<br>");
        }

        private void BuildSocialEventTable()
        {
            SqlConnection WorkoutConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
            WorkoutConn.Open();
            SqlDataAdapter WorkoutSda = new SqlDataAdapter("select Data, Typ, Opis, Status FROM Workout", WorkoutConn);
            DataSet WorkoutDs = new DataSet();
            WorkoutSda.Fill(WorkoutDs);
            socialEvents = WorkoutDs.Tables[0];
            WorkoutConn.Close();
        }

        private DataTable socialEvents;

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            DataRow[] rows = socialEvents.Select(
                  String.Format(
                     "Data >= #{0}# AND Data < #{1}#",
                     e.Day.Date.ToShortDateString(),
                     e.Day.Date.AddDays(1).ToShortDateString()
                  )
               );

            foreach (DataRow row in rows)
            {
                System.Web.UI.WebControls.Image image;
                image = new System.Web.UI.WebControls.Image();
                image.ImageUrl = this.ResolveUrl("Dot.jpg");
                image.ToolTip = row["Opis"].ToString();
                e.Cell.BackColor = Color.Wheat;
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            System.Data.DataView view = socialEvents.DefaultView;
            view.RowFilter = String.Format(
                              "Data >= #{0}# AND Data < #{1}#",
                              Calendar1.SelectedDate.ToShortDateString(),
                              Calendar1.SelectedDate.AddDays(1).ToShortDateString()
                           );

            if (view.Count > 0)
            {
                DataGrid1.Visible = true;
                DataGrid1.DataSource = view;
                DataGrid1.DataBind();
            }
            else
            {
                DataGrid1.Visible = false;
            }
        }
    }
}