<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Sports.master" CodeFile="ContactDisplay.aspx.cs" Inherits="ContactDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Contact Display</title>
</asp:Content>
<asp:Content ID="body1" ContentPlaceHolderID="body" runat="server">
    <div class="display-box">
        Contact list:<br />
        <table>
            <tr>
                <td class="black-type">
                    <asp:ListBox ID="lstContacts" runat="server" Height="120px" Width="450px"></asp:ListBox>
                </td>
                <td class="style2">
                    <asp:Button ID="btnRemove" CssClass="btn btn-warning" runat="server" Text="Remove Contact" Width="120px" 
                        onclick="btnRemove_Click" /><br />
                    <br />
                    <asp:Button ID="btnEmpty" CssClass="btn btn-danger" runat="server" Text="Empty List" Width="120px" 
                        onclick="btnEmpty_Click" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnSelect" CssClass="btn btn-default-inv" runat="server" Text="Select Additional Customers" PostBackUrl="CustomerDisplay" Width="200px" /><br />
    </div>
</asp:Content>
