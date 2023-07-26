<%@ Page Title="" Language="C#" MasterPageFile="~/userheader.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="cosmaticstore029.cart" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style>
        .abc{
            margin-top:80px;
            padding-left:30px;
           
            width:1200px;
            margin-left:100px;
        }
        .ab{
           
            margin-left:10px;
            margin-right:200px;
            background-color:black;
            font-weight:bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
    <h1>All Carts</h1>
        <asp:GridView runat="server" ID="form" AutoGenerateColumns="false" Width="1200px" OnRowCommand="form_RowCommand" OnRowDeleting="form_RowDeleting" CssClass="table abc">
        <Columns>
            <asp:BoundField HeaderText="Product Name" DataField="productname" />
            <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Label runat="server" ID="price" Text='<%# "Rs." + Eval("price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            


            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image runat="server" ID="img" Width="100px" Height="80px" imageUrl='<%#"~/images/"+Eval("productimage") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
           

            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="remove" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("productid")%>' OnClientClick="return confirm('Are you sure?');"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

       <div class="container">
    <div class="row">
      <div class="col-sm-12 col-md-12 col-lg-12 mx-auto">
        <div class="card border-0 shadow rounded-3 my-5">
          <div class="cart-body p-sm-5">
            <h5 class="card-title text-center mb-5 fw-light fs-5">Confirm Order</h5>
           <div class="row">

                <div class="col-6 form-floating mb-3">
                      <label for="fullName">Full Name</label>
                <asp:TextBox  CssClass="form-control" id="fullName"  runat="server"></asp:TextBox>
              
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="fullname" ErrorMessage="Enter Full Name" ID="RFV"></asp:RequiredFieldValidator>
              </div>

              <div class="col-6 form-floating mb-3">
                  <label for="email">Email address</label>
                <asp:TextBox  CssClass="form-control" id="email"  runat="server"></asp:TextBox>
                   <asp:RegularExpressionValidator ControlToValidate="email" ErrorMessage="Invalid email" SetFocusOnError="true" ForeColor="red" runat="server" ID="REGULAR1" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
<asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="email" ErrorMessage="Email field empty "></asp:RequiredFieldValidator>


              </div>
              <div class="col-6 form-floating mb-3">
                  <label for="number">Mobile Number</label>
                <asp:TextBox   CssClass="form-control" id="number" runat="server"></asp:TextBox>
             <asp:CompareValidator ControlToValidate="number" Text="Invalid Number" SetFocusOnError="true" ForeColor="red" runat="server" ID="CompareValidator1" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator>
<asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="number" ErrorMessage="Phone number field empty "></asp:RequiredFieldValidator>

                
              </div>
               <div class="col-6 form-floating mb-3">
                     <label for="address">Address</label>
                <asp:TextBox  CssClass="form-control" id="address" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="address" ErrorMessage="Address field empty "></asp:RequiredFieldValidator>

              </div>
           </div>
              

                
                  
              
              <div class="d-grid">
                <asp:Button cssClass="btn btn-primary btn-login text-uppercase fw-bold" Text="Checkout"  runat="server" ID="checkoutBtn" OnClick="checkoutBtn_Click"></asp:Button>
              </div>
             <asp:Label runat="server" ID="errorLable" ForeColor="Red"></asp:Label>
              
             
           
          </div>
        </div>
      </div>
    </div>
  </div>

    </div>
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</asp:Content>
