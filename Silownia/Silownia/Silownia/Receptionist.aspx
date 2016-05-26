<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receptionist.aspx.cs" Inherits="Silownia.Receptionist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Recepcjonistka</title>

    <link rel="Shortcut icon" href="images/gym_icon.png" />

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            text-align: right;
            width: 145px;
        }
        .auto-style3 {
            width: 44px;
        }
        .auto-style4 {
            text-align: right;
            height: 26px;
            width: 145px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            width: 90px;
        }
        .auto-style7 {
            width: 145px;
        }
        .auto-style8 {
            width: 149px;
        }
        .auto-style9 {
            font-size: x-large;
        }
        .auto-style10 {
            width: 1048px;
        }
        .auto-style12 {
            text-align: right;
        }
        .auto-style13 {
            width: 53px;
        }
        .auto-style14 {
            width: 250px;
        }
        .auto-style15 {
            height: 26px;
            width: 250px;
        }
        .auto-style16 {
            font-size: large;
        }
        .auto-style17 {
            width: 261px;
        }
        .auto-style18 {
            width: 342px;
        }
        .auto-style19 {
            text-align: left;
        }
        .auto-style20 {
            text-align: left;
            width: 102px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr">
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style10"><strong>
    
        <asp:Label ID="LabelWelcome" runat="server" Text="Witaj " CssClass="auto-style9" ForeColor="#3333FF"></asp:Label>
                    <br />
                    <br />
                    </strong>
    
        <asp:Button ID="B_logout" runat="server" OnClick="B_logout_Click" Text="Wyloguj" CssClass="auto-style16" BackColor="#FFFFCC" />
    
                </td>
                <td class="auto-style20">
                    &nbsp;</td>
                <td class="auto-style19">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style17">
                    <asp:SqlDataSource ID="SqlDataSourceGym_member" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" 
                        SelectCommand="SELECT [ID], [UserName], [Imie], [Nazwisko], [Email], [DataUrodzenia], [Telefon] FROM [Gym_member]"
                        UpdateCommand="UPDATE [Gym_member] Set [UserName]=@UserName, [Imie]=@Imie, [Nazwisko]=@Nazwisko, [Email]=@Email, [DataUrodzenia]=@DataUrodzenia, [Telefon]=@Telefon Where [ID]=@ID; UPDATE [Gym_member_Diet] Set [UserName]=@UserName, [Imie]=@Imie, [Nazwisko]=@Nazwisko Where [ID]=@ID; UPDATE [Gym_member_Exercises] Set [UserName]=@UserName, [Imie]=@Imie, [Nazwisko]=@Nazwisko Where [ID]=@ID"
                        DeleteCommand="DELETE from [Gym_member] Where [ID]=@ID; DELETE from [Gym_member_Diet] Where [ID]=@ID; DELETE from [Gym_member_Exercises] Where [ID]=@ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UserName" />
                            <asp:Parameter Name="Imie" />
                            <asp:Parameter Name="Nazwisko" />
                            <asp:Parameter Name="Email" />
                            <asp:Parameter Name="DataUrodzenia" />
                            <asp:Parameter Name="Telefon" />
                            <asp:Parameter Name="ID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style18">
                    <asp:SqlDataSource ID="SqlDataSourceGym_memberSurnameSearch" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" 
                        SelectCommand="SELECT [ID], [UserName], [Imie], [Nazwisko], [Email], [DataUrodzenia], [Telefon] FROM [Gym_member] WHERE ([Nazwisko] = @Nazwisko)"
                        UpdateCommand="UPDATE [Gym_member] Set [UserName]=@UserName, [Imie]=@Imie, [Nazwisko]=@Nazwisko, [Email]=@Email, [DataUrodzenia]=@DataUrodzenia, [Telefon]=@Telefon Where [ID]=@ID; UPDATE [Gym_member_Diet] Set [UserName]=@UserName, [Imie]=@Imie, [Nazwisko]=@Nazwisko Where [ID]=@ID"
                        DeleteCommand="DELETE from [Gym_member] Where [ID]=@ID; DELETE from [Gym_member_Diet] Where [ID]=@ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UserName" />
                            <asp:Parameter Name="Imie" />
                            <asp:Parameter Name="Nazwisko" />
                            <asp:Parameter Name="Email" />
                            <asp:Parameter Name="DataUrodzenia" />
                            <asp:Parameter Name="Telefon" />
                            <asp:Parameter Name="ID" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxGym_memberSearch" Name="Nazwisko" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSourceCurrentUser" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" 
                        SelectCommand="SELECT [ID], [UserName], [Password], [Imie], [Nazwisko], [Email], [DataUrodzenia], [Telefon] FROM [Receptionist] WHERE ([UserName] = @UserName)"
                        UpdateCommand="UPDATE [Receptionist] Set [UserName]=@UserName, [Password] = @Password, [Imie]=@Imie, [Nazwisko]=@Nazwisko, [Email]=@Email, [DataUrodzenia]=@DataUrodzenia, [Telefon]=@Telefon WHERE ([UserName] = @UserName)">
                        <SelectParameters>
                            <asp:SessionParameter Name="UserName" SessionField="New" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UserName" />
                            <asp:Parameter Name="Password" />
                            <asp:Parameter Name="Imie" />
                            <asp:Parameter Name="Nazwisko" />
                            <asp:Parameter Name="Email" />
                            <asp:Parameter Name="DataUrodzenia" />
                            <asp:Parameter Name="Telefon" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td colspan="3">&nbsp;</td>
                <td class="auto-style14">
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td colspan="3">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td colspan="3"><strong>Dodaj nowego człowka siłowni</strong></td>
                <td class="auto-style14">&nbsp;</td>
                <td rowspan="6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Imie:</strong></td>
                <td colspan="3">
                    <asp:TextBox ID="TextBoxName" runat="server" Width="207px" autocomplete="off"></asp:TextBox>
                </td>
                <td class="auto-style14">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4"><strong>Nazwisko:</strong></td>
                <td class="auto-style5" colspan="3">
                    <asp:TextBox ID="TextBoxSurname" runat="server" Width="207px" autocomplete="off"></asp:TextBox>
                </td>
                <td class="auto-style15"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Email:</strong></td>
                <td colspan="3">
                    <asp:TextBox ID="TextBoxEmail" runat="server" Width="207px" autocomplete="off"></asp:TextBox>
                </td>
                <td class="auto-style14">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Data urodzenia:</strong></td>
                <td class="auto-style3">
                    <asp:DropDownList ID="DropDownListDay" runat="server" Width="45px">
                        <asp:ListItem Value="01">1</asp:ListItem>
                        <asp:ListItem Value="02">2</asp:ListItem>
                        <asp:ListItem Value="03">3</asp:ListItem>
                        <asp:ListItem Value="04">4</asp:ListItem>
                        <asp:ListItem Value="05">5</asp:ListItem>
                        <asp:ListItem Value="06">6</asp:ListItem>
                        <asp:ListItem Value="07">7</asp:ListItem>
                        <asp:ListItem Value="08">8</asp:ListItem>
                        <asp:ListItem Value="09">9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>31</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style6">
                    <asp:DropDownList ID="DropDownListMonth" runat="server" Width="100px">
                        <asp:ListItem Value="01">Styczeń</asp:ListItem>
                        <asp:ListItem Value="02">Luty</asp:ListItem>
                        <asp:ListItem Value="03">Marzec</asp:ListItem>
                        <asp:ListItem Value="04">Kwiecień</asp:ListItem>
                        <asp:ListItem Value="05">Maj</asp:ListItem>
                        <asp:ListItem Value="06">Czerwiec</asp:ListItem>
                        <asp:ListItem Value="07">Lipiec</asp:ListItem>
                        <asp:ListItem Value="08">Sierpień</asp:ListItem>
                        <asp:ListItem Value="09">Wrzesień</asp:ListItem>
                        <asp:ListItem Value="10">Październik</asp:ListItem>
                        <asp:ListItem Value="11">Listopad</asp:ListItem>
                        <asp:ListItem Value="12">Grudzień</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style13">
                    <asp:DropDownList ID="DropDownListYear" runat="server" Width="55px">
                        <asp:ListItem>1950</asp:ListItem>
                        <asp:ListItem>1951</asp:ListItem>
                        <asp:ListItem>1952</asp:ListItem>
                        <asp:ListItem>1953</asp:ListItem>
                        <asp:ListItem>1954</asp:ListItem>
                        <asp:ListItem>1955</asp:ListItem>
                        <asp:ListItem>1956</asp:ListItem>
                        <asp:ListItem>1957</asp:ListItem>
                        <asp:ListItem>1958</asp:ListItem>
                        <asp:ListItem>1959</asp:ListItem>
                        <asp:ListItem>1960</asp:ListItem>
                        <asp:ListItem>1961</asp:ListItem>
                        <asp:ListItem>1962</asp:ListItem>
                        <asp:ListItem>1963</asp:ListItem>
                        <asp:ListItem>1964</asp:ListItem>
                        <asp:ListItem>1965</asp:ListItem>
                        <asp:ListItem>1966</asp:ListItem>
                        <asp:ListItem>1967</asp:ListItem>
                        <asp:ListItem>1968</asp:ListItem>
                        <asp:ListItem>1969</asp:ListItem>
                        <asp:ListItem>1970</asp:ListItem>
                        <asp:ListItem>1971</asp:ListItem>
                        <asp:ListItem>1972</asp:ListItem>
                        <asp:ListItem>1973</asp:ListItem>
                        <asp:ListItem>1974</asp:ListItem>
                        <asp:ListItem>1975</asp:ListItem>
                        <asp:ListItem>1976</asp:ListItem>
                        <asp:ListItem>1977</asp:ListItem>
                        <asp:ListItem>1978</asp:ListItem>
                        <asp:ListItem>1979</asp:ListItem>
                        <asp:ListItem>1980</asp:ListItem>
                        <asp:ListItem>1981</asp:ListItem>
                        <asp:ListItem>1982</asp:ListItem>
                        <asp:ListItem>1983</asp:ListItem>
                        <asp:ListItem>1984</asp:ListItem>
                        <asp:ListItem>1985</asp:ListItem>
                        <asp:ListItem>1986</asp:ListItem>
                        <asp:ListItem>1987</asp:ListItem>
                        <asp:ListItem>1988</asp:ListItem>
                        <asp:ListItem>1989</asp:ListItem>
                        <asp:ListItem>1990</asp:ListItem>
                        <asp:ListItem>1991</asp:ListItem>
                        <asp:ListItem>1992</asp:ListItem>
                        <asp:ListItem>1993</asp:ListItem>
                        <asp:ListItem>1994</asp:ListItem>
                        <asp:ListItem>1995</asp:ListItem>
                        <asp:ListItem>1996</asp:ListItem>
                        <asp:ListItem>1997</asp:ListItem>
                        <asp:ListItem>1998</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style14">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Telefon:</strong></td>
                <td colspan="3">
                    <asp:TextBox ID="TextBoxPhone" runat="server" Width="207px" autocomplete="off"></asp:TextBox>
                </td>
                <td class="auto-style14">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style12" colspan="3">
                    <asp:Button ID="ButtonAdd" runat="server" OnClick="ButtonAdd_Click" Text="Dodaj" />
                </td>
                <td class="auto-style14">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td colspan="3">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
        </table>
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2"><strong>Członkowie siłowni:</strong></td>
                <td>
                    <asp:Button ID="ButtonRefresh" runat="server" OnClick="ButtonRefresh_Click" Text="Odśwież" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td>
                    <asp:GridView ID="GridViewGym_member" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSourceGym_member" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="DataUrodzenia" HeaderText="DataUrodzenia" SortExpression="DataUrodzenia" />
                            <asp:BoundField DataField="Telefon" HeaderText="Telefon" SortExpression="Telefon" />
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
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Wyszukaj:</strong></td>
                <td>
                    <asp:TextBox ID="TextBoxGym_memberSearch" runat="server" autocomplete="off" Width="207px"></asp:TextBox>
                    <asp:Button ID="ButtonSearch" runat="server" Text="Wyszukaj" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td>
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSourceGym_memberSurnameSearch" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="DataUrodzenia" HeaderText="DataUrodzenia" SortExpression="DataUrodzenia" />
                            <asp:BoundField DataField="Telefon" HeaderText="Telefon" SortExpression="Telefon" />
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
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Moje dane:</strong></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSourceCurrentUser" DefaultMode="Edit" CellPadding="4" ForeColor="#333333">
                        <EditItemTemplate>
                            ID:
                            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                            <br />
                            UserName:
                            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                            <br />
                            Password:
                            <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                            <br />
                            Imie:
                            <asp:TextBox ID="ImieTextBox" runat="server" Text='<%# Bind("Imie") %>' />
                            <br />
                            Nazwisko:
                            <asp:TextBox ID="NazwiskoTextBox" runat="server" Text='<%# Bind("Nazwisko") %>' />
                            <br />
                            Email:
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                            <br />
                            DataUrodzenia:
                            <asp:TextBox ID="DataUrodzeniaTextBox" runat="server" Text='<%# Bind("DataUrodzenia") %>' />
                            <br />
                            Telefon:
                            <asp:TextBox ID="TelefonTextBox" runat="server" Text='<%# Bind("Telefon") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            ID:
                            <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                            <br />
                            UserName:
                            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                            <br />
                            Password:
                            <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                            <br />
                            Imie:
                            <asp:TextBox ID="ImieTextBox" runat="server" Text='<%# Bind("Imie") %>' />
                            <br />
                            Nazwisko:
                            <asp:TextBox ID="NazwiskoTextBox" runat="server" Text='<%# Bind("Nazwisko") %>' />
                            <br />
                            Email:
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                            <br />
                            DataUrodzenia:
                            <asp:TextBox ID="DataUrodzeniaTextBox" runat="server" Text='<%# Bind("DataUrodzenia") %>' />
                            <br />
                            Telefon:
                            <asp:TextBox ID="TelefonTextBox" runat="server" Text='<%# Bind("Telefon") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            ID:
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                            <br />
                            UserName:
                            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' />
                            <br />
                            Password:
                            <asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("Password") %>' />
                            <br />
                            Imie:
                            <asp:Label ID="ImieLabel" runat="server" Text='<%# Bind("Imie") %>' />
                            <br />
                            Nazwisko:
                            <asp:Label ID="NazwiskoLabel" runat="server" Text='<%# Bind("Nazwisko") %>' />
                            <br />
                            Email:
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                            <br />
                            DataUrodzenia:
                            <asp:Label ID="DataUrodzeniaLabel" runat="server" Text='<%# Bind("DataUrodzenia") %>' />
                            <br />
                            Telefon:
                            <asp:Label ID="TelefonLabel" runat="server" Text='<%# Bind("Telefon") %>' />
                            <br />
                        </ItemTemplate>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:FormView>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
