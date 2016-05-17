<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="Silownia.Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menedżer</title>
    <link rel="Shortcut icon" href="images/gym_icon.png" />

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
            width: 225px;
        }
        .auto-style4 {
            width: 205px;
        }
        .auto-style5 {
            width: 201px;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
            width: 54px;
        }
        .auto-style8 {
            height: 26px;
            width: 95px;
        }
        .auto-style9 {
            text-align: right;
            width: 225px;
            height: 30px;
        }
        .auto-style10 {
            width: 214px;
            height: 30px;
        }
        .auto-style11 {
            height: 30px;
        }
        .auto-style14 {
            text-align: right;
        }
        .auto-style15 {
            width: 29px;
        }
        .auto-style16 {
            width: 224px;
        }
        .auto-style17 {
            font-size: x-large;
        }
        .auto-style18 {
            text-align: right;
            width: 422px;
        }
        .auto-style19 {
            width: 618px;
        }
        .auto-style20 {
            font-size: large;
        }
        .auto-style29 {
            width: 241px;
        }
        .auto-style30 {
            width: 214px;
        }
        .auto-style32 {
            text-align: right;
            width: 143px;
        }
        .auto-style33 {
            width: 143px;
        }
        .auto-style35 {
            text-align: right;
            width: 225px;
            height: 26px;
        }
        .auto-style36 {
            width: 214px;
            height: 26px;
        }
        .auto-style38 {
            width: 143px;
            height: 26px;
        }
        .auto-style40 {
            text-align: right;
            width: 214px;
        }
        .auto-style41 {
            width: 133px;
        }
        .auto-style42 {
            width: 133px;
            height: 26px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style16">
    
                    &nbsp;</td>
                <td class="auto-style19">
    
                    <strong>
    
        <asp:Label ID="LabelWelcome" runat="server" Text="Witaj " CssClass="auto-style17"></asp:Label>
                    <br />
                    <br />
                    </strong>
        <asp:Button ID="B_logout" runat="server" OnClick="B_logout_Click" Text="Wyloguj" CssClass="auto-style20" />
    
                </td>
                <td class="auto-style18">
                    &nbsp;</td>
                <td class="auto-style14">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style5">
                    <asp:SqlDataSource ID="SqlDataSourceCoach" runat="server"
                        ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>"
                        SelectCommand="SELECT [ID], [Imie], [Nazwisko], [Email], [DataUrodzenia], [Telefon] FROM [Coach]"
                        UpdateCommand="UPDATE [Coach] Set [Imie]=@Imie, [Nazwisko]=@Nazwisko, [Email]=@Email, [DataUrodzenia]=@DataUrodzenia, [Telefon]=@Telefon Where [ID]=@ID"
                        DeleteCommand="DELETE from [Coach] Where [ID]=@ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Imie" />
                            <asp:Parameter Name="Nazwisko" />
                            <asp:Parameter Name="Email" />
                            <asp:Parameter Name="DataUrodzenia" />
                            <asp:Parameter Name="Telefon" />
                            <asp:Parameter Name="ID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style4">
                    <asp:SqlDataSource ID="SqlDataSourceDietician" runat="server"
                        ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>"
                        SelectCommand="SELECT [ID], [Imie], [Nazwisko], [Email], [DataUrodzenia], [Telefon] FROM [Dietician]"
                        UpdateCommand="UPDATE [Dietician] Set [Imie]=@Imie, [Nazwisko]=@Nazwisko, [Email]=@Email, [DataUrodzenia]=@DataUrodzenia, [Telefon]=@Telefon Where [ID]=@ID"
                        DeleteCommand="DELETE from [Dietician] Where [ID]=@ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Imie" />
                            <asp:Parameter Name="Nazwisko" />
                            <asp:Parameter Name="Email" />
                            <asp:Parameter Name="DataUrodzenia" />
                            <asp:Parameter Name="Telefon" />
                            <asp:Parameter Name="ID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style29">
                    <asp:SqlDataSource ID="SqlDataSourceReceptionist" runat="server"
                        ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>"
                        SelectCommand="SELECT [ID], [Imie], [Nazwisko], [Email], [DataUrodzenia], [Telefon] FROM [Receptionist]"
                        UpdateCommand="UPDATE [Receptionist] Set [Imie]=@Imie, [Nazwisko]=@Nazwisko, [Email]=@Email, [DataUrodzenia]=@DataUrodzenia, [Telefon]=@Telefon Where [ID]=@ID"
                        DeleteCommand="DELETE from [Receptionist] Where [ID]=@ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Imie" />
                            <asp:Parameter Name="Nazwisko" />
                            <asp:Parameter Name="Email" />
                            <asp:Parameter Name="DataUrodzenia" />
                            <asp:Parameter Name="Telefon" />
                            <asp:Parameter Name="ID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSourceCurrentUser" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" 
                        SelectCommand="SELECT [ID], [UserName], [Password], [Imie], [Nazwisko], [Email], [Telefon] FROM [Manager] WHERE ([UserName] = @UserName)"
                        UpdateCommand="UPDATE [Manager] Set [UserName]=@UserName, [Password] = @Password, [Imie]=@Imie, [Nazwisko]=@Nazwisko, [Email]=@Email, [Telefon]=@Telefon WHERE ([UserName] = @UserName)">
                        <SelectParameters>
                            <asp:SessionParameter Name="UserName" SessionField="New" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UserName" />
                            <asp:Parameter Name="Password" />
                            <asp:Parameter Name="Imie" />
                            <asp:Parameter Name="Nazwisko" />
                            <asp:Parameter Name="Email" />
                            <asp:Parameter Name="Telefon" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style30"><strong>Dodaj pracownika</strong></td>
                <td class="auto-style41">&nbsp;</td>
                <td class="auto-style32"><strong>Edytuj moje dane:</strong></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style35"><strong>Typ użytkownika:</strong></td>
                <td class="auto-style36">
                    <asp:DropDownList ID="DropDownListUserType" runat="server" Width="210px">
                        <asp:ListItem Value="Coach">Trener</asp:ListItem>
                        <asp:ListItem Value="Dietician">Dietetyk</asp:ListItem>
                        <asp:ListItem Value="Receptionist">Recepcjonistka</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style42"></td>
                <td class="auto-style38"></td>
                <td rowspan="6">
                    <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSourceCurrentUser" ForeColor="#333333">
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
                            Telefon:
                            <asp:Label ID="TelefonLabel" runat="server" Text='<%# Bind("Telefon") %>' />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        </ItemTemplate>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:FormView>
                </td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Imie:</strong></td>
                <td class="auto-style30">
                    <asp:TextBox ID="TextBoxName" runat="server" Width="207px" autocomplete="off"></asp:TextBox>
                </td>
                <td class="auto-style41">&nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Nazwisko:</strong></td>
                <td class="auto-style30">
                    <asp:TextBox ID="TextBoxSurname" runat="server" Width="207px" autocomplete="off"></asp:TextBox>
                </td>
                <td class="auto-style41">&nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Email:</strong></td>
                <td class="auto-style30">
                    <asp:TextBox ID="TextBoxEmail" runat="server" Width="207px" autocomplete="off"></asp:TextBox>
                </td>
                <td class="auto-style41">&nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Data urodzenia:</strong></td>
                <td class="auto-style30">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style7">
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
                            <td class="auto-style8">
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
                            <td class="auto-style6">
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
                                    <asp:ListItem>1995</asp:ListItem>
                                    <asp:ListItem>1996</asp:ListItem>
                                    <asp:ListItem>1997</asp:ListItem>
                                    <asp:ListItem>1998</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style41">&nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Telefon:</strong></td>
                <td class="auto-style30">
                    <asp:TextBox ID="TextBoxPhone" runat="server" Width="207px" autocomplete="off"></asp:TextBox>
                </td>
                <td class="auto-style41">&nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style40">
                    <asp:Button ID="ButtonAdd" runat="server" Text="Dodaj" OnClick="ButtonAdd_Click" />
                </td>
                <td colspan="4">&nbsp;</td>
            </tr>
            </table>
        <p>
        </p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style11" colspan="2"></td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Trenerzy:</strong></td>
                <td class="auto-style30">
                    <asp:Button ID="ButtonCoachRefresh" runat="server" OnClick="ButtonCoachRefresh_Click" Text="Odśwież" />
                </td>
                <td class="auto-style15">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style30">
                    <asp:GridView ID="GridViewCoach" runat="server" CellPadding="4" DataSourceID="SqlDataSourceCoach" ForeColor="#333333" GridLines="None" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AutoGenerateColumns="False" AllowPaging="True" OnRowDeleting="GridViewCoach_RowDeleting" OnSelectedIndexChanged="GridViewCoach_SelectedIndexChanged" DataKeyNames="ID">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="DataUrodzenia" HeaderText="DataUrodzenia" SortExpression="DataUrodzenia" />
                            <asp:BoundField DataField="Telefon" HeaderText="Telefon" SortExpression="Telefon" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
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
                <td colspan="2">&nbsp;</td>
            </tr>
            </table>
        <p>
        </p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style30">
                    &nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Dietetycy:</strong></td>
                <td class="auto-style30">
                    <asp:Button ID="ButtonDieticianRefresh" runat="server" OnClick="ButtonDieticianRefresh_Click" Text="Odśwież" />
                </td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style30">
                    <asp:GridView ID="GridViewDietician" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceDietician" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="ID">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="DataUrodzenia" HeaderText="DataUrodzenia" SortExpression="DataUrodzenia" />
                            <asp:BoundField DataField="Telefon" HeaderText="Telefon" SortExpression="Telefon" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
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
                <td class="auto-style15">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
        <p>
        </p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style30">
                    &nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Recepcjonistki:</strong></td>
                <td class="auto-style30">
                    <asp:Button ID="ButtonReceptionistRefresh" runat="server" OnClick="ButtonReceptionistRefresh_Click" Text="Odśwież" />
                </td>
                <td class="auto-style15">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style30">
                    <asp:GridView ID="GridViewReceptionist" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceReceptionist" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="ID">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="DataUrodzenia" HeaderText="DataUrodzenia" SortExpression="DataUrodzenia" />
                            <asp:BoundField DataField="Telefon" HeaderText="Telefon" SortExpression="Telefon" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
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
                <td class="auto-style15">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style30">
                    &nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
    </form>
</body>
</html>
