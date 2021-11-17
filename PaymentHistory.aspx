<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="PaymentHistory.aspx.cs" Inherits="Assignment.PaymentHistory" %>

<asp:Content ID="contentWishlist" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .tableAttrb {
            font-family: cursive;
            font-size: medium;
        }

        .title {
            font-family: curse;
            font-size: x-large;
            text-align: center;
        }

        .blueButton {
	        box-shadow: 0px 1px 0px 0px #f0f7fa;
	        background:linear-gradient(to bottom, #33bdef 5%, #019ad2 100%);
	        background-color:#33bdef;
	        border-radius:6px;
	        border:1px solid #057fd0;
	        display:inline-block;
	        cursor:pointer;
	        color:#ffffff;
	        font-family:cursive;
	        font-size:medium;
	        font-weight:bold;
	        padding:6px 12px;
	        text-decoration:none;
	        text-shadow:0px -1px 0px #5b6178;
        }

        .blueButton:hover {
	        background:linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
	        background-color:#019ad2;
        }

        .blueButton:active {
	        position:relative;
	        top:1px;
        }

        .greenButton {
	        box-shadow:inset 0px 1px 0px 0px #caefab;
	        background:linear-gradient(to bottom, #77d42a 5%, #8ea17e 100%);
	        background-color:#77d42a;
	        border-radius:6px;
	        border:1px solid #268a16;
	        display:inline-block;
	        cursor:pointer;
	        color:#306108;
	        font-family:cursive;
	        font-size:15px;
	        font-weight:bold;
	        padding:6px 24px;
	        text-decoration:none;
	        text-shadow:0px 1px 0px #aade7c;
        }

        .greenButton:hover {
	        background:linear-gradient(to bottom, #8ea17e 5%, #77d42a 100%);
	        background-color:#8ea17e;
        }

        .greenButton:active {
	        position:relative;
	        top:1px;
        }
    </style>

    <div>
            <table>
                <tr>
                    <td colspan="5" style="text-align:center; font-size:x-large" class="auto-style1"><b>Payment History</b></td>
                </tr>

                <tr>
                    <td colspan="5">
                        <asp:ListView ID="HistoryListView" runat="server" DataSourceID="SqlHistorySource">
                            <AlternatingItemTemplate>
                                <tr class="tableAttrb" style="background-color:#23f791;">
                                    <td>
                                        <asp:Label ID="orderIDLabel" runat="server" Text='<%# Eval("orderID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="paymentDateLabel" runat="server" Text='<%# Eval("paymentDate") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="awNameLabel" runat="server" Text='<%# Eval("awName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="awDescriptionLabel" runat="server" Text='<%# Eval("awDescription") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="awPriceLabel" runat="server" Text='<%# Eval("awPrice") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="categoryNameLabel" runat="server" Text='<%# Eval("categoryName") %>' />
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <tr style="background-color:#008A8C;color: #FFFFFF;">
                                    <td>
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="orderIDTextBox" runat="server" Text='<%# Bind("orderID") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="paymentDateTextBox" runat="server" Text='<%# Bind("paymentDate") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="awNameTextBox" runat="server" Text='<%# Bind("awName") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="awDescriptionTextBox" runat="server" Text='<%# Bind("awDescription") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="awPriceTextBox" runat="server" Text='<%# Bind("awPrice") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="categoryNameTextBox" runat="server" Text='<%# Bind("categoryName") %>' />
                                    </td>
                                </tr>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                    <tr>
                                        <td>No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <tr style="">
                                    <td>
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="orderIDTextBox" runat="server" Text='<%# Bind("orderID") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="paymentDateTextBox" runat="server" Text='<%# Bind("paymentDate") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="awNameTextBox" runat="server" Text='<%# Bind("awName") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="awDescriptionTextBox" runat="server" Text='<%# Bind("awDescription") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="awPriceTextBox" runat="server" Text='<%# Bind("awPrice") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="categoryNameTextBox" runat="server" Text='<%# Bind("categoryName") %>' />
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <tr class="tableAttrb" style="background-color:#aef2d2;color: #000000;">
                                    <td>
                                        <asp:Label ID="orderIDLabel" runat="server" Text='<%# Eval("orderID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="paymentDateLabel" runat="server" Text='<%# Eval("paymentDate") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="awNameLabel" runat="server" Text='<%# Eval("awName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="awDescriptionLabel" runat="server" Text='<%# Eval("awDescription") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="awPriceLabel" runat="server" Text='<%# Eval("awPrice") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="categoryNameLabel" runat="server" Text='<%# Eval("categoryName") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr runat="server" class="tableAttrb" style="background-color:#DCDCDC;color: #000000;">
                                                    <th runat="server">Order ID</th>
                                                    <th runat="server">Payment Date</th>
                                                    <th runat="server">Artwork Name</th>
                                                    <th runat="server">Artwork Description</th>
                                                    <th runat="server">Artwork Price</th>
                                                    <th runat="server">Category Name</th>
                                                </tr>
                                                <tr id="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="text-align: center;background-color:#18f0e5; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                            <asp:DataPager ID="DataPager1" runat="server">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="blueButton" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                                    <td>
                                        <asp:Label ID="orderIDLabel" runat="server" Text='<%# Eval("orderID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="paymentDateLabel" runat="server" Text='<%# Eval("paymentDate") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="awNameLabel" runat="server" Text='<%# Eval("awName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="awDescriptionLabel" runat="server" Text='<%# Eval("awDescription") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="awPriceLabel" runat="server" Text='<%# Eval("awPrice") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="categoryNameLabel" runat="server" Text='<%# Eval("categoryName") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:SqlDataSource ID="SqlHistorySource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT payment.orderID, payment.paymentDate, ArtWork.awName, ArtWork.awDescription, ArtWork.awPrice, Categories.categoryName FROM payment INNER JOIN orders ON payment.orderID = orders.orderID INNER JOIN OrderDetail ON orders.orderID = OrderDetail.orderID INNER JOIN ArtWork ON OrderDetail.awID = ArtWork.awID INNER JOIN Categories ON ArtWork.categoryID = Categories.categoryID WHERE payment.custID = @custID">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="custID" PropertyName="Text" />

                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>

                <tr>
                    <td><asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label></td>
                </tr>
            </table>
        </div>
</asp:Content>