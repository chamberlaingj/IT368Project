<%@ Page Title="Register" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="display-box">
     <table>
         <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="First name:  "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox9" CssClass="black-type" runat="server"></asp:TextBox>
                </td>
            </tr>
           <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Last name:  "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox10" CssClass="black-type" runat="server"></asp:TextBox>
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
                    <asp:Label ID="Label1" runat="server" Text="Address:  "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" CssClass="black-type" runat="server"></asp:TextBox>
                </td>
            </tr>
         <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="State:  "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" CssClass="black-type" runat="server" MaxLength="2"></asp:TextBox>
                </td>
            </tr>
          <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="City:  "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox6" CssClass="black-type" runat="server"></asp:TextBox>
                </td>
            </tr>
          <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Zipcode:  "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox7" CssClass="black-type" runat="server"></asp:TextBox>
                </td>
            </tr>
              <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Cell Number:  "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox8" CssClass="black-type" runat="server"></asp:TextBox>
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
    <asp:Label ID="errLabel" runat="server" ForeColor="Red"></asp:Label>
        </div>

    
    
</asp:Content>

