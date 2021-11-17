<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="ArtWorkDetails.aspx.cs" Inherits="Assignment.ArtWorkDetails" %>



<asp:Content ID="contentWishlist" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>     
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
        <div>
            <h1>ArtWork Details</h1>
            <asp:Label ID="lblawID" runat="server" Font-Italic="true"></asp:Label>
            <br />
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <b><u>Artwork Review</u></b><br />
                        <div>
                            <img src='data:CarImages/jpg;base64,<%# Eval("awImage") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("awImage")) : string.Empty %>' width="300" height="200" />
                        </div>                    <br /><hr />
                    <b><u>Artwork Name</u></b><br />
                    <%#Eval("awName")%>
                    <br /><hr />
                    <b><u>Artwork Price</u></b><br />
                    <%#Eval("awPrice")%>
                    <br /><hr />
                    <b><u>Artwork Description</u></b><br />
                    <%#Eval("awDescription")%>
                    <br /><hr />
                    <b><u>Material Used</u></b><br />
                    <%#Eval("materialUsed")%>
                    <br /><hr />
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ArtWork] WHERE ([awID] = @awID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblawID" Name="awID" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <h2>Artist Details</h2>
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                 <ItemTemplate>
                    <b>Artist ID: </b><%#Eval("artistID")%><br />
                    <b>Artist Image: </b><%#Eval("artistImage")%><br />
                    <b>Artist Name: </b><%#Eval("artistName")%><br />
                    <b>Artist Gender: </b><%#Eval("artistGender")%><br />
                    <b>Artist Email: </b><%#Eval("artistEmail")%><br />
                    <b>Artist Phone Number: </b><%#Eval("artistPhoneNo")%><br />
                    <b>Artist Description: </b><%#Eval("artistDescription")%><br />
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ArtWork.awID, Artist.artistID, Artist.artistEmail, Artist.artistPhoneNo, Artist.artistDescription, Artist.artistImage, Artist.artistGender, Artist.artistName FROM ArtWork INNER JOIN Artist ON ArtWork.artistID = Artist.artistID WHERE ArtWork.awID =  @artistID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblawID" Name="artistID" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            
            <asp:Button CssClass="btn" ID="BtnBack" runat="server" Text="Back" PostBackUrl="~/homepage.aspx"/>
            <asp:Button CssClass="btn" ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Add to Wishlist" />
            <asp:Button CssClass="btn" BackColor="Blue" ID="BtnOrder" runat="server" Text="Order" OnClick="BtnOrder_Click"/>



        </div>
</asp:Content>