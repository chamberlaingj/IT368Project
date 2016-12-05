<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Sports.master" CodeFile="CustomerDisplay.aspx.cs" Inherits="CustomerDisplay" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Customer Display</title>
</asp:Content>
<asp:Content ID="body1" ContentPlaceHolderID="body" runat="server">
    <div>
        Select a customer:&nbsp;
        <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="AccessDataSource1"
            DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True">
        </asp:DropDownList>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/TechSupport.mdb"
            SelectCommand="SELECT * FROM [Customers] ORDER BY [Name]">
        </asp:AccessDataSource>
        <br />
        <br />
        <div class="display-box">
        <table>
            <tr>
                <td class="style1">
                    Address:</td>
                <td class="style2">
                    <asp:Label ID="lblAddress" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="style1">
                    </td>
                <td class="style2">
                    <asp:Label ID="lblCityStateZip" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="style1">
                    Phone:</td>
                <td class="style2">
                    <asp:Label ID="lblPhone" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="style1">
                    Email:</td>
                <td class="style2">
                    <asp:Label ID="lblEmail" runat="server"></asp:Label></td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" Text="Add to Contact List" Width="150px" onclick="btnAdd_Click" />
        &nbsp;
        <asp:Button ID="btnDisplay" CssClass="btn btn-default-inv" runat="server" PostBackUrl="ContactDisplay" Text="Display Contact List" Width="150px" />
        </div>
        <br />
        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>

    </div>
</asp:Content>
