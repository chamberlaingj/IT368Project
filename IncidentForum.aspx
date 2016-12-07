<%@ Page Title="HTTP Error 403" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="IncidentForum.aspx.cs" Inherits="IncidentForum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="IncidentID" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
            <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
            <asp:BoundField DataField="TechID" HeaderText="TechID" SortExpression="TechID" />
            <asp:BoundField DataField="DateOpened" HeaderText="DateOpened" SortExpression="DateOpened" />
            <asp:BoundField DataField="DateClosed" HeaderText="DateClosed" SortExpression="DateClosed" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT IncidentID, CustomerID, ProductCode, TechID, DateOpened, DateClosed, Title, Description FROM Incidents WHERE (IncidentID = @IncidentID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" Name="IncidentID" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    Comments<br />
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
</asp:Content>