<%@ Page Language="C#" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="part_1.Signup" %>

<asp:Content ID="ContentSignup" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">

    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            width: 45px;
        }
        .auto-style3 {
            height: 26px;
            width: 45px;
        }
        .auto-style4 {
            width: 490px;
            height: 307px;
        }
        .auto-style5 {
            width: 45px;
            height: 29px;
        }
        .auto-style6 {
            height: 29px;
        }
        .auto-style7 {
            height: 29px;
            width: 100px;
        }
        .auto-style8 {
            width: 100px;
        }
        .auto-style9 {
            height: 26px;
            width: 100px;
        }
    </style>

        <div>

            <table class="auto-style4" border="0" style="background-color: #C0C0C0">

                <tr>
                    <th colspan="4">
                        <u><asp:Label ID="loginTitle" runat="server" Text="SIGNUP"></asp:Label></u>
                    </th>
                </tr>

                <tr>
                    <td class="auto-style5"></td><td class="auto-style7">
                    </td><td class="auto-style6"></td><td class="auto-style5"></td>
                </tr>

                <tr>
                    <td class="auto-style5"></td><td class="auto-style6" colspan="2">
                    <asp:DropDownList ID="ddlSignupUser" runat="server" Width="100%" Height="100%" Font-Bold="True" Font-Overline="False" Font-Size="Medium">
                        <asp:ListItem Value="ArtistAcc">I am an Artist</asp:ListItem>
                        <asp:ListItem Value="CustomerAcc">I am a Customer</asp:ListItem>
                    </asp:DropDownList>
                    </td><td class="auto-style5"></td>
                </tr>

                <tr>
                    <td class="auto-style3"></td><td class="auto-style9"></td><td class="auto-style1"></td><td class="auto-style3"></td>
                </tr>

                <tr>
                    <td class="auto-style5"></td><td class="auto-style7">
                        <asp:Label ID="Label1" runat="server" Text="Email: "></asp:Label>
                    </td><td class="auto-style6">
                        <asp:TextBox ID="txtSignupEmail" runat="server" Width="95%"></asp:TextBox>
                    </td><td class="auto-style5">

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is required." ControlToValidate="txtSignupEmail" ForeColor="Red" ValidationGroup="SignupValidation">*</asp:RequiredFieldValidator>
                         </td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8"></td><td>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email format is invalid." ForeColor="Red" ControlToValidate="txtSignupEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="SignupValidation"></asp:RegularExpressionValidator>
                        </td><td class="auto-style2"></td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8">
                        <asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>
                    </td><td>
                        <asp:TextBox ID="txtSignupPassword" runat="server" Width="95%"></asp:TextBox>
                    </td><td class="auto-style2">

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required." ControlToValidate="txtSignupPassword" ForeColor="Red" ValidationGroup="SignupValidation">*</asp:RequiredFieldValidator>
                        </td>
                </tr>

                <tr>
                    <td class="auto-style3"></td><td class="auto-style9"></td><td class="auto-style1">

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password must be at lease 6 characters." ControlToValidate="txtSignupPassword" ValidationExpression="\w{6}" ForeColor="Red" ValidationGroup="SignupValidation"></asp:RegularExpressionValidator>
                        </td><td class="auto-style3"></td>
                </tr>

                <tr>
                    <td class="auto-style3">&nbsp;</td><td class="auto-style1">
                        <asp:Label ID="Label4" runat="server" Text="Confirm Password: "></asp:Label>
                    </td><td class="auto-style1">
                        <asp:TextBox ID="txtSignupConPassword" runat="server" Width="95%"></asp:TextBox>
                    </td><td class="auto-style3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSignupConPassword" ErrorMessage="Confirm Password is required." ForeColor="Red" ValidationGroup="SignupValidation">*</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style3">&nbsp;</td><td class="auto-style1">
                    &nbsp;</td><td class="auto-style1">

                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtSignupPassword" ControlToValidate="txtSignupConPassword" ErrorMessage="Both password must be the same." ForeColor="Red" ValidationGroup="SignupValidation"></asp:CompareValidator>
                        </td><td class="auto-style3">&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8"></td><td>
                    <asp:Button ID="signupBtn" runat="server" Text="SignUp Now!" style="float:right"  Width="110px" Height="100%" OnClick="signupBtn_Click" Font-Bold="True" ValidationGroup="SignupValidation"/>
                    </td><td class="auto-style2"></td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td colspan="2">
                    <asp:Label ID="Label3" runat="server" Text="Already have an account? "></asp:Label>
                    <asp:LinkButton ID="signinLinkBtn" runat="server" PostBackUrl="~/Login.aspx">Sign In!</asp:LinkButton>
                    </td><td class="auto-style2"></td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artist]"></asp:SqlDataSource>
                    </td><td>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
                    </td><td class="auto-style2"></td>
                </tr>

            </table>

        </div>

</asp:Content>