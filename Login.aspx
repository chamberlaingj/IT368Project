<%@ Page Title="Login" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="display-box">
    <asp:Login ID="Login1" runat="server" LoginButtonText="Login" TitleText="Login"  OnAuthenticate="LoginControl_Authenticate" UserNameLabelText="Email: ">
        <LoginButtonStyle CssClass="btn btn-success" />
        <TextBoxStyle CssClass="black-type" />
    </asp:Login>
    </div>
</asp:Content>

