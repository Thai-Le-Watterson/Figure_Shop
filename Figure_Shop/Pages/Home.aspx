<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master_Page.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Figure_Shop.Pages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <style>
        @keyframes goUp {
            0% {
                transform: translateY(10px);
            } 
            100% {
                transform: translateY(0);
            }
        }

        body {
            background-color: #f0f0f0;
            font-family: Arial;
        }

        p.title {
            font-size: 26px;
            font-weight: 600;
        }

        .banner {
            height: 560px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;
            margin-bottom: 20px;
            position: relative;
        }

        .banner .overlay {
            opacity: 0;
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background-color: rgba(0, 0, 0, 0.5);
            transition: all linear .2s;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .banner:hover .overlay {
            opacity: 1;
        }

        .banner a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            font-size: 24px;
            background-color: #4141ff;
            padding: 16px 20px;
            border-radius: 6px;
            transition: all linear .2s;
        }

        .banner:hover a {
            cursor: pointer;
            animation-name: goUp;
            animation-delay: 0s;
            animation-direction: normal;
            animation-duration: 1s;
            animation-fill-mode: backwards;
            animation-iteration-count: 1;
            animation-timing-function: ease;
        }

        .category_container {
            position: relative;
        }

        .category_overlay {
            text-decoration: none;
            color: #000000;
        }

        .list_category {
            margin: 0 auto;
        }

        .list_category td {
            width: 300px;
            text-align: center;
        }

        .list_category .category {
            transition: all linear .2s;
            text-align: center;
            margin: 0 auto;
            padding: 20px 20px;
            border-radius: 12px;
            /*width: 140px;*/
        }

        .list_category .category:hover {
            cursor: pointer;
            background-color: #f9f9f9;
            box-shadow: 1px 1px 12px #e6e6e6;
        }

        .list_category .category:empty {
            display: none;
        }

        .list_category .image {    
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background-color: #fff;
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;
            margin: 0 auto 10px;
            box-shadow: 4px 4px 8px #e5e5e5;
        }

        .list_category .category_name {

        }

        .list_product_container {
            position: relative;
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
            width: 1200px;
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
            top: 20px;
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
    </style>
    <div class="banner" style="background-image: url(../Assets/Images/banner/banner_2.png)">
        <div class="overlay">
            <a href="Product.aspx?ma_loai=OP">Shop Now</a>
        </div>
    </div>
    <div class="category_container">
        <p class="title">Danh mục</p>
        <%--<a href="#" class="view_more">
            Xem thêm
            <i class="fa-solid fa-caret-right"></i>
        </a>--%>
        <asp:DataList ID="DataList_danhmuc" CellSpacing="12" CssClass="list_category" runat="server" DataKeyField="ma_loai" DataSourceID="SqlDataSource2" RepeatColumns="8">
            <ItemTemplate>
                <a class="category_overlay" href='<%# "Product.aspx?ma_loai=" + Eval("ma_loai") %>'>
                    <div class="category">
                        <div class="image" style='<%# "background-image: url(../Assets/Images/icon/"+ Eval("hinh_anh") %>'></div>
                        <asp:Label ID="ten_loaiLabel" CssClass="category_name" runat="server" Text='<%# Eval("ten_loai") %>' />
                    </div>
                </a>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <div class="list_product_container">
        <p class="title">Sản phẩm nổi bật</p>
        <a href="Product.aspx?loc=banchay" class="view_more">
            Xem thêm
            <i class="fa-solid fa-caret-right"></i>
        </a>
        <asp:DataList ID="DataList_sp" runat="server" CellSpacing="12" CssClass="list_product" DataKeyField="ma_sp" DataSourceID="SqlDataSource1" RepeatColumns="5" OnSelectedIndexChanged="DataList_sp_SelectedIndexChanged" RepeatDirection="Horizontal">
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Figure_DbConnectionString %>" SelectCommand="SELECT TOP (10) ma_sp, ten_sp, ma_loai, gia, so_luong, mo_ta, hinh_anh, giam_gia, da_ban FROM san_pham ORDER BY da_ban DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Figure_DbConnectionString %>" SelectCommand="SELECT * FROM [loai_sp] where hinh_anh IS NOT NULL and hinh_anh != ''"></asp:SqlDataSource>
</asp:Content>

