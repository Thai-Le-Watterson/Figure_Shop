<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin_Master_Page.Master" AutoEventWireup="true" CodeBehind="Product_Category_Manager.aspx.cs" Inherits="Figure_Shop.Pages.Admin_Pages.Product_Category_Manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <style>
        .GridView1 {
            width: 600px;
            margin: 50px auto;
            border: 1px solid #e7e7e7;
        }

        .GridView1  th, 
        .GridView1  td {
            border-left: 1px solid #e7e7e7;
            border-right: 1px solid #e7e7e7;
        }

        .GridView1 .paging td{
            border: none;
        }

        .GridView1 .paging span,
        .GridView1 .paging a{
            display: inline-block;
            margin: 0 4px;
            padding: 6px 12px;
            font-size: 18px;
            border-radius: 4px;
        }

        .GridView1 .paging span{
            color: #2461bf;
            background-color: #fff;
        }

        .GridView1 .paging a{
            text-decoration: none;
        }

        .GridView1 .paging a:hover{
            background-color: #3f7fe1;
        }

        .product_manager_container {
            width: 800px;
            margin: 0 auto;
            padding-top: 20px;
        }

        .product_manager_container .title {
            text-align: center;
        }

        .product_manager_container .form_manager {

        }

        .product_manager_container .form_manager .form_group {
            display: inline-block;
            width: 49%;
            padding: 10px 18px;
            box-sizing: border-box;
        }

        .product_manager_container .form_manager .form_group.full_width {
            width: 97%;
        }

        .product_manager_container .form_manager .form_group.align_right{
            text-align: right;
        }

        .product_manager_container .form_manager .form_group .form_label {
            display: block;
            padding-bottom: 4px;
        }

        .product_manager_container .form_manager .form_group .form_control {
            width: 100%;
            box-sizing: border-box;
            padding: 10px 14px;
            border-radius: 32px;
            border: 1px solid #a3a3a3;
        }

        .product_manager_container .form_manager .form_group .form_control:focus {
            border-width: 1px;
            outline: none;
            box-shadow: 1px 1px 8px #a6c3ff;
        }

        .product_manager_container .form_manager .form_group .form_control.area {
            border-radius: 10px;
        }

        .product_manager_container .form_manager .form_group .form_button {
            background-color: #457def;
            border: 2px solid #457def;
            border-radius: 20px;
            color: #fff;
            padding: 10px 20px;
            box-sizing: border-box;
            transition: all linear .1s;
            font-size: 14px;
        }

        .product_manager_container .form_manager .form_group .form_button:hover {
            color: #457def;
            background-color: #fff;
            cursor: pointer;
        }
    </style>
    <div class="product_manager_container">
        <h1 class="title">Quản Lý Loại Sản Phẩm</h1>
        <div class="form_manager">
            <div class="form_group">
                <label for="inp_malsp" class="form_label">Mã loại sản phẩm</label>
                <input id="inp_malsp" type="text" class="form_control" runat="server"/>
            </div>
            <div class="form_group">
                <label for="inp_tenlsp" class="form_label">Tên loại sản phẩm</label>
                <input id="inp_tenlsp" type="text" class="form_control" runat="server"/>
            </div>
            <div class="form_group">
                <label for="inp_tenlsp" class="form_label">Tên loại sản phẩm</label>
                <asp:FileUpload ID="file_anh" runat="server" CssClass="form_control file_anh" />
            </div>
            <div class="form_group align_right full_width">
                <asp:Button ID="btn_them" runat="server" Text="Thêm" CssClass="form_button" OnClick="btn_them_Click" />
                <asp:Button ID="btn_sua" runat="server" Text="Sửa" CssClass="form_button" OnClick="btn_sua_Click" />
                <asp:Button ID="btn_xoa" runat="server" Text="Xóa" CssClass="form_button" OnClick="btn_xoa_Click" />
            </div>
        </div>
    </div>
    <asp:GridView ID="GridView1" CssClass="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ma_loai" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ma_loai" HeaderText="Mã loại" ReadOnly="True" SortExpression="ma_loai" />
            <asp:BoundField DataField="ten_loai" HeaderText="Tên loại" SortExpression="ten_loai" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" CssClass="paging" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Figure_DbConnectionString3 %>" SelectCommand="SELECT * FROM [loai_sp]"></asp:SqlDataSource>
</asp:Content>
