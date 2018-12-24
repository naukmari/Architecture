<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="ContactsManager.aspx.cs" Inherits="Lab5.admin.ContactsManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <title>Administrator tools: the contacts manager page</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentplaceTitle" runat="server">
<h1>Contacts</h1>
<asp:Literal runat="server" ID="msg"></asp:Literal>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceText" runat="server">
<!-- ---------------------------GridView: Contacts ------------------------- -->    
<div style="width: 768px">

 <asp:ImageButton ID="imgbtnSave" runat="server" Visible="true"  AlternateText="Save"    Width="18px" Height="18px"
                        ToolTip="Save" ImageUrl="~/icons/save.gif"  OnClick="imgbtnSave_Click" />&nbsp;
                 <b><asp:Literal ID="ltlSave" runat="server" Text="Save" /></b>&nbsp;&nbsp;&nbsp;
    <asp:ImageButton ID="imgbtnNew" runat="server"  AlternateText="New"    Width="18px" Height="18px"
                        ToolTip="Save" ImageUrl="~/icons/new.gif"  OnClick="imgbtnNew_Click" />&nbsp;
                    <b><asp:Literal ID="ltrNew" runat="server" Text="New" /></b>&nbsp;&nbsp;&nbsp;
                 
</div>
<hr/>
<div style="width: 768px>
<div style="width: 248px;float: left; margin-right: 10px ">
 <asp:GridView ID="grdContacts" runat="server" AutoGenerateColumns="False" EmptyDataText="There are no data records to display."
 onrowediting="grdContactsRowEdit"
 onrowdeleting="grdContactsRowDelete">
 
 <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
 <RowStyle BackColor="#EEEEEE" ForeColor="Black" Height="20px" />
 <AlternatingRowStyle BackColor="Gainsboro" />
 <SelectedRowStyle BackColor="#008A8C" ForeColor="White" />
 <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
 <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
 <Columns>
 <asp:templatefield >
 <ItemTemplate>
 <asp:ImageButton ID="imgbtnEdit" runat="server" commandname="Edit" 
 ImageUrl="~/icons/edit.png" ToolTip = "Edit"/>
 </ItemTemplate>
 </asp:templatefield>
 <asp:templatefield >
 <itemtemplate>
 <asp:ImageButton id="imgbtnDelete" runat="server" commandname="Delete" 
 AlternateText='Delete' ImageUrl="~/icons/error.gif" forecolor="black"
 ToolTip='Delete'/>
 </itemtemplate>
 </asp:templatefield>
 <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
 <ItemTemplate>
 <asp:Literal ID="ltrFirstName" runat="server" Text='<%# Bind("FirstName") %>'/>
 </ItemTemplate>
 </asp:TemplateField>
 <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
 <ItemTemplate>
 <asp:Literal ID="ltrLastName" runat="server" Text='<%# Bind("LastName") %>'/>
 </ItemTemplate>
 </asp:TemplateField>
 <asp:TemplateField HeaderText="City" SortExpression="City">
 <ItemTemplate>
 <asp:Literal ID="ltrCity" runat="server" Text='<%# Bind("City") %>'/>
 </ItemTemplate>
 </asp:TemplateField>
 <asp:TemplateField HeaderText="Visible" ItemStyle-HorizontalAlign="Center">
 <ItemTemplate>
 <asp:CheckBox ID="chbVisible" runat="server" Checked='<%# Bind("Visible") %>' Enabled="true" />
 </ItemTemplate>
 </asp:TemplateField>
 </Columns>
 </asp:GridView> 
 </div>
<div style="width: 480px;float: right; margin-left: 10px">
 <!-- ------------------------ Panel: pnlDetails ---------------------- -->
<asp:Panel ID="pnlGrdViewDetail" runat="server" Width="470px" Height="300px" 
BorderColor="White" BorderWidth="1px" >
    
<asp:DetailsView ID="dtDetailsView" runat="server" EnableViewState="True" AutoGenerateRows="False" 
 BorderColor="White" 
 cellpadding="3" GridLines="None" 
 height="258px" HorizontalAlign="Center" 
 style="border-style: outset; border-width: 1px; padding: 1px 3px" 
 Width="470px">
<RowStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Left" />
<AlternatingRowStyle BackColor="#DCDCDC" />

<Fields>
    

<asp:TemplateField HeaderText="ID" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<asp:TextBox ID="txtCode" Enabled="false" BackColor="LightGray" Width="100px"
 MaxLength="50" runat="server" Text='<%# Eval("ID") %>'/>
</ItemTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="FirstName" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<asp:TextBox ID="txtFirstName" Width="350px" MaxLength="50" runat="server" Text='<%# Eval("FirstName") %>'/>
<asp:CustomValidator id="cvFirst" Runat="server" EnableViewState="False"
 ControlToValidate="txtFirstName"
 EnableClientScript="False" 
 ValidationGroup="GroupValidation" 
 ValidateEmptyText="true"
 OnServerValidate="cvStringValidator_ServerValidate"
 Text="<%$ Resources:GlobalResources,WrongFormat %>" />&nbsp; 
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="LastName" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<asp:TextBox ID="txtLastName" MaxLength="50" 
 Width="350px" runat="server" Text='<%# Eval("LastName") %>'/>
<asp:CustomValidator id="cvLastName" Runat="server" EnableViewState="False"
 EnableClientScript="False" 
 ControlToValidate="txtLastName"
 ValidationGroup="GroupValidation" 
 ValidateEmptyText="true"
 OnServerValidate="cvStringValidator_ServerValidate"
 Text="<%$ Resources:GlobalResources,WrongFormat %>" />&nbsp; 
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="StateOrProvince"  ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<asp:TextBox ID="txtStateOrProvince" MaxLength="50" 
 Width="350px" runat="server" Text='<%# Eval("StateOrProvince") %>'/>
