<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Sports.master" CodeFile="ContactDisplay.aspx.cs" Inherits="ContactDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Contact Display</title>
</asp:Content>
<asp:Content ID="body1" ContentPlaceHolderID="body" runat="server">
    <div>
        <h1>SportsPro</h1><br />
        <h2>Sports management software for the sports enthusiast</h2>
        <br />
        Contact list:<br />
        <table>
            <tr>
                <td class="style1">
                    <asp:ListBox ID="lstContacts" runat="server" Height="120px" Width="450px"></asp:ListBox>
                </td>
                <td class="style1">
                    <asp:Button ID="btnRemove" runat="server" Text="Remove Contact" Width="120px" 
                        onclick="btnRemove_Click" /><br />
                    <br />
                    <asp:Button ID="btnEmpty" runat="server" Text="Empty List" Width="120px" 
                        onclick="btnEmpty_Click" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnSelect" runat="server" Text="Select Additional Customers" PostBackUrl="CustomerDisplay" Width="200px" /><br />
    </div>
</asp:Content>
