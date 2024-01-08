<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master_Page.Master" AutoEventWireup="true" CodeBehind="Product_Detail.aspx.cs" Inherits="Figure_Shop.Pages.Product_Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
            background-color: #f5f5f5;
        }

        .clear {
            clear: both;
        }

        .product_container {
            margin-bottom: 20px;
            padding: 10px 10px 20px;
            background-color: #fff;
            border-radius: 8px;
        }

        .list_imgs {
            height: 550px;
            overflow-x: hidden;
            overflow-y: auto;
            float: left;
            width: 10%;
            box-sizing: border-box;
            padding: 0 10px 0 0;
            border-right: 10px solid transparent;
        }

        .list_imgs::-webkit-scrollbar {
            width: 6px;
        }

        /* Track */
        .list_imgs::-webkit-scrollbar-track {
            background: #fafafa; 
        }
 
        /* Handle */
        .list_imgs::-webkit-scrollbar-thumb {
            background: #888; 
        }

        /* Handle on hover */
        .list_imgs::-webkit-scrollbar-thumb:hover {
            background: #555; 
        }

        .list_imgs .img {
            width: 100%;
            height: 110px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;
            list-style: none;
            border: 2px solid #f0f0f0;
            border-radius: 4px;
            margin: 0 0 10px 0;
            transition: all linear .1s;
        }

        .list_imgs .img:hover {
            cursor: pointer;
            opacity: .9;
        }

        .list_imgs .img.active {
            border-color: #ff8282;
        }

        .img_container {
            float: left;
            width: 45%;
            box-sizing: border-box;
        }

        .img {
            height: 550px;
            background-position: center;
            background-repeat: no-repeat;
            background-size: contain;
        }

        .infor_container {
            float: left;
            width: 45%;
            padding: 0 0 0 20px;
            box-sizing: border-box;
        }

        .infor_container .product_name {
            display: -webkit-box;
            overflow: hidden;
            -webkit-line-clamp: 4;
            -webkit-box-orient: vertical;
            font-weight: bold;
            font-size: 26px;
            color: #444444;
            line-height: 32px;
            /*border-bottom: 1px solid #f0f0f0;*/
            /*padding-bottom: 10px;*/
        }

        .infor_container .product_price {
            font-size: 24px;
            font-weight: bold;
            color: #ff3434;
            margin-bottom: 10px;
        }

        .infor_container .product_old_price-container {
                margin: 10px 0 30px;
        }

        .infor_container .product_old_price {
            font-size: 14px;
            color: #747474;
            text-decoration: line-through;
        }

        .infor_container .product_discount {
            margin-left: 10px;
        }

        .infor_container input[type=number]
        {
            -moz-appearance: textfield;
        }
        
        .infor_container input[type=number]::-webkit-inner-spin-button, 
        .infor_container input[type=number]::-webkit-outer-spin-button { 
            -webkit-appearance: none;
            margin: 0;
        }

        .infor_container .inp_soluong {
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

        .infor_container .quantity button {
            background-color: #fafafa;
            border: 1px solid #eee;
            padding: 7px 14px;
        }

        .infor_container .quantity button:not(:disabled):hover {
            background-color: #eee;
            border: 1px solid #eee;
            cursor: pointer;
            transition: all linear .1s;
        }

        .infor_container .quantity .inventory_number {
            font-size: 13px;
            color: #545454;
            margin-left: 10px;
        }

        .infor_container .button_container {
            margin: 20px 0;
        }

        .infor_container .button_container .btn {
            padding: 20px 60px;
            border-radius: 4px;
            box-sizing: border-box;
            border-radius: 4px;
            font-size: 14px;
            text-transform: capitalize;
        }

        .infor_container .button_container .btn:hover {
            opacity: 0.8;
            cursor: pointer;
        }

        .infor_container .button_container .btn_mua {
            background-color: #373cff;
            color: #fff;
            border: 1px solid #373cff;
        }

        .infor_container .button_container .btn_them {
            background-color: #ebecff;
            color: #373cff;
            border: 1px solid #373cff;
        }

        .description_container {
            margin-bottom: 20px;
            padding: 10px 20px 20px;
            background-color: #fff;
            border-radius: 8px;
        }

        .description_container h3{
            color: #2c2c2c;
        }

        .description_container p{
            font-size: 14px;
            line-height: 20px;
        }

        .list_product_container {
            position: relative;
        }

        p.title {
            font-size: 26px;
            font-weight: 600;
        }

        .view_more {
            display: inline-block;
            text-decoration: none;
            position: absolute;
            top: 0;
            right: 0;
            padding: 10px;
            background-color: #4044ff;
            border-radius: 6px;
            color: #fff;
            transition: all linear .1s;
        }

        .view_more:hover {
            opacity: 0.8;
            cursor: pointer;
        }

        .list_product {
            /*width: 1000px;*/
            width: 100%;
            margin: 20px auto;
        }

        .list_product td {
            width: 20%;
            background-color: #fff;
            box-shadow: 0px 0px 8px #bbbbbb;
            border-radius: 8px;
            transition: all linear .2s;
            padding: 0;
            position: relative;
        }

        .list_product td:hover {
            cursor: pointer;
            box-shadow: 1px 1px 12px #6f6f6f;
        }

        .list_product td:empty {
            display: none;
        }

        .list_product .product {
            text-decoration: none;
            color: #202020;
        }

        .list_product .discount {
            position: absolute;
            top: 6px;
            left: -4px;
            background-color: #b60000;
            color: #fff;
            font-size: 12px;
            padding: 3px 4px;
        }

        .list_product .discount::after {
            content: "";
            position: absolute;
            top: 19px;
            left: 0;
            /*background-color: #690000;*/
            color: #fff;
            font-size: 12px;
            border-top: 4px solid #690000;
            border-left: 4px solid transparent;
        }

        .list_product .product_image {
            width: 100%;
            /*height: 200px;*/
            height: 280px;
            background-repeat: no-repeat;
            background-position: center 10%;
            background-size: cover;
            background-clip: padding-box;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .list_product .product_name_container {
            height: 36px;
            padding: 8px 8px 4px;
        }

        .list_product .product_name {
            display: -webkit-box;
            line-height: 18px;
            -webkit-line-clamp: 2;
            overflow: hidden;
            -webkit-box-orient: vertical;
        }

        .list_product .product_price_container {
            align-items: flex-start;
            height: 44px;
        }

        .list_product .product_price {
            display: -webkit-box;
            padding: 4px 8px;
            -webkit-line-clamp: 1;
            overflow: hidden;
            -webkit-box-orient: vertical;
            font-size: 16px;
            color: red;
        }

        .list_product .product_old_price {
            display: -webkit-box;
            padding: 4px 8px 0;
            -webkit-line-clamp: 1;
            overflow: hidden;
            -webkit-box-orient: vertical;
            font-size: 12px;
            color: #9e9e9e;
            text-decoration: solid;
            text-decoration-line: line-through;
            line-height: 14px;
        }

        .list_product .product_new_price {
            display: -webkit-box;
            padding: 4px 8px 0;
            -webkit-line-clamp: 1;
            overflow: hidden;
            -webkit-box-orient: vertical;
            font-size: 16px;
            color: red;
            line-height: 16px;
        }

        .list_product .sell {
            padding: 4px 8px 0;
            font-size: 12px;
            color: #666666;
        }

        .snackbar2 {
            visibility: hidden;
            min-width: 250px;
            margin-left: -125px;
            background-color: #eaebff;
            box-shadow: 4px 0 8px #898cff;
            color: #fff;
            text-align: center;
            border-radius: 4px;
            padding: 16px;
            position: fixed;
            z-index: 1;
            top: 100px;
            right: 10px;
            font-size: 17px;
        }

        .snackbar2.show {
            visibility: visible;
            -webkit-animation: fadein 0.5s; /*fadeout 0.5s 2.5s;*/
            animation: fadein 0.5s; /*fadeout 0.5s 2.5s;*/
            /*animation-fill-mode: both;*/
            transition: all linear .3s;
        }

        .snackbar2 i {
            position: absolute;
            top: 0;
            right: 0;
            padding: 10px 14px;
            color: #999;
        }

        .snackbar2 i {
            cursor: pointer;
            opacity: 0.9;
        }

        .snackbar2 h5 {
            margin: 0 0 8px 0;
            color: #444444;
            font-size: 16px;
        }

        .snackbar2 a {
            display: inline-block;
            text-decoration: none;
            color: #fff;
            padding: 10px;
            margin: 10px 10px 0;
            border: 2px solid #3939ff;
            border-radius: 6px;
        }

        .snackbar2 a:hover {
            opacity: 0.8;
            cursor: pointer;
        }

        .snackbar2 .btn_login {
            color: #fff;
            background-color: #3a3acc;
        }

        .snackbar2 .btn_no_login2 {
            color: #0000ff;
            background-color: #fff;
        }

        @-webkit-keyframes fadein {
            from {
                opacity: 0.5;
                transform: translateX(100%);
            } 
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes fadein {
            from {
                opacity: 0.5;
                transform: translateX(100%);
            } 
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @-webkit-keyframes fadeout {
            from {
                opacity: 1;
            } 
            to {
                opacity: 0;
            }
        }

        @keyframes fadeout {
            from {
                opacity: 1;
            } 
            to {
                opacity: 0;
            }
        }
    </style>

    <asp:DataList ID="DataList1" CssClass="" runat="server" Width="100%" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <div class="product_container">
                <ul class="list_imgs">
                    <% if(images != null)
                        foreach(string img in images) { %>
                        <li class="img" style='<%= "background-image: url(../Assets/Images/Figures/" + img.Trim() + ");" %>' data-img_name='<%= img.Trim() %>'></li>
                    <% } %>
                </ul>
                <div class="img_container">
                    <div class="img" style='<%# "background-image: url(../Assets/Images/Figures/" + Eval("hinh_anh") + ")" %>'></div>
                </div>
                <div class="infor_container">
                    <h3 class="product_name"><%# Eval("ten_sp") %></h3>
                        <p class="product_price"><%# (double.Parse(Eval("gia").ToString()) - double.Parse(Eval("gia").ToString()) * double.Parse(Eval("giam_gia").ToString()) / 100).ToString("#,##0") + " đ" %></p>
                    <div class="product_old_price-container" style='<%# "display: " + (Eval("giam_gia").ToString() == "0" ? "none" : "block") %>'>
                        <span class="product_old_price"><%# double.Parse(Eval("gia").ToString()).ToString("#,##0") + " đ" %></span>
                        <span class="product_discount"><%# "-" + double.Parse(Eval("giam_gia").ToString()).ToString("#,##0") + "%" %></span>
                    </div>
                    <div class="quantity">
                        <span>Số lượng</span>
                        <button type="button" id="minus" disabled="disabled">-</button>
                        <%--<input id="inp_soluong" runat="server" type="number" min="1" max='<%# int.Parse(Eval("so_luong").ToString()) %>' value="1" />--%>
                        <asp:TextBox ID="txt_soluong" CssClass="inp_soluong" runat="server" type="number" min="1" max='<%# int.Parse(Eval("so_luong").ToString()) %>' value="1"></asp:TextBox>
                        <button type="button" id="plus">+</button>
                        <span class="inventory_number"><%# Eval("so_luong") + " sản phẩm có sẵn" %></span>
                    </div>
                    <div class="button_container">
                        <%--<button class="btn btn_mua">Mua ngay</button>
                        <button class="btn btn_them">Thêm vào giỏ</button>--%>
                        <asp:Button ID="btn_mua" runat="server" Text="Mua ngay" CssClass="btn btn_mua" CommandName="Buy_Product" OnClick="btn_mua_Click" />
                        <asp:Button ID="btn_themvaogio" runat="server" Text="Thêm vào giỏ" CssClass="btn btn_them" OnClick="btn_themvaogio_Click" CommandName="Add_To_Cart" />
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="description_container">
                <h3>Mô tả</h3>
                <p><%# Eval("mo_ta") %></p>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <div class="list_product_container">
        <p class="title">Sản phẩm liên quan</p>
        <a href='<%= "Product.aspx?ma_loai=" + ma_loai %>' class="view_more">
            Xem thêm
            <i class="fa-solid fa-caret-right"></i>
        </a>
        <asp:DataList ID="DataList2" runat="server" CellSpacing="12" RepeatColumns="5" CssClass="list_product" RepeatDirection="Horizontal">
            <ItemTemplate>
                <a class="product" href='<%#"Product_Detail.aspx?masp=" + Eval("ma_sp") %>'>
                    <div class="discount" style='<%# "display: " + (Eval("giam_gia").ToString() != "0" ? "block" : "none") %>' ><%# "Giảm " + Eval("giam_gia") + "%" %></div>
                    <div id="hinh_anh" class="product_image" runat="server" style='<%# "background-image: url(../Assets/Images/Figures/" + Eval("hinh_anh") + ")" %>'></div>
                    <div class="product_name_container">
                        <asp:Label ID="ten_spLabel" runat="server" CssClass="product_name" Text='<%# Eval("ten_sp") %>' />
                    </div>

                    <div class="product_price_container" style='<%# "display: " + (Eval("giam_gia").ToString() != "0" ? "block" : "none")  %>'>
                        <asp:Label ID="Label1" CssClass="product_new_price" runat="server" Text='<%# (double.Parse(Eval("gia").ToString()) - double.Parse(Eval("gia").ToString()) * double.Parse(Eval("giam_gia").ToString()) / 100.0).ToString("#,##0") + " đ" %>'></asp:Label>
                        <div style="display: flex; justify-content: space-between">
                            <asp:Label ID="giaLabel" runat="server" CssClass="product_old_price" Text='<%# double.Parse(Eval("gia").ToString()).ToString("#,##0") + " đ" %>' />
                            <asp:Label ID="Label3" runat="server" CssClass="sell" Text='<%# "Đã bán " + (double.Parse(Eval("da_ban").ToString()) > 1000 ? ((Math.Floor(double.Parse(Eval("da_ban").ToString()) / 100.0) / 10.0).ToString() + "k") : double.Parse(Eval("da_ban").ToString()).ToString()) %>' />
                        </div>
                    </div>
                    <div class="product_price_container" style='<%# "justify-content: space-between; display: " + (Eval("giam_gia").ToString() == "0" ? "flex" : "none")  %>'>
                        <asp:Label ID="Label2" runat="server" CssClass="product_price" Text='<%# double.Parse(Eval("gia").ToString()).ToString("#,##0") + " đ" %>' />
                        <asp:Label ID="Label4" runat="server" CssClass="sell" Text='<%# "Đã bán " + (double.Parse(Eval("da_ban").ToString()) > 1000 ? ((Math.Floor(double.Parse(Eval("da_ban").ToString()) / 100.0) / 10.0).ToString() + "k") : double.Parse(Eval("da_ban").ToString()).ToString()) %>' />
                    </div>
                </a>
            </ItemTemplate>
        </asp:DataList>
    </div>

    <%--<div id="snackbar2" runat="server">Some text some message..</div>--%>
    <asp:Label ID="snackbar2" CssClass="snackbar2" runat="server" Text="">
        <i class="fa-solid fa-xmark close_toast2"></i>
        <h5>Bạn vẫn chưa đăng nhập</h5>
        <h5>Có muốn đăng nhập không ?</h5>
        <a href="LogIn.aspx" class="btn_login">Đăng nhập</a>
        <a class="btn_no_login2">Để sau</a>
    </asp:Label>

    <script>
        //Handle tăng giảm số lượng
        //const inp_soluong = document.getElementById("inp_soluong");
        const inp_soluong = document.getElementsByClassName("inp_soluong")[0];
        const btn_minus = document.getElementById("minus");
        const btn_plus = document.getElementById("plus");

        inp_soluong.oninput = function (e) {
            onInputChange(+e.target.value);
        }

        btn_minus.onclick = function () {
            if (inp_soluong.value > 1) {
                inp_soluong.value = +inp_soluong.value - 1;
                onInputChange(+inp_soluong.value);
            }
        }

        btn_plus.onclick = function () {
            if (+inp_soluong.value < +inp_soluong.max) {
                inp_soluong.value = +inp_soluong.value + 1;
                onInputChange(+inp_soluong.value);
            }
        }

        function onInputChange(inputValue) {
            if (inputValue < 1) {
                inp_soluong.value = 1
            } else if (inputValue > +inp_soluong.max) {
                inp_soluong.value = inp_soluong.max;
            }

            if (inputValue == 1) {
                btn_minus.disabled = true;
            } else if (inputValue == +inp_soluong.max) {
                btn_plus.disabled = true;
            } else {
                btn_minus.disabled = false;
                btn_plus.disabled = false;
            }

            if (inputValue >= 100) {
                inp_soluong.style.paddingLeft = "14px";
            } else if (inputValue >= 10) {
                inp_soluong.style.paddingLeft = "17px";
            }
        }

        //Handle chọn hình ảnh sản phẩm
        const list_imgs = document.querySelectorAll(".list_imgs .img");
        const img_show = document.querySelector(".img_container .img");

        list_imgs[0].classList.add("active");

        Array.from(list_imgs).forEach(function (img) {
            img.onclick = function (e) {
                //console.log(e.target.dataset.img_name);
                img_show.style.backgroundImage = "url(../Assets/Images/Figures/" + e.target.dataset.img_name;
                document.querySelector(".list_imgs .img.active").classList.remove("active");
                img.classList.add("active");
            }
        })

        //Handle hide toast
        const snackbar2 = document.querySelector(".snackbar2");
        const close_icon2 = document.querySelector(".close_toast2");
        const btn_no_login2 = document.querySelector(".btn_no_login2");

        close_icon2.onclick = function () {
            snackbar2.style.animation = "fadeout 0.5s";
            snackbar2.style.animationFillMode = "both";
        }
        btn_no_login2.onclick = function () {
            snackbar2.style.animation = "fadeout 0.5s";
            snackbar2.style.animationFillMode = "both";
        }
    </script>
</asp:Content>
