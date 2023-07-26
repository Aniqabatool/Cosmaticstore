<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="cosmaticstore029.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="css/bootstrap.min.css" rel="stylesheet" /> 
    <link href="css/login.css" rel="stylesheet" /> 
</head>
<body>
   <section class="banner">
        <div class="=container" id="form_container" style="margin-top:10%">
            <div id="form_box" style="box-shadow: 0px 0px 5px 2px #bfbdbd ;padding:40px 0;background-color:#f7f1f1;border-radius:10px; margin:auto ;width:750px;">
               <div class="row" style="justify-content:center;align-items:center;">
                   <div class="col-lg-4">
                            <asp:Image runat="server" style="border-radius:10px" ID="imgLogin" ImageUrl="images/2a.jpg" Width="100%"/>
                        </div>
                   <div class="col-4">
                       <div runat="server" id="logo">
                           <h6 class="mb-4">Login into your account</h6>
                       </div>
                       <form id="form" runat="server"> 
                            <div >
                                <label>Email:</label>
                                <asp:TextBox runat="server" id="Email" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="Email" ErrorMessage="Empty email feild" ></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ControlToValidate="Email" ErrorMessage="Invalid email" SetFocusOnError="true" ForeColor="red" runat="server" ID="REGULAR1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                            </div>
                            <div >
                                <label>Password:</label>
                                <asp:TextBox runat="server" id="password" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="password" ErrorMessage="Empty password feild"></asp:RequiredFieldValidator>
                             </div>

                           <div style="text-align:left">
                    <asp:LinkButton runat="server" ID="forgetpassword" Text="Forget password" CommandName="forgetpass" CommandArgument='<%# Eval("adminid") %>'></asp:LinkButton>

                             </div>

                            <div >
                                <asp:Button CssClass="btn btn-dark w-100" runat="server" ID="btn_form" OnClick="btn_form_Click" Text="LOGIN"/>
                             </div>
                         </form>
                   </div>
               </div>
            </div>
           </div>       
    </section>

</body>
</html>
