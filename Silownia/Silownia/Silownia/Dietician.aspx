<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dietician.aspx.cs" Inherits="Silownia.Dietician" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dietetyk</title>
    <link rel="Shortcut icon" href="images/gym_icon.png" />

    <style type="text/css">
        .auto-style2 {
            font-size: x-large;
        }
        .auto-style3 {
            font-size: large;
        }
        .auto-style6 {
            width: 1107px;
        }
        .auto-style7 {
            width: 1107px;
            text-align: right;
        }
        .auto-style9 {
            width: 270px;
            height: 23px;
        }
        .auto-style10 {
            width: 1107px;
            height: 23px;
        }
        .auto-style11 {
            height: 23px;
        }
        .auto-style12 {
            text-align: right;
            width: 270px;
            font-size: large;
        }
        .auto-style13 {
            height: 23px;
            font-size: large;
        }
        .auto-style15 {
            width: 259px;
        }
        .auto-style16 {
            width: 270px;
        }
        .auto-style17 {
            width: 123%;
            margin-right: 596px;
        }
        .auto-style19 {
            width: 123%;
        }
        .auto-style20 {
            width: 270px;
            text-align: right;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style19">
            <tr>
                <td class="auto-style16">&nbsp;</td>
                <td><strong>
    
        <asp:Label ID="LabelWelcome" runat="server" Text="Witaj " CssClass="auto-style2" ForeColor="#3333FF"></asp:Label>
                    </strong>
                    <br />
                    <br />
        <asp:Button ID="B_logout" runat="server" OnClick="B_logout_Click" Text="Wyloguj" CssClass="auto-style3" BackColor="#FFFFCC" />
    
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <table class="auto-style19">
            <tr>
                <td class="auto-style15">
                    <asp:SqlDataSource ID="SqlDataSourceGym_member" runat="server" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" SelectCommand="SELECT * FROM [Gym_member_Diet]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSourceCurrentUser" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" 
                        SelectCommand="SELECT [ID], [UserName], [Password], [Imie], [Nazwisko], [Email], [DataUrodzenia], [Telefon] FROM [Dietician] WHERE ([UserName] = @UserName)"
                        UpdateCommand="UPDATE Dietician SET UserName = @UserName, Password = @Password, Imie = @Imie, Nazwisko = @Nazwisko, Email = @Email, DataUrodzenia = @DataUrodzenia, Telefon = @Telefon WHERE (UserName = @UserName)">
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
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <table class="auto-style17">
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style10"><strong><span class="auto-style3">Dodaj dietę dla </span></strong>
                    <asp:Label ID="MessageLabel" runat="server" CssClass="auto-style3" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style13">
                    &nbsp;</td>
                <td class="auto-style11"></td>
            </tr>
            <tr>
                <td class="auto-style12"><strong>wybierz członka siłowni:</strong></td>
                <td class="auto-style6">
                    <asp:GridView ID="GridViewGym_member_Diet" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSourceGym_member" ForeColor="#333333" GridLines="None" AllowPaging="True" OnSelectedIndexChanged="GridViewGym_member_Diet_SelectedIndexChanged" Width="1100px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                            <asp:BoundField DataField="DietDescription" HeaderText="DietDescription" SortExpression="DietDescription" />
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
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12"><strong>dodaj/edytuj opis diety:</strong></td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBoxDiet" runat="server" Height="200px" TextMode="MultiLine" Width="1100px" style="font-family:Microsoft Sans Serif, Sans-Serif;"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style7">
                    <asp:Button ID="ButtonAddEdit" runat="server" OnClick="ButtonAdd_Click" Text="Dodaj/Edytuj dietę" CssClass="auto-style3" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20"><strong>Moje dane:</strong></td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style6">
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
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        </ItemTemplate>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:FormView>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
