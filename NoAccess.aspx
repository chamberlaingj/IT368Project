<%@ Page Title="HTTP Error 403" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="NoAccess.aspx.cs" Inherits="NoAccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <span class="style1">You do not have access to the requested resource. The application must be aborted.</span><br />
</asp:Content>