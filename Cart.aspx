<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Assignment.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-weight: normal;
        }
        .orderButton {
            background-color: #000000;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            margin: 4px 2px;
            cursor: pointer;
        }
        .orderButton:hover {
            background-color: #FFFFFF;
            color: black;
            border: 2px solid #000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="auto-style1"><strong>My Chart</strong></h1>
            <br />
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <HeaderTemplate >
                    <table border="1" style="width:100%">
                        <tr>
                            <th style="width:25%">Image</th>
                            <th style="width:75%">Details</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                        <tr>
                            <th><%#Eval("awImage")%></th>
                            <th  style="text-align:left"><%#Eval("awName")%><br /><%#Eval("awPrice")%></th>
                        </tr>
                </ItemTemplate>
                <FooterTemplate>
                        <tr>
                            <th>SUBTOTAL (RM): </th>
                            <th style="text-align:left"><asp:Label ID="lblSubTotal" runat="server"></asp:Label></th>
                        </tr>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [awImage], [awName], [awPrice] FROM [ArtWork]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
            <br />
            <div style="text-align:center">
                <asp:Button CssClass="orderButton" ID="btnOrder" runat="server" Text="Order/Checkout"  />
            </div>
        </div>
    </form>
</body>
</html>
