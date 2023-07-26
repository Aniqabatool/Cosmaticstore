<%@ Page Title="" Language="C#" MasterPageFile="~/headerfooter.Master" AutoEventWireup="true" CodeBehind="typelist.aspx.cs" Inherits="cosmaticstore029.typelist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <form runat="server" style="margin-top:70px">
    <div>
       <h4>Here is the list of all the Types names</h4>
            
        <div class="col-md-6" style="margin-top :10px">
    <asp:GridView runat="server"  ID="typeGv" AutoGenerateColumns="false" CssClass="table table-bordered" OnRowCommand="typeGv_RowCommand" OnRowEditing="typeGv_RowEditing" OnRowDeleting="typeGv_RowDeleting">
        <Columns>

            <asp:BoundField DataField="typename" HeaderText="Type Name " />
         
             

            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="Editbrand" Text="Edit" CommandName="edit" CommandArgument='<%#Eval("typeid")%>'></asp:LinkButton>
                    /
                    <asp:LinkButton runat="server" ID="deletebrand" Text="Delete"  CommandName="delete" CommandArgument='<%#Eval("typeid")%>' OnClientClick="return confirm( 'Do you want to delete this brand?');"></asp:LinkButton>

                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
            </div>
           <div style="margin :15px"  >
        <asp:Button ID="addtype" runat="server" OnClick="addtype_Click" Text="Add Type" BorderStyle="Groove"  />
            </div>
        </div>
       </form>
</asp:Content>
