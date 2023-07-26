<%@ Page Title="" Language="C#" MasterPageFile="~/headerfooter.Master" AutoEventWireup="true" CodeBehind="brandlist.aspx.cs" Inherits="cosmaticstore029.brandlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
     <form runat="server" style="margin-top:70px">
    <div>
       <h4>Here is the list of all the brand names</h4>
            
        <div class="col-md-6" style="margin-top :10px">
    <asp:GridView runat="server"  ID="brandGv" AutoGenerateColumns="false" CssClass="table table-bordered" OnRowCommand="brandGv_RowCommand" OnRowEditing="brandGv_RowEditing" OnRowDeleting="brandGv_RowDeleting">
        <Columns>

            <asp:BoundField DataField="brandname" HeaderText="Brand Name " />
         
             

            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="Editbrand" Text="Edit" CommandName="edit" CommandArgument='<%#Eval("brandID")%>'></asp:LinkButton>
                    /
                    <asp:LinkButton runat="server" ID="deletebrand" Text="Delete"  CommandName="delete" CommandArgument='<%#Eval("brandID")%>' OnClientClick="return confirm( 'Do you want to delete this brand?');"></asp:LinkButton>

                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
            </div>
           <div style="margin :15px"  >
        <asp:Button ID="addbrand" runat="server" OnClick="addbrand_Click" Text="Add brand" BorderStyle="Groove"  />
            </div>
        </div>
       </form>
</asp:Content>
