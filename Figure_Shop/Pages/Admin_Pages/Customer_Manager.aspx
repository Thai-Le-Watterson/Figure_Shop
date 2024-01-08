<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin_Master_Page.Master" AutoEventWireup="true" CodeBehind="Customer_Manager.aspx.cs" Inherits="Figure_Shop.Pages.Admin_Pages.Customer_Manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .form_group {
            /*display: inline-block;*/
            float: left;
            width: 33%;
            padding: 10px 18px;
            box-sizing: border-box;
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

        .product_manager_container .form_manager .form_group #show_anh {
            display: none;
        }

        .product_manager_container .form_manager .form_group .anh_dai_dien {
            margin: 8px auto;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
    </style>
    <div class="product_manager_container">
        <h1 class="title">Quản Lý Khách Hàng</h1>
        <div class="form_manager">
            <div class="two_thirds_width center">
                <div class="form_group half_width">
                    <div class="form_group full_width">
                        <label for="inp_tenkh" class="form_label">Tên khách hàng</label>
                        <input id="inp_tenkh" type="text" class="form_control" runat="server"/>
                    </div>
                    <div class="form_group full_width">
                        <label for="inp_email" class="form_label">Email</label>
                        <input id="inp_email" type="text" class="form_control" runat="server"/>
                    </div>
                    <div class="form_group full_width">
                        <label for="inp_matkhau" class="form_label">Mật khẩu</label>
                        <input id="inp_matkhau" type="text" class="form_control" runat="server"/>
                    </div>
                </div>
                <div class="form_group half_width">
                    <label for="inp_anh" class="form_label">Ảnh đại diện</label>
                    <%--<input id="inp_anh" type="file" class="form_control file_anh" runat="server" />--%>
                    <asp:FileUpload ID="file_anh" runat="server" CssClass="form_control file_anh" />
                    <% String bg_img = "background-image: url(../../Assets/Images/avatar/" + custom_avatar + ")"; %>
                    <div class="anh_dai_dien" style="<%= bg_img %>"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="form_group align_right full_width">
                <asp:Button ID="btn_them" runat="server" Text="Thêm" CssClass="form_button" OnClick="btn_them_Click" />
                <asp:Button ID="btn_sua" runat="server" Text="Sửa" CssClass="form_button" OnClick="btn_sua_Click" />
                <asp:Button ID="btn_xoa" runat="server" Text="Xóa" CssClass="form_button" OnClick="btn_xoa_Click" />
            </div>
            <asp:GridView ID="GridView1" CssClass="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="STT">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ten_tk" HeaderText="Tên khách hàng" SortExpression="ten_tk" />
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                    <asp:BoundField DataField="mat_khau" HeaderText="Mật khẩu" SortExpression="mat_khau" />
                    <asp:BoundField DataField="avatar" HeaderText="Ảnh đại diện" SortExpression="avatar" />
                    <asp:CommandField ShowSelectButton="True" />
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
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Figure_DbConnectionString2 %>" SelectCommand="SELECT * FROM [users] WHERE ([quyen] = @quyen)">
        <SelectParameters>
            <asp:Parameter DefaultValue="R1" Name="quyen" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <script>
        let inp_file = document.getElementsByClassName("file_anh")[0];
        let avatar = document.getElementsByClassName("anh_dai_dien")[0];
        inp_file.onchange = function (e) {
            console.log(URL.createObjectURL(event.target.files[0]));

            let value = e.target.value.split("\\");

            avatar.style.backgroundImage = "url(" + URL.createObjectURL(event.target.files[0]) + ")";
        };
    </script>
</asp:Content>
