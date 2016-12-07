<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Sports.master" CodeFile="CustomerDisplay.aspx.cs" Inherits="CustomerDisplay" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Customer Display</title>
    </asp:Content>
<asp:Content ID="body1" ContentPlaceHolderID="body" runat="server">
    <div>
        <h1>SportsPro</h1><br />
        <h2>Sports management software for the sports enthusiast</h2>
        <br />
        Select a customer:&nbsp;
        <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="SqlDataSource1"
            DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [CustomerID], [Name], [Address], [City], [State], [ZipCode], [Phone], [Email] FROM [Customers] WHERE ([CustomerID] = @CustomerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCustomers" Name="CustomerID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add to Contact List" Width="150px" onclick="btnAdd_Click" />
        &nbsp;
        <asp:Button ID="btnDisplay" runat="server" PostBackUrl="ContactDisplay" Text="Display Contact List" Width="150px" />
        <br />
        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>

    </div>
</asp:Content>
