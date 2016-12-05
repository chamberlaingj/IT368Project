<%@ Page Title="" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="CustomerMaintenance.aspx.cs" Inherits="CustomerMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CustomerMaintenance</title>
    <style type="text/css">
        .style1
        {
            width: 375px;
        }
        .style2
        {
            width: 15px;
        }
        .style3
        {
            width: 255px;
        }
        input, button, select, textarea {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
            color: black;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <table>
        <tr>
            <td class="auto-style1" valign="top">
                <asp:GridView ID="maintainCustomers" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" CellPadding="5" CellSpacing="5" DataKeyNames="CustomerID"
                    DataSourceID="SqlDataSource1" ForeColor="Black" Width="375px" SelectedIndex="0" PageSize="8" AllowSorting="True" BackColor="Black">
                    <FooterStyle BackColor="#CCCCCC" />



                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                            <ItemStyle Width="160px" />
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                            <ItemStyle Width="110px" />
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State">
                            <ItemStyle Width="45px" />
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" >
                            <ItemStyle Width="60px" />
                        </asp:CommandField>
                    </Columns>



                    <RowStyle BackColor="White" Font-Size="Small" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="Black" Font-Names="Arial" Font-Size="Small" ForeColor="White"
                        HorizontalAlign="Center" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" Font-Names="Arial" Font-Size="Small"
                        ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>"
                    SelectCommand="SELECT [CustomerID], [Name], [City], [State] FROM [Customers] ORDER BY [Name]" ProviderName="<%$ ConnectionStrings:ConnectionString1.ProviderName %>">
                </asp:SqlDataSource>
            </td>
            <td class="style2"></td>
            <td class="style3" valign="top">
                <asp:DetailsView ID="dtlCustomers" runat="server" 
                    DataSourceID="SqlDataSource2" Height="50px"
                    Width="300px" AutoGenerateRows="False" Color="Black" CellPadding="5" CellSpacing="5" onitemdeleted="dtlCustomers_Deleted" 
                    oniteminserted="dtlCustomers_Inserted" 
                    onitemupdated="dtlCustomers_Updated" ForeColor="Black" BackColor="#000099" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" Font-Size="Small" Height="20px" />
                    <AlternatingRowStyle Height="20px" />
                    <CommandRowStyle BackColor="#000099" />
                    <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <FieldHeaderStyle BackColor="#000099" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="CustomerID" HeaderText="ID:" InsertVisible="False"
                            ReadOnly="True" SortExpression="CustomerID">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name:" SortExpression="Name">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="200px" />
                            <ControlStyle Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Address" HeaderText="Address:" SortExpression="Address">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="200px" />
                            <ControlStyle Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="200px" />
                            <ControlStyle Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="State" HeaderText="State:" SortExpression="State">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="200px" />
                            <ControlStyle Width="40px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ZipCode" HeaderText="Zip code:" SortExpression="ZipCode">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="200px" />
                            <ControlStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="200px" />
                            <ControlStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Email:" SortExpression="Email">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="200px" />
                            <ControlStyle Width="200px" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True"
                            ShowInsertButton="True" ItemStyle-HorizontalAlign="Center" />
                    </Fields>
                </asp:DetailsView>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" 
                    DeleteCommand="DELETE * FROM [Registrations] WHERE [CustomerID] = @original_CustomerID"
                    InsertCommand="INSERT INTO [Customers] ([Name], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (@Name, @Address, @City, @State, @ZipCode, @Phone, @Email)"
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT [CustomerID], [Name], [Address], [City], [State], [ZipCode], [Phone], [Email] FROM [Customers] WHERE ([CustomerID] = ?)"
                    UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Phone] = @Phone, [Email] = @Email WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [Phone] = @original_Phone AND [Email] = @original_Email" ProviderName="<%$ ConnectionStrings:ConnectionString1.ProviderName %>">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CustomerID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="State" Type="String" />
                        <asp:Parameter Name="ZipCode" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="original_CustomerID" Type="Int32" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_State" Type="String" />
                        <asp:Parameter Name="original_ZipCode" Type="String" />
                        <asp:Parameter Name="original_Phone" Type="String" />
                        <asp:Parameter Name="original_Email" Type="String" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="maintainCustomers" Name="CustomerID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="State" Type="String" />
                        <asp:Parameter Name="ZipCode" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <asp:Label ID="lblErrorMessage" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

