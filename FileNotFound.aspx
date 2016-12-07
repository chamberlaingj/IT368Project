<%@ Page Title="HTTP Error 404" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="FileNotFound.aspx.cs" Inherits="FileNotFound" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <span class="style1">The resource you requested can't be found. The application must be aborted.</span><br />
</asp:Content>