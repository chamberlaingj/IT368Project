<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Sports.master" CodeFile="CustomerSurvey.aspx.cs" Inherits="CustomerSurvey" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Customer Survey</title>
</asp:Content>

<asp:Content ID="body1" ContentPlaceHolderID="body" runat="server">
    <div>
        Enter your customer ID: &nbsp;
        <asp:TextBox ID="txtCustomerID" runat="server" Width="80px"></asp:TextBox>&nbsp;
        <asp:Button ID="btnGetIncidents" CssClass="btn btn-default-inv" runat="server" Text="Get Incidents" ValidationGroup="CustomerID" onclick="btnGetIncidents_Click" />

        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerID" Display="Dynamic" ErrorMessage="You must enter a customer ID." ValidationGroup="CustomerID" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCustomerID" Display="Dynamic" ErrorMessage="Customer ID must be an integer." Operator="DataTypeCheck" Type="Integer" ValidationGroup="CustomerID" ForeColor="Red"></asp:CompareValidator><br />
        
        <asp:Label ID="lblNoIncidents" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <div class="display-box">
        <asp:ListBox ID="lstIncidents" runat="server" Width="448px" Enabled="False"></asp:ListBox>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You must select an incident." ControlToValidate="lstIncidents" InitialValue="None" Width="192px" Display="Dynamic" Enabled="False" ValidationGroup="Submit" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/TechSupport.mdb" SelectCommand="SELECT [CustomerID], [ProductCode], [DateOpened], [Title], [DateClosed], [TechID], [IncidentID] FROM [Incidents] ORDER BY [DateClosed]"></asp:AccessDataSource>
        <br />
        <br />
        <asp:Label ID="lblHeading" runat="server" Font-Bold="True" Text="Please rate this incident by the following categories:" Enabled="False"></asp:Label><br />
        <table>
            <tr>
                <td class="auto-style1" valign="top">
                    <asp:Label ID="lblResponseTime" runat="server" Text="Response time:" Enabled="False"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:RadioButtonList ID="rblResponseTime" runat="server" RepeatDirection="Vertical" Enabled="False">
                        <asp:ListItem Value="1">&nbsp;Not satisfied</asp:ListItem>
                        <asp:ListItem Value="2">&nbsp;Somewhat satisfied</asp:ListItem>
                        <asp:ListItem Value="3">&nbsp;Satisfied</asp:ListItem>
                        <asp:ListItem Value="4">&nbsp;Completely satisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" valign="top">
                    <asp:Label ID="lblEfficiency" runat="server" Text="Technician efficiency:" Width="136px" Enabled="False"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:RadioButtonList ID="rblEfficiency" runat="server" RepeatDirection="Vertical" Enabled="False">
                    <asp:ListItem Value="1">&nbsp;Not satisfied</asp:ListItem>
                    <asp:ListItem Value="2">&nbsp;Somewhat satisfied</asp:ListItem>
                    <asp:ListItem Value="3">&nbsp;Satisfied</asp:ListItem>
                    <asp:ListItem Value="4">&nbsp;Completely satisfied</asp:ListItem>
                </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" valign="top">
                    <asp:Label ID="lblResolution" runat="server" Text="Problem resolution:" Enabled="False"></asp:Label>
                </td>
                <td class="auto-style1"><asp:RadioButtonList ID="rblResolution" runat="server" RepeatDirection="Vertical" Enabled="False">
                    <asp:ListItem Value="1">&nbsp;Not satisfied</asp:ListItem>
                    <asp:ListItem Value="2">&nbsp;Somewhat satisfied</asp:ListItem>
                    <asp:ListItem Value="3">&nbsp;Satisfied</asp:ListItem>
                    <asp:ListItem Value="4">&nbsp;Completely satisfied</asp:ListItem>
                </asp:RadioButtonList>
                </td>
            </tr>
        </table>
        <br />
        <table>
            <tr>
                <td class="style3" valign="top">
                    <asp:Label ID="lblComments" runat="server" Text="Additional comments:" Width="136px" Enabled="False"></asp:Label></td>
                <td class="style4">
                    <asp:TextBox ID="txtComments" runat="server" Rows="4" TextMode="MultiLine" Width="470px" Enabled="False"></asp:TextBox></td>
            </tr>
        </table>
        <br />
        <center>
        <asp:CheckBox ID="chkContact" runat="server" Text="&nbsp;Please contact me to discuss this incident." Enabled="False" /><br />
        <table>
            <tr>
                <td class="style5">
                </td>
                <td class="style6">
                    <asp:RadioButton ID="rdoContactByEmail" runat="server" GroupName="Contact" Text="&nbsp;Contact by email"
                        Width="136px" Enabled="False" /><br />
                    <asp:RadioButton ID="rdoContactByPhone" runat="server" GroupName="Contact" Text="&nbsp;Contact by phone"
                        Width="136px" Enabled="False" /></td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Text="Submit" Enabled="False" 
            ValidationGroup="Submit" onclick="btnSubmit_Click" /></div>
        </center>
        </div>
</asp:Content>
