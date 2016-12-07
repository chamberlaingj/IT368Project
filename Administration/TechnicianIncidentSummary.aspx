<%@ Page Title="Technician Incident Summary" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="TechnicianIncidentSummary.aspx.cs" Inherits="TechnicianIncidentSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    Technician:
        <asp:DropDownList ID="ddlTechnicians" runat="server" 
            DataSourceID="ObjectDataSource1" DataTextField="Name" DataValueField="TechID" 
            Width="150px" AutoPostBack="True">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllTechnicians" 
            TypeName="TechnicianDB">
        </asp:ObjectDataSource>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="ObjectDataSource2" BackColor="White" BorderColor="#999999" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" 
            GridLines="Vertical">
            <Columns>
                <asp:BoundField DataField="DateOpened" DataFormatString="{0:d}" 
                    HeaderText="Date Opened" >
                <HeaderStyle HorizontalAlign="Left" Width="125px" />
                </asp:BoundField>
                <asp:BoundField DataField="ProductCode" HeaderText="Product" >
                <HeaderStyle HorizontalAlign="Left" Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Customer">
                <HeaderStyle HorizontalAlign="Left" Width="200px" />
                </asp:BoundField>
            </Columns>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle Font-Size="Small" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" Font-Names="Arial" Font-Size="Small"
                ForeColor="White" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetOpenTechIncidents" TypeName="IncidentDB">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlTechnicians" Name="techID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
</asp:Content>

