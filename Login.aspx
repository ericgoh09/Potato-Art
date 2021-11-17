<%@ Page Language="C#" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="part1.Login" %>

<asp:Content ID="ContentLogin" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">

    <style type="text/css">
        .auto-style1 {
            height: 26px;
            width: 150px;
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
        .auto-style7 {
            height: 29px;
            width: 150px;
        }
        .auto-style8 {
            width: 100px;
        }
        .auto-style9 {
            height: 26px;
            width: 100px;
        }
        .auto-style10 {
            width: 150px;
        }
    </style>

        <div>

            <table class="auto-style4" border="0" style="background-color: #C0C0C0">

                <tr>
                    <th colspan="4">
                        <u><asp:Label ID="loginTitle" runat="server" Text="LOGIN"></asp:Label></u>
                    </th>
                </tr>

                <tr>
                    <td class="auto-style5" colspan="2"></td><td class="auto-style7"></td><td></td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8">
                        <asp:Label ID="Label1" runat="server" Text="Email: "></asp:Label>
                    </td><td class="auto-style10">
                        <asp:TextBox ID="txtLoginEmail" runat="server" Width="95%"></asp:TextBox>
                    </td><td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLoginEmail" ErrorMessage="Email is required." ForeColor="Red" ValidationGroup="LoginValidation">*</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8"></td><td class="auto-style10">

                    

                    </td><td class="auto-style2"></td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8">
                        <asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>
                    </td><td class="auto-style10">
                        <asp:TextBox ID="txtLoginPassword" runat="server" Width="95%"></asp:TextBox>
                    </td><td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLoginPassword" ErrorMessage="Password is required." ForeColor="Red" ValidationGroup="LoginValidation">*</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style3"></td><td class="auto-style9"></td><td class="auto-style1">

                    &nbsp;</td><td class="auto-style3"></td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8"></td><td class="auto-style10">
                    <asp:Button ID="loginBtn" runat="server" Text="Login" style="float:right" Width="80px" Height="100%" Font-Bold="True" OnClick="loginBtn_Click" ValidationGroup="LoginValidation"/>
                    </td><td class="auto-style2"></td>
                </tr>

                <tr>
                    <td class="auto-style3"></td><td class="auto-style9"></td><td class="auto-style1"></td><td class="auto-style3"></td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td colspan="2">
                    <asp:Label ID="Label3" runat="server" Text="Don't have an account yet? "></asp:Label>
                    <asp:LinkButton ID="signupLinkBtn" runat="server" PostBackUrl="~/Signup.aspx" >SignUp!</asp:LinkButton>
                    </td><td class="auto-style2"></td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8">&nbsp;</td><td class="auto-style10"></td><td class="auto-style2"></td>
                </tr>

            </table>

        </div>

</asp:Content>
