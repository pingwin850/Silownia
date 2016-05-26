<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Coach.aspx.cs" Inherits="Silownia.Coach" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trener</title>
    <link rel="Shortcut icon" href="images/gym_icon.png" />

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            font-size: x-large;
        }
        .auto-style3 {
            font-size: large;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            height: 23px;
            text-align: right;
            width: 195px;
        }
        .auto-style6 {
            width: 926px;
        }
        .auto-style7 {
            width: 194px;
        }
        .auto-style8 {
            height: 23px;
            width: 505px;
        }
        .auto-style9 {
            height: 23px;
            width: 505px;
            text-align: right;
        }
        .auto-style10 {
            height: 23px;
            width: 195px;
        }
        .auto-style11 {
            height: 23px;
            width: 273px;
        }
        .auto-style12 {
            height: 23px;
            width: 505px;
            text-align: left;
        }
        .auto-style13 {
            height: 23px;
            width: 306px;
        }
        .auto-style14 {
            height: 23px;
            width: 306px;
            text-align: right;
        }
        .auto-style15 {
            height: 23px;
            width: 505px;
            font-size: large;
        }
        .auto-style16 {
            height: 23px;
            width: 306px;
            font-size: large;
        }
        .auto-style17 {
            height: 23px;
            width: 508px;
            font-size: large;
        }
        .auto-style18 {
            height: 23px;
            width: 508px;
        }
        .auto-style19 {
            height: 23px;
            width: 508px;
            text-align: right;
        }
        .auto-style20 {
            height: 23px;
            width: 59px;
        }
        .auto-style23 {
            height: 23px;
            width: 203px;
            font-size: large;
        }
        .auto-style24 {
            height: 23px;
            width: 190px;
        }
        .auto-style25 {
            height: 23px;
            text-align: right;
            width: 190px;
        }
        .auto-style26 {
            height: 23px;
            text-align: right;
            width: 203px;
        }
        .auto-style27 {
            height: 23px;
            width: 203px;
        }
    </style>

