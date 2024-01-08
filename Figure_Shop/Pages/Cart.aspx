<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master_Page.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Figure_Shop.Pages.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
            background-color: #f9f9f9;
        }

        .option_container {
            width: 70%;
            margin: 0 0 10px 0;
            padding: 10px 20px;
            background-color: #fff;
            box-sizing: border-box;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .option_container > div {
            display: flex;
            align-items: center;
            cursor: pointer;
            position: relative;
        }

        .option_container input[type=checkbox] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .option_container label {
            cursor: pointer;
            margin-left: 8px;
            user-select: none;
        }

        .option_container i {
            color: #fff;
            position: absolute;
            top: 50%;
            left: 14px;
            transform: translateY(-50%);
        }

        .option_container input[type=submit] {
            border: none;
            background-color: #249bfc;
            color: #fff;
            padding: 10px 20px 10px 36px;
            border-radius: 4px;
            transition: all linear .2s;
        }

        .option_container i:hover + input[type=submit],
        .option_container input[type=submit]:hover {
            background-color: #4c50ff;
            cursor: pointer;
        }

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
        }

        .product_list .name-img_container a {
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

        .product_option .delete_btn {
            position: relative;
            margin: 10px 0 0 auto;
            width: min-content;
        }

        .delete_btn i {
            color: #fff;
            position: absolute;
            top: 50%;
            left: 14px;
            transform: translateY(-50%);
        }

        .delete_btn i:hover {
        }

        .delete_btn input[type=submit] {
            border: none;
            background-color: #249bfc;
            color: #fff;
            padding: 10px 20px 10px 36px;
            border-radius: 4px;
            transition: all linear .2s;
        }

        .delete_btn i:hover + input[type=submit],
        .delete_btn input[type=submit]:hover {
            background-color: #4c50ff;
            cursor: pointer;
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
    <div class="option_container">
        <div>
            <asp:CheckBox ID="chk_check_all" runat="server" Text="Chọn tất cả" AutoPostBack="True" OnCheckedChanged="chk_check_all_CheckedChanged" />
        </div>
        <div>
            <i class="fa-solid fa-trash-can"></i>
            <asp:Button ID="btn_delete_all" runat="server" Text="Xóa tất cả" OnClick="btn_delete_all_Click" />
        </div>
    </div>
    <asp:DataList ID="DataList1" CssClass="product_list" runat="server" CellSpacing="10" DataKeyField="ma_sp" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
        <ItemTemplate>
            <div class="product">
                <div class="name-img_container">
                    <asp:CheckBox ID="CheckBox1" CssClass="checkbox" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
                    <a href='<%# "Product_Detail.aspx?masp=" + Eval("ma_sp") %>'>
                        <div class="img_sp" style='<%# "background-image: url(../Assets/Images/Figures/"+ Eval("hinh_anh") +")" %>'></div>
                        <asp:Label ID="Label1" CssClass="product_name" runat="server" Text='<%# Eval("ten_sp") %>'></asp:Label>
                    </a>
                </div>
                <div class="price_container">
                    <div class="price">
                        <asp:Label ID="Label2" CssClass="product_price" runat="server" Text='<%# (Double.Parse(Eval("gia").ToString()) - (Double.Parse(Eval("gia").ToString()) * Double.Parse(Eval("giam_gia").ToString()) / 100)).ToString("#,##0") + " đ" %>'></asp:Label>
                        <asp:Label ID="Label4" CssClass="product_old_price" runat="server" style='<%# "display:" + (Eval("giam_gia").ToString() == "0" ? "none" : "inline") %>' Text='<%# Double.Parse(Eval("gia").ToString()).ToString("#,##0") + " đ" %>'></asp:Label>
                    </div>
                    <asp:Label ID="Label3" CssClass="product_discount" runat="server" style='<%# "display:" + (Eval("giam_gia").ToString() == "0" ? "none" : "inline-block") %>' Text='<%# "Giảm giá: " + Eval("giam_gia") + "%" %>'></asp:Label>
                </div>
                <div class="product_option">
                    <div class="quantity">
                        <%--<button type="button" class="minus" disabled="disabled">-</button>--%>
                        <asp:Button ID="Button1" runat="server" CssClass="minus btn" Text="-" OnClick="Button1_Click" />
                        <asp:TextBox ID="TextBox1" CssClass="inp_soluong" runat="server" type="number" value="1" min="1" max='<%# Eval("so_luong") %>' AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                        <asp:Button ID="Button2" runat="server" CssClass="plus btn" Text="+" OnClick="Button2_Click" />
                        <%--<button type="button" class="plus">+</button>--%>
                    </div>
                    <div class="delete_btn">
                        <i class="fa-solid fa-trash-can"></i>
                        <asp:Button ID="btn_delete_product" runat="server" Text="Xóa" CommandName="Select" />
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
        <asp:Button ID="Button3" runat="server" Text="Mua hàng" CssClass="btn" OnClick="Button3_Click" />
    </div>
    <script>
        const inps_soluong = document.getElementsByClassName("inp_soluong");
        const btns_minus = document.getElementsByClassName("minus");
        const btns_plus = document.getElementsByClassName("plus");

        Array.from(inps_soluong).forEach(function (inp_soluong, index) {
            inp_soluong.oninput = function (e) {
                onInputChange(+e.target.value, index);
            }

            onInputChange(inp_soluong.value, index);
        })

        
        Array.from(btns_minus).forEach(function (btn_minus, index) {
            btn_minus.onclick = function () {
                if (inps_soluong[index].value > 1) {
                    inps_soluong[index].value = +inps_soluong[index].value - 1;
                    onInputChange(+inps_soluong[index].value, index);
                }
        }
        })
            
        Array.from(btns_plus).forEach(function (btn_plus, index) {
            btn_plus.onclick = function () {
                if (+inps_soluong[index].value < +inps_soluong[index].max) {
                    inps_soluong[index].value = +inps_soluong[index].value + 1;
                    onInputChange(+inps_soluong[index].value, index);
                }
            }
        })

        function onInputChange(inputValue, index) {
            if (inputValue < 1) {
                inps_soluong[index].value = 1
            } else if (inputValue > +inps_soluong[index].max) {
                inps_soluong[index].value = inps_soluong[index].max;
            }

            //if (inputValue == 1) {
            //    btns_minus[index].disabled = true;
            //} else if (inputValue == +inps_soluong[index].max) {
            //    btns_plus[index].disabled = true;
            //} else {
            //    btns_minus[index].disabled = false;
            //    btns_plus[index].disabled = false;
            //}

            if (inputValue >= 100) {
                inps_soluong[index].style.paddingLeft = "14px";
            } else if (inputValue >= 10) {
                inps_soluong[index].style.paddingLeft = "17px";
            }
        }
    </script>
</asp:Content>
