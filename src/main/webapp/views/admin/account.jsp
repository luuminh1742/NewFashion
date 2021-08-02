<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIAccountInfo" value="/api/account?action=info"/>
<c:url var="APIAccountPassword" value="/api/account?action=password"/>
<c:url var="UrlLogout" value="/logout"/>
<html>
<head>
    <title>Account Management | Admin New Fashion</title>
</head>
<body>
<div class="header">
    <h1 class="page-header">
        Account Management
    </h1>
    <ol class="breadcrumb">
        <li><a href='<c:url value="/admin/home"/> '>Home</a></li>
        <li><a href="active">Account Management</a></li>
    </ol>
</div>
<div id="page-inner">
    <div class="panel panel-default">
        <div class="panel-body">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#profile"><i class="fa fa-user"></i> Profile</a></li>
                <li><a data-toggle="tab" href="#update-password"><i class="fa fa-free-code-camp"></i> Update
                    password</a>
                </li>
                <li><a data-toggle="tab" href="#setting"><i class="fa fa-gear"></i> Setting</a></li>
            </ul>

            <div class="tab-content">
                <div id="profile" class="tab-pane fade in active" style="padding: 20px">
                    <h3>Profile</h3>
                    <hr>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel-body">
                                <div class="form-group row">
                                    <label for="username" class=" col-md-2">Username</label>
                                    <input class="form-control col-md-10"
                                           name="username" id="username"
                                           placeholder="Username"
                                           value="${accountModel.username}" disabled>
                                </div>
                                <div class="form-group row">
                                    <label for="fullName" class=" col-md-2">Full name</label>
                                    <input class="form-control col-md-10"
                                           name="fullName" id="fullName"
                                           placeholder="Full name"
                                           value="${accountModel.fullName}">
                                </div>
                                <div class="form-group row">
                                    <label for="address" class=" col-md-2">Address</label>
                                    <input class="form-control col-md-10"
                                           name="address" id="address"
                                           placeholder="Address"
                                           value="${accountModel.address}">
                                </div>
                                <div class="form-group row">
                                    <label for="email" class=" col-md-2">Email</label>
                                    <input class="form-control col-md-10"
                                           name="email" id="email"
                                           placeholder="Email"
                                           value="${accountModel.email}">
                                </div>
                                <div class="form-group row">
                                    <label for="phone" class="label col-md-2">Phone</label>
                                    <input class="form-control col-md-10"
                                           name="phone" id="phone"
                                           placeholder="Phone"
                                           value="${accountModel.phone}">
                                </div>
                                <br>
                                <div class="form-group row">
                                    <input type="button" class="btn btn-warning" value="Save info"
                                           onclick="clickSaveInfo()">
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <div id="update-password" class="tab-pane fade" style="padding: 20px">
                    <h3>Update password</h3>
                    <hr>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel-body">
                                <form>
                                    <div class="form-group row">
                                        <label for="old-password" class=" col-md-2">Old password</label>
                                        <input class="form-control col-md-10" type="password"
                                               name="old-password" id="old-password"
                                               placeholder="Old Password">
                                    </div>
                                    <div class="form-group row">
                                        <label for="new-password" class=" col-md-2">New password</label>
                                        <input class="form-control col-md-10" type="password"
                                               name="new-password" id="new-password"
                                               placeholder="New Password">
                                    </div>
                                    <div class="form-group row">
                                        <label for="confirm-new-password" class=" col-md-2">Confirm new password</label>
                                        <input class="form-control col-md-10" type="password"
                                               name="confirm-new-password" id="confirm-new-password"
                                               placeholder="Confirm New Password">
                                    </div>
                                    <br>
                                    <div class="form-group row">
                                        <input type="button" class="btn btn-warning" value="Update"
                                               onclick="clickUpdatePassword()"> &nbsp;
                                        <input type="reset" class="btn btn-success" value="Reset">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="setting" class="tab-pane fade" style="padding: 20px">
                    <h3>Setting</h3>

                </div>
            </div>
        </div>
    </div>
</div>

<script>

    const clickSaveInfo = () => {
        let data = {};
        data["fullName"] = $('#fullName').val();
        data["address"] = $('#address').val();
        data["email"] = $('#email').val();
        data["phone"] = $('#phone').val();
        data["id"] = ${USERMODEL.id};
        $.ajax({
            url: '${APIAccountInfo}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: (result) => {
                alert("Successfully updated personal information.");
            },
            error: (error) => {
                alert("Update of personal information failed.");
            }
        });
    }

    const clickUpdatePassword = () => {
        if ($('#confirm-new-password').val() != $('#new-password').val()) {
            alert("Password does not match.");
            return;
        }
        let data = {};
        data["password"] = $('#old-password').val();
        data["newPassword"] = $('#new-password').val();
        data["id"] = ${USERMODEL.id};
        $.ajax({
            url: '${APIAccountPassword}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: (result) => {
                if (result) {
                    alert("Successfully updated password.");
                    window.location = '${UrlLogout}';
                } else
                    alert("Your old password is incorrect.");
            },
            error: (error) => {
                alert("Update of password failed.");
            }
        });
    }

</script>
</body>
</html>
