<%@ Page Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="ArtWorkInformation.aspx.cs" Inherits="Part_1.ArtWorkDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">

    <style>
        .imageContainer{
            padding:1% 5% 5% 5%;
            min-height:250px;
        }

        .dataContainer1{
            padding:5% 5% 5% 1%;
            
        }

        .imageStyle{
            width:80%;
        }

        .nameContainer{
            height:50px;
        }

        .name{
            font-size:large;
            width:100%;
            font-weight:500;
            font-family:Arial, sans-serif;
            
        }

        .categoryContainer{
            height:50px;
        }

        .category{
            color:rgb(128, 128, 128);
            width:100%;
            margin:5px 5px 2.5px 0px;
            font-size:small;
            width:100%;
            
            font-family:Arial, sans-serif;

        }

        .price{
            font-family:Arial, sans-serif;
            color:rgb(0, 77, 255);
            margin:2% 5px 2.5px 0px;
            width:100%;
            font-weight:600;
            font-size:large;
        }

        .dataContainer2{
            clear:both;
            font-family:Arial, sans-serif;
            margin:-2% 5% 5% 7%;
        }

        .title{
            font-size:medium;
            font-weight:300;
        }

        .description{
            font-size:small;
        }

    </style>

        <div>

        <%--display artwowrk details--%>
        <table style="width:95%; margin-left:5%;">
            <tr>
                <td style="width:50%;">
                    <div class="imageContainer">
                        <asp:Image ID="AWImage" runat="server" CssClass="imageStyle"/>
                    </div>
                </td>
                <td style="width:50%; vertical-align:top;">
                     <div class="dataContainer1">
                         <div class="nameContainer">
                             <asp:Label ID="name" runat="server" Text="Label" CssClass="name"></asp:Label>
                         </div>
                        
                        <br />
                        <asp:Label ID="category" runat="server" Text="Label" CssClass="category"></asp:Label>
                        <br />
                         <div class="price">
                            RM <asp:Label ID="price" runat="server" Text="Label" ></asp:Label>
                         </div>
                        
                    </div>
                </td>
            </tr>
        </table>
        </div>

        <div class="dataContainer2">
                <div style="margin-bottom:5%;">
                    <p class="title">Material Used:</p>
                <asp:Label ID="MaterialUsed" runat="server" Text="Label" CssClass="description"></asp:Label>
                </div>
                <p class="title">Description:</p>
                <asp:Label ID="Description" runat="server" Text="Label" CssClass="description"></asp:Label>
        </div>
        

</asp:content> 