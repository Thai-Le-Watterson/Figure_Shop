<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin_Master_Page.Master" AutoEventWireup="true" CodeBehind="Order_Manager.aspx.cs" Inherits="Figure_Shop.Pages.Admin_Pages.Order_Manager" EnableViewState="true" %>
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

        .GridView .inp_so_luong {
            width: 80px;
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
        <h1 class="title">Quản Lý Đơn Hàng</h1>
        <div class="form_manager">
            <div class="two_thirds_width center">
                <div class="form_group half_width">
                    <label class="form_label">Khách hàng</label>
                    <%--<input id="inp_tenkh" type="text" class="form_control" runat="server"/>--%>
                    <asp:DropDownList ID="DropDownList_khachhang" runat="server" CssClass="form_control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_khachhang_SelectedIndexChanged" ViewStateMode="Enabled"></asp:DropDownList>
                </div>
                <div class="form_group half_width">
                    <label class="form_label">Đơn hàng</label>
                    <%--<input id="inp_email" type="text" class="form_control" runat="server"/>--%>
                    <asp:DropDownList ID="DropDownList_donhang" runat="server" CssClass="form_control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_donhang_SelectedIndexChanged" ViewStateMode="Enabled"></asp:DropDownList>
                </div>
                <div class="form_group half_width">
                    <label class="form_label">Người nhận</label>
                    <input id="inp_nguoinhan" type="text" class="form_control" runat="server"/>
                </div>
                <div class="form_group half_width">
                    <label class="form_label">Số điện thoại</label>
                    <input id="inp_sdt" type="text" class="form_control" runat="server"/>
                </div>
                <div class="form_group half_width">
                    <label class="form_label">Tình trạng</label>
                    <%--<input id="inp_tinhtrang" type="text" class="form_control" runat="server"/>--%>
                    <asp:DropDownList ID="DropDownList_tinhtrang" runat="server" CssClass="form_control"></asp:DropDownList>
                </div>
                <div class="form_group half_width">
                    <label class="form_label">Thành tiền</label>
                    <input id="inp_thanhtien" type="number" class="form_control" runat="server" min="0" disabled="disabled"/>
                </div>
                <div class="form_group full_width">
                    <label class="form_label">Địa chỉ</label>
                    <input id="inp_diachi" type="text" class="form_control" runat="server" />
                </div>
                <div class="clear"></div>
            </div>
            <div class="form_group align_right center two_thirds_width float_none">
                <asp:Button ID="btn_them" runat="server" Text="Thêm" CssClass="form_button" OnClick="btn_them_Click" />
                <%--<asp:Button ID="btn_sua" runat="server" Text="Sửa" CssClass="form_button" OnClick="btn_sua_Click" />--%>
                <asp:Button ID="btn_xoa" runat="server" Text="Xóa" CssClass="form_button" OnClick="btn_xoa_Click" />
            </div>
            <div class="grid_container">
                <div class="title">Danh sách toàn bộ sản phẩm</div>
                <div class="title">Danh sách sản phẩm trong đơn</div>
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
                        <asp:TemplateField HeaderText="Số lượng">
                            <ItemTemplate>
                                <asp:Label ID="lbl_so_luong_2" runat="server" Text='<%# Eval("so_luong") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="True" HeaderText="Thêm vào đơn" SelectText="Thêm" />
                        <asp:TemplateField HeaderText="Số lượng thêm">
                            <ItemTemplate>
                                <asp:TextBox ID="inp_so_luong" runat="server" CssClass="inp_so_luong" type="number" min="1" max='<%# Eval("so_luong") %>'></asp:TextBox>
                                <%--<input type="number" min="1" runat="server" max='<%# Eval("so_luong") %>' id="inp_so_luong" />--%>
                            </ItemTemplate>
                        </asp:TemplateField>
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
                
                <asp:GridView ID="GridView1" CssClass="GridView GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
                                <asp:Label ID="lbl_so_luong" runat="server" Text='<%# Eval("so_luong") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="True" HeaderText="Xóa khỏi đơn" SelectText="Xóa" />
                        <%--<asp:TemplateField HeaderText="Xóa khỏi đơn">
                            <ItemTemplate>
                                <asp:Button ID="btn_xoa_row" runat="server" CommandName="Delete" Text="Xóa" />
                            </ItemTemplate>
                        </asp:TemplateField>--%>
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
                <div class="clear float_none"></div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Figure_DbConnectionString %>" SelectCommand="SELECT chi_tiet_hd.ma_hoa_don, san_pham.ma_sp, san_pham.ten_sp, san_pham.gia, chi_tiet_hd.so_luong FROM chi_tiet_hd INNER JOIN san_pham ON chi_tiet_hd.ma_sp = san_pham.ma_sp WHERE (chi_tiet_hd.ma_hoa_don = @ma_hoa_don)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList_donhang" Name="ma_hoa_don" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
