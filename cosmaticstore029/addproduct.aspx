<%@ Page Title="" Language="C#" MasterPageFile="~/headerfooter.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="cosmaticstore029.addproduct1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form runat="server" style="margin-top:70px">
    <div class="row" >
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <h4>Add new product to the database all these fields are required</h4>
            <div class="form-group">
                <label>Product name: </label>
                <asp:TextBox  runat="server" ID="prodname" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="prodname" ErrorMessage="Product name field empty "></asp:RequiredFieldValidator>
            <asp:CompareValidator ControlToValidate="prodname" Text="Invalid Name" SetFocusOnError="true" ForeColor="red" runat="server" ID="COMPV2" Type="String" Operator="DataTypeCheck"></asp:CompareValidator>

            </div>


                   

             <div class="form-group">
                 <Label>Product Brand</Label>
                <asp:DropDownList runat="server" ID="ddlbrand">
                </asp:DropDownList>
                 <asp:RequiredFieldValidator ControlToValidate="ddlbrand" ErrorMessage="Please select your brand" InitialValue="0" SetFocusOnError="true" ForeColor="red" runat="server" ID="RFV2"></asp:RequiredFieldValidator>
     
            </div>

            <div class="form-group">
                 <Label>Product type</Label>
                <asp:DropDownList runat="server" ID="ddltype">
                </asp:DropDownList>
                 <asp:RequiredFieldValidator ControlToValidate="ddltype" ErrorMessage="Please select your type" InitialValue="0" SetFocusOnError="true" ForeColor="red" runat="server" ID="RFV3"></asp:RequiredFieldValidator>

            </div>

            

             <div class="form-group">
                <label>Product Color: </label>
                <asp:TextBox runat="server" ID="prodcolor" CssClass="form-control"></asp:TextBox>
             <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="prodcolor" ErrorMessage="Product color field empty "></asp:RequiredFieldValidator>
           <asp:CompareValidator ControlToValidate="prodcolor" Text="Invalid Name" SetFocusOnError="true" ForeColor="red" runat="server" ID="CompareValidator3" Type="String" Operator="DataTypeCheck"></asp:CompareValidator>

            </div>
            

             <div class="form-group">
                <label>Product Weight: </label>
                <asp:TextBox runat="server" ID="prodweight" CssClass="form-control"></asp:TextBox>
             <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="prodweight" ErrorMessage="Product weight field empty "></asp:RequiredFieldValidator>
            <asp:CompareValidator ControlToValidate="prodweight" Text="Invalid weight" SetFocusOnError="true" ForeColor="red" runat="server" ID="CompareValidator2" Type="Integer" Operator="GreaterThanEqual" ValueToCompare="0"></asp:CompareValidator>

            </div>

             <div class="form-group">
                <label>Product price</label>
                <asp:TextBox runat="server" ID="prodprice" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="prodprice" ErrorMessage="Product price field empty "></asp:RequiredFieldValidator>
        <asp:CompareValidator ControlToValidate="prodprice" Text="Invalid amount" SetFocusOnError="true" ForeColor="red" runat="server" ID="CompareValidator1" Type="Integer" Operator="GreaterThanEqual" ValueToCompare="0"></asp:CompareValidator>

             </div>
            
           
              <div class="form-group">
                <label>Image</label>
                <asp:FileUpload runat="server" ID="image"></asp:FileUpload>
                 <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="image" ErrorMessage="Image not selected "></asp:RequiredFieldValidator>

            </div>
            <div class="form-group">
                <asp:Image runat="server" ID="img1" />
            </div>
    
      
             <div class="form-group" >
                <asp:Button runat="server" ID="Save" CssClass="btn btn-primary"  Text="save" OnClick="Save_Click"></asp:Button>
                 <a href="productlist.aspx" class="btn btn-primary">Cancel</a>
                 <asp:Label runat="server" ID="lblmsg" ForeColor="Red"></asp:Label>
               </div>
                

        </div>
    </div>
        </form>
</asp:Content>
