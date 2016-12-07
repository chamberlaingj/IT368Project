<%@ Page Title="HTTP Error" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="HttpError.aspx.cs" Inherits="HttpError" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <span class="style1">An unexpected HTTP error has occurred. The application must be aborted.</span><br />
</asp:Content>