<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="Assignment.order" %>

<asp:Content ID="contentWishlist" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .auto-style1 {
            width: 150px;
            font-family:Georgia, 'Times New Roman', Times, serif;
            font-size:large;
        }
        .txtBox {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .auto-style2 {
            width: 450px;
        }
        .auto-style3 {
            width: 25px;
        }
        .ddl {
            width: 100%;
            padding: 16px 20px;
            border: none;
            border-radius: 4px;
            background-color: #f1f1f1;
        }
        .btn {
            background-color: black;
            border: none;
            color: white;
            padding: 16px 32px;
            text-decoration: none;
            margin: 25px 25px;
            cursor: pointer;
            font-size:large;
            width:25%;
        }
    </style>
        <h1>Order Details</h1>
        <b>Artwork ID: </b>
        <asp:Label ID="lblartID" runat="server"></asp:Label>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
                <ItemTemplate>
                    <div>
                        <img src='data:CarImages/jpg;base64,<%# Eval("awImage") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("awImage")) : string.Empty %>' width="300" height="200" />
                    </div>                    <br /><hr />
                    <b>Artwork Name: </b><%#Eval("awName")%>
                    <br />
                    <b>Artwork Price(unitPrice): </b><asp:Label ID="lblUnitPrice" runat="server" Text=<%# Eval("awPrice", "{0:N2}")%>></asp:Label>
                    <br />
                    <b>Stock Quantity: </b><asp:Label ID="lblMaxQty" runat="server" Text=<%# Eval("stockQty")%>></asp:Label> 
                </ItemTemplate>
        </asp:Repeater>
        <br />
        <b>Quantity: </b><asp:TextBox ID="txtQty" runat="server">1</asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtQty"
                ErrorMessage="Quantity is required"
                Text="*"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
            <asp:RangeValidator ID="rvclass" runat="server" ControlToValidate="txtQty" 
               ErrorMessage="Enter your class (0-maxQty)" MaximumValue="100" 
               MinimumValue="0" Type="Integer" ForeColor="Red" >

            </asp:RangeValidator>
        <br />
        <b>Total Price: </b><asp:Label ID="lblTotal" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Button CssClass="btn" ID="lblCal" runat="server" OnClick="btnCalculate_Click" Text="Calculate" CausesValidation="False" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ArtWork] WHERE ([awID] = @awID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblartID" Name="awID" PropertyName="Text" Type="String" />
            </SelectParameters>
    </asp:SqlDataSource>
        
        <h1>Shipping</h1>
        <table>
            <tr>
                <td class="auto-style1">Full Name</td>
                <td class="auto-style3">:</td>
                <td class="auto-style2"><asp:TextBox CssClass="txtBox" ID="txtName" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtName"
                            ErrorMessage="Full Name is required"
                            Text="*"
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr>
                <td class="auto-style1">Phone Number</td>
                <td class="auto-style3">:</td>
                <td class="auto-style2"><asp:TextBox CssClass="txtBox" ID="txtPhone" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtPhone"
                        ErrorMessage="Phone Number is required"
                        Text="*"
                        ForeColor="Red" >
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ControlToValidate="txtPhone"
                        ErrorMessage="Phone number format should be 10 or 11 digits"
                        ValidationExpression="[0-9]{10,11}"
                        ForeColor="Red"
                        Text="*">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Email address</td>
                <td class="auto-style3">:</td>
                <td class="auto-style2"><asp:TextBox CssClass="txtBox" ID="txtEmail" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email Address is required"
                        Text="*"
                        ForeColor="Red"
                        ValidationGroup="ValidataGroup1" >
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email format is incorrect"
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ForeColor="Red"
                        Text="*">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Addresses</td>
                <td class="auto-style3">:</td>
                <td class="auto-style2"><asp:TextBox CssClass="txtBox" ID="txtAddress" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtAddress"
                            ErrorMessage="Address is required"
                            Text="*"
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">State</td>
                <td class="auto-style3">:</td>
                <td class="auto-style2">
                    <asp:DropDownList CssClass="ddl" ID="ddlState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                    <asp:ListItem>Johor</asp:ListItem>
                    <asp:ListItem>Kedah</asp:ListItem>
                    <asp:ListItem>Kelantan</asp:ListItem>
                    <asp:ListItem>Melaka</asp:ListItem>
                    <asp:ListItem>Negeri Sembilan</asp:ListItem>
                    <asp:ListItem>Pahang</asp:ListItem>
                    <asp:ListItem>Pulau Pinang</asp:ListItem>
                    <asp:ListItem>Perak</asp:ListItem>
                    <asp:ListItem>Perlis</asp:ListItem>
                    <asp:ListItem>Sabah</asp:ListItem>
                    <asp:ListItem>Sarawak</asp:ListItem>
                    <asp:ListItem>Selangor</asp:ListItem>
                    <asp:ListItem>Terengganu</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">City</td>
                <td class="auto-style3">:</td>
                <td class="auto-style2"><asp:DropDownList CssClass="ddl" ID="ddlCity" runat="server">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td class="auto-style1">Post Code</td>
                <td class="auto-style3">:</td>
                <td class="auto-style2"><asp:TextBox CssClass="txtBox" ID="txtPostCode" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtPostCode"
                            ErrorMessage="Post Code is required"
                            Text="*"
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                        ControlToValidate="txtPostCode"
                        ErrorMessage="Post Vode should be 5 digits"
                        ValidationExpression="[0-9]{5}"
                        ForeColor="Red"
                        Text="*">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr style="text-align:center">
                <td colspan="3">
                    <asp:Button CssClass="btn" ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CausesValidation="False" />
                    <asp:Button CssClass="btn" ID="Cancel" runat="server" Text="Cancel" PostBackUrl="~/homepage.aspx" CausesValidation="False" />
                    <asp:Button CssClass="btn" BackColor="Blue" ID="btnOrder" runat="server" Text="Order" OnClick="btnOrder_Click"/>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            DisplayMode ="BulletList"  ShowMessageBox="true" ShowSummary="false" 
            HeaderText="The following problems have been encountered:" />
</asp:Content>
