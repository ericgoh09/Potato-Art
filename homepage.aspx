<%@ Page Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="Assignment.WebForm1" %>

<asp:Content ID="contentWishlist" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
            <h1>Artwork</h1>

            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
                <AlternatingItemTemplate>
                    <td runat="server" style="background-color:#FFF8DC;">
                        <div>
                            <img src='data:CarImages/jpg;base64,<%# Eval("awImage") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("awImage")) : string.Empty %>' width="300" height="200" />
                        </div>
                        <br />
                        <asp:Label ID="awNameLabel" runat="server" Text='<%# Eval("awName") %>' />
                        <br />
                        <asp:Label ID="awPriceLabel" runat="server" Text='<%# Eval("awPrice", "{0:N2}") %>' />
                        <br />
                        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl='<%# "ArtWorkDetails.aspx?awid="+Eval("awID") %>' Text='<%# Eval("awID") %>'></asp:LinkButton>
                        <br /></td>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">awImage:
                        <asp:TextBox ID="awImageTextBox" runat="server" Text='<%# Bind("awImage") %>' />
                        <br />awName:
                        <asp:TextBox ID="awNameTextBox" runat="server" Text='<%# Bind("awName") %>' />
                        <br />awPrice:
                        <asp:TextBox ID="awPriceTextBox" runat="server" Text='<%# Bind("awPrice", "{0:N2}") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        <br /></td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
<td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">awImage:
                        <asp:TextBox ID="awImageTextBox" runat="server" Text='<%# Bind("awImage") %>' />
                        <br />awName:
                        <asp:TextBox ID="awNameTextBox" runat="server" Text='<%# Bind("awName") %>' />
                        <br />awPrice:
                        <asp:TextBox ID="awPriceTextBox" runat="server" Text='<%# Bind("awPrice", "{0:N2}") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        <br /></td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="background-color:#DCDCDC;color: #000000;">
                        <div class="imageContainer">
                            <img src='data:CarImages/jpg;base64,<%# Eval("awImage") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("awImage")) : string.Empty %>'alt="image" width="300" height="200" />
                        </div>                        <br />
                        <asp:Label ID="awNameLabel" runat="server" Text='<%# Eval("awName") %>' />
                        <br />
                        <asp:Label ID="awPriceLabel" runat="server" Text='<%# Eval("awPrice", "{0:N2}") %>' />
                        <br />
                        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl='<%# "ArtWorkDetails.aspx?awid="+Eval("awID") %>' Text='<%# Eval("awID") %>'></asp:LinkButton>
                        <br />
                        </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server" class="auto-style1">
                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;" class="auto-style1">
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="background-color:#DCDCDC; color: #000000;">
                        <asp:Image ID="awImage" runat="server" Height="100px" ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("awImage")) %>"' Width="100px" />
                        <br />
                        <asp:Label ID="awNameLabel" runat="server" Text='<%# Eval("awName") %>'></asp:Label>
                        <br />
                        <asp:Label ID="awPriceLabel" runat="server" Text='<%# Eval("awPrice", "{0:N2}") %>' />
                        <br />
                        <asp:LinkButton runat="server" PostBackUrl='<%# "ArtWorkDetails.aspx?awid="+Eval("awID") %>'  Text='<%# Eval("awID") %>' ID="LinkButton2"></asp:LinkButton>
                        <br />
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [awImage], [awName], [awPrice], [awID] FROM [ArtWork]"></asp:SqlDataSource>
            
            <br />
        </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentAd" Runat="Server">
</asp:Content>