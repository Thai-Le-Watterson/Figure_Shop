<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Admin_Header.ascx.cs" Inherits="Figure_Shop.User_Controls.Admin_Header" %>

<style>
    ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      overflow: hidden;
      background-color: #002267;
    }

    li {
      float: left;
    }

    li a {
      display: block;
      color: white;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
    }

    li a:hover:not(.active) {
      background-color: #002b82;
      transition: all linear .1s;
    }

    .active {
      background-color: #3872e9;
    }

    .header_name {
    }
</style>
<div class="admin_header_container">
    <ul>
      <li>
        <a href="../Home.aspx" class="header_name active">Luruku</a>
      </li>
      <li><a href="../Admin_Pages/Product_Manager.aspx">Sản phẩm</a></li>
      <li><a href="../Admin_Pages/Product_Category_Manager.aspx">Loại sản phẩm</a></li>
      <li><a href="../Admin_Pages/Customer_Manager.aspx">Khách hàng</a></li>
      <li><a href="../Admin_Pages/Order_Manager.aspx">Hóa đơn</a></li>
      <li><a href="../Admin_Pages/Cart_Manager.aspx">Giỏ hàng</a></li>
    </ul>
</div>