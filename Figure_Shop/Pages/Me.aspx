<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master_Page.Master" AutoEventWireup="true" CodeBehind="Me.aspx.cs" Inherits="Figure_Shop.Pages.Me" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #form1 {
            background-color: #f0f0f0;
        }

        .user_profile_container {
            background-color: #fff;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            column-gap: 20px;
            margin: 0 auto;
            width: 800px;
            border-radius: 8px;
        }

        .user_profile_container .content_left {
            width: 40%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: flex-start;
        }

        .user_profile_container .user_profile {
            width: 100%;
            height: fit-content;
        }

        .user_profile_container .user_profile td:first-child{
            width: 140px;
            padding: 8px 10px;
            text-align: right;
            color: #8b8b8b;
            box-sizing: border-box;
        }

        .user_profile_container .user_profile td:last-child{
            position: relative;
        }

        .user_profile_container .input {
            width: 100%;
            font-size: 16px;
            padding: 6px;
            border-radius: 5px;
            border: 2px solid #707070;
            box-sizing: border-box;
            outline: none;
        }

        .user_profile_container .btn_container {
            position: relative;
            color: #999;
            transition: all linear .1s;
        }

        .user_profile_container .btn_container:hover {
            cursor: pointer;
            color: #000;
            opacity: 0.9;
        }

        .user_profile_container .btn_edit {
            background-color: transparent;
            border: none;
            padding: 0 0 0 32px;
            font-size: 16px;
            color: inherit;
            cursor: pointer;
            transition: all linear .1s;
        }

        .user_profile_container .btn_save {
            background-color: #fff;
            border: 2px solid blue;
            border-radius: 8px;
            padding: 10px 16px 10px 30px;
            cursor: pointer;
            color: blue;
        }

        .user_profile_container .btn_save + i {
            color: blue;
        }

        .user_profile_container .btn_container i {
            position: absolute;
            top: 50%;
            left: 8px;
            transform: translateY(-56%);
            transition: all linear .1s;
        }

        .user_profile_container .icon {
            position: absolute;
            top: 50%;
            right: 8px;
            transform: translateY(-56%);
            transition: all linear .1s;
            color: #444;
        }

        .user_profile_container .avatar_container {
            width: 50%;
            height: 170px;
            padding: 10px;
            border-left: 1px solid #e5e5e5;
        }

        .user_profile_container .avatar {
            width: 100px;
            height: 100px;
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;
            border-radius: 50%;
            margin: 0 auto;
            transition: all linear .1s;
        }

        .user_profile_container .avatar:hover {
            cursor: pointer;
            opacity: 0.9;
        }

        .user_profile_container .file_upload {
            display: none;
        }

        .user_profile_container .avatar_container label {
            display: block;
            width: fit-content;
            margin: 10px auto 0;
            padding: 10px 20px;
            border: 1px solid #e5e5e5;
            transition: all linear .1s;
        }

        .user_profile_container .avatar_container label:hover {
            cursor: pointer;
            background-color: #fdfdfd;
        }
    </style>

    <asp:DataList ID="DataList1" runat="server" Width="100%" OnEditCommand="DataList1_EditCommand" OnUpdateCommand="DataList1_UpdateCommand">
        <ItemTemplate>
            <div class="user_profile_container">
                <div class="content_left">
                    <table class="user_profile">
                        <tr>
                            <td>Tên đăng nhập</td>
                            <td>
                                <asp:Label ID="lbl_tenkh" runat="server"><%# Eval("ten_tk") %></asp:Label>
                                <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandName="edit" CssClass="icon">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </asp:LinkButton>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>
                                <asp:Label ID="Label1" runat="server"><%# Eval("email") %></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <div class="btn_container">
                        <asp:Button ID="Button1" CssClass="btn_edit" runat="server" Text="Sửa hồ sơ" OnClick="Button1_Click" CommandName="edit" />
                        <i class="fa-solid fa-pen-to-square"></i>
                    </div>
                </div>
                <div class="avatar_container">
                    <div class="avatar" style='<%# "background-image: url(../Assets/Images/avatar/" + Eval("avatar") + ")" %>'></div>
                    <%--<asp:FileUpload ID="FileUpload1" runat="server" CssClass="file_upload" />--%>
                    <%--<label for="ContentPlaceHolder1_DataList1_FileUpload1_0">Chọn ảnh</label>--%>
                </div>
            </div>
        </ItemTemplate>
        <EditItemTemplate>
            <div class="user_profile_container">
                <div class="content_left">
                    <table class="user_profile">
                        <tr>
                            <td>Tên đăng nhập</td>
                            <td>
                                <asp:TextBox ID="txt_tenkh" runat="server" CssClass="input" Text='<%# Eval("ten_tk") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><asp:Label ID="Label1" runat="server"><%# Eval("email") %></asp:Label></td>
                        </tr>
                    </table>
                    <div class="btn_container">
                        <asp:Button ID="Button1" CssClass="btn_save" runat="server" Text="Lưu" CommandName="update" OnClick="Button1_Click1" />
                        <i class="fa-regular fa-face-grin-wink"></i>
                    </div>
                </div>
                <div class="avatar_container">
                    <div class="avatar avatar_profile" style='<%# "background-image: url(../Assets/Images/avatar/" + Eval("avatar") + ")" %>'></div>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="file_upload" />
                    <label for="ContentPlaceHolder1_DataList1_FileUpload1_0">Chọn ảnh</label>
                </div>
            </div>
        </EditItemTemplate>
    </asp:DataList>

    <script>
        let inp_file = document.getElementsByClassName("file_upload")[0];
        let anh_sp = document.getElementsByClassName("avatar_profile")[0];
        //let img_fullscreen = document.getElementsByClassName("img_fullscreen")[0];
        inp_file.onchange = function (e) {
            console.log(URL.createObjectURL(event.target.files[0]));

            let value = e.target.value.split("\\");

            //anh_sp.style.backgroundImage = "url(../../Assets/Images/Figures/" + value[2] + ")";
            //img_fullscreen.style.backgroundImage = "url(../../Assets/Images/Figures/" + value[2] + ")";

            anh_sp.style.backgroundImage = "url(" + URL.createObjectURL(event.target.files[0]) + ")";
            //img_fullscreen.style.backgroundImage = "url(" + URL.createObjectURL(event.target.files[0]) + ")";
        };
    </script>
</asp:Content>