</head>
<body>

    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6"><strong>
    
        <asp:Label ID="LabelWelcome" runat="server" Text="Witaj " CssClass="auto-style2" ForeColor="#3333FF"></asp:Label>
                    <br />
                    <br />
        <asp:Button ID="B_logout" runat="server" OnClick="B_logout_Click" Text="Wyloguj" CssClass="auto-style3" BackColor="#FFFFCC" />
    
                    </strong>
                    <br />
    
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <p>
        </p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style10">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" 
                        SelectCommand="SELECT ID, Partia, Opis, Obraz FROM Exercises WHERE (Partia = @Partia)" 
                        UpdateCommand="UPDATE [Exercises] Set [Partia]=@Partia, [Opis]=@Opis Where [ID]=@ID" 
                        DeleteCommand="DELETE from [Exercises] Where [ID]=@ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxSearch" Name="Partia" PropertyName="Text" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Partia" />
                            <asp:Parameter Name="Opis" />
                            <asp:Parameter Name="ID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style8">
                    <asp:SqlDataSource ID="SqlDataSourceGym_member_Exercises" runat="server" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" SelectCommand="SELECT * FROM [Gym_member_Exercises]"></asp:SqlDataSource>
                </td>
                <td class="auto-style20">
                    &nbsp;</td>
                <td class="auto-style24">
                    &nbsp;</td>
                <td class="auto-style27">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style15">
                    <strong>Dodaj nowe zajęcia grupowe:</strong></td>
                <td class="auto-style20"></td>
                <td class="auto-style24"></td>
                <td class="auto-style23"><strong>Odwołaj zajęcia grupowe:</strong></td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style5"><strong>podaj datę i godzinę zajęć:</strong></td>
                <td class="auto-style8">
                    <asp:TextBox ID="TextBox1" runat="server" Width="186px" autocomplete="off" placeholder="MM/dd/yyyy HH:mm:ss"></asp:TextBox>
                </td>
                <td class="auto-style20"></td>
                <td class="auto-style25"><strong>Wybierz datę i godzinę:</strong></td>
                <td class="auto-style27">
                    <asp:DropDownList ID="DropDownListDateAndHour" runat="server" DataSourceID="SqlDataSourceWorkout" DataTextField="Data" DataValueField="Data" Width="200px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style5"><strong>wybierz typ zajęć:</strong></td>
                <td class="auto-style12">
                    <asp:DropDownList ID="DropDownListWorkoutType" runat="server" OnSelectedIndexChanged="DropDownListWorkoutType_SelectedIndexChanged" AutoPostBack="True" AppendDataBoundItems="True" Width="190px">
                        <asp:ListItem Value="0">--Wybierz--</asp:ListItem>
                        <asp:ListItem Value="Judo">Judo</asp:ListItem>
                        <asp:ListItem Value="Boks">Boks</asp:ListItem>
                        <asp:ListItem Value="Pilates">Pilates</asp:ListItem>
                        <asp:ListItem Value="Zumba">Zumba</asp:ListItem>
                        <asp:ListItem Value="ABS">ABS</asp:ListItem>
                        <asp:ListItem Value="Fat Burner Bike">Fat Burner Bike</asp:ListItem>
                        <asp:ListItem Value="Jumping">Jumping</asp:ListItem>
                        <asp:ListItem Value="Aqua Senior">Aqua Senior</asp:ListItem>
                        <asp:ListItem Value="Joga">Joga</asp:ListItem>
                        <asp:ListItem Value="Step">Step</asp:ListItem>
                        <asp:ListItem Value="TRX">TRX</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style20">
                    </td>
                <td class="auto-style25"><strong>podaj typ zajęć:</strong></td>
                <td class="auto-style27">
                    <asp:TextBox ID="TextBoxTypeWorkout" runat="server" Width="194px"></asp:TextBox>
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style5" rowspan="4"><strong>dodaj opis zajęć:</strong></td>
                <td class="auto-style9" rowspan="4">
                    <asp:TextBox ID="TextBox2" runat="server" Height="100px" TextMode="MultiLine" Width="500px" style="font-family:Microsoft Sans Serif, Sans-Serif;"></asp:TextBox>
                </td>
                <td class="auto-style20" rowspan="4">&nbsp;</td>
                <td class="auto-style24" rowspan="4">&nbsp;</td>
                <td class="auto-style26">
                    <asp:Button ID="ButtonCancel" runat="server" OnClick="ButtonCancel_Click" Text="Odwołaj" />
                </td>
                <td class="auto-style4" rowspan="4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style27">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style27">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style27">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style9">
                    <asp:Button ID="ButtonAddWorkout" runat="server" OnClick="Button1_Click" Text="Dodaj" Enabled="False" />
                </td>
                <td class="auto-style20">
                    &nbsp;</td>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style8">
                    <strong>
    
                    <asp:SqlDataSource ID="SqlDataSourceExercises" runat="server" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" SelectCommand="SELECT [ID], [Partia], [Obraz], [Opis] FROM [Exercises]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceWorkout" runat="server" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" SelectCommand="SELECT [ID], [Data], [Opis], [Typ], [Status] FROM [Workout]"></asp:SqlDataSource>
                    </strong>
                </td>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style8">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" OnDayRender="Calendar1_DayRender1" OnSelectionChanged="Calendar1_SelectionChanged1">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                </td>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style8">
                    <asp:GridView ID="DataGrid1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </td>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
        </table>
        <p>
        </p>

        <table class="auto-style1">
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style13">
                </td>
                <td class="auto-style11"></td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style16">
                    <strong>Dodaj nowe ćwiczenie:</strong></td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"><strong>podaj partię mięśni:</strong></td>
                <td class="auto-style13">
                    <asp:DropDownList ID="DropDownListMusclesType" runat="server" Width="150px">
                        <asp:ListItem Value="Barki">Barki</asp:ListItem>
                        <asp:ListItem Value="Biceps">Biceps</asp:ListItem>
                        <asp:ListItem Value="Brzuch">Brzuch</asp:ListItem>
                        <asp:ListItem Value="Klatka piersiowa">Klatka piersiowa</asp:ListItem>
                        <asp:ListItem Value="Lydki">Łydki</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"><strong>dodaj opis ćwiczenia:</strong></td>
                <td class="auto-style13">
                    <asp:TextBox ID="TextBoxExercisesDescription" runat="server" Height="100px" TextMode="MultiLine" Width="300px" style="font-family:Microsoft Sans Serif, Sans-Serif;"></asp:TextBox>
                </td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"><strong>załaduj obraz:</strong></td>
                <td class="auto-style13">
                    <asp:FileUpload ID="FileUploadImage" runat="server" Width="302px" />
                </td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style14">
                    <asp:Button ID="ButtonAddExercises" runat="server" Text="Dodaj" OnClick="ButtonAddExercises_Click" />
                </td>
                <td class="auto-style11"></td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style13">
                    &nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"><strong>Wyszukaj ćwiczenie:</strong></td>
                <td class="auto-style4" colspan="2">
                    <asp:TextBox ID="TextBoxSearch" runat="server" Width="150px" autocomplete="off" placeholder="np. Biceps"></asp:TextBox>
                    <asp:Button ID="ButtonSearch" runat="server" Text="Wyszukaj" />
                </td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style4" colspan="2">
                    <asp:GridView ID="GridViewExercises" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="418px" OnSelectedIndexChanged="GridViewExercises_SelectedIndexChanged" DataKeyNames="ID">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="Partia" HeaderText="Partia" SortExpression="Partia" />
                            <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
                            <asp:ImageField DataImageUrlField="Obraz" HeaderText="Obraz">
                            </asp:ImageField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style13">
                    &nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            </table>
        <p>
        </p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style17">
                    <strong>Przypisz ćwiczenia dla 
                    <asp:Label ID="LabelGymMember" runat="server" ForeColor="Red"></asp:Label>
                &nbsp;</strong></td>
                <td class="auto-style11"></td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style5"><strong>wybierz członka siłowni:</strong></td>
                <td class="auto-style4" colspan="3">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSourceGym_member_Exercises" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="946px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                            <asp:BoundField DataField="Cwiczenia" HeaderText="Cwiczenia" SortExpression="Cwiczenia" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style18">
                    &nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"><strong>dodaj/edytuj ćwiczenia:</strong></td>
                <td class="auto-style18">
                    <asp:TextBox ID="TextBoxExercisesForGymMember" runat="server" Width="500px" TextMode="MultiLine" placeholder="Aby dodać ćwiczenia najpierw wyszukaj partię mięśni, która Cię interesuje, a następnie kliknij przycisk wybierz." style="font-family:Microsoft Sans Serif, Sans-Serif;" Height="100px"></asp:TextBox>
                </td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style19">
                    <asp:Button ID="ButtonAddExercisesForGymMember" runat="server" OnClick="ButtonAddExercisesForGymMember_Click" Text="Przypisz" />
                </td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style18">
                    &nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style18">
                    &nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
        </table>
        
    
    </div>
    </form>
</body>
</html>
