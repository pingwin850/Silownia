<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gym_member.aspx.cs" Inherits="Silownia.Gym_member" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Członek siłowni</title>
    <link rel="Shortcut icon" href="images/gym_icon.png" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            font-size: x-large;
        }
        .auto-style4 {
            font-size: large;
        }
        .auto-style5 {
            height: 23px;
        }
        .auto-style6 {
            height: 23px;
            width: 245px;
            text-align: right;
            background-color: #FFFFFF;
        }
        .auto-style8 {
            height: 23px;
            width: 602px;
            text-align: justify;
        }
        .auto-style9 {
            width: 602px;
        }
        .auto-style11 {
            width: 832px;
        }
        .auto-style12 {
            width: 245px;
            text-align: right;
        }
        .auto-style13 {
            width: 206px;
        }
        .auto-style14 {
            width: 245px;
            text-align: right;
            height: 25px;
        }
        .auto-style15 {
            width: 602px;
            height: 25px;
        }
        .auto-style16 {
            height: 25px;
        }
        .auto-style19 {
            width: 240px;
        }
        .auto-style20 {
            width: 245px;
        }
        .auto-style21 {
            width: 245px;
            height: 23px;
        }
        .auto-style22 {
            width: 602px;
            height: 23px;
        }
        .auto-style23 {
            width: 246px;
        }
        .auto-style24 {
            width: 272px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style23">&nbsp;</td>
                <td class="auto-style11">
    
        <asp:Label ID="LabelWelcome" runat="server" Text="Witaj " CssClass="auto-style3"></asp:Label>
                </td>
                <td class="auto-style2">
        <asp:Button ID="B_logout" runat="server" OnClick="B_logout_Click" Text="Wyloguj" CssClass="auto-style4" />
    
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style13">
                    <asp:SqlDataSource ID="SqlDataSourceDiet" runat="server" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" SelectCommand="SELECT [DietDescription] FROM [Gym_member_Diet] WHERE ([UserName] = @UserName)">
                        <SelectParameters>
                            <asp:SessionParameter Name="UserName" SessionField="New" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style19">
                    <asp:SqlDataSource ID="SqlDataSourceExercises" runat="server" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" SelectCommand="SELECT [Cwiczenia] FROM [Gym_member_Exercises] WHERE ([UserName] = @UserName)">
                        <SelectParameters>
                            <asp:SessionParameter Name="UserName" SessionField="New" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style24">
                    <asp:SqlDataSource ID="SqlDataSourceCheckExercises" runat="server" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" SelectCommand="SELECT [ID], [Partia], [Opis], [Obraz] FROM [Exercises] WHERE ([Opis] = @Opis)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxCheck" Name="Opis" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSourceWorkout" runat="server" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" SelectCommand="SELECT [ID], [Data], [Typ], [Opis], [Status] FROM [Workout]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style6"><strong>Moja dieta:</strong></td>
                <td class="auto-style8">
                    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSourceDiet">
                        <EditItemTemplate>
                            DietDescription:
                            <asp:TextBox ID="DietDescriptionTextBox" runat="server" Text='<%# Bind("DietDescription") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            DietDescription:
                            <asp:TextBox ID="DietDescriptionTextBox" runat="server" Text='<%# Bind("DietDescription") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="DietDescriptionLabel" runat="server" Text='<%# Bind("DietDescription") %>' />
                        </ItemTemplate>
                    </asp:FormView>
                </td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style22"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style14"><strong>Moje ćwiczenia:</strong></td>
                <td class="auto-style15">
                    <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSourceExercises" Height="21px" OnDataBound="FormView2_DataBound" Width="573px">
                        <EditItemTemplate>
                            Cwiczenia:
                            <asp:TextBox ID="CwiczeniaTextBox" runat="server" Text='<%# Bind("Cwiczenia") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            Cwiczenia:
                            <asp:TextBox ID="CwiczeniaTextBox" runat="server" Text='<%# Bind("Cwiczenia") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CwiczeniaLabel" runat="server" Text='<%# Bind("Cwiczenia") %>' />
                        </ItemTemplate>
                    </asp:FormView>
                </td>
                <td class="auto-style16"></td>
                <td class="auto-style16"></td>
            </tr>
            <tr>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12">S<strong>prawdź ćwiczenie:</strong></td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBoxCheck" runat="server" autocomplete="off"></asp:TextBox>
                    <asp:Button ID="ButtonCheck" runat="server" Text="Sprawdź" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style9">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSourceCheckExercises" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
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
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12"><strong>Sprawdź kiedy odbywają się zajęcia:</strong></td>
                <td class="auto-style9">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style9">
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
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12"><strong>Zapisz się
                    na zajęcia grupowe:</strong></td>
                <td class="auto-style9">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
