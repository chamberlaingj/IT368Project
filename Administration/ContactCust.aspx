<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Sports.master" CodeFile="ContactCust.aspx.cs" Inherits="ContactCust" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name">
<<<<<<< HEAD
</asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT Name, Phone FROM Customers WHERE (Role = 'customer')"></asp:SqlDataSource>
Text Message<br />
<asp:TextBox ID="TextBox1" runat="server" Height="91px" TextMode="MultiLine" Width="396px"></asp:TextBox>
=======
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT Name, Phone FROM Customers WHERE (Role = 'customer')"></asp:SqlDataSource>
>>>>>>> origin/master
    <br />
    <br />
    <div class="display-box">
    Text Message:<br />
    <asp:TextBox ID="TextBox1" CssClass="black-type" runat="server" Height="91px" TextMode="MultiLine" Width="396px"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" OnClick="Button1_Click" Text="Send!" />
    </div>
    
</asp:Content>
