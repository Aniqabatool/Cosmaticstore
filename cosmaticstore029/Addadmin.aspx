<%@ Page Title="" Language="C#" MasterPageFile="~/headerfooter.Master" AutoEventWireup="true" CodeBehind="Addadmin.aspx.cs" Inherits="cosmaticstore029.Addadmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .col-md-4{
          margin-top:70px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server" style="margin-top:70px" >
    <div class="row"  >
        <div class="col-md-4"></div>
        <div class="col-md-4" >
            <h4>Add new admin to the database all these fields are required</h4>
            <div class="form-group">
                <label>First name: </label>
                <asp:TextBox  runat="server" ID="txtfirstname" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="txtfirstname" ErrorMessage="First name field empty "></asp:RequiredFieldValidator>
                       <asp:CompareValidator ControlToValidate="txtfirstname" Text="Invalid Name" SetFocusOnError="true" ForeColor="red" runat="server" ID="COMPV2" Type="String" Operator="DataTypeCheck"></asp:CompareValidator>

                </div>

             <div class="form-group">
                <label>Last name: </label>
                <asp:TextBox runat="server" ID="txtlastname" CssClass="form-control"></asp:TextBox>
             <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="txtlastname" ErrorMessage="Last name field empty "></asp:RequiredFieldValidator>
            <asp:CompareValidator ControlToValidate="txtlastname" Text="Invalid Name" SetFocusOnError="true" ForeColor="red" runat="server" ID="CompareValidator1" Type="String" Operator="DataTypeCheck"></asp:CompareValidator>

            </div>

             <div class="form-group">
                <label>Email</label>
                <asp:TextBox runat="server" ID="txtemail" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="txtemail" ErrorMessage="Email field empty "></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ControlToValidate="txtemail" ErrorMessage="Invalid email" SetFocusOnError="true" ForeColor="red" runat="server" ID="REGULAR1" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>

            </div>
           

             <div class="form-group">
                <label>Password</label>
                <asp:TextBox runat="server" ID="txtpassword" TextMode="Password" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="txtpassword" ErrorMessage="password field empty "></asp:RequiredFieldValidator>

            </div>
            <div class="form-group">
                <label>Confirm Password</label>
                <asp:TextBox runat="server" ID="confpassword"  CssClass="form-control"></asp:TextBox>
             <asp:CompareValidator  ControlToValidate="txtpassword" runat="server" ID="confpass" ForeColor="Red"   ControlToCompare="confpassword" ErrorMessage="Enter same password"></asp:CompareValidator>
            </div>

    
      
             <div class="form-group" >
                <asp:Button runat="server" ID="Save" CssClass="btn btn-primary"  Text="save" OnClick="Save_Click"></asp:Button>
                 <a href="Adminlist.aspx" class="btn btn-primary">Cancel</a>
                 <asp:Label runat="server" ID="lblmsg" ForeColor="Red"></asp:Label>
               </div>
                

        </div>
    </div>
        </form>

</asp:Content>
