<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Sports.master" CodeFile="ContactCust.aspx.cs" Inherits="ContactCust" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    
    Text to customer:&nbsp;
    <asp:TextBox ID="TextBox1" runat="server" Height="80px" TextMode="MultiLine" Width="215px"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send!" />
    <br />
    <br />
    <br />
    
</asp:Content>
