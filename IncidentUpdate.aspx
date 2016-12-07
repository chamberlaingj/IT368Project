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
    <asp:GridView ID="grdIncidents" runat="server" DataSourceID="ObjectDataSource2" 
        AutoGenerateColumns="False" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" 
        CellPadding="4" ForeColor="#333333" GridLines="None" Width="850px">
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
            <asp:CommandField ButtonType="Button" ShowEditButton="True" >
                <ItemStyle VerticalAlign="Top" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" Font-Size="Small" />
        <EditRowStyle BackColor="CornflowerBlue" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="Blue" Font-Bold="True" Font-Names="Arial" Font-Size="Small"
            ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" TypeName="IncidentDB" 
        SelectMethod="GetCustomerIncidents" UpdateMethod="UpdateIncident" 
        ConflictDetection="CompareAllValues">
        <UpdateParameters>
            <asp:Parameter Name="original_Incident" Type="Object" />
            <asp:Parameter Name="incident" Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCustomers" Name="CustomerID" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:Label ID="lblErrorMessage" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label><br />
</asp:Content>
