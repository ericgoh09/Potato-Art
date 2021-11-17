<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Assignment.Wishlist" %>

<asp:Content ID="contentWishlist" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .title {
            text-align:center; 
            font-size:x-large;
            font-family: cursive;
        }

        .tableAttrb {
            font-family: cursive;
            font-size: medium;
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
        <table class="auto-style1">
            <tr>
                <td class="title" colspan="5"><b>Wish List</b></td>
            </tr>

            <tr>
                <td colspan="5">
                    <asp:ListView ID="WishlistView" runat="server" DataKeyNames="wishID" DataSourceID="SqlWishlistSource" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
                        <AlternatingItemTemplate>
                            <tr class="tableAttrb" style="background-color:#23f791;">
                                <td>
                                    <asp:Button ID="DeleteButton" class="blueButton" runat="server" CommandName="Delete" Text="Delete" />
                                </td>
                                <td>
                                    <asp:Label ID="wishIDLabel" runat="server" Text='<%# Eval("wishID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="artIDLabel" runat="server" Text='<%# Eval("artID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CIDLabel" runat="server" Text='<%# Eval("CID") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color:#008A8C;color: #FFFFFF;">
                                <td>
                                    <asp:Button ID="UpdateButton" class="blueButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" class="blueButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="wishIDLabel1" runat="server" Text='<%# Eval("wishID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="artIDTextBox" runat="server" Text='<%# Bind("artID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="CIDTextBox" runat="server" Text='<%# Bind("CID") %>' />
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
                                   <asp:Button ID="InsertButton" class="blueButton" runat="server" CommandName="Insert" Text="Insert" />
                                   <asp:Button ID="CancelButton" class="blueButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>
                                   <asp:TextBox ID="wishIDTextBox" runat="server" Text='<%# Bind("wishID") %>' />
                                </td>
                                <td>
                                   <asp:TextBox ID="artIDTextBox" runat="server" Text='<%# Bind("artID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="CIDTextBox" runat="server" Text='<%# Bind("CID") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr class="tableAttrb" style="background-color:#aef2d2; color:#000000;">
                                <td>
                                    <asp:Button ID="DeleteButton" class="blueButton" runat="server" CommandName="Delete" Text="Delete" />
                                </td>
                                <td>
                                    <asp:Label ID="wishIDLabel" runat="server" Text='<%# Eval("wishID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="artIDLabel" runat="server" Text='<%# Eval("artID") %>' />
                                </td>
                                <td>
                                   <asp:Label ID="CIDLabel" runat="server" Text='<%# Eval("CID") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr class="tableAttrb" runat="server" style="background-color:#4ef700;color: #000000;">
                                                <th runat="server"></th>
                                                <th runat="server">Wish ID</th>
                                                <th runat="server">Artwork ID</th>
                                                <th runat="server">Customer ID</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #18f0e5;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                        <div>
                                            <asp:DataPager ID="DataPager1" runat="server">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonCssClass="blueButton" ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                                </Fields>    
                                            </asp:DataPager>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color:#79f299;font-weight: bold;color: #FFFFFF;">
                                <td>
                                    <asp:Button ID="DeleteButton" class="blueButton" runat="server" CommandName="Delete" Text="Delete" />
                                </td>
                                <td>
                                    <asp:Label ID="wishIDLabel" runat="server" Text='<%# Eval("wishID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="artIDLabel" runat="server" Text='<%# Eval("artID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CIDLabel" runat="server" Text='<%# Eval("CID") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                </td>
            </tr>

            <tr>
                <td colspan="5">
                    <asp:SqlDataSource ID="SqlWishlistSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [wishID], [artID], [CID] FROM [Wishlist]" DeleteCommand="DELETE FROM [Wishlist] WHERE [wishID] = @wishID" InsertCommand="INSERT INTO [Wishlist] ([wishID], [artID], [CID]) VALUES (@wishID, @artID, @CID)" UpdateCommand="UPDATE [Wishlist] SET [artID] = @artID, [CID] = @CID WHERE [wishID] = @wishID">
                        <DeleteParameters>
                            <asp:Parameter Name="wishID" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="wishID" Type="String" />
                            <asp:Parameter Name="artID" Type="String" />
                            <asp:Parameter Name="CID" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="artID" Type="String" />
                            <asp:Parameter Name="CID" Type="String" />
                            <asp:Parameter Name="wishID" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>

            <tr>
                <td colspan="5"></td>
            </tr>

            <tr>
                <td><asp:Button ID="W_RemoveAll" CssClass="greenButton" runat="server" Text="Remove All Wishes" OnClick="W_RemoveAll_Btn" /></td>
                <%--<td><asp:Button ID="W_AddToCart" CssClass="greenButton" runat="server" Text="Add to cart" /></td>--%>
                <td colspan="3"></td>
            </tr>

            <tr>
                <td><asp:Label ID="lblMsg" runat="server"></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Content>