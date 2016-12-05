<%@ Page Title="Technician Maintenance" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="TechnicianMaintenance.aspx.cs" Inherits="TechnicianMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100px;
        }
        .style2
        {
            width: 75px;
        }
        .style3
        {
            width: 250px;
        }
        .style4
        {
            width: 20px;
        }
        .style5
        {
            width: 40px;
        }
        .style6
        {
            width: 222px;
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
    Select a technician:&nbsp;
    <asp:DropDownList ID="ddlTechnicians" runat="server" DataSourceID="SqlDataSource1"
        DataTextField="Name" DataValueField="TechID" Width="150px" AutoPostBack="True">
    </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>"
        SelectCommand="SELECT [TechID], [Name] FROM [Technicians] ORDER BY [Name]" ProviderName="<%$ ConnectionStrings:ConnectionString1.ProviderName %>"></asp:SqlDataSource>
    <br />
    <br />
    <table>
        <tr>
            <td class="style1">
                <asp:FormView ID="fvTechnician" runat="server" DataKeyNames="TechID" 
                    DataSourceID="SqlDataSource2" BorderColor="Black" BorderStyle="Solid" 
                    BorderWidth="3px" CellPadding="4" ForeColor="White" Width="375px" 
                    onitemdeleted="fvTechnician_Deleted" 
                    oniteminserted="fvTechnician_Inserted" 
                    onitemupdated="fvTechnician_Updated" BackColor="#000099" CellSpacing="2" GridLines="Both">
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td class="style2">Tech ID:</td>
                                <td class="style3">
                                    <asp:Label ID="TechIDLabel1" runat="server" Text='<%# Eval("TechID") %>'></asp:Label>
                                </td>
                                <td class="style4"></td>
                            </tr>
                            <tr>
                                <td class="style2">Name:</td>
                                <td class="style3">
                                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' Width="240px"></asp:TextBox>
                                </td>
                                <td class="style4">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox"
                                        Display="Dynamic" ErrorMessage="Name is a required field.">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">Email:</td>
                                <td class="style3">
                                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' Width="240px"></asp:TextBox>
                                </td>
                                <td class="style4">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EmailTextBox"
                                        Display="Dynamic" ErrorMessage="Email is a required field.">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">Phone:</td>
                                <td class="style3">
                                    <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' Width="240px"></asp:TextBox>
                                </td>
                                <td class="style4">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PhoneTextBox"
                                        Display="Dynamic" ErrorMessage="Phone is a required field.">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <center>
                            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update"></asp:Button>
                            <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel"></asp:Button>
                        </center>
                        
                    </EditItemTemplate>

                    <InsertItemTemplate>
                        <table>
                            <tr>
                                <td class="style2">Name:</td>
                                <td class="style3">
                                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' Width="240px"></asp:TextBox>
                                </td>
                                <td class="style5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="NameTextBox"
                                        ErrorMessage="Name is a required field." Display="Dynamic">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">Email:</td>
                                <td class="style3">
                                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' Width="240px"></asp:TextBox>
                                </td>
                                <td class="style5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="EmailTextBox"
                                        ErrorMessage="Email is a required field." Display="Dynamic">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">Phone:</td>
                                <td class="style3">
                                    <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' Width="240px"></asp:TextBox>
                                </td>
                                <td class="style5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="PhoneTextBox"
                                        ErrorMessage="Phone is a required field." Display="Dynamic">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <center>
                            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert"></asp:Button>
                            <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel"></asp:Button>
                        </center>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td class="style2">Tech ID:</td>
                                <td class="style3">
                                    <asp:Label ID="TechIDLabel" runat="server" Text='<%# Eval("TechID") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">Name:</td>
                                <td class="style3">
                                    <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">Email:</td>
                                <td class="style3">
                                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">Phone:</td>
                                <td class="style3">
                                    <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <center>
                            <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:Button>
                            <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete"></asp:Button>
                            <asp:Button ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New"></asp:Button>
                        </center>
                    </ItemTemplate>
                    <FooterStyle BackColor="#000099" />
                    <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#000099" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <InsertRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>"
                    SelectCommand="SELECT [TechID], [Name], [Email], [Phone] FROM [Technicians] WHERE ([TechID] = ?)" ConflictDetection="CompareAllValues" 
                    DeleteCommand="DELETE FROM [Technicians] WHERE [TechID] = @original_TechID AND [Name] = @original_Name AND [Email] = @original_Email AND [Phone] = @original_Phone" 
                    InsertCommand="INSERT INTO [Technicians] ([Name], [Email], [Phone]) VALUES (@Name, @Email, @Phone)" OldValuesParameterFormatString="original_{0}" 
                    UpdateCommand="UPDATE [Technicians] SET [Name] = @Name, [Email] = @Email, [Phone] = @Phone WHERE [TechID] = @original_TechID AND [Name] = @original_Name AND [Email] = @original_Email AND [Phone] = @original_Phone" ProviderName="<%$ ConnectionStrings:ConnectionString1.ProviderName %>">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlTechnicians" Name="TechID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_TechID" Type="Int32" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_Phone" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="original_TechID" Type="Int32" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_Phone" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td class="style4"></td>
            <td class="style6" valign="top">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    HeaderText="Please correct the following errors:" ForeColor="Red" />
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblErrorMessage" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label><br />
</asp:Content>

