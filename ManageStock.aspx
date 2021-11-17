<%@ Page Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="ManageStock.aspx.cs" Inherits="Part_1.ManaageStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">

    <style>

        .imageContainer{
            padding:8% 0% 5% 5%;
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

        .stockQty{
            width:100%;
            margin:5px 5px 2.5px 0px;
            font-size:small;
            width:100%;
            font-family:Arial, sans-serif;

        }

        .stockInBtn{
            margin-top:3%;
            background-color:rgb(0, 206, 27);
            color:white;
            font-weight:bold;
            margin-bottom:5%;
            height:30px;
            border:1px solid rgb(190, 190, 190);
            width:100px;
        }

        .stockOutBtn{
            margin-top:3%;
            background-color:rgb(255, 0, 0);
            color:white;
            font-weight:bold;
            margin-bottom:5%;
            height:30px;
            border:1px solid rgb(190, 190, 190);
            margin-left:3%;
            width:100px;
        }

        .textField{
            border:2px solid rgb(190, 190, 190);
            width:50%;
            border-radius:4px;
            height:45%;
        }

        .labelQty{
            font-family:Arial, sans-serif;
        }

        .auto-style1 {
            background-color: rgb(0, 206, 27);
            color: white;
            font-weight: bold;
            margin-bottom: 5%;
            height: 30px;
            border: 1px solid rgb(190, 190, 190);
            width: 100px;
        }

        .errorMsg{
            color:rgb(255, 0, 0);
            font-size:10px;
            vertical-align:top;
        }

        .successMsg{
            color:rgb(0, 206, 27);
            font-size:10px;

        }

    </style>

        <div>

            <!-- Display artwork details -->
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
                             <table style="width:100%;">
                                 <tr class="stockQty">
                                     <td style="text-align:right;">
                                         <p>Stock Qty:&nbsp</p>
                                     </td>
                                     <td>
                                         <asp:Label ID="qty" runat="server" Text="Label" CssClass="stockQtyLbl"></asp:Label>
                                     </td>
                                 </tr>
                                 <tr>

                                     <td>

                                     </td>
                                     <td>

                                     </td>
                                 </tr>
                                 <tr>
                                     <td style="width:15%; text-align:right;">
                                         <asp:Label ID="lblQty" runat="server" Text="Enter Qty:&nbsp;" CssClass="labelQty"></asp:Label>
                                     </td>
                                     <td style="width:60%;">
                                          <asp:TextBox ID="txtQty" runat="server" CssClass="textField" OnTextChanged="txtQty_TextChanged"></asp:TextBox>
                                     </td>
                                 </tr>
                                 <tr style="height:30px;">
                                     <td>

                                     </td>
                                     <td>
                                         <asp:Label ID="lblErrorMsg" runat="server" Text="" Visible="False" CssClass="errorMsg"></asp:Label>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>

                                     </td>
                                     <td>
                                         
                                     </td>
                                 </tr>
                             </table>
                             <asp:Button ID="btnStockIn" runat="server" Text="Stock In" CssClass="auto-style1" OnClick="btnStockIn_Click" />
                             <asp:Button ID="btnStockOut" runat="server" Text="Stock Out" CssClass="stockOutBtn" OnClick="btnStockOut_Click"/>
                         <br />
                         <asp:Label ID="lblSucessMsg" runat="server" Text="Stock Updated Successfully" CssClass="successMsg" Visible="False"></asp:Label>
                         
                        </div>
                    
                </td>
            </tr>
        </table>
        </div>
</asp:content> 
