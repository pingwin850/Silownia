<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Silownia.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Siłownia</title>

    <link rel="Shortcut icon" href="images/gym_icon.png" />
    <link type="text/css" href="css/main.css" rel="stylesheet" />

    <style>
        a:link, a:visited {
            background-color: black;
            color: white;
            padding: 14px 25px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }


        a:hover, a:active {
            background-color: white;
            color: black;
        }
    </style>

    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
            text-align: center;
        }

        .auto-style2 {
            width: 100%;
        }

        .auto-style3 {
            width: 270px;
        }

        .auto-style4 {
            width: 270px;
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
            width: 137px;
        }

        .auto-style11 {
            width: 270px;
            text-align: right;
        }

        .auto-style12 {
            font-size: large;
        }

        .auto-style13 {
            font-size: medium;
        }

        .auto-style14 {
            width: 270px;
            height: 22px;
        }

        .auto-style15 {
            width: 137px;
            height: 22px;
        }

        .auto-style16 {
            height: 22px;
        }

        .auto-style17 {
            width: 270px;
            height: 31px;
        }

        .auto-style18 {
            width: 137px;
            height: 31px;
        }

        .auto-style19 {
            height: 31px;
        }

        .auto-style20 {
            font-size: xx-large;
        }
    </style>
</head>
<body style="background-image: url('images/background2.jpg')">
    <form id="form1" runat="server">
        <div class="auto-style1">

            <table class="auto-style2">
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
                <td class="auto-style4">
                    <a href="Album/Silownia/album/index.html"><strong><span class="auto-style20">Grafika</span></strong></a>
                    &nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14"></td>
                <td class="auto-style15"></td>
                <td class="auto-style16"></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>
                    <asp:Label ID="Label1" runat="server" CssClass="auto-style12" ForeColor="White" Text="Typ użytkownika:"></asp:Label>
                </strong></td>
                <td class="auto-style10">
                    <asp:DropDownList ID="DropDownListUserType" runat="server" Height="22px" Width="200px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="auto-style13">
                        <asp:ListItem Value="Manager">Menedżer</asp:ListItem>
                        <asp:ListItem Value="Receptionist">Recepcjonistka</asp:ListItem>
                        <asp:ListItem Value="Coach">Trener</asp:ListItem>
                        <asp:ListItem Value="Dietician">Dietetyk</asp:ListItem>
                        <asp:ListItem Value="Gym_Member">Członek siłowni</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>
                    <asp:Label ID="Label2" runat="server" CssClass="auto-style12" ForeColor="White" Text="Nazwa użytkownika:"></asp:Label>
                </strong></td>
                <td class="auto-style10">
                    <asp:TextBox ID="TextBoxUserName" runat="server" Height="20px" Width="195px" autocomplete="off" CssClass="auto-style13"></asp:TextBox>
                </td>
                <td><strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUserName" ErrorMessage="Podaj nazwę użytkownika!" ForeColor="Red" CssClass="auto-style12"></asp:RequiredFieldValidator>
                </strong></td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>
                    <asp:Label ID="Label3" runat="server" CssClass="auto-style12" ForeColor="White" Text="Hasło:"></asp:Label>
                </strong></td>
                <td class="auto-style10">
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" Height="20px" Width="195px" autocomplete="off" CssClass="auto-style13"></asp:TextBox>
                </td>
                <td><strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Podaj hasło!" ForeColor="Red" CssClass="auto-style12"></asp:RequiredFieldValidator>
                </strong></td>
            </tr>
            <tr>
                <td class="auto-style17"></td>
                <td class="auto-style18">
                    <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click" Text="Zaloguj" Height="29px" Style="text-align: right" CssClass="auto-style12" />
                </td>
                <td class="auto-style19"></td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
