<%@ Page Title="Product Registration" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="ProductRegistration.aspx.cs" Inherits="ProductRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       .style1
       {
           width: 70px;
           height: 28px; 
       }
       .style2
       {
           width: 200px;
           height: 28px;
       }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    Enter your customer ID:&nbsp;
    <asp:TextBox ID="txtCustomerID" runat="server" Width="72px"></asp:TextBox>&nbsp;
    <asp:Button ID="btnGetCustomer" CssClass="btn btn-default-inv" runat="server" Text="Get Customer" ValidationGroup="GetCustomer" />&nbsp;
    <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerID"
        Display="Dynamic" ErrorMessage="You must enter a customer ID." 
        ValidationGroup="GetCustomer" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCustomerID"
        Display="Dynamic" ErrorMessage="CompareValidator" 
        Operator="DataTypeCheck" Type="Integer"
        ValidationGroup="GetCustomer" ForeColor="Red">Customer ID must be an integer.</asp:CompareValidator>
    <asp:CustomValidator ID="cvalCustomerID" runat="server" ControlToValidate="txtCustomerID"
        Display="Dynamic" ErrorMessage="Customer not found." 
        ValidationGroup="GetCustomer" ForeColor="Red" 
        onservervalidate="cvalCustomerID_ServerValidate"></asp:CustomValidator>
    <br />
    <div class="display-box">
    <table>
        <tr>
            <td class="style1">Customer:</td>
            <td class="style2">
                <asp:Label ID="lblCustomer" runat="server" Width="194px"></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>"
                        SelectCommand="SELECT [CustomerID], [Name] FROM [Customers] WHERE ([CustomerID] = @CustomerID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtCustomerID" Name="CustomerID"
                                PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style1">Product:</td>
            <td class="style2">
                <asp:DropDownList ID="ddlProducts" CssClass="black-type" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="Name" DataValueField="ProductCode" Width="198px" AppendDataBoundItems="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>"
                    SelectCommand="SELECT [ProductCode], [Name] FROM [Products] ORDER BY [Name]">
                </asp:SqlDataSource>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlProducts"
                    Display="Dynamic" ErrorMessage="You must select a product." InitialValue="None"
                    ValidationGroup="RegisterProduct" Width="183px" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnRegister" CssClass="btn btn-success" runat="server" Text="Register Product" 
        Enabled="False" ValidationGroup="RegisterProduct" onclick="btnRegister_Click" /><br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>"
        DeleteCommand="DELETE FROM [Registrations] WHERE [CustomerID] = @CustomerID AND [ProductCode] = @ProductCode"
        InsertCommand="INSERT INTO [Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (@CustomerID, @ProductCode, @RegistrationDate)"
        SelectCommand="SELECT * FROM [Registrations] WHERE ([CustomerID] = @CustomerID)"
        UpdateCommand="UPDATE [Registrations] SET [RegistrationDate] = @RegistrationDate WHERE [CustomerID] = @CustomerID AND [ProductCode] = @ProductCode">
        <DeleteParameters>
            <asp:Parameter Name="CustomerID" Type="Int32" />
            <asp:Parameter Name="ProductCode" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="RegistrationDate" Type="DateTime" />
            <asp:Parameter Name="CustomerID" Type="Int32" />
            <asp:Parameter Name="ProductCode" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtCustomerID" Name="CustomerID" PropertyName="Text"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="CustomerID" Type="Int32" />
            <asp:Parameter Name="ProductCode" Type="String" />
            <asp:Parameter Name="RegistrationDate" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblErrorMessage" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label><br />
    </div>
</asp:Content>