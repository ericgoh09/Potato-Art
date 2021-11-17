<%@ Page Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Assignment.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">

            <table class="auto-style4" border="0" style="background-color: #C0C0C0; width:60%; margin-left:auto; margin-right:auto;">

                <tr>
                    <th colspan="8">
                        <u><asp:Label ID="profileTitle" runat="server" Text="YOUR PROFILE"></asp:Label></u>
                    </th>
                </tr>

                <tr>
                    <td class="auto-style5" colspan="8"></td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8" colspan="2">
                        &nbsp;</td><td class="auto-style8" colspan="2" style="text-align:center">
                        <asp:Image ID="ArtistImage" runat="server" />
                            <img src="Image/defaultImg.png" height="100px" width="100px"/>
                    </td><td class="auto-style8" colspan="2">
                        &nbsp;</td><td class="auto-style2">
                        &nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style2">
                        </td><td class="auto-style2" colspan="4" style="text-align:center">
                            <u><asp:Label ID="Label9" runat="server" Text="Display Picture"></asp:Label></u>    
                    </td><td class="auto-style2">
                        </td><td class="auto-style2">
                        </td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style2">
                        </td><td class="auto-style2" colspan="4" style="text-align:center">
                            <asp:FileUpload ID="fuImage" runat="server" accept=".png, .jpg, .jpeg, .gif"/> 
                    </td><td class="auto-style2">
                        </td><td class="auto-style2">
                        </td>
                </tr>

                <tr>
                    <td class="auto-style5" colspan="8">&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8" colspan="3">
                        <asp:Label ID="Label5" runat="server" Text="ID: "></asp:Label>
                    </td><td class="auto-style10" colspan="3">
                        <asp:Label ID="lblID" runat="server" Text=""></asp:Label>
                    </td><td class="auto-style2">
                        
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8" colspan="3">
                        <asp:Label ID="Label4" runat="server" Text="Email: "></asp:Label>
                    </td><td class="auto-style10" colspan="3">
                        <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                    </td><td class="auto-style2">
                        &nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style2" colspan="3">
                        <asp:Label ID="Label6" runat="server" Text="Gender: "></asp:Label>
                    </td><td class="auto-style2" colspan="3">
                        <asp:Label ID="lblGender" runat="server" Text=""></asp:Label>
                    </td><td class="auto-style2">
                        &nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8" colspan="3">
                        <asp:Label ID="Label8" runat="server" Text="Description: "></asp:Label>
                    </td><td class="auto-style10" colspan="3">
                        &nbsp;</td><td class="auto-style2">
                        &nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style2">&nbsp;</td><td colspan="6">
                        <asp:TextBox ID="txtProfileDesc" runat="server" Width="100%"></asp:TextBox>
                    </td><td class="auto-style2">
                        &nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style2" colspan="3">
                        </td><td class="auto-style2" colspan="3">
                        </td><td class="auto-style2">
                        </td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style8" colspan="3">
                        <asp:Label ID="Label7" runat="server" Text="Name: "></asp:Label>
                    </td><td class="auto-style10" colspan="3">
                        <asp:TextBox ID="txtProfileName" runat="server" Width="95%" ></asp:TextBox>
                    </td><td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProfileName" ErrorMessage="Name is required." ForeColor="Red" ValidationGroup="SaveValidation">*</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style1" colspan="3">
                        <asp:Label ID="Label2" runat="server" Text="Phone No: (optional)"></asp:Label>
                    </td><td class="auto-style10" colspan="3">
                        <asp:Label ID="Label3" runat="server" Text="(+60) "></asp:Label>
                        <asp:TextBox ID="txtArtistPhone" runat="server" Width="95%"></asp:TextBox>
                    </td><td class="auto-style2">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Malaysia phone number only. (+60)xx-xxxxxxx OR (+60)xx-xxxxxxxx ." ForeColor="Red" ControlToValidate="txtArtistPhone" ValidationExpression="\d{2}-\d{7,8}">*</asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">&nbsp;</td><td class="auto-style1" colspan="3">
                        &nbsp;</td><td class="auto-style10" colspan="3">
                        &nbsp;</td><td class="auto-style2">
                        &nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style1" colspan="3">
                        &nbsp;</td><td class="auto-style10" colspan="3">
                    <asp:Button ID="saveBtn1" runat="server" Text="Save" style="float:right" Width="80px" Height="100%" Font-Bold="True" ValidationGroup="SaveValidation" OnClick="saveBtn_Click"/>
                    </td><td class="auto-style2">
                        &nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style2">&nbsp;</td><td class="auto-style1" colspan="3">
                        &nbsp;</td><td class="auto-style10" colspan="3">
                        &nbsp;</td><td class="auto-style2">
                        &nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style2"></td>
                    <td colspan="6" style="text-align:center">
                        <asp:ChangePassword ID="ChangePassword1" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" OnChangedPassword="ChangePassword1_ChangedPassword">
                            <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
                        </asp:ChangePassword>
                    </td><td class="auto-style2"></td>
                </tr>

                <tr>
                    <td class="auto-style2"></td><td class="auto-style1" colspan="3"></td><td class="auto-style10" colspan="3">
                    &nbsp;</td><td class="auto-style2"></td>
                </tr>

                <tr>
                    <td class="auto-style3"></td><td class="auto-style1" colspan="3"></td><td class="auto-style1" colspan="3"></td><td class="auto-style3"></td>
                </tr>

                </table>

</asp:Content>





<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 349px;
        }
        .auto-style2 {
            height: 29px;
        }
    </style>
</asp:Content>
