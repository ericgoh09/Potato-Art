<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="DetailedWishlist.aspx.cs" Inherits="Assignment.DetailedWishlist" %>

<asp:Content ID="contentWishlist" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .wishlistContainer{
            width:90%;
            border:1.5px solid rgb(227, 227, 227);
            margin-left:auto;
            margin-right:auto;
            float:left;
            min-height:180px;
        }

        .imageContainer{
            width: 216px;
            float:left;
            padding:1% 1% 1% 1%;
            min-width:150px;
        }

        .contentContainer{
            width:60%;
            float:left;
            padding:1% 1% 1% 1%;
        }

        .wishID{

        }

        .artName{
            font-weight:800;
            min-height:50px;
            width:100%;
            margin:10px 5px 2.5px 5px;
            color:black;
        }

        .artworkID{

        }

        .artDescription{

        }

        .category{
            color:rgb(128, 128, 128);
            min-height:10px;
            width:100%;
            margin:5px 5px 2.5px 0px;
            font-size:smaller;
        }

        .categoryID{

        }

        .price{
            color:rgb(0, 77, 255);
            min-height:20px;
            margin:5px 5px 2.5px 5px;
            width:100%;
            font-weight:800;
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

    <div style="min-height:800px;">
    <%--Display all wishlist from a customer by using repeater view--%>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>

                <a href="ArtworkDetails.aspx?awid=<%#Eval("artID") %>">
                    <div class="wishlistContainer" onclick="viewDetails">
                        <div class="wishID">
                            <asp:Label ID="lblWishID" runat="server" Text='<%# Eval("wishID") %>' />
                        </div>

                        <div class="imageContainer">
                            <img src='data:CarImages/jpg;base64,<%# Eval("awImage") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("awImage")) : string.Empty %>'alt="image" height="200" width="100%" /> 
                        </div>

                        <div class="contentContainer">
                            <div class="artName">
                                <asp:Label ID="lblAWName" runat="server" Text='<%# Eval("awName") %>'/>
                            </div>

                            <div class="artworkID">
                                <asp:Label ID="lblAWID" runat="server" Text='<%# Eval("artID") %>'/>
                            </div>

                            <div class="artDescription">
                                <asp:Label ID="lblAWDescp" runat="server" Text='<%# Eval("awDescription") %>'/>
                            </div>

                            <div class="category">
                                <asp:Label ID="lblAWCateogory" runat="server" Text='<%# Eval("categoryName") %>'  CssClass="category" />
                            </div>

                            <div class="categoryID">
                                <asp:Label ID="lblCID" runat="server" Text='<%# Eval("categoryID") %>' />
                            </div>

                    
                            <div class="price">
                                RM <asp:Label ID="lblAWPrice" runat="server" Text='<%# Eval("awPrice", "{0:N2}") %>' CssClass="price"/>
                            </div>
                        </div>

                        <div class="buttonContainer">
                            <asp:Button ID="W_RemoveAll" Text="Remove" runat="server" OnClick="W_Remove_Btn" CssClass="blueButton" />
                        </div>
                    

                    </div>
                </a>
            </ItemTemplate>
        </asp:Repeater>

        <div style="margin-bottom:2%; clear:both;">&nbsp;</div>
      </div>
</asp:Content>