<asp:CustomValidator id="cvStateOrProvince" Runat="server" EnableViewState="False"
 EnableClientScript="False" 
 ControlToValidate="txtStateOrProvince"
 ValidationGroup="GroupValidation" 
 ValidateEmptyText="true"
 OnServerValidate="cvStringValidator_ServerValidate"
 Text="<%$ Resources:GlobalResources,WrongFormat %>" />&nbsp; 
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Region" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<asp:TextBox ID="txtRegion" MaxLength="50" 
 Width="350px" runat="server" Text='<%# Eval("Region") %>'/>
<asp:CustomValidator id="cvRegion" Runat="server" EnableViewState="False"
 EnableClientScript="False" 
 ControlToValidate="txtRegion"
 ValidationGroup="GroupValidation" 
 ValidateEmptyText="true"
 OnServerValidate="cvStringValidator_ServerValidate"
 Text="<%$ Resources:GlobalResources,WrongFormat %>" />&nbsp; 
</ItemTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="City" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<asp:TextBox ID="txtCity" MaxLength="50"  Width="350px" runat="server" Text='<%# Eval("City") %>'/> 
<asp:CustomValidator id="cvCity" Runat="server" EnableViewState="False"
 EnableClientScript="False" 
 ControlToValidate="txtCity"
 ValidationGroup="GroupValidation" 
 ValidateEmptyText="true"
 OnServerValidate="cvStringValidator_ServerValidate"
 Text="<%$ Resources:GlobalResources,WrongFormat %>" />&nbsp; 
</ItemTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="Address" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<asp:TextBox ID="txtAddress" MaxLength="50" 
 Width="350px" runat="server" Text='<%# Eval("Address") %>'/> 
<asp:CustomValidator id="cvAddress" Runat="server" EnableViewState="False"
 EnableClientScript="False" 
 ControlToValidate="txtAddress"
 ValidationGroup="GroupValidation" 
 ValidateEmptyText="true"
 OnServerValidate="cvStringValidator_ServerValidate"
 Text="<%$ Resources:GlobalResources,WrongFormat %>" />&nbsp; 
</ItemTemplate>
</asp:TemplateField>




<asp:TemplateField HeaderText="Email" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<asp:TextBox ID="txtEmail" MaxLength="50" 
 Width="350px" runat="server" Text='<%# Eval("Email") %>'/> 
<asp:CustomValidator id="cvEmail" Runat="server" EnableViewState="False"
 EnableClientScript="False" 
 ControlToValidate="txtEmail"
 ValidationGroup="GroupValidation" 
 ValidateEmptyText="true"
 OnServerValidate="cvStringValidator_ServerValidate"
 Text="<%$ Resources:GlobalResources,WrongFormat %>" />&nbsp; 
</ItemTemplate>
</asp:TemplateField>

 <asp:TemplateField HeaderText="Birthdate" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<asp:TextBox ID="txtBirthdate" MaxLength="50" 
 Width="350px" runat="server" Text='<%# Eval("Birthdate") %>'/> 
<asp:CustomValidator id="cvBirthdate" Runat="server" EnableViewState="False"
 EnableClientScript="False" 
 ControlToValidate="txtBirthdate"
 ValidationGroup="GroupValidation" 
 ValidateEmptyText="true"
 OnServerValidate="cvStringValidator_ServerValidate"
 Text="<%$ Resources:GlobalResources,WrongFormat %>" />&nbsp; 
</ItemTemplate>
</asp:TemplateField>
 


 <asp:TemplateField HeaderText="Home phone" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<asp:TextBox ID="txtHomePhone" MaxLength="50" 
 Width="350px" runat="server" Text='<%# Eval("HomePhone") %>'/>

<asp:CustomValidator id="cvHomePhone" Runat="server" EnableViewState="False"
 EnableClientScript="False" 
 ControlToValidate="txtHomePhone"
 ValidationGroup="GroupValidation" 
 ValidateEmptyText="true"
 OnServerValidate="cvStringValidator_ServerValidate"
 Text="<%$ Resources:GlobalResources,WrongFormat %>" />&nbsp; 
</ItemTemplate>
</asp:TemplateField>
 <asp:TemplateField HeaderText="Mobile phone" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<asp:TextBox ID="txtMobilePhone" MaxLength="50" 
 Width="350px" runat="server" Text='<%# Eval("MobilePhone") %>'/>
<asp:CustomValidator id="cvMobilePhone" Runat="server" EnableViewState="False"
 EnableClientScript="False" 
 ControlToValidate="txtMobilePhone"
 ValidationGroup="GroupValidation" 
 ValidateEmptyText="true"
 OnServerValidate="cvStringValidator_ServerValidate"
 Text="<%$ Resources:GlobalResources,WrongFormat %>" />&nbsp; 
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Visible" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<asp:CheckBox ID="chbVisible" runat="server" Checked='<%# Eval("Visible") %>' Enabled="true" />
</ItemTemplate>
</asp:TemplateField>
    
<asp:TemplateField HeaderText="Photos" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<asp:Button ID="btcnPicture" Text="Photo" runat="server" Enabled="true" />&nbsp;&nbsp;&nbsp;
<asp:Button ID="bnIcon" Text="Icon" runat="server" Enabled="true" />
</ItemTemplate>
</asp:TemplateField>

</Fields>
</asp:DetailsView>
</asp:Panel> 
</div></div>
 </asp:Content>
