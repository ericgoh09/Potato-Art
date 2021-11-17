<%@ Page Language="C#" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="true" CodeBehind="SignupCust.aspx.cs" Inherits="part1.SignupCust" %>

<asp:Content ID="ContentSignupCust" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">

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
                        <u><asp:Label ID="loginTitle" runat="server" Text="Customer Details"></asp:Label></u>
                    </th>
                </tr>

                <tr>
                    <td class="auto-style5"></td><td class="auto-style7">
                    </td><td class="auto-style6"></td><td class="auto-style5"></td>
                </tr>

                <tr>
                    <td class="auto-style5"></td><td class="auto-style6">
                    <asp:Label ID="Label4" runat="server" Text="Display Name: "></asp:Label>
                    </td><td class="auto-style6">
                        <asp:TextBox ID="txtCustName" runat="server" Width="95%"></asp:TextBox>
                    </td><td class="auto-style5">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustName" ErrorMessage="Display name is required." ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style3"></td><td class="auto-style9"></td><td class="auto-style1"></td><td class="auto-style3"></td>
                </tr>

                <tr>
                    <td class="auto-style5"></td><td class="auto-style7">
                        <asp:Label ID="Label1" runat="server" Text="Gender: "></asp:Label>
                    </td><td class="auto-style6">
                        <asp:RadioButtonList ID="rblCustGender" runat="server">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td><td class="auto-style5">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rblCustGender" ErrorMessage="Gender is required." ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8"></td><td>

                    &nbsp;</td><td class="auto-style2"></td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8">
                        <asp:Label ID="Label2" runat="server" Text="Phone No: "></asp:Label>
                        (optional)</td><td>
                        <asp:Label ID="Label3" runat="server" Text="(+60)"></asp:Label><asp:TextBox ID="txtCustPhone" runat="server" Width="80%"></asp:TextBox>
                    </td><td class="auto-style2">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Malaysia phone number only. (+60)xx-xxxxxxx OR (+60)xx-xxxxxxxx ." ForeColor="Red" ControlToValidate="txtCustPhone" ValidationExpression="\d{2}-\d{7,8}">*</asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style3"></td><td class="auto-style9"></td><td class="auto-style1">
                    &nbsp;</td><td class="auto-style3"></td>
                </tr>

                <tr>
                    <td class="auto-style3">&nbsp;</td><td class="auto-style1" colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Problem(s) encountered as stated below: " ForeColor="Red"/>
                    </td><td class="auto-style3">&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8"></td><td>
                    <asp:Button ID="conSignupBtn" runat="server" Text="Confirm SignUp" style="float:right"  Width="140px" Height="100%" OnClick="conSignupBtn_Click" Font-Bold="True"/>
                    </td><td class="auto-style2"></td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td colspan="2">
                    </td><td class="auto-style2"></td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
                    </td><td></td><td class="auto-style2"></td>
                </tr>

            </table>

        </div>

</asp:Content>

