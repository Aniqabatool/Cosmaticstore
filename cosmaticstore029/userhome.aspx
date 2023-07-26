<%@ Page Title="" Language="C#" MasterPageFile="~/userheader.Master" AutoEventWireup="true" CodeBehind="userhome.aspx.cs" Inherits="cosmaticstore029.userhome" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #cartpage{
            margin-left:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container my-5">
           <div style="width:250px; margin-left:auto; display:flex; justify-content:end; margin-bottom:20px;">
<asp:Button runat="server" ID="cartpage" OnClick="cartpage_Click" Text="Checkout"  />
               </div>
       <div class="row">
     
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">  
            <ItemTemplate>  
                
                <div class="col-lg-3 py-3">  
                   
                        <h3>  
                            <%#Eval("productname")%>
                        </h3>  
                        <h1>  
                           
                            <img src="images/<%#Eval("productimage")%>" width="100%" height="200px" />  
                        </h1>  
                       <h3>
                           Price : <%# Eval("price") %>
                       </h3>
                   <asp:LinkButton runat="server" ID="btnAddCart" CssClass="btn btn-primary btn-sm ab"  style="border-radius:0px;" Text="Add To Cart" CommandName="addtocart" CommandArgument='<%#Eval("productid") %>' CausesValidation="false"></asp:LinkButton>
                   
                </div> 
           
             
            </ItemTemplate>  
        </asp:Repeater> 
            </div>
   </div> 
</asp:Content>
