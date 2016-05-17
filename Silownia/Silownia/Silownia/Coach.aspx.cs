using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Silownia
{
    public partial class Coach : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(TextBox2.Text))
            {

                DateTime d = Convert.ToDateTime(TextBox1.Text);
                string typ = DropDownListWorkoutType.Text;
                string desc = TextBox2.Text;
                string status = "Aktywny";

                SqlConnection WorkoutAddConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                WorkoutAddConn.Open();
                string WorkoutAddStatement = "insert into Workout values('" + d + "','" + typ + "','" + desc + "','" + status + "') ";
                SqlCommand WorkoutAddCommand = new SqlCommand(WorkoutAddStatement, WorkoutAddConn);

                int x = WorkoutAddCommand.ExecuteNonQuery();
                if (x == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Nie można dodać nowych zajęć grupowych !!!');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Nowe zajęcia grupowe zostały dodane !!!');", true);
                }

                WorkoutAddConn.Close();
                Calendar1.DataBind();
                BuildSocialEventTable();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Proszę podaj datę i godzinę !!!');", true);
            }

        }

        protected void Calendar1_DayRender1(object sender, DayRenderEventArgs e)
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

        protected void Calendar1_SelectionChanged1(object sender, EventArgs e)
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

        protected void DropDownListWorkoutType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string entity;
            entity = DropDownListWorkoutType.SelectedValue;

            switch (entity)
            {
                case "0":
                    ButtonAddWorkout.Enabled = false;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Wybierz typ zajęć !!!');", true);
                    break;

                case "Judo":
                    ButtonAddWorkout.Enabled = true;
                    string jodo = "JUDO jest sportem walki, opierającym się na rzutach i chwytach.";
                    TextBox2.Text = jodo;
                    TextBox2.DataBind();
                    break;

                case "Boks":
                    ButtonAddWorkout.Enabled = true;
                    string boks = "Zajęcia ogólnorozwojowe z elementami techniki boksu. Mega spalanie, poprawa kondycji i solidna dawka adrenaliny w jednym!";
                    TextBox2.Text = boks;
                    TextBox2.DataBind();
                    break;

                case "Pilates":
                    ButtonAddWorkout.Enabled = true;
                    string pilates = "PILATES to doskonały trening na wysmuklenie sylwetki, uzyskanie płaskiego brzucha i pozbycie się dolegliwości związanych z bólem pleców. Połączony z ćwiczeniami rozciągającymi gwarantuje poprawę elastyczności, piękną rzeźbę całego ciała, a co za tym idzie lepsze samopoczucie oraz poprawę samopoczucia.";
                    TextBox2.Text = pilates;
                    TextBox2.DataBind(); break;

                case "Zumba":
                    ButtonAddWorkout.Enabled = true;
                    string zumba = "Hit na rynku fitness! Taneczny, energetyczny i prosty choreograficznie trening – gorące latynoskie rytmy, doskonała zabawa i tysiące spalonych kalorii.";
                    TextBox2.Text = zumba;
                    TextBox2.DataBind();
                    break;

                case "ABS":
                    ButtonAddWorkout.Enabled = true;
                    string abs = "Trwające 25 minut ćwiczenia wzmacniające i kształtujące mięśnie brzucha. Pełna izolacja tej partii mięśniowej gwarantuje szybkie efekty. Zajęcia odbywają się na strefie funkcjonalnej.";
                    TextBox2.Text = abs;
                    TextBox2.DataBind();
                    break;

                case "Fat Burner Bike":
                    ButtonAddWorkout.Enabled = true;
                    string fat_burner_bike = "Zajęcia ukierunkowane na spalanie tkanki tłuszczowej. Przeznaczone dla osób średnio zaawansowanych i zaawansowanych.";
                    TextBox2.Text = fat_burner_bike;
                    TextBox2.DataBind();
                    break;

                case "Jumping":
                    ButtonAddWorkout.Enabled = true;
                    string jumping = "HIT na rynku fitness - licencjonowane zajęcia na specjlanych trampolinach. Doskonały trening dla brzucha, ud i pośladków, mnóstwo spalonych kalorii, a przy okazji niepowtarzalna zabawa przy energetycznej muzyce!";
                    TextBox2.Text = jumping;
                    TextBox2.DataBind();
                    break;

                case "Aqua Senior":
                    ButtonAddWorkout.Enabled = true;
                    string aqua_senior = "Zajęcia w wodzie przeznaczone dla osób w wieku senioralnym, polegające na gimnastyce usprawniającej. Istotą zajęć jest aktywizacja wszystkich części ciała, poprawa ruchomości stawów i zwiększenie zakresu ruchu a co za tym idzie poprawa samopoczucia. Intensywność zajęć dostosowana ejst do indywidualnych możliwości ćwiczących i schorzeń współtowarzyszących. Zajęcia odbywają się w wodzie płytkej.";
                    TextBox2.Text = aqua_senior;
                    TextBox2.DataBind();
                    break;

                case "Joga":
                    ButtonAddWorkout.Enabled = true;
                    string joga = "Joga to w dosłownym tłumaczeniu jedność ciała, umysłu i jaźni. Redukuje stres, wycisza i zapewnia stabilność emocjonalną, wspomagając przy tym regulację procesów trawiennych, hormonalnych i oddechowych. Joga to elastyczne, mocne, sprężyste i przede wszystkim zdrowe ciało!";
                    TextBox2.Text = joga;
                    TextBox2.DataBind();
                    break;

                case "TRX":
                    ButtonAddWorkout.Enabled = true;
                    string trx = "TRX to innowacyjny system ćwiczeń przy użyciu specjalnych taśm, które umożliwiają trening w różnych płaszczyznach nachylenia ciała względem ziemi.";
                    TextBox2.Text = trx;
                    TextBox2.DataBind();
                    break;

            }
        }

        protected void ButtonAddExercises_Click(object sender, EventArgs e)
        {

            if (!FileUploadImage.HasFile)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Proszę wybierz zdjęcie !!!');", true);
            }
            else
            {
                string typ = DropDownListMusclesType.Text;
                string desc = TextBoxExercisesDescription.Text;

                /*int length = FileUploadImage.PostedFile.ContentLength;
                byte[] pic = new byte[length];
                HttpPostedFile image = FileUploadImage.PostedFile;
                image.InputStream.Read(pic, 0, length);*/

                string filename = Path.GetFileName(FileUploadImage.PostedFile.FileName);
                FileUploadImage.SaveAs(Server.MapPath("~/Images/" + filename));

                SqlConnection ExercisesAddConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                ExercisesAddConn.Open();
                string ExercisesAddStatement = "insert into Exercises (Partia,Opis,Obraz) values (@Partia,@Opis,@Obraz)";
                SqlCommand ExercisesAddCommand = new SqlCommand(ExercisesAddStatement, ExercisesAddConn);
                ExercisesAddCommand.Parameters.AddWithValue("@Partia", typ);
                ExercisesAddCommand.Parameters.AddWithValue("@Opis", desc);
                ExercisesAddCommand.Parameters.AddWithValue("@Obraz", "Images/" + filename);

                int x = ExercisesAddCommand.ExecuteNonQuery();
                if (x == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Nie można dodać nowego ćwiczenia !!!');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Nowe ćwiczenie zostało dodane !!!');", true);
                }
                ExercisesAddConn.Close();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            LabelGymMember.Text = row.Cells[2].Text;
        }

        protected void GridViewExercises_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row2 = GridViewExercises.SelectedRow;
            TextBoxExercisesForGymMember.Text += TextBoxSearch.Text + ": " + row2.Cells[3].Text + ", \n";
        }

        protected void ButtonAddExercisesForGymMember_Click(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;

            if (row != null)
            {
                SqlConnection Gym_member_ExercisesConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                Gym_member_ExercisesConn.Open();
                string Gym_memberExercises = "update [Gym_member_Exercises] set [Cwiczenia]=@Cwiczenia WHERE UserName like '" + row.Cells[2].Text + "'";
                SqlCommand Gym_member_ExercisesCommand = new SqlCommand(Gym_memberExercises, Gym_member_ExercisesConn);
                Gym_member_ExercisesCommand.Parameters.AddWithValue("@Cwiczenia", TextBoxExercisesForGymMember.Text);
                Gym_member_ExercisesCommand.ExecuteNonQuery();
                Gym_member_ExercisesConn.Close();
                GridView1.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Najpierw musisz wybrać członka siłowni !!!');", true);
            }
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(TextBoxTypeWorkout.Text))
            {
                string hour = DropDownListDateAndHour.Text;
                string typ = TextBoxTypeWorkout.Text;
                string status = "Odwołane";

                SqlConnection WorkoutCancelConn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                WorkoutCancelConn.Open();
                string WorkoutCancelStatement = "update [Workout] set [Status]=@Status where Data = '" + hour + "' and Typ = '" + typ + "'";
                SqlCommand WorkoutCancelCommand = new SqlCommand(WorkoutCancelStatement, WorkoutCancelConn);
                WorkoutCancelCommand.Parameters.AddWithValue("@Status", status);

                int x = WorkoutCancelCommand.ExecuteNonQuery();
                if (x == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Błąd !!!');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Wybrane zajęcia zostały odwołane !!!');", true);
                }

                WorkoutCancelConn.Close();
                Calendar1.DataBind();
                BuildSocialEventTable();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Proszę podaj typ zajęć !!!');", true);
            }
        }
    }
}