<%@ Page Title="Register" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="display-box">
     <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Desired Username:  "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" CssClass="black-type" runat="server"></asp:TextBox>
                </td>
            </tr>
         <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Email:  "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" CssClass="black-type" runat="server"></asp:TextBox>
                </td>
            </tr>

         <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Password:  "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" CssClass="black-type" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>

         <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Confirm Password:  "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" CssClass="black-type" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
    </table>

    <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" OnClick="Button1_Click" Text="Register" />
    
    <br />
    <asp:Label ID="errLabel" runat="server"></asp:Label>
        </div>

    
    
</asp:Content>

