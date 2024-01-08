<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="Figure_Shop.User_Controls.Header" %>

<style>
    body {
    }

    .header_container {
        padding: 0 100px;
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-image: linear-gradient(0, #090ed9, #262bff);
        box-sizing: border-box;
        color: white;
        z-index: 99;
    }

    .header_name {
        width: 25%;
        color: white;
        text-decoration: none;
        display: flex;
        /*display: inline-block;*/
        align-items: center;
        column-gap: 10px;
        cursor: pointer;
    }

    .header_name .logo {
        /*display: inline-block;*/
        margin: 20px 0;
        width: 50px;
        height: 50px;
        background: url(../Assets/Images/logo/white_logo.png) no-repeat center;
        background-size: cover;
        border-radius: 50%;
    }

    .search_container {
        display: inline-block;
        position: relative;
        width: 50%;
    }

    .search_container .inp_search {
        padding: 12px 40px 12px 20px;
        width: 100%;
        border: 2px solid #fff;
        border-radius: 200px;
        background-color: transparent;
        box-sizing: border-box;
        color: #fff;
        outline: none;
    }

    .search_container .inp_search::selection {
        background-color: #999;
    }

    .search_container .inp_search:focus {
        z-index: 1000;
    }

    .search_container .inp_search:focus {
        box-shadow: 1px 1px 12px #898cff;
    }

    .search_container .inp_search::-webkit-input-placeholder {
        color: #b5b7ff;
    }

    .search_container .search_icon {
        padding: 14px 24px 14px 14px;
        position: absolute;
        top: 50%;
        right: 0px;
        transform: translateY(-50%);
    }

    .search_container .search_icon:hover {
        cursor: pointer;
    }

    .cart_container {
        display: inline-block;
        width: 15%;
        height: 20px;
        color: white;
        font-size: 20px;
        position: relative;
    }

    .cart_container .cart_icon {
        color: white;
        font-size: 20px;
        padding: 10px;
        position: absolute;
        top: 50%;
        right: 0;
        transform: translateY(-50%);
    }

    .cart_container .cart_icon:hover {
        opacity: 0.8;
        cursor: pointer;
    }

    .user_container {
        width: 10%;
        position: relative;
        display: flex;
        /*display: inline-block;*/
        justify-content: flex-end;
    }

    .user_container > div {
        padding: 10px 0;
    }

    .user_container .user_infor, .user_container a {
        display: flex;
        align-items: center;
        column-gap: 6px;
        cursor: pointer;
        text-decoration: none;
        color: white;   
    }

    .user_container > div:hover .user_infor {
        opacity: 0.8;
    }

    .user_container .avatar {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        /*background: url(../Assets/Images/avatar/<%= user_avatar %>) no-repeat center;*/
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
    }

    .user_container > div:hover .user_option{
        display: block;
        cursor: pointer;
    }

    .user_container .user_option {
        list-style: none;
        color: #000;
        margin: 0;
        padding: 0;
        min-width: 160px;
        background-color: white;
        box-shadow: 1px 1px 4px #ccc;
        border-radius: 6px;
        position: absolute;
        top: 100%;
        right: 0;
        display: none;
    }

    .user_container .user_option li:hover {
        background-color: #e5e5e5;
    }

    .user_container .user_option li:first-child {
        border-top-left-radius: 6px;
        border-top-right-radius: 6px;
    }

    .user_container .user_option li:last-child {
        border-bottom-left-radius: 6px;
        border-bottom-right-radius: 6px;
    }

    .user_container .user_option li .item{
        padding: 4px;
        color: #000;
        padding: 8px 10px;
    }

    .user_container a:hover {
        opacity: 0.8;
        cursor: pointer;
    }

    .user_container a .login_icon {
        font-size: 20px;
    }

    .snackbar {
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

    .snackbar.show {
        visibility: visible;
        -webkit-animation: fadein 0.5s; /*fadeout 0.5s 2.5s;*/
        animation: fadein 0.5s; /*fadeout 0.5s 2.5s;*/
        /*animation-fill-mode: both;*/
        transition: all linear .3s;
    }

    .snackbar i {
        position: absolute;
        top: 0;
        right: 0;
        padding: 10px 14px;
        color: #999;
    }

    .snackbar i {
        cursor: pointer;
        opacity: 0.9;
    }

    .snackbar h5 {
        margin: 0 0 8px 0;
        color: #444444;
        font-size: 16px;
    }

    .snackbar a {
        display: inline-block;
        text-decoration: none;
        color: #fff;
        padding: 10px;
        margin: 10px 10px 0;
        border: 2px solid #3939ff;
        border-radius: 6px;
    }

    .snackbar a:hover {
        opacity: 0.8;
        cursor: pointer;
    }

    .snackbar .btn_login {
        color: #fff;
        background-color: #3a3acc;
    }

    .snackbar .btn_no_login {
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

    .inp_search:focus ~ .search_suggest {
        display: block;
    }

    .search_suggest {
        display: none;
        position: absolute;
        top: 50px;
        left: 0;
        right: 0;
        background-color: #fff;
        padding: 10px;
        border-radius: 8px;
        box-shadow: 0 4px 8px #ccc;
        transition: all linear .2s;
    }

    .search_suggest:hover {
        display: block;
    }

    .search_suggest p {
        color: #000;
        font-weight: bold;
        font-size: 18px;
        margin: 10px;
    }

    .search_suggest .list_category {
        width: 100%;
    }

    .search_suggest .list_category td {
        text-align: left;
    }

    .search_suggest .list_category .category_name {
        display: inline-block;
        width: 100%;
        padding: 2px 0 0 30px;
        text-decoration: none;
        color: #343434;
        display: inline-block;
        transition: all linear .2s;
        box-sizing: border-box;
    }

    .search_suggest .list_category .category_name:hover {
        background-color: #f1f1f1;
    }

    .search_suggest .list_product {
        width: 100%;
    }

    .search_suggest .list_product td {
        width: 100%;
        margin-left: 30px;
        border-radius: 0;
    }

    .search_suggest .list_product .product_suggest {
        display: flex;
        text-decoration: none;
        padding: 8px 0 8px 30px;
        width: 100%;
        box-sizing: border-box;
        transition: all linear .2s;
    }

    .search_suggest .list_product .product_suggest:hover {
        background-color: #f1f1f1;
    }

    .search_suggest .list_product .product_img {
        width: 50px;
        height: 50px;
        background-size: contain;
        background-repeat: no-repeat;
        background-position: center;
        border: 1px solid #e5e5e5;
        margin-right: 10px;
    }

    .search_suggest .list_product .product_name {
        color: #242323;
    }
</style>

<link rel="stylesheet" href="../Assets/fontawesome-free-6.4.2-web/css/all.min.css" />

<div class="header_container">
    <a href="../Pages/Home.aspx" class="header_name">
        <div class="logo"></div>
        <h1 class="shop_name">Luruku</h1>
    </a>
    <div class="search_container">
        <input id="inp_search" class="inp_search" type="text" runat="server" placeholder="Tìm kiếm..." />
        <i class="fa-solid fa-magnifying-glass search_icon"></i>
        <div class="search_suggest">
            <p>Tìm theo danh mục</p>
            <asp:DataList ID="dtl_search_category" runat="server" CssClass="list_category">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="category_name" NavigateUrl='<%# "~/Pages/Product.aspx?ma_loai=" + Eval("ma_loai") %>'><%# Eval("ten_loai") %></asp:HyperLink>
                </ItemTemplate>
            </asp:DataList>
            <p>Tìm theo sản phẩm nổi bật</p>
            <asp:DataList ID="dtl_search_product" runat="server" CssClass="list_product">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="product_suggest" NavigateUrl='<%# "~/Pages/Product_Detail.aspx?masp=" + Eval("ma_sp") %>'>
                        <%--<asp:Image ID="img_product" runat="server" CssClass="product_img" ImageUrl='<%# "../Assets/Images/Figures/" + Eval("hinh_anh") %>' />--%>
                        <div class="product_img" style='<%# "background-image: url(../Assets/Images/Figures/"+ Eval("hinh_anh") +")" %> '></div>
                        <asp:Label ID="lbl_product_name" runat="server" CssClass="product_name" Text='<%# Eval("ten_sp") %>'></asp:Label>
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
    <div class="cart_container">
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">
            <i class="fa-solid fa-cart-shopping cart_icon"></i>
        </asp:LinkButton>
    </div>
    <div class="user_container">
        <% if(user_name != "") { %>
            <div>
                <div class="user_infor">
                    <span class="user_name"><%= user_name %></span>
                    <% String background_img = "background-image: url(../Assets/Images/avatar/" + user_avatar + ")"; %>
                    <div class="avatar" style="<%= background_img %>"></div>
                </div>
                <ul class="user_option">
                        <% if(user_role == "R0") { %>
                            <li>
                                <asp:LinkButton ID="lbtn_admin_page" runat="server" CssClass="item" OnClick="lbtn_admin_page_Click">Trang quản trị</asp:LinkButton>
                            </li>
                        <% } %>
                    <li>
                        <asp:LinkButton ID="lbtn_me_page" runat="server" CssClass="item btn_me_page" OnClick="lbtn_me_page_Click">Hồ sơ cá nhân</asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="link_btn_logout" runat="server" OnClick="link_btn_logout_Click" CssClass="item btn_logout">Đăng xuất</asp:LinkButton>
                    </li>
                </ul>
            </div>
        <% } else { %>
            <a href="/Pages/LogIn.aspx">
                <span class="user_name">Đăng nhập</span>
                <div class="login_icon">
                    <i class="fa-solid fa-circle-user"></i>
                </div>
            </a>
        <% } %>
    </div>
</div>

<asp:Label ID="snackbar" CssClass="snackbar" runat="server" Text="">
    <i class="fa-solid fa-xmark close_toast"></i>
    <h5>Bạn vẫn chưa đăng nhập</h5>
    <h5>Có muốn đăng nhập không ?</h5>
    <%--<asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn_login">Đăng nhập</asp:LinkButton>--%>
    <%--<asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn_no_login">Để sau</asp:LinkButton>--%>
    <a href="LogIn.aspx" class="btn_login">Đăng nhập</a>
    <a class="btn_no_login">Để sau</a>
</asp:Label>

<script>
    const inp_search = document.getElementsByClassName("inp_search")[0];
    const search_icon = document.getElementsByClassName("search_icon")[0];

    inp_search.onkeydown = function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            if(e.target.value != "")
                window.location.href = "http://localhost:1043/Pages/Product.aspx?search=" + e.target.value;
            else
                window.location.href = "http://localhost:1043/Pages/Product.aspx";
        }
    }

    search_icon.onclick = function () {
        if (inp_search.value != "")
            window.location.href = "http://localhost:1043/Pages/Product.aspx?search=" + inp_search.value;
        else
            window.location.href = "http://localhost:1043/Pages/Product.aspx";
    }

    //Handle hide toast
    const snackbar = document.querySelector(".snackbar");
    const close_icon = document.querySelector(".close_toast");
    const btn_no_login = document.querySelector(".btn_no_login");

    close_icon.onclick = function () {
        snackbar.style.animation = "fadeout 0.5s";
        snackbar.style.animationFillMode = "both";
    }
    btn_no_login.onclick = function () {
        snackbar.style.animation = "fadeout 0.5s";
        snackbar.style.animationFillMode = "both";
    }
</script>
