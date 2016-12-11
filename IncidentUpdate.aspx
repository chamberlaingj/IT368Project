<%@ Page Title="Incident Update" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    Select a customer:&nbsp;
    <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="ObjectDataSource1"
        DataTextField="Name" DataValueField="CustomerID" Width="225px" AutoPostBack="True">
    </asp:DropDownList>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetCustomersWithIncidents" TypeName="CustomerDB">
    </asp:ObjectDataSource>
    <br />
    <br />
    <asp:GridView ID="grdIncidents" runat="server" DataSourceID="SqlDataSource1" 
        AutoGenerateColumns="False" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
        CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="850px" BackColor="White" OnRowUpdating="dtlCustomers_Updated">
        <Columns>
            <asp:BoundField DataField="IncidentID" HeaderText="ID" ReadOnly="True">
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="25px" />
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" />
            </asp:BoundField>
            <asp:BoundField DataField="ProductCode" HeaderText="Product code" ReadOnly="True">
                <ItemStyle Width="60px" VerticalAlign="Top" />
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" />
            </asp:BoundField>
            <asp:BoundField DataField="DateOpened" DataFormatString="{0:d}" HeaderText="Date opened"
                HtmlEncode="False" ReadOnly="True">
                <ItemStyle Width="60px" VerticalAlign="Top" />
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" />
            </asp:BoundField>
            <asp:BoundField DataField="DateClosed" DataFormatString="{0:d}" HeaderText="Date closed"
                HtmlEncode="False" ApplyFormatInEditMode="True">
                <ControlStyle Width="50px" />
                <ItemStyle Width="60px" VerticalAlign="Top" />
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" />
            </asp:BoundField>
            <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True">
                <ItemStyle Width="160px" VerticalAlign="Top" />
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>'
                        Rows="4" TextMode="MultiLine" Width="275px"></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle Width="285px" />
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" />
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowEditButton="True" ControlStyle-CssClass="btn btn-warning">
<ControlStyle CssClass="btn btn-warning"></ControlStyle>

                <ItemStyle VerticalAlign="Top" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <RowStyle Font-Size="Small" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <HeaderStyle BackColor="Black" Font-Bold="True" Font-Names="Arial" Font-Size="Small"
            ForeColor="White" />
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT IncidentID, ProductCode, DateOpened, DateClosed, Title, Description FROM Incidents WHERE (CustomerID = @CustomerID) AND (TechID IS NOT NULL)" UpdateCommand="UPDATE Incidents SET TechID = '123' WHERE (Description = '01/01/01')">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCustomers" Name="CustomerID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="lblErrorMessage" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label><br />
</asp:Content>
