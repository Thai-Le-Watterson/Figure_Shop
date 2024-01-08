<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin_Master_Page.Master" AutoEventWireup="true" CodeBehind="Cart_Manager.aspx.cs" Inherits="Figure_Shop.Pages.Admin_Pages.Cart_Manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #form1 {
            margin: 0;
        }

        .form_group {
            /*display: inline-block;*/
            float: left;
            width: 33%;
            padding: 10px 18px;
            box-sizing: border-box;
        }

        .float_none {
            float: none;
        }

        .center {
            margin: 0 auto;
        }

        .align_center{
            text-align: center;
        }

        .align_right{
            text-align: right;
        }

        .clear {
            clear: both;
        }

        .full_width{
            width: 100%;
        }

        .two_thirds_width {
            width: 66%;
        }

        .half_width {
            width: 50%;
        }

        .grid_container {
            padding: 50px 0;
        }

        .grid_container > div:not(:last-child) {
            width: 50%;
            padding: 10px 20px;
            box-sizing: border-box;
            float: left;
        }

        .grid_container .title {
            text-align: center;
            font-size: 20px;
        }

        .GridView1 {
            width: 100%;
            margin: 0 0 0 auto;
            border: 1px solid #e7e7e7;
        }

        .GridView2 {
            width: 100%;
            margin: 0 auto 0 0;
            border: 1px solid #e7e7e7;
        }

        .GridView  th, 
        .GridView td {
            border-left: 1px solid #e7e7e7;
            border-right: 1px solid #e7e7e7;
        }

        .GridView input,
        .GridView > tbody > tr > td > a {
            display: inline-block;
            margin: 0 4px;
            padding: 6px 12px;
            color: #2461bf !important;
            text-decoration: none;
            border: 2px solid #3f7fe1;
            border-radius: 4px;
            background-color: #fff;
        }

        .GridView input:hover,
        .GridView > tbody > tr > td > a:hover {
            color: #fff !important;
            cursor: pointer;
            background-color: #3f7fe1;
        }

        .GridView input:focus {
            outline: none;
        }

        .GridView .paging td{
            border: none;
        }

        .GridView .paging span,
        .GridView .paging a{
            display: inline-block;
            margin: 0 4px;
            padding: 6px 12px;
            font-size: 18px;
            border-radius: 4px;
            text-decoration: none;
        }

        .GridView .paging span{
            color: #2461bf;
            background-color: #fff;
        }

        .GridView .paging a:hover{
            background-color: #3f7fe1;
        }

        .product_manager_container {
            width: 1400px;
            margin: 0 auto;
            padding-top: 20px;
        }

        .product_manager_container .title {
            text-align: center;
        }

        .product_manager_container .form_manager {

        }

        .product_manager_container .form_manager .col-6{
            width: 45%;
            display: inline-block;
            float: left;
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

        .product_manager_container .form_manager .form_group .avatar {
            width: 112px;
            height: 112px;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            box-sizing: border-box;
            border-radius: 50%;
            display: inline-block;
        }

        .product_manager_container .form_manager .form_group .avatar:hover {
            opacity: 0.8;
            cursor: pointer;
        }

        .product_manager_container .form_manager .form_group .form_control:focus {
            border-width: 1px;
            outline: none;
            box-shadow: 1px 1px 8px #a6c3ff;
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
        <h1 class="title">Quản Lý Giỏ Hàng</h1>
        <div class="form_manager">
            <div class="form_group">
                <label class="form_label">Khách hàng</label>
                <%--<input id="inp_tenkh" type="text" class="form_control" runat="server"/>--%>
                <asp:DropDownList ID="DropDownList_khachhang" runat="server" CssClass="form_control" OnSelectedIndexChanged="DropDownList_khachhang_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            </div>
            <div class="form_group full_width">
                <asp:Button ID="btn_them" runat="server" Text="Thêm" CssClass="form_button" OnClick="btn_them_Click" />
                <asp:Button ID="btn_xoa" runat="server" Text="Xóa" CssClass="form_button" OnClick="btn_xoa_Click" />
            </div>
            <div class="grid_container">
                <div class="title">Danh sách toàn bộ sản phẩm</div>
                <% if(isHaveCart) { %>
                    <div class="title">Danh sách sản phẩm trong giỏ</div>
                <% } else { %>
                    <div class="title">Khách hàng này vẫn chưa có giỏ hàng</div>
                <% } %>
                <asp:GridView ID="GridView1" CssClass="GridView GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Mã sản phẩm">
                            <ItemTemplate>
                                <asp:Label ID="lbl_masp" runat="server" Text='<%# Eval("ma_sp") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tên sản phẩm">
                            <ItemTemplate>
                                <asp:Label ID="lbl_tensp" runat="server" Text='<%# Eval("ten_sp") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Giá">
                            <ItemTemplate>
                                <asp:Label ID="lbl_gia" runat="server" Text='<%# Eval("gia") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Số lượng">
                            <ItemTemplate>
                                <asp:Label ID="lbl_soluong" runat="server" Text='<%# Eval("so_luong") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="True" HeaderText="Thêm vào giỏ" SelectText="Thêm" />
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
                <% if(isHaveCart) { %>
                    <% if (!isHaveProductInCart) { %>
                        <h3 class="align_center">Giỏ hàng không có sản phẩm nào</h3>
                    <% } %>
                    <asp:GridView ID="GridView2" CssClass="GridView GridView2" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" OnPageIndexChanging="GridView2_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Mã sản phẩm">
                            <ItemTemplate>
                                <asp:Label ID="lbl_masp_2" runat="server" Text='<%# Eval("ma_sp") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tên sản phẩm">
                            <ItemTemplate>
                                <asp:Label ID="lbl_tensp_2" runat="server" Text='<%# Eval("ten_sp") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Giá">
                            <ItemTemplate>
                                <asp:Label ID="lbl_gia_2" runat="server" Text='<%# Eval("gia") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="True" HeaderText="Xóa khỏi giỏ" SelectText="Xóa" />
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
                <% } %>
                <div class="clear float_none"></div>
            </div>
        </div>
    </div>
</asp:Content>
