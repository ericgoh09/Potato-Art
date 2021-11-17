<%@ Page Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="AddNewArtWork.aspx.cs" Inherits="Part_1.AddNewArtWork" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">

    
    <style type="text/css">
        .auto-style1 {
            width: 368px;
            text-align: right;
            font-family:cursive;
            font-size:15px;
        }
        
        .errorMsg{
            color:rgb(255, 0, 0);
            font-size:10px;
            vertical-align:top;
        }
        
        .textfieldStyle{
            border:2px solid rgb(190, 190, 190);
            width:50%;
            border-radius:4px;
            height:45%;
        }
        .auto-style9 {
            height: 26px;
            width: 368px;
        }
        .auto-style10 {
            width: 41px;
            height: 26px;
        }
        .auto-style11 {
            color: rgb(255, 0, 0);
            font-size: 10px;
            vertical-align: top;
            height: 26px;
        }
        .auto-style12 {
            width: 368px;
        }
        .auto-style13 {
            width: 41px;
        }
        .auto-style14 {
            height: 29px;
            width: 41px;
        }
        .auto-style15 {
            height: 28px;
            width: 41px;
        }

        .saveBtn{
            background-color:rgb(0, 206, 27);
            color:white;
            font-weight:bold;
            margin-left:35%;
            margin-top:2%;
            margin-bottom:5%;
            width:8%;
            height:25px;
            border:1px solid rgb(190, 190, 190);
        }

        .cancelBtn{

            background-color:rgb(252, 252, 252);
            color:black;
            font-weight:bold;
            margin-left:2%;
            margin-top:1%;
            width:8%;
            height:25px;
            border:1px solid rgb(165, 165, 165);

        }

        .saveBtn:hover{
            background-color:rgb(0, 183, 24);
            cursor:pointer;
        }

        .cancelBtn:hover{
            background-color:rgb(227, 227, 227);
            cursor:pointer;
        }

        .saveBtn:active{
            opacity:0.7;
        }

        .cancelBtn:active{
            opacity:0.7;
        }


        .validationSummary{
            font-size:15px;
            font-family:cursive;
        }

    </style>

    <%--Prompt new artwork details from artist--%>
        <div>
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style1">Artwork Name</td>
                    <td class="auto-style13">&nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtArtName" runat="server" CssClass="textfieldStyle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="errorMsg">
                        <asp:RequiredFieldValidator CssClass="errorMsg" ID="rfvName" runat="server" ErrorMessage="Artwork Name cannot be empty." ControlToValidate="txtArtName" ForeColor="Red" ValidationGroup="Group1">This field cannot be empty!</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" >Category</td>
                    <td class="auto-style13">&nbsp;</td>
                    <td>
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="textfieldStyle" style="width:20%;">
                            <asp:ListItem>Please Select</asp:ListItem>
                            <asp:ListItem>Drawing</asp:ListItem>
                            <asp:ListItem>Modeling</asp:ListItem>
                            <asp:ListItem>Music</asp:ListItem>
                            <asp:ListItem>Painting</asp:ListItem>
                            <asp:ListItem>Photographing</asp:ListItem>
                            <asp:ListItem>Sculpture</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="errorMsg">
                        <asp:RequiredFieldValidator CssClass="errorMsg" ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlCategory" ErrorMessage="A category must be selected." InitialValue="Please Select" ValidationGroup="Group1">Please select an item!</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Material Used</td>
                    <td class="auto-style14"></td>
                    <td>
                        <asp:TextBox ID="txtMaterial" runat="server" CssClass="textfieldStyle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9"></td>
                    <td class="auto-style10"></td>
                    <td class="auto-style11">
                        <asp:RequiredFieldValidator class="errorMsg" ID="rfvMaterialUsed" runat="server" ErrorMessage="Material Used cannot be empty" ControlToValidate="txtMaterial" ValidationGroup="Group1">This field cannot be empty</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Price(RM)</td>
                    <td class="auto-style15"></td>
                    <td>
                        <asp:TextBox ID="txtPrice" runat="server" CssClass="textfieldStyle" OnTextChanged="txtPrice_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator class="errorMsg" ID="rfvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="Price cannot be empty." ForeColor="Red" ValidationGroup="Group1">This field cannot be empty!</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9"></td>
                    <td class="auto-style10"></td>
                    <td class="auto-style11">
                        <asp:CompareValidator CssClass="errorMsg" ID="cvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="Price must be in decimal." ForeColor="Red" Type="Double" ValidationGroup="Group1">Price must be in decimal!</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Description</td>
                    <td class="auto-style13">&nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtDescription" runat="server" Height="75px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="errorMsg">
                        <asp:RequiredFieldValidator class="errorMsg" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescription" ErrorMessage="Description cannot be empty." ValidationGroup="Group1">This field cannot be empty!</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Image</td>
                    <td class="auto-style13">&nbsp;</td>
                    <td>
                        <asp:FileUpload ID="fuImage" runat="server" accept=".png, .jpg, .jpeg, .gif"/>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="errorMsg">
                        <asp:RequiredFieldValidator class="errorMsg" ID="rfvImage" runat="server" ControlToValidate="fuImage" ErrorMessage="Please upload an Image." ForeColor="Red" ValidationGroup="Group1">Please upload an Image!</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:ValidationSummary CssClass="validationSummary" ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="Group1"/>
                    </td>
                </tr>
            </table>
        </div>

        <div>
            
        </div>
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="saveBtn" ValidationGroup="Group1"/>
        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" CssClass="cancelBtn"/>
</asp:content> 