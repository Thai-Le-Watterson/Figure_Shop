<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin_Master_Page.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="Product_Manager.aspx.cs" Inherits="Figure_Shop.Pages.Admin_Pages.Product_Manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../../Assets/fontawesome-free-6.4.2-web/css/all.min.css" />
    <style>
        .GridView1 {
            width: 1200px;
            margin: 50px auto;
            border: 1px solid #e7e7e7;
        }

        .GridView1  th, 
        .GridView1  td {
            border-left: 1px solid #e7e7e7;
            border-right: 1px solid #e7e7e7;
        }

        .GridView1  th a {
            text-decoration: none;
        }

        .GridView1 .select_btn {
            display: inline-block;
            text-decoration: none;
            color: white !important;
            background-color: #1360ff;
            padding: 6px 8px;
            border-radius: 6px;
        }

        .GridView1 .select_btn:hover {
            opacity: 0.8;
            transition: all linear .1s;
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
            width: 1200px;
            margin: 0 auto;
            padding-top: 20px;
        }

        .product_manager_container .title {
            text-align: center;
        }

        .product_manager_container .form_manager {
            display: flex;
        }

        .product_manager_container .form_manager .form_group {
            display: inline-block;
            width: 30%;
            margin: 10px 18px;
        }

        .product_manager_container .form_manager .form_group.full_width {
            width: 97%;
        }

        .product_manager_container .form_manager .form_group.full_width_2 {
            width: 93%;
        }

        .product_manager_container .form_manager .form_group.higher_width {
            width: 63%;
        }

        .product_manager_container .form_manager .form_group.half_width {
            width: 44%;
        }

        .full_width {
            width: 100%;
        }

        .full_width_2 {
            width: 93%;
        }

        .higher_width {
            display: inline-block;
            width: 68%;
        }

        .half_width {
            display: inline-block;
            width: 50%;
        }

        .small_width {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            width: 31%;
        }

        .align_right{
            text-align: right;
        }

        .product_manager_container .form_manager .form_group .form_label {
            display: block;
            margin-bottom: 4px;
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

        .form_button {
            background-color: #457def;
            border: 2px solid #457def;
            border-radius: 20px;
            color: #fff;
            padding: 10px 20px;
            box-sizing: border-box;
            transition: all linear .1s;
            font-size: 14px;
        }

        .form_button:hover {
            color: #457def;
            background-color: #fff;
            cursor: pointer;
        }

        .product_manager_container .form_manager .form_group .anh_sp {
            display: block;
            width: 100%;
            height: 230px;
            border-radius: 4px;
            background-size: contain;
            background-position: center;
            background-repeat: no-repeat;
        }

        .product_manager_container .form_manager .form_group .anh_sp:hover {
            cursor: pointer;
            opacity: 0.8;
        }

        .product_manager_container .form_manager .form_group #show_product_image {
            display: none;
        }

        .product_manager_container .form_manager .form_group #show_product_image:checked + .img_fullscreen {
            display: block;
        }

        .product_manager_container .form_manager .form_group .img_fullscreen {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #e5e5e5;
            background-size: contain;
            background-position: center;
            background-repeat: no-repeat;
        }

        .product_manager_container .form_manager .form_group .close_icon {
            position: fixed;
            top: 20px;
            right: 20px;
            font-size: 24px;
        }

        .product_manager_container .form_manager .form_group .close_icon:hover {
            cursor: pointer;
            opacity: 0.8;
        }
    </style>
    <div class="product_manager_container">
        <h1 class="title">Quản Lý Sản Phẩm</h1>
        <div class="form_manager">
            <div class="higher_width">
                <div class="form_group half_width">
                    <label for="inp_masp" class="form_label">Mã sản phẩm</label>
                    <input id="inp_masp" type="number" class="form_control" runat="server"  min="0"/>
                </div>
                <div class="form_group half_width">
                    <label for="inp_tensp" class="form_label">Tên sản phẩm</label>
                    <input id="inp_tensp" type="text" class="form_control" runat="server"/>
                </div>
                <div class="form_group half_width">
                    <label for="inp_gia" class="form_label">Giá</label>
                    <input id="inp_gia" type="number" class="form_control" runat="server"  min="0"/>
                </div>
                <div class="form_group half_width">
                    <label for="inp_soluong" class="form_label">Số lượng</label>
                    <input id="inp_soluong" type="number" class="form_control" runat="server" min="0"/>
                </div>
                <div class="form_group half_width">
                    <label for="inp_giamgia" class="form_label">Giảm giá (%)</label>
                    <input id="inp_giamgia" type="number" class="form_control" runat="server"  min="0"/>
                </div>
                <div class="form_group half_width">
                    <label for="inp_daban" class="form_label">Số lượng đã bán</label>
                    <input id="inp_daban" type="number" class="form_control" runat="server" min="0"/>
                </div>
                <div class="form_group full_width_2">
                    <label for="inp_hinhanhkhac" class="form_label">Hình ảnh khác</label>
                    <input id="inp_hinhanhkhac" type="text" class="form_control" runat="server"/>
                </div>
                <div class="form_group" style="width: 93%">
                    <label for="inp_mota" class="form_label">Mô tả</label>
                    <%--<input id="inp_mota" type="text" class="form_control"/>--%>
                    <textarea id="inp_mota" class="form_control area" rows="8" runat="server"></textarea>
                </div>
            </div>
            <div class="small_width">
                <div class="form_group full_width">
                    <label for="inp_loaisp" class="form_label">Loại sản phẩm</label>
                    <%--<input id="inp_loaisp" type="text" class="form_control" runat="server"/>--%>
                    <asp:DropDownList ID="DropDownList_loai_sp" runat="server" CssClass="form_control"></asp:DropDownList>
                </div>
                <div class="form_group full_width">
                    <label for="inp_anh" class="form_label">Hình ảnh</label>
                    <%--<input id="inp_anh" type="file" class="form_control file_anh" runat="server"/>--%>
                    <asp:FileUpload ID="file_anh" runat="server" CssClass="form_control file_anh" />
                </div>
                <div class="form_group full_width" style="margin: 18px 0">
                    <%String background_img = "background-image: url(../../Assets/Images/Figures/" + product_image + ")"; %>
                    <label for="show_product_image" class="anh_sp" style="<%= background_img %>"></label>
                    <input id="show_product_image" type="checkbox" />
                    <div class="img_fullscreen" style="<%= background_img %>">
                        <label for="show_product_image" class="close_icon"><i class="fa-solid fa-xmark"></i></label>
                    </div>
                </div>
            </div>
        </div>
        <div class="align_right full_width">
            <asp:Button ID="btn_them" runat="server" Text="Thêm" CssClass="form_button" OnClick="btn_them_Click" />
            <asp:Button ID="btn_sua" runat="server" Text="Sửa" CssClass="form_button" OnClick="btn_sua_Click" />
            <asp:Button ID="btn_xoa" runat="server" Text="Xóa" CssClass="form_button" OnClick="btn_xoa_Click" />
        </div>
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ma_sp" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" CssClass="GridView1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ma_sp" HeaderText="Mã" InsertVisible="False" ReadOnly="True" SortExpression="ma_sp" >
                <ItemStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="ten_sp" HeaderText="Tên" SortExpression="ten_sp" >
                <ItemStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="ma_loai" HeaderText="Loại" SortExpression="ma_loai" />
            <asp:BoundField DataField="gia" HeaderText="Giá" SortExpression="gia" />
            <asp:BoundField DataField="giam_gia" HeaderText="Giảm giá" SortExpression="giam_gia" />
            <asp:BoundField DataField="so_luong" HeaderText="Số lượng" SortExpression="so_luong" />
            <asp:BoundField DataField="da_ban" HeaderText="Đã bán" SortExpression="da_ban" />
            <asp:BoundField DataField="mo_ta" HeaderText="Mô tả" SortExpression="mo_ta" >
            <ItemStyle Width="300px" />
            </asp:BoundField>
            <asp:BoundField DataField="hinh_anh" HeaderText="Hình ảnh" SortExpression="hinh_anh" />
            <asp:BoundField DataField="hinh_anh_khac" HeaderText="Hình ảnh khác" SortExpression="hinh_anh_khac" />
            <asp:CommandField ShowSelectButton="True" SelectText="Chọn" ControlStyle-CssClass="select_btn">
<ControlStyle CssClass="select_btn"></ControlStyle>
            </asp:CommandField>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Figure_DbConnectionString %>" SelectCommand="SELECT * FROM [san_pham]"></asp:SqlDataSource>
    
    <script>
        let inp_file = document.getElementsByClassName("file_anh")[0];
        let anh_sp = document.getElementsByClassName("anh_sp")[0];
        let img_fullscreen = document.getElementsByClassName("img_fullscreen")[0];
        inp_file.onchange = function (e) {
            console.log(URL.createObjectURL(event.target.files[0]));

            let value = e.target.value.split("\\");

            //anh_sp.style.backgroundImage = "url(../../Assets/Images/Figures/" + value[2] + ")";
            //img_fullscreen.style.backgroundImage = "url(../../Assets/Images/Figures/" + value[2] + ")";

            anh_sp.style.backgroundImage = "url(" + URL.createObjectURL(event.target.files[0]) + ")";
            img_fullscreen.style.backgroundImage = "url(" + URL.createObjectURL(event.target.files[0]) + ")";
        };
    </script>
</asp:Content>
