<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="List_Category.ascx.cs" Inherits="Figure_Shop.User_Controls.List_Category" %>
<style>
    .list_container {
        background-color: #fff;
        padding: 2px 20px 10px 20px;
        border-radius: 8px;
        position: sticky;
        top: 120px;
    }

    .title {
        font-size: 20px;
    }

    .title i {
        font-size: 18px;
    }

    .category_list {
        padding-left: 34px;
    }
    
    .category {
        display: block;
        padding: 4px;
        color: #000000;
        text-decoration: none;
        font-size: 14px;
    }

    .category:hover {
        cursor: pointer;
        color: #0b0b91;
    }

    .category.active {
        color: #0e13df;
        font-weight: bold;
        position: relative;
    }

    .category.active::after {
        content: "";
        border-left: 6px solid #0e13df;
        border-right: 10px solid transparent;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        position: absolute;
        left: -10px;
        top: 50%;
        transform: translateY(-50%);
    }
</style>

<div class="list_container">
    <h2 class="title">
        <i class="fa-solid fa-list-ul"></i>
        Danh mục sản phẩm
    </h2>
    <div class="category_list">
        <asp:DataList ID="DataList1" runat="server" Width="100%">
            <ItemTemplate>
                <%--<asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("ten_loai") %>' CssClass='<%# "category" + (Request.QueryString["ma_loai"].ToString() == Eval("ma_loai").ToString() ? " active" : "" ) %>'></asp:LinkButton>--%>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "http://localhost:1043/Pages/Product.aspx?ma_loai=" + Eval("ma_loai") %>' Text='<%# Eval("ten_loai") %>' CssClass='<%# "category" + (Request.QueryString["ma_loai"] != null && Request.QueryString["ma_loai"].ToString() == Eval("ma_loai").ToString() ? " active" : "") %>'></asp:HyperLink>
            </ItemTemplate>
        </asp:DataList>
    </div>
</div>
