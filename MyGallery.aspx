<%@ Page Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="MyGallery.aspx.cs" Inherits="Part_1.NewArtWorkDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    
    <style>
        .artworkContainer{
            width:30%;
            border:1px solid rgb(227, 227, 227);
            margin: 1% 1% 0.5% 1%;
            float:left;
            min-height:300px;
            min-width:300px;
        }

        .artworkContainer:hover{
            
        }

        a{
            text-decoration:none;
            text-decoration-style:none;
            text-decoration-color:none;
        }

        .name{
            font-weight:500;
            min-height:50px;
            width:100%;
            margin:5px 5px 2.5px 5px;
            color:black;
        }

        .category{
            color:rgb(128, 128, 128);
            min-height:10px;
            width:100%;
            margin:5px 5px 2.5px 2.5px;
            font-size:smaller;
        }

        .price{
            color:rgb(0, 77, 255);
            min-height:20px;
            margin:5px 5px 2.5px 5px;
            width:100%;
            font-weight:800;
        }
        
        .notFound{
            margin-top:5%;
            position:relative;
        }

        .txtSearch{
            width:50%;
            height:30px;
            padding-left:1%;
            border:2px solid rgb(156, 156, 156);
            border-radius:4px;
        }

        .searchButton{
            margin:10px 0px 0px 10px;
            vertical-align:central;
        }

        .searchButton:hover{
            opacity:0.5;
            
        }

    </style>

    <div style="min-height:800px;">
    <%--Display all artwork from a artist by using repeater view--%>

        <center>
             <asp:TextBox ID="txtSearch" runat="server" CssClass="txtSearch" placeholder="Search"></asp:TextBox>
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Image/magnifiying-glass.png" Width="18px" OnClick="serachBtn_Click" CssClass="searchButton" Height="18px"/>
        </center>
        <%--<div style="width:60%; margin-left:auto; margin-right:auto;">--%>
           
<%--        </div>--%>
        

        <br />

        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>

                <a href="ArtWorkInformation.aspx?AWID=<%#Eval("awID") %>">
                    <div class="artworkContainer" onclick="viewDetails">
                    

                        <img src='data:CarImages/jpg;base64,<%# Eval("awImage") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("awImage")) : string.Empty %>'alt="image" height="200" width="100%" /> 

                        <div class="name">
                            <asp:Label ID="lblAWName" runat="server" Text='<%# Eval("awName") %>'/>
                        </div>
                    
                        <div class="category">
                            <asp:Label ID="lblAWCateogory" runat="server" Text='<%# Eval("categoryName") %>'  CssClass="category" />
                        </div>
                    
                        <div class="price">
                            RM<asp:Label ID="lblAWPrice" runat="server" Text='<%# Eval("awPrice", "{0:N2}") %>' CssClass="price"/>
                        </div>
                    

                    </div>
                </a>
            </ItemTemplate>
        </asp:Repeater>

        <div class="notFound">
            <center>
                <asp:Label ID="Label1" runat="server" Text="No Result Found" Visible="false"></asp:Label>
            </center>
        </div>
        

        <div style="margin-bottom:2%; clear:both;">&nbsp;</div>
      </div>
</asp:content> 
