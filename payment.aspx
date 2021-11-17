<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="Assignment.payment" %>

<asp:Content ID="contentWishlist" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .auto-style1 {
            width: 250px;
            font-family: Georgia, 'Times New Roman', Times, serif;
            font-size: large;
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
            width: 379px;
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
        .auto-style4 {
            width: 250px;
            font-family: Georgia, 'Times New Roman', Times, serif;
            font-size: large;
            height: 31px;
        }
        .auto-style5 {
            width: 25px;
            height: 31px;
        }
        .auto-style6 {
            width: 379px;
            height: 31px;
        }
        .auto-style7 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding: 16px 20px;
            border-radius: 4px;
            background-color: #f1f1f1;
        }
        .auto-style8 {
            height: 243px;
        }
        </style>
    <h1>Order Information</h1>
    
    <p style="font-size:x-large">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <b>Order ID: </b><%#Eval("orderID")%><br />
                <b>Order Date: </b><%#Eval("OrderDate")%><br />
                <b>Ship Phone: </b><%#Eval("ShipPhone")%><br />
                <b>Ship Email: </b><%#Eval("ShipEmail")%><br />
                <b>Ship Address: </b><%#Eval("ShipAddress")%><br />
                <b>Ship State: </b><%#Eval("ShipState")%><br />
                <b>Ship City: </b><%#Eval("ShipCity")%><br />
            </ItemTemplate>
        </asp:Repeater>
        <br />
        <b>Total Price: </b> 
        <asp:Label style="font-size:x-large" ID="lbltotalPrice" runat="server"></asp:Label>
    </p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT orders.orderID, OrderDetail.awID, OrderDetail.qty, OrderDetail.unitPrice, orders.OrderDate, orders.ShipPhone, orders.ShipEmail, orders.ShipAddress, orders.ShipState, orders.ShipCity 
FROM orders INNER JOIN OrderDetail ON orders.orderID = OrderDetail.orderID 
WHERE (orders.orderID = @orderID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="orderID" QueryStringField="orderID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <h1>Payment Setup</h1>
    <table>
        <tr>
            <td class="auto-style1">Account Name</td>
            <td class="auto-style3">:</td>
            <td class="auto-style2"><asp:TextBox CssClass="txtBox" ID="txtAccName" runat="server" ></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtAccName"
                        ErrorMessage="Account Name is required"
                        Text="*"
                        ForeColor="Red">
                </asp:RequiredFieldValidator>
            </td>

        </tr>
        <tr>
            <td class="auto-style1">Account Number</td>
            <td class="auto-style3">:</td>
            <td class="auto-style2"><asp:TextBox CssClass="txtBox" ID="txtAccNo" runat="server"></asp:TextBox>
                <br />Format: XXXX-XXXX-XXXX-XXXX
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtAccNo"
                    ErrorMessage="Account Number is required"
                    Text="*"
                    ForeColor="Red" >
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ControlToValidate="txtAccNo"
                    ErrorMessage="Account Number should be 16 digits"
                    ValidationExpression="\d{4}-\d{4}-\d{4}-\d{4}"
                    ForeColor="Red"
                    Text="*">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">CVV</td>
            <td class="auto-style3">:</td>
            <td class="auto-style2"><asp:TextBox CssClass="txtBox" ID="txtCVV" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtAccNo"
                    ErrorMessage="CVV Number is required"
                    Text="*"
                    ForeColor="Red" >
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                    ControlToValidate="txtCVV"
                    ErrorMessage="CVV Number should be 3 digits"
                    ValidationExpression="\d{3}"
                    ForeColor="Red"
                    Text="*">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="4">Bank</td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style8">                
                <asp:RadioButtonList ID="rbtnBank" runat="server">
                    <asp:listitem Selected="True" Value="MayBank" Text='<img src="../Image/MayBank.png" alt="MayBank" width="225" height="75" style="vertical-align:middle"/>'></asp:listitem>
                    <asp:listitem Value="CIMB Bank" Text='<img src="../Image/cimb bank.jpg" alt="CIMB Bank"  width="225" height="75" style="vertical-align:middle"/>'></asp:listitem>
                    <asp:listitem Value="PUBLIC Bank" Text='<img src="../Image/pbelogo.gif" alt="PUBLIC Bank"  width="225" height="75" style="vertical-align:middle"/>'></asp:listitem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Valid Until</td>
            <td class="auto-style5">:</td>
            <td class="auto-style6">
                <asp:DropDownList CssClass="auto-style7" ID="ddlMonth" runat="server" Width="227px">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2	</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:DropDownList CssClass="auto-style7" ID="ddlYear" runat="server" Width="228px" >
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="text-align:center">
            <td colspan="4">
                <asp:Button CssClass="btn" ID="btnClear" runat="server" Text="Clear" CausesValidation="False" OnClick="btnClear_Click"/>
                <asp:Button CssClass="btn" ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CausesValidation="False"/>
                <asp:Button CssClass="btn" BackColor="Blue" ID="btnPay" runat="server" Text="Pay" OnClick="btnPay_Click"/>
            </td>
        </tr>
        </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        DisplayMode ="BulletList"  ShowMessageBox="true" ShowSummary="false" 
        HeaderText="The following problems have been encountered:" />
    <asp:Label ID="labelmsg" runat="server"></asp:Label>
</asp:Content>
