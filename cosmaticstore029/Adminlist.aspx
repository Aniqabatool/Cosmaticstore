<%@ Page Title="" Language="C#" MasterPageFile="~/headerfooter.Master" AutoEventWireup="true" CodeBehind="Adminlist.aspx.cs" Inherits="cosmaticstore029.Adminlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <form runat="server" style="margin-top:70px">
    <div>
       <h4>Here is the list of all the admins account</h4>

     

            
        <div class="col-md-6" style="margin-top :10px">
    <asp:GridView runat="server"  ID="Gv" AutoGenerateColumns="false" CssClass="table table-bordered" OnRowCommand="Gv_RowCommand" OnRowEditing="Gv_RowEditing" OnRowDeleting="Gv_RowDeleting">
        <Columns>

            <asp:BoundField DataField="FirstName" HeaderText="First Name " />
              <asp:BoundField DataField="LastName" HeaderText="Last Name " />
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblemail"  Text='<%# Eval("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:BoundField DataField="status" HeaderText="Status" />

            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="Editadmin" Text="Edit" CommandName="edit" CommandArgument='<%# Eval("adminid") %>'></asp:LinkButton>
                    /
                    <asp:LinkButton runat="server" ID="deleteadmin" Text="Delete"  CommandName="delete" CommandArgument='<%# Eval("adminid") %>'  OnClientClick="return confirm( 'Do you want to delete this Admin?');"></asp:LinkButton>

                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
            </div>
           <div style="margin :15px"  >
        <asp:Button ID="addadmin" runat="server" OnClick="addadmin_Click" Text="Add Admin" BorderStyle="Groove"  />
            </div>
        </div>
       </form>
</asp:Content>
