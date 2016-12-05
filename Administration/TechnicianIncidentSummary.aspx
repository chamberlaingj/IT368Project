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
            DataSourceID="ObjectDataSource2" BackColor="White" BorderColor="Blue" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
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
            <RowStyle BackColor="#EFF3FB" Font-Size="Small" />
            <HeaderStyle BackColor="Blue" Font-Bold="True" Font-Names="Arial" Font-Size="Small"
                ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
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

