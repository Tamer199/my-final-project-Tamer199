<%@ Page Language="C#" %>
<%@ import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection();

        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|User.mdf;Integrated Security=True";





        string strInsert = "INSERT INTO  Member" +
          " VALUES('" + Fname.Text + "', '"
           + Lname.Text + "', '"
          + Email.Text + "', '"
          + password.Text + "', '"
          + Cpassword.Text + "', '"
          + phone.Text + "', '"
          + rblgender.SelectedValue + "')";
          
          


        // 3- Create SQL Command
        SqlCommand cmdInsert = new SqlCommand(strInsert, conn);        try        {

            //  int x = 0, y = 0, z;
            // z = x / y;


            // 4- Open the database
            conn.Open();

            // 5- Execute SQL Command
            cmdInsert.ExecuteNonQuery();

            // 6- Close the database
            conn.Close();


            lblmsg.Text = "Welcome " + Fname.Text + ", Your Account has been Successfully Created!!";        }        catch (SqlException err)        {            if (err.Number == 2627)                lblmsg.Text = "The Email " + Email.Text + " already used, Please Choose another !!";            else                lblmsg.Text = "Sorry, database problem, please try later !!";        }        catch        {            lblmsg.Text = "Sorry,the system is not available at the moment, you may try later !!";        }

    }





    
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color: #999999;
        }
        .auto-style2 {
            width: 142px;
        }
        .auto-style3 {
            width: 160px;
        }
        .auto-style4 {
            width: 133px;
        }
    </style>
</head>
<body style="width: 791px; height: 309px">
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="4">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Monotype Corsiva" Font-Size="XX-Large" ForeColor="#000066" Text="Welcome to Facebook SignUp"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="Large" ForeColor="#CC0000" Text="First name :"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="Fname" runat="server" BackColor="White" Width="207px"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Fname" ErrorMessage="Required Field!" ForeColor="#000066"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Fname" EnableTheming="True" ErrorMessage="invaled First name!" ForeColor="#000066" ValidationExpression="([A-Z][a-z]*\s[A-Z][a-z]*)|([A-Z][a-z]*)"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="Large" ForeColor="#CC0000" Text="Last name :"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="Lname" runat="server" BackColor="White" Width="207px"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Lname" ErrorMessage="Required Field!" ForeColor="#000066"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Lname" EnableTheming="True" ErrorMessage="invaled Last name!" ForeColor="#000066" ValidationExpression="([A-Z][a-z]*\s[A-Z][a-z]*)|([A-Z][a-z]*)"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="Large" ForeColor="#CC0000" Text="Email :"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="Email" runat="server" BackColor="White" Width="207px"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Email" ErrorMessage="Required Field!" ForeColor="#000066"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Email" EnableTheming="True" ErrorMessage="invaled Email!" ForeColor="#000066" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="Large" ForeColor="#CC0000" Text="Password :"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="password" runat="server" BackColor="White" Width="207px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="password" ErrorMessage="Required Field!" ForeColor="#000066"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="password" EnableTheming="True" ErrorMessage="invaled Password!" ForeColor="#000066" ValidationExpression=" *\w{6,13}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="Large" ForeColor="#CC0000" Text="Confirm Password :"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="Cpassword" runat="server" BackColor="White" Width="207px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Cpassword" ErrorMessage="Required Field!" ForeColor="#000066"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="Cpassword" ErrorMessage="Don't Match!" ForeColor="#000066"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="Large" ForeColor="#CC0000" Text="Phone :"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="phone" runat="server" BackColor="White" Width="207px"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="phone" ErrorMessage="Required Field!" ForeColor="#000066"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="Large" ForeColor="#CC0000" Text="Gender :"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:RadioButtonList ID="rblgender" runat="server" Font-Italic="True" ForeColor="#000066" RepeatDirection="Horizontal" Width="241px">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="rblgender" ErrorMessage="Required Field!" ForeColor="#000066"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        &nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" Font-Names="Arial Black" Font-Size="Medium" Font-Strikeout="False" ForeColor="#000066" Height="35px" OnClick="Button1_Click" Text="Submit" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Monotype Corsiva" Font-Size="X-Large" ForeColor="#000066"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
