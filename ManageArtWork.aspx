<%@ Page Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="ManageArtWork.aspx.cs" Inherits="Part_1.ManageArtWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    
    <style>
        .artworkContainer{
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

        .manageStock{
            margin-top:3%;
            background-color:rgb(0, 206, 27);
            color:white;
            font-weight:bold;
            margin-bottom:5%;
            height:25px;
            border:1px solid rgb(190, 190, 190);
        
        }

        .manageStock:hover{
            background-color:rgb(0, 183, 24);
            cursor:pointer;
        }

        .manageStock:active{
            opacity:0.7;
        }

        .name{
            font-weight:800;
            min-height:50px;
            width:100%;
            margin:10px 5px 2.5px 5px;
            color:black;
        }

        .stockQty{
            font-size:small;
        }

        .category{
            color:rgb(128, 128, 128);
            min-height:10px;
            width:100%;
            margin:5px 5px 2.5px 0px;
            font-size:smaller;
        }

        .notFound{
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
            margin:30px 0px 0px 10px;
            vertical-align:central;
        }

        .searchButton:hover{
            opacity:0.5;
            
        }

        .manageStockBtn{
            margin-left:1%;
            margin-top:1%;
        }

    </style>

    <div style="min-height:800px;">
        <center>
             <asp:TextBox ID="txtSearch" runat="server" CssClass="txtSearch" placeholder="Search"></asp:TextBox>
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Image/magnifiying-glass.png" Width="18px" OnClick="serachBtn_Click" CssClass="searchButton" Height="18px"/>
        </center>

        <div style="height:7%;">
            &nbsp;
        </div>

        <%--Display all artwork from a particular artist by using repeater view--%>
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                    <div class="artworkContainer" onclick="viewDetails">
                    
                        <div class="imageContainer">
                            <img src='data:CarImages/jpg;base64,<%# Eval("awImage") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("awImage")) : string.Empty %>'alt="image" height="160" width="100%" />
                        </div>

                        <div class="contentContainer">
                            <div class="name">
                                <asp:Label ID="lblAWName" runat="server" Text='<%# Eval("awName") %>'/>
                                <asp:Label ID="lblAWID" runat="server" Text='<%# Eval("awID") %>' Visible="false"/>
                            </div>
                            <div class="category">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("categoryName") %>'  CssClass="category" />
                            </div>
                            <div class="stockQty">
                                Stock Quantity: <asp:Label ID="lblAWCateogory" runat="server" Text='<%# Eval("stockQty") %>'  CssClass="stockQty" />
                            </div>
                            <div>
                                <asp:Button ID="Button1" Text="Manage Stock" runat="server" OnClick="StockIn" OnClientClick="return GetUserValue();" CssClass="manageStock"/>
                                <%--<asp:Button ID="btnDelete" runat="server" Text="Delete" onClientClick = "javascript:confirm('Confirm Delete?');" OnClick="deleteStock" />
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="editBtn"/>--%>
                                <asp:ImageButton ID="btn" runat="server" ImageUrl="~/Image/edit.png" Width="22px" Height="22px" CssClass="manageStockBtn" OnClick="editBtn" ToolTip="Edit" />
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Image/trash.png" Width="22px" Height="22px" onClientClick = "javascript:confirm('Confirm Delete?');" OnClick="deleteStock" CssClass="manageStockBtn" ToolTip="Delete" />
                            </div>
                        </div>
                        

                        <div class="buttonContainer">
                            
                        </div>
                        
                    </div>
                       
            </ItemTemplate>
        </asp:Repeater>

    <div style="clear:both;">&nbsp;</div>

        <div class="notFound">
        <center>
            <asp:Label ID="Label1" runat="server" Text="No Result Found" Visible="false"></asp:Label>
        </center>
    </div>

    </div>

</asp:content>        

    
