<%@ Page Title="IncidentDisplay" Language="C#" MasterPageFile="~/Sports.master" AutoEventWireup="true" CodeFile="IncidentDisplay.aspx.cs" Inherits="IncidentDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
         <LayoutTemplate>
             <table ID="itemHeadingsr" runat="server" cellspacing="0" cellpadding="0"
                style="border-color: Black;font-size: small">
                <tr style="background-color:Black;color: White;font-weight:bold;
                    font-family: Verdana, Arial, Helvetica, sans-serif">
                    <th id="Th1" runat="server" style="width: 225px" align="left">Product</th>
                    <th id="Th2" runat="server" style="width: 200px" align="left">Customer</th>
                    <th id="Th3" runat="server" style="width: 200px" align="left">Technician</th>
                </tr>
                <tr ID="itemPlaceholder" runat="server"></tr>
            </table>
            <table id="IncidentTable1" runat="server" cellspacing="0" cellpadding="0" 
                style="text-align: center;background-color: #EFF3FB;
                font-family: Verdana, Arial, Helvetica, sans-serif;
                width: 625px;font-size: small">
                <tr>
                    <td>
                        <asp:DataPager ID="ItemDataPager1" runat="server" PageSize="4">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
         <AlternatingItemTemplate>
            <tr style="background-color:White;">
                <td colspan="3">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="ProductLabel" runat="server" 
                                    Text='<%# Eval("Product") %>' Width="225" />
                            </td>
                            <td style="width: 200px">
                                <asp:Label ID="CustomerLabel" runat="server" 
                                    Text='<%# Eval("Customer") %>' Width="200" />
                            </td>
                            <td style="width: 200px">
                                <asp:Label ID="TechnicianLabel" runat="server" 
                                    Text='<%# Eval("Technician") %>' Width="200" />
                            </td>
                        </tr>
                        <tr style="height: 10px"></tr>
                        <tr>
                            <td style="width: 125px"></td>
                            <td style="width: 100px">Date Opened:</td>
                            <td colspan="2">
                                <asp:Label ID="DateOpenedLabel" runat="server" 
                                    Text='<%# Eval("DateOpened", "{0:d}") %>' Width="100" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 125px"></td>
                            <td style="width: 100px">Date Closed:</td>
                            <td colspan="2">
                                <asp:Label ID="DateClosedLabel" runat="server" 
                                    Text='<%# Eval("DateClosed", "{0:d}") %>' Width="100" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 125px"></td>
                            <td style="width: 100px">Title:</td>
                            <td colspan="2">
                                <asp:Label ID="TitleLabel" runat="server" 
                                    Text='<%# Eval("Title") %>' Width="400" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 125px"></td>
                            <td style="width: 100px" valign="top">Description:</td>
                            <td colspan="2">
                                <asp:Label ID="DescriptionLabel" runat="server" 
                                    Text='<%# Eval("Description") %>' Width="400" />
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 20px" colspan="4"></td>
                        </tr>
                    </table>
                </td>
            </tr>
          </AlternatingItemTemplate>


         <ItemTemplate>
            <tr style="background-color:#EFF3FB;">
                <td colspan="3">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="ProductLabel" runat="server" 
                                    Text='<%# Eval("Product") %>' Width="225" />
                            </td>
                            <td style="width: 200px">
                                <asp:Label ID="CustomerLabel" runat="server" 
                                    Text='<%# Eval("Customer") %>' Width="200" />
                            </td>
                            <td style="width: 200px">
                                <asp:Label ID="TechnicianLabel" runat="server" 
                                    Text='<%# Eval("Technician") %>' Width="200" />
                            </td>
                        </tr>
                        <tr style="height: 10px"></tr>
                        <tr>
                            <td style="width: 125px"></td>
                            <td style="width: 100px">Date Opened:</td>
                            <td colspan="2">
                                <asp:Label ID="DateOpenedLabel" runat="server" 
                                    Text='<%# Eval("DateOpened", "{0:d}") %>' Width="100" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 125px"></td>
                            <td style="width: 100px">Date Closed:</td>
                            <td colspan="2">
                                <asp:Label ID="DateClosedLabel" runat="server" 
                                    Text='<%# Eval("DateClosed", "{0:d}") %>' Width="100" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 125px"></td>
                            <td style="width: 100px">Title:</td>
                            <td colspan="2">
                                <asp:Label ID="TitleLabel" runat="server" 
                                    Text='<%# Eval("Title") %>' Width="400" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 125px"></td>
                            <td style="width: 100px">Description:</td>
                            <td colspan="2" valign="top">
                                <asp:Label ID="DescriptionLabel" runat="server" 
                                    Text='<%# Eval("Description") %>' Width="400" />
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 20px" colspan="4"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </ItemTemplate>

        <EmptyDataTemplate>
            <table id="IncidentTable2" runat="server" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>


    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT Products.Name AS Product, Customers.Name AS Customer, Technicians.Name AS Technician, Incidents.DateOpened, Incidents.DateClosed, Incidents.Title, Incidents.Description FROM (((Incidents INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID) INNER JOIN Products ON Incidents.ProductCode = Products.ProductCode) INNER JOIN Technicians ON Incidents.TechID = Technicians.TechID) ORDER BY Incidents.DateOpened"></asp:SqlDataSource>
</asp:Content>

