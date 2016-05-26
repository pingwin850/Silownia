using PdfSharp.Drawing;
using PdfSharp.Drawing.Layout;
using PdfSharp.Pdf;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.IO;
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
            if (FormView2 != null) {
                Label test = ((Label)FormView2.FindControl("CwiczeniaLabel"));
                test.Text = test.Text.Replace(",", "<br>");
            }
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

        protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = DataGrid1.SelectedRow;
            LabelEnrolFor.Text = row.Cells[2].Text + ": " + row.Cells[1].Text;
        }

        protected void ButtonEnrolFor_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(LabelEnrolFor.Text))
            {

            GridViewRow row = DataGrid1.SelectedRow;
            string searchedValue = "Odwołane";
            string hour = row.Cells[1].Text;
            string type = row.Cells[2].Text;

            

           string CancelledStatus = null;
           SqlConnection GetStatus = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
           string GetStatusStatement = "select Status FROM Workout where Status = @Status and Data = @Hour and Typ = @Typ";
           SqlCommand GetStatusCommand = new SqlCommand(GetStatusStatement, GetStatus);
           GetStatusCommand.Parameters.AddWithValue("@Status", searchedValue);
           GetStatusCommand.Parameters.AddWithValue("@Hour", hour);
           GetStatusCommand.Parameters.AddWithValue("@Typ", type);

            try
            {
                GetStatus.Open();

                using (SqlDataReader readStatus = GetStatusCommand.ExecuteReader())
                {
                    while (readStatus.Read())
                    {
                        CancelledStatus = (readStatus["Status"].ToString());
                    }
                }
            }
            finally
            {
                GetStatus.Close();
            }

                if (CancelledStatus != searchedValue)
                {

                    string NewParticipant = Session["New"].ToString() + ", ";

                    string ParticipantsAlreadyEnrolled = null;
                    SqlConnection GetParticipants = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                    string GetParticipantsStatement = "select Uczestnicy FROM Workout where Data = @Hour and Typ = @Typ";
                    SqlCommand GetParticipantsCommand = new SqlCommand(GetParticipantsStatement, GetParticipants);
                    GetParticipantsCommand.Parameters.AddWithValue("@Hour", hour);
                    GetParticipantsCommand.Parameters.AddWithValue("@Typ", type);

                    try
                    {
                        GetParticipants.Open();

                        using (SqlDataReader reader = GetParticipantsCommand.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                ParticipantsAlreadyEnrolled = (reader["Uczestnicy"].ToString());
                            }
                        }
                    }
                    finally
                    {
                        GetParticipants.Close();
                    }


                    if (!ParticipantsAlreadyEnrolled.Contains(NewParticipant))
                    {

                        SqlConnection EnrolForConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                        EnrolForConn.Open();
                        string EnrolForStatement = "update [Workout] set [Uczestnicy]=@Uczestnicy where Data = @Hour and Typ = @Typ";
                        SqlCommand EnrolForCommand = new SqlCommand(EnrolForStatement, EnrolForConn);
                        EnrolForCommand.Parameters.AddWithValue("@Uczestnicy", ParticipantsAlreadyEnrolled + NewParticipant);
                        EnrolForCommand.Parameters.AddWithValue("@Hour", hour);
                        EnrolForCommand.Parameters.AddWithValue("@Typ", type);

                        int x = EnrolForCommand.ExecuteNonQuery();
                        if (x == 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Błąd !!!');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Zostałeś zapisany na wybrane zajęcia !!!');", true);
                        }

                        EnrolForConn.Close();

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Zostałeś już wcześniej zapisany na wybrane zajęcia !!!');", true);
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Nie możesz się zapisać na te zajęcia, ponieważ zostały one odwołane !!!');", true);
                }
            }

            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Proszę wybierz zajęcia, na które chcesz się zapisać !!!');", true);
            }


        }

        protected void ButtonPDF_Click(object sender, EventArgs e)
        {
            Label label1 = new Label();
            label1 = ((Label)FormView1.FindControl("DietDescriptionLabel"));
            string diet = null;
            diet = label1.Text;

            Label label2 = ((Label)FormView2.FindControl("CwiczeniaLabel"));
            label2.Text = label2.Text.Replace("<br>", " ");
            string exercises = null;
            exercises = label2.Text;

            PdfDocument pdf = new PdfDocument();
            pdf.Info.Title = "Moja dieta i przypisane cwiczenia";

            string autor = null;
            autor = LabelWelcome.Text;
            autor = autor.Replace("Witaj ", "");
            autor = autor.Replace("_", " ");
            pdf.Info.Author = autor;

            PdfPage pdfPage = pdf.AddPage();
            XGraphics graph = XGraphics.FromPdfPage(pdfPage);
            XTextFormatter tf = new XTextFormatter(graph);

            XFont font = new XFont("Verdana", 12, XFontStyle.Regular);
            XFont fontBold = new XFont("Verdana", 15, XFontStyle.Bold);
            XFont fontAuthor = new XFont("Verdana", 25, XFontStyle.Bold);

            XRect rect = new XRect(40, 30, 520, 220);
            graph.DrawRectangle(XBrushes.White, rect);
            tf.DrawString(autor, fontAuthor, XBrushes.Black, rect, XStringFormats.TopLeft);

            rect = new XRect(40, 100, 520, 220);
            graph.DrawRectangle(XBrushes.Wheat, rect);
            tf.DrawString("\nĆwiczenia: ", fontBold, XBrushes.Black, rect, XStringFormats.TopLeft);
            tf.DrawString("\n\n\n" + exercises, font, XBrushes.Black, rect, XStringFormats.TopLeft);

            rect = new XRect(40, 350, 520, 220);
            graph.DrawRectangle(XBrushes.Wheat, rect);
            tf.DrawString("\nDieta: ", fontBold, XBrushes.Black, rect, XStringFormats.TopLeft);
            tf.DrawString("\n\n\n" + diet, font, XBrushes.Black, rect, XStringFormats.TopLeft);

            MemoryStream stream = new MemoryStream();
            pdf.Save(stream, false);

            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-length", stream.Length.ToString());
            Response.BinaryWrite(stream.ToArray());
            Response.Flush();
            stream.Close();
            Response.End();
        }
    }
}