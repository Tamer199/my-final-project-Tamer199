<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="WebProject.Signin" %>

<%@ import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>
<script runat="server">

  protected void Button1_Click(object sender, EventArgs e)
    {
      
        SqlConnection conn = new SqlConnection();

        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|User.mdf;Integrated Security=True";

           
        
            
        string strSelect = "SELECT * FROM Member "
            + " WHERE Email = '" + Email.Text + "' AND Password = '"
            + Password.Text + "'";


         
        SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

        
        SqlDataReader reader;

        
        conn.Open();

        

        reader = cmdSelect.ExecuteReader();

        if (reader.Read())
            Response.Redirect("~/userhome.aspx");
        else
            lblmsg.Text = "Incorrect Email/Password!";

        
        conn.Close();


    }
    </script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 62%;
            height: 306px;
            background-color: #999999;
        }
        .auto-style2 {
            width: 233px;
        }
        .auto-style3 {
            width: 233px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 220px;
        }
        .auto-style6 {
            width: 220px;
            height: 23px;
        }
        .auto-style7 {
            margin-left: 0px;
        }
        .auto-style8 {
            width: 233px;
            height: 34px;
        }
        .auto-style9 {
            width: 220px;
            height: 34px;
        }
        .auto-style10 {
            height: 34px;
        }
        .auto-style11 {
            width: 233px;
            height: 25px;
        }
        .auto-style12 {
            width: 220px;
            height: 25px;
        }
        .auto-style13 {
            height: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="3">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Monotype Corsiva" Font-Size="XX-Large" ForeColor="#000066" Text="Welcome to Facebook SignIn"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#000066" Text="Please fill the following to Login!!"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td class="auto-style6"></td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="Large" ForeColor="#CC0000" Text="Email : "></asp:Label>
                    </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="Email" runat="server" CssClass="auto-style7" Width="243px"></asp:TextBox>
                    </td>
                    <td class="auto-style10">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" EnableTheming="True" ErrorMessage="invaled Email!" ForeColor="#000066" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style5">
                        <asp:Label ID="Label6" runat="server" Font-Italic="True" Font-Size="X-Small" Text="example@Ex.ex"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="Large" ForeColor="#CC0000" Text="Password :"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="Password" runat="server" CssClass="auto-style7" Width="243px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Password" EnableTheming="True" ErrorMessage="invaled Password!" ForeColor="#000066" ValidationExpression=" *\w{6,13}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblmsg" runat="server" Font-Bold="False" Font-Names="Arial Black" Font-Size="Medium" ForeColor="#000066"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" Font-Size="Large" OnClick="Button1_Click" Text="Login" Width="88px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Red" NavigateUrl="~/Signup.aspx">Create new account?</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Small" Text="For Help contact us!"></asp:Label>
                    </td>
                    <td class="auto-style12">
                        <asp:HyperLink ID="HyperLink3" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Black" NavigateUrl="https://outlook.live.com/owa/">20173797@fue.edu.eg</asp:HyperLink>
                    </td>
                    <td class="auto-style13">&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
