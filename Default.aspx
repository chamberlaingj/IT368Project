<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:HyperLink ID="loginLink" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink><br />
    <br />
    <asp:HyperLink ID="registerLink" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink><br />
</asp:Content>