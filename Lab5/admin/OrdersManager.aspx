<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="OrdersManager.aspx.cs" Inherits="Lab5.admin.OrdersManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <title>Administrator tools: the orders manager page</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentplaceTitle" runat="server">
<h1>Orders</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceText" runat="server">
    <asp:GridView ID="grdContacts" runat="server" AutoGenerateColumns="False" EnableViewState="False"
        EmptyDataText="There are no data records to display." 
        onrowdeleted="GrdContactsRowDelete" onrowediting="GrdContactsRowEdit">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" />
            <asp:BoundField DataField="StateOrProvince" HeaderText="StateOrProvince" 
                SortExpression="StateOrProvince" />
            <asp:BoundField DataField="Region" HeaderText="Region" 
                SortExpression="Region" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="Address" HeaderText="Address" 
                SortExpression="Address" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Birthdate" HeaderText="Birthdate" 
                SortExpression="Birthdate" />
            <asp:BoundField DataField="HomePhone" HeaderText="HomePhone" 
                SortExpression="HomePhone" />
            <asp:BoundField DataField="MobilePhone" HeaderText="MobilePhone" 
                SortExpression="MobilePhone" />
                
                
              </Columns>
    </asp:GridView> 
  </asp:Content>