<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Account</title>
</head>
<body>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href='<c:url value="/home"/>'><i class="fa fa-home"></i> Home</a>
                    <span>Account</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Form Section Begin -->

<!-- Register Section Begin -->
<div class="register-login-section spad">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h3 class="mb-3 font-weight-bold" style="color: #e7ab3c">${USERMODEL.fullName}</h3>
                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">

                    <a class="nav-link my-menu active" data-toggle="pill" href="#v-pills-profile" role="tab">
                        <i class="fa fa-user"></i> My Profile
                    </a>
                    <a class="nav-link my-menu" data-toggle="pill" href="#v-pills-messages" role="tab">
                        <i class="fa fa-bell-o"></i> Notifications
                    </a>
                    <a class="nav-link my-menu" data-toggle="pill" href="#v-pills-settings" role="tab">
                        <i class="fa fa-cog"></i> My Settings</a>
                    <a class="nav-link my-menu" data-toggle="pill" href="#v-pills-payment" role="tab">
                        <i class="fa fa-credit-card"></i> Payments
                    </a>
                </div>
            </div>
            <div class="col-md-9">
                <div class="tab-content" id="v-pills-tabContent">

                    <div class="tab-pane fade  show active" id="v-pills-profile" role="tabpanel"
                         aria-labelledby="v-pills-profile-tab">

                        <%@include file="/views/web/account/my-profile.jsp"%>

                    </div>
                    <div class="tab-pane fade" id="v-pills-messages" role="tabpanel"
                         aria-labelledby="v-pills-messages-tab">
                        <p>Notifications</p>
                    </div>
                    <div class="tab-pane fade" id="v-pills-settings" role="tabpanel"
                         aria-labelledby="v-pills-settings-tab">
                        <p>Setting</p>
                    </div>
                    <div class="tab-pane fade" id="v-pills-payment" role="tabpanel"
                         aria-labelledby="v-pills-settings-tab">
                        <p>Payment</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
