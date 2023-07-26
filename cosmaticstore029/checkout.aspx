<%@ Page Title="" Language="C#" MasterPageFile="~/userheader.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="cosmaticstore029.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
        <div class="row cart-body py-5 px-5">
            <div class="col-lg-6 col-md-6 col-sm-6 col-12 col-md-push-6 col-sm-push-6 border-left border-right">
                <div class="bg-dark"><h4 class="py-3 text-white pl-3">Cart Items</h4></div>
                <div class="panel-body mt-2">
                    <asp:Repeater ID="repeater2" runat="server" OnItemDataBound="repeater2_ItemDataBound">
                        <ItemTemplate>
                            <div class="row py-4 border-bottom mx-auto">
                                <div class="col-sm-4 col-4">
                                    <asp:Image ID="photo" Width="60px" runat="server" ImageUrl='<%#"~/images/"+Eval("productimage") %>' CausesValidation="false" />
                                    <div class="col-sm-4 col-4">
                                        <div class="col-12" style="font-weight:600;"><%# Eval("productname") %></div>
                                     
                                    </div>
                                    <div class="col-sm-4 col-4 text-right">
                                        Rs.<asp:Label ID="prc" runat="server" Text='<%#(Convert.ToInt32(Eval("Price")))%>'></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="row pt-4 mx-auto">
                        <div class="col-md-6"><strong>Total Bill:</strong></div>
                        <div class="col-md-6">
                            <div class="float-right">
                                Rs.<asp:Label runat="server" ID="tprice" Text="0"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Button runat="server" ID="cancel" Text="Go to home page" CssClass="btn btn-primary btn-sm ab" style="border-radius:0px; margin-top:10px" OnClick="cancel_Click"/>
            </div>
            </div>
         </div>
</asp:Content>
