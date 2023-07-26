<%@ Page Title="" Language="C#" MasterPageFile="~/headerfooter.Master" AutoEventWireup="true" CodeBehind="productlist.aspx.cs" Inherits="cosmaticstore029.productlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <form runat="server" style="margin-top:70px">
    <div>
       <h4>Here is the list of all the products</h4>

        <div class="col-md-4" style="margin-top :10px">
    <asp:GridView runat="server"  ID="productGv" AutoGenerateColumns="false" CssClass="table table-bordered" OnRowCommand="productGv_RowCommand" OnRowEditing="productGv_RowEditing" OnRowDeleting="productGv_RowDeleting">
        <Columns>

            <asp:BoundField DataField="productname" HeaderText="Product Name " />
              <asp:BoundField DataField="typename" HeaderText="Product Type" />
          
             <asp:BoundField DataField="brandname" HeaderText="Brand Name" />
          
            <asp:BoundField DataField="productcolor" HeaderText="Color" />
            

              <asp:TemplateField HeaderText="Product Price" >
                <ItemTemplate>
                    <asp:Label runat="server" ID="price"  Text='<%# Eval("price") + "/-Rs" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

                        <asp:TemplateField HeaderText="Product weight" >
                <ItemTemplate>
                    <asp:Label runat="server" ID="productweight"  Text='<%# Eval("productweight") + "g" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Product image" >
                <ItemTemplate>
                    <asp:Image runat="server"  ID="prodimage" Width="150px" ImageUrl='<%# "images/" + Eval("productimage")  %>'/>
                </ItemTemplate>


            </asp:TemplateField>



            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="Editproduct" Text="Edit" CommandName="edit" CommandArgument='<%# Eval("productid") %>' ></asp:LinkButton>
                    /
                    <asp:LinkButton runat="server" ID="deleteproduct" Text="Delete"  CommandName="delete" CommandArgument='<%# Eval("productid") %>'  OnClientClick="return confirm( 'Do you want to delete this product?');"></asp:LinkButton>

                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
            </div>
           <div style="margin :15px"  >
        <asp:Button ID="addproduct" runat="server" OnClick="addproduct_Click" Text="Add Product" BorderStyle="Groove"  />
            

        
          </div>
        </div>
       </form>
</asp:Content>
