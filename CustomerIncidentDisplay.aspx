<%@ Page Title="Customer Incident Display" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="CustomerIncidentDisplay.aspx.cs" Inherits="CustomerIncidentDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .style1
        {
            width: 600px;
        }
        .style2
        {
            width: 210px;
        }
        .style3
        {
            width: 170px;
        }
        .style4
        {
            width: 110px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    Select a customer:&nbsp;
    <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="SqlDataSource1"
        DataTextField="Name" DataValueField="CustomerID" Width="141px" AutoPostBack="True">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>"
        SelectCommand="SELECT [CustomerID], [Name] FROM [Customers] ORDER BY [Name]" ProviderName="<%$ ConnectionStrings:ConnectionString1.ProviderName %>">
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:DataList ID="dlIncidents" runat="server" DataSourceID="SqlDataSource2" CellPadding="3" ForeColor="Black" BorderColor="Black" BorderWidth="3px" BackColor="White" BorderStyle="Solid" GridLines="Vertical">
        <ItemTemplate>
            <table class="style1">
                <tr>
                    <td class="style2">
                        <asp:Label ID="lblProduct" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </td>
                    <td class="style3">
                        <asp:Label ID="lblTechnician" runat="server" Text='<%# Eval("IncTech") %>'></asp:Label>
                    </td>
                    <td class="style4">
                        <asp:Label ID="lblDateOpened" runat="server" Text='<%# Eval("DateOpened", "{0:d}") %>'></asp:Label>
                    </td>
                    <td class="style4">
                        <asp:Label ID="lblDateClosed" runat="server" Text='<%# Eval("DateClosed", "{0:d}") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <HeaderTemplate>
            <table class="style1">
                <tr>
                    <td class="style2" valign="top">Product/<br />Incident</td>
                    <td class="style3" valign="top">Tech name</td>
                    <td class="style4" valign="top">Date opened</td>
                    <td class="style4" valign="top">Date closed</td>
                </tr>
            </table>
        </HeaderTemplate>
        <FooterStyle BackColor="#CCCCCC" />
        <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <AlternatingItemStyle BackColor="#CCCCCC" Font-Size="Small" />
        <ItemStyle Font-Size="Small" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Names="Arial" Font-Size="Small" />
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>"
        SelectCommand="SELECT Products.Name, Technicians.Name AS IncTech,
                              Incidents.DateOpened, Incidents.DateClosed,
                              Incidents.Description
                       FROM (Incidents
                       INNER JOIN Technicians
                          ON Incidents.TechID = Technicians.TechID)
                       INNER JOIN Products
                          ON Incidents.ProductCode = Products.ProductCode
                       WHERE (Incidents.CustomerID = ?)" ProviderName="<%$ ConnectionStrings:ConnectionString1.ProviderName %>">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCustomers" Name="?" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

