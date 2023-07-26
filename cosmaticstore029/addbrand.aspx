<%@ Page Title="" Language="C#" MasterPageFile="~/headerfooter.Master" AutoEventWireup="true" CodeBehind="addbrand.aspx.cs" Inherits="cosmaticstore029.addbrand" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server" style="margin-top:70px">
    <div class="row" >
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <h4>Add new brand to the database </h4>
            <div class="form-group">
                <label>Product name: </label>
                <asp:TextBox  runat="server" ID="brandname" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="brandname" ErrorMessage="Brand name field empty "></asp:RequiredFieldValidator>
            </div>

             <div class="form-group" >
                <asp:Button runat="server" ID="Save" CssClass="btn btn-primary"  Text="save" OnClick="Save_Click"></asp:Button>
                 <a href="brandlist.aspx" class="btn btn-primary">Cancel</a>
                 <asp:Label runat="server" ID="lblmsg" ForeColor="Red"></asp:Label>
               </div>
            </div>
        </div>
        </form>

</asp:Content>
