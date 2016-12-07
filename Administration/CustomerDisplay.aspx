<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Sports.master" CodeFile="CustomerDisplay.aspx.cs" Inherits="CustomerDisplay" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Customer Display</title>
    </asp:Content>
<asp:Content ID="body1" ContentPlaceHolderID="body" runat="server">
    <div>
        Select a customer:&nbsp;
        <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="SqlDataSource1"
            DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
        <br />
<<<<<<< HEAD
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [CustomerID], [Name], [Address], [City], [State], [ZipCode], [Phone], [Email] FROM [Customers] WHERE ([CustomerID] = @CustomerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCustomers" Name="CustomerID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
=======
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
>>>>>>> origin/master
        <br />
        <asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" Text="Add to Contact List" Width="150px" onclick="btnAdd_Click" />
        &nbsp;
        <asp:Button ID="btnDisplay" CssClass="btn btn-default-inv" runat="server" PostBackUrl="ContactDisplay" Text="Display Contact List" Width="150px" />
        </div>
        <br />
        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>

    </div>
</asp:Content>
