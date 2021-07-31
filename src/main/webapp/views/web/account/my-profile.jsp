<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIAccountInfo" value="/api/account?action=info"/>
<c:url var="APIAccountPassword" value="/api/account?action=password"/>
<c:url var="UrlLogout" value="/logout"/>

<h4 class="font-weight-bold">Update personal information</h4>
<br>
<div class="row">
    <div class="col-md-12">
        <div class="form-group row">
            <label for="username" class="label col-md-2">Username</label>
            <input class="form-control col-md-10"
                   name="username" id="username"
                   placeholder="Username"
                   value="${accountModel.username}" disabled>
        </div>
        <div class="form-group row">
            <label for="fullName" class="label col-md-2">Full name</label>
            <input class="form-control col-md-10"
                   name="fullName" id="fullName"
                   placeholder="Full name"
                   value="${accountModel.fullName}">
        </div>
        <div class="form-group row">
            <label for="address" class="label col-md-2">Address</label>
            <input class="form-control col-md-10"
                   name="address" id="address"
                   placeholder="Address"
                   value="${accountModel.address}">
        </div>
        <div class="form-group row">
            <label for="email" class="label col-md-2">Email</label>
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
            <input type="button" class="btn btn-warning" value="Save info" onclick="clickSaveInfo()">
        </div>
    </div>

</div>

<hr>

<h4 class="font-weight-bold">Update password</h4>
<br>
<div class="row">
    <div class="col-md-12">
        <form>

            <div class="form-group row">
                <label for="username" class="label col-md-2">Old password</label>
                <input class="form-control col-md-10" type="password"
                       name="old-password" id="old-password"
                       placeholder="Old Password">
            </div>
            <div class="form-group row">
                <label for="username" class="label col-md-2">New password</label>
                <input class="form-control col-md-10" type="password"
                       name="new-password" id="new-password"
                       placeholder="New Password">
            </div>
            <div class="form-group row">
                <label for="username" class="label col-md-2">Confirm new password</label>
                <input class="form-control col-md-10" type="password"
                       name="confirm-new-password" id="confirm-new-password"
                       placeholder="Confirm New Password">
            </div>
            <br>
            <div class="form-group row">
                <input type="button" class="btn btn-warning" value="Update" onclick="clickUpdatePassword()"> &nbsp;
                <input type="reset" class="btn btn-success" value="Reset">
            </div>
        </form>
    </div>
</div>
<br>


<script>
	
	const clickSaveInfo = ()=>{
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
	
	const clickUpdatePassword = ()=>{
		if($('#confirm-new-password').val() != $('#new-password').val()){
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
            	if(result){
                	alert("Successfully updated password.");
                	window.location = '${UrlLogout}';
            	}
            	else
            		alert("Your old password is incorrect.");
            },
            error: (error) => {
                alert("Update of password failed.");
            }
        });
	}

</script>