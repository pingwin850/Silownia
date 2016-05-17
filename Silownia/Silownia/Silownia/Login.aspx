<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Silownia.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Siłownia</title>

    <link rel="Shortcut icon" href="images/gym_icon.png" />

    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
            text-align: center;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 169px;
        }
        .auto-style4 {
            width: 169px;
            font-weight: bold;
            text-align: right;
        }
        .auto-style6 {
            width: 347px;
        }
        .auto-style7 {
            width: 435px;
        }
        .auto-style8 {
            width: 307px;
        }
        .auto-style9 {
            width: 421px;
        }
        .auto-style10 {
            width: 111px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <strong>Logowanie</strong><table class="auto-style2">
            <tr>
                <td class="auto-style6">
                    <asp:SqlDataSource ID="SqlDataSourceGym_Member" runat="server" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" SelectCommand="SELECT * FROM [Gym_member]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
                </td>
                <td class="auto-style8">
                    <asp:SqlDataSource ID="SqlDataSourceReceptionist" runat="server" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" SelectCommand="SELECT * FROM [Receptionist]"></asp:SqlDataSource>
                </td>
                <td class="auto-style7">
                    <asp:SqlDataSource ID="SqlDataSourceCoach" runat="server" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" SelectCommand="SELECT * FROM [Coach]"></asp:SqlDataSource>
                </td>
                <td class="auto-style9">
                    <asp:SqlDataSource ID="SqlDataSourceDietician" runat="server" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" SelectCommand="SELECT * FROM [Dietician]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSourceManager" runat="server" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" SelectCommand="SELECT * FROM [Manager]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style4">Typ użytkownika:</td>
                <td class="auto-style10">
                    <asp:DropDownList ID="DropDownListUserType" runat="server" Height="22px" Width="155px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="Manager">Menedżer</asp:ListItem>
                        <asp:ListItem Value="Receptionist">Recepcjonistka</asp:ListItem>
                        <asp:ListItem Value="Coach">Trener</asp:ListItem>
                        <asp:ListItem Value="Dietician">Dietetyk</asp:ListItem>
                        <asp:ListItem Value="Gym_Member">Członek siłowni</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">Nazwa użytkownika:</td>
                <td class="auto-style10">
                    <asp:TextBox ID="TextBoxUserName" runat="server" Height="20px" Width="150px" autocomplete="off"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUserName" ErrorMessage="Podaj nazwę użytkownika!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Hasło:</td>
                <td class="auto-style10">
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" Height="20px" Width="150px" autocomplete="off"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Podaj hasło!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style10">
                    <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click" Text="Zaloguj" Height="20px" style="text-align: right" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
