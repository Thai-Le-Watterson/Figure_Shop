<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Product_Master_Page.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Figure_Shop.Pages.Product" %>

<%@ Register Src="~/User_Controls/List_Category.ascx" TagPrefix="uc1" TagName="List_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .list_product {
            /*width: 1000px;*/
            margin: 20px auto;
        }

        .list_product td {
            width: 25%;
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
            visibility: hidden;
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
            color: #fff;
            font-size: 12px;
            border-top: 4px solid #690000;
            border-left: 4px solid transparent;
        }

        .list_product .product_image {
            width: 100%;
            height: 260px;
            background-repeat: no-repeat;
            background-position: center 10%;
            background-size: cover;
            background-clip: padding-box;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .list_product .product_name_container {
            height: 36px;
            padding: 8px 8px 2px;
        }

        .list_product .product_name {
            display: -webkit-box;
            line-height: 18px;
            -webkit-line-clamp: 2;
            overflow: hidden;
            -webkit-box-orient: vertical;
        }

        .list_product .product_price_container {
            align-items: center;
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

        .menu_filter {
            padding: 14px 20px;
            background-color: #efefef;
            border-radius: 6px;
        }

        .filter_item {
            margin: 0 10px;
            padding: 10px 14px;
            background-color: #ffffff;
            border: none;
            color: #000;
            border-radius: 4px;
            font-size: 14px;
        }

        .filter_item.active {
            background-color: #4044ff;
            color: #fff;
        }

        .filter_item.active:hover {
            background-color: #4d51ff;
            color: #fff;
        }

        .filter_item:hover {
            cursor: pointer;
            color: #000;
            background-color: #f5f5ff;
            transition: all linear .1s;
        }
    </style>
    <div class="menu_filter">
        Sắp xếp theo
        <asp:Button ID="btn_moi" CssClass="filter_item" runat="server" Text="Mới nhất" OnClick="btn_moi_Click" />
        <asp:Button ID="btn_banchay" CssClass="filter_item" runat="server" Text="Bán chạy" OnClick="btn_banchay_Click" />
        <asp:DropDownList ID="ddl_gia" CssClass="filter_item" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_gia_SelectedIndexChanged">
        </asp:DropDownList>
    </div>
    <% if(!isHaveProduct) { %>
        <h3 style="text-align: center">Sorry :(( Shop vẫn chưa bán sản phẩm thuộc danh mục này</h3>
    <% } %>
    <asp:DataList ID="DataList1" runat="server" CellSpacing="12" RepeatColumns="4"  CssClass="list_product" RepeatDirection="Horizontal">
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
                        <asp:Label ID="Label4" runat="server" CssClass="sell" Text='<%# "Đã bán " + (double.Parse(Eval("da_ban").ToString()) > 1000 ? ((Math.Floor(double.Parse(Eval("da_ban").ToString()) / 100.0) / 10.0).ToString() + "k") : double.Parse(Eval("da_ban").ToString()).ToString()) %>' />
                    </div>
                </div>
                <div class="product_price_container" style='<%# "justify-content: space-between; display: " + (Eval("giam_gia").ToString() == "0" ? "flex" : "none")  %>'>
                    <asp:Label ID="Label2" runat="server" CssClass="product_price" Text='<%# double.Parse(Eval("gia").ToString()).ToString("#,##0") + " đ" %>' />
                    <asp:Label ID="Label3" runat="server" CssClass="sell" Text='<%# "Đã bán " + (double.Parse(Eval("da_ban").ToString()) > 1000 ? ((Math.Floor(double.Parse(Eval("da_ban").ToString()) / 100.0) / 10.0).ToString() + "k") : double.Parse(Eval("da_ban").ToString()).ToString()) %>' />
                </div>
            </a>
        </ItemTemplate>
    </asp:DataList>
    </asp:Content>
