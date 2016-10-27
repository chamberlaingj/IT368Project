<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <span class="style1">How to contact us</span><br /><br />
  Any Questions About Anything?<br />
   Contact Sports Pro!!<br />
    <br />
    <table cellpadding="4" style="width: 350px;">
        <tr>
            <td class="style2" valign="top">Phone:</td>
            <td class="style3">
                1-708-555-2398<br />
                Please Call within 7am to 10pm central time
            </td>
        </tr>
        <tr>
            <td class="style2">E-mail:</td>
            <td class="style3">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="mailto:sportspro@sportspro.com">
                    sportspro@sportspro.com</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="style2">Fax:</td>
            <td class="style3">1-559-555-2732</td>
        </tr>
        <tr>
            <td class="style2" valign="top">Address:</td>
            <td class="style3">
                SportsPro, Inc.<br />
                3456 N. Van Buren Street<br />
                Chicago, Illinois 93710
            </td>
        </tr>
    </table>
</asp:Content>

