<%@ Page Title="Survey Complete" Language="C#" AutoEventWireup="true" MasterPageFile="~/Sports.master" CodeFile="SurveyComplete.aspx.cs" Inherits="SurveyComplete" %>


<asp:Content ID="Head1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="body1" ContentPlaceHolderID="body" runat="server">
    
    <div>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Black"></asp:Label><br />
        <br />
        <asp:Button ID="Button1" CssClass="btn btn-default-inv" runat="server" PostBackUrl="CustomerSupport_CustomerSurvey" Text="Return to Survey" />
    </div>
    </asp:Content>
 
