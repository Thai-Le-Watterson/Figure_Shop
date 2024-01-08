<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master_Page.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Figure_Shop.Pages.Order1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .product_list {
            width: 70%;
            background-color: #fff;
            border-radius: 8px;
        }

        .product_list .product {

        }

        .product_list tr:not(:last-child) .product {
            border-bottom: 1px solid #999;
        }

        .product_list .product {
            width: 100%;
            display: flex;
            justify-content: space-between;
            padding: 10px;
            box-sizing: border-box;
        }

        .product_list .name-img_container {
            width: 450px;
            display: flex;
            column-gap: 20px;
            cursor: pointer;
            text-decoration: none;
            color: #000;
        }

        .product_list .checkbox {
            align-self: center;
        }

        .product_list .img_sp {
            width: 100px;
            height: 100px;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }

        .product_list .product_name{
            padding-right: 10px;
        }

        .product_list .price_container {
            text-align: left;
            flex: 1;
        }

        .price_container .price .product_old_price {
            font-size: 14px;
            color: #898989;
            text-decoration: line-through;
            margin-left: 10px;
        }

        .price_container .price .product_price {
            color: red; 
        }

        .price_container .product_discount {
            font-size: 14px;
            margin-top: 6px;
        }

        .product_list .product_option {

        }

        .product_option .quantity input[type=number]
        {
            -moz-appearance: textfield;
        }
        
        .product_option .quantity input[type=number]::-webkit-inner-spin-button, 
        .product_option .quantity input[type=number]::-webkit-outer-spin-button { 
            -webkit-appearance: none;
            margin: 0;
        }

        .product_option .inp_soluong {
            width: 50px;
            height: 30px;
            line-height: 1.65;
            display: inline-block;
            padding: 0;
            margin: 0;
            padding-left: 20px;
            border: 1px solid #eee;
            box-sizing: border-box;
        }

        .product_option .quantity .btn {
            background-color: #fafafa;
            border: 1px solid #eee;
            padding: 7px 14px;
        }

        .product_option .quantity .btn:hover {
            cursor: pointer;
            opacity: 0.9;
        }

        .product_option .quantity button:not(:disabled):hover {
            background-color: #eee;
            border: 1px solid #eee;
            cursor: pointer;
            transition: all linear .1s;
        }

        .location {
            width: 70%;
            margin: 0 0 10px 0;
            padding: 10px;
            border-bottom: 1px solid #999;
            position: relative;
        }

        .location i {
            color: #000099;
            margin-right: 4px;
        }

        .location p {
            margin: 6px 0;
            font-size: 14px;
            margin-left: 20px;
        }

        .location .phone {
            margin-left: 10px;
            padding-left: 10px;
            border-left: 1px solid #bdbdbd;
        }

        .location i:last-child {
            position: absolute;
            right: 26px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 20px;
            color: #606060;
            padding: 10px 16px;
        }

        .location i:last-child:hover {
            cursor: pointer;
        }

        .modal_overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.2);
            z-index: 10;
        }

        .modal_order_info {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 10px 30px 30px;
            background-color: #fff;
            border-radius: 10px;
        }

        .modal_order_info i {
            position: absolute;
            top: 0px;
            right: 0px;
            padding: 12px 18px;
            font-size: 20px;
            border-top-right-radius: 10px;
            transition: all linear .2s;
        }

        .modal_order_info i:hover {
            background-color: #f8f8f8;
            cursor: pointer;
        }

        .modal_order_info label {
            display: block;
            margin: 16px 0 6px 0;
        }

        .modal_order_info input {
            width: 300px;
            padding: 10px 14px;
            border: 1px solid #545454;
            outline: none;
            border-radius: 6px;
        }

        .modal_order_info .btn_ok {    
            display: block;
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #fff;
            border: 1px solid blue;
            color: blue;
            border-radius: 6px;
            transition: all linear .2s;
        }

        .order_infor_container {
            position: fixed;
            top: 100px;
            right: 150px;
            background-color: #fff;
            padding: 10px 30px;
            border-radius: 4px;
            width: 350px;
            box-sizing: border-box;
        }

        .order_infor_container .title {
            font-weight: normal;
            font-size: 22px;
            margin: 10px 0;
        }

        .order_infor_container .product_price_total,
        .order_infor_container .ship_price {
            color: #737373;
            font-size: 14px;
            display: flex;
            justify-content: space-between;
        }

        .order_infor_container .product_price_total span,
        .order_infor_container .ship_price span {
            color: #000;
            font-size: 16px;
        }

        .order_infor_container .price_total {
            display: flex;
            justify-content: space-between;
        }

        .order_infor_container .price_total span {
            color: #ff2300;
            font-size: 18px;
        }

        .order_infor_container .btn {    
            width: 100%;
            padding: 14px;
            background-color: #ff9100;
            border: none;
            color: #fff;
            font-size: 16px;
            box-sizing: border-box;
            border-radius: 4px;
            transition: all linear .2s;
        }

        .order_infor_container .btn:hover {
            cursor: pointer;
            background-color: #ff7500;
        }
    </style>
    <div class="location">
        <i class="fa-solid fa-location-dot"></i>
        <span>Địa chỉ nhận hàng</span>
        <p id="lbl_who" runat="server" class="who"><%= who != "" ? who : "Ai là người nhận hàng ?" %><span id="lbl_phone" runat="server" class="phone"><%= phone != "" ? phone : "Số điện thoại người nhận ?" %></span></p>
        <p id="lbl_address" runat="server" class="address"><%= address != "" ? address : "Địa chỉ ?" %></p>
        <i class="fa-solid fa-chevron-right"></i>
    </div>
    <div class="modal_overlay">
        <div class="modal_order_info">
            <i class="fa-solid fa-xmark"></i>
            <label for="inp_who">Tên người nhận</label>
            <input runat="server" id="inp_who" type="text" />
            <label for="inp_phone">Số điện thoại</label>
            <input runat="server" id="inp_phone" type="text" />
            <label for="inp_address">Địa chỉ</label>
            <input runat="server" id="inp_address" type="text" />
            <asp:Button ID="Button1" CssClass="btn_ok" runat="server" Text="Xác nhận" OnClick="Button1_Click" />
        </div>
    </div>
    <asp:DataList ID="DataList1" runat="server" CssClass="product_list" DataKeyField="ma_sp">
        <ItemTemplate>
            <div class="product">
                <a class="name-img_container" href='<%# "Product_Detail.aspx?masp=" + Eval("ma_sp") %>' >
                    <div class="img_sp" style='<%# "background-image: url(../Assets/Images/Figures/"+ Eval("hinh_anh") +")" %>'></div>
                    <asp:Label ID="Label1" CssClass="product_name" runat="server" Text='<%# Eval("ten_sp") %>'></asp:Label>
                </a>
                <div class="price_container">
                    <div class="price">
                        <asp:Label ID="Label2" CssClass="product_price" runat="server" Text='<%# (Double.Parse(Eval("gia").ToString()) - (Double.Parse(Eval("gia").ToString()) * Double.Parse(Eval("giam_gia").ToString()) / 100)).ToString("#,##0") + " đ" %>'></asp:Label>
                        <asp:Label ID="Label4" CssClass="product_old_price" runat="server" style='<%# "display:" + (Eval("giam_gia").ToString() == "0" ? "none" : "inline") %>' Text='<%# Double.Parse(Eval("gia").ToString()).ToString("#,##0") + " đ" %>'></asp:Label>
                    </div>
                    <asp:Label ID="Label3" CssClass="product_discount" runat="server" style='<%# "display:" + (Eval("giam_gia").ToString() == "0" ? "none" : "inline-block") %>' Text='<%# "Giảm giá: " + Eval("giam_gia") + "%" %>'></asp:Label>
                </div>
                <div class="product_option">
                    <div class="quantity">
                        <asp:Label ID="Label5" runat="server" Text='<%# arr_soluong[Container.ItemIndex] %>'></asp:Label>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <div class="order_infor_container">
        <h3 class="title">Thông tin đơn hàng</h3>
        <p class="product_price_total">Giá <%= product_total %> sản phẩm: <span><%= price_total.ToString("#,##0") %> đ</span></p>
        <p class="ship_price">Phí vận chuyển: <span>0 đ</span></p>
        <p class="price_total">Tổng tiền: <span><%= price_total.ToString("#,##0") %> đ</span></p>
        <asp:Button ID="Button3" runat="server" Text="Đặt hàng" CssClass="btn" OnClick="Button3_Click"/>
    </div>
    <script>
        //Handle ẩn hiện modal
        const icon_open_modal = document.querySelector(".fa-solid.fa-chevron-right");
        const modal = document.querySelector(".modal_overlay");
        const modal_info = document.querySelector(".modal_order_info"); 
        const incon_close_modal = document.querySelector(".modal_order_info i"); 
        //const btn_ok = document.querySelector(".modal_order_info button");

        icon_open_modal.onclick = function () {
            modal.style.display = "block";
            console.log("icon_open_modal")
        }

        incon_close_modal.onclick = function () {
            modal.style.display = "none";
        }

        modal.onclick = function (e) {
            modal.style.display = "none";
        }

        modal_info.onclick = function (e) {
            e.stopPropagation();
        }
    </script>
</asp:Content>
