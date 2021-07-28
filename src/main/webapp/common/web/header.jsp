<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>


<!-- Header Section Begin -->
<header class="header-section">
    <div class="header-top">
        <div class="container">
            <div class="ht-left">
                <div class="mail-service">
                    <i class=" fa fa-envelope"></i>
                    hello.world@gmail.com
                </div>
                <div class="phone-service">
                    <i class=" fa fa-phone"></i>
                    0999888776
                </div>
            </div>
            <div class="ht-right">

                <c:if test="${not empty USERMODEL}">


                    <div class="dropdown">
                        <a class="login-panel" href='#'><i class="fa fa-user-circle"></i> ${USERMODEL.fullName}</a>
                        <div class="dropdown-content">
                            <a href="#"><i class="fa fa-user"></i> Account</a>
                            <a href='<c:url value="/logout"/> '><i class="fa fa-sign-out"></i> Logout</a>
                        </div>
                    </div>

                </c:if>
                <c:if test="${empty USERMODEL}">
                    <a href='<c:url value="/login"/> ' class="login-panel"><i class="fa fa-user"></i>Login</a>

                </c:if>

            </div>
        </div>
    </div>
    <div class="container">
        <div class="inner-header">
            <div class="row">
                <div class="col-lg-2 col-md-2">
                    <div class="logo">
                        <a href='<c:url value="/home"/> '>
                            <img src='<c:url value="/assets/web/img/logo.png"/>' alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-7 col-md-7">
                    <div class="advanced-search">
                        <button type="button" class="category-btn">All Categories</button>

                        <div class="input-group">
                            <input type="text" placeholder="Search product">
                            <button type="button"><i class="ti-search"></i></button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 text-right col-md-3">
                    <ul class="nav-right">

                        <li class="cart-icon">

                            <c:if test="${not empty USERMODEL}">
                                <a href="#">
                                    <i class="fa fa-cart-plus"></i>
                                    <span>3</span>
                                </a>
                            </c:if>
                            <c:if test="${empty USERMODEL}">
                                <a href="#" onclick="clickCart()">
                                    <i class="fa fa-cart-plus"></i>
                                </a>
                                <script>
                                    const clickCart = ()=>{
                                        alert('You are not logged in!');
                                    }

                                </script>
                            </c:if>
                        </li>
                        <%--<li class="cart-price">$150.00</li>--%>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="nav-item">
        <div class="container">
            <div class="nav-depart">
                <div class="depart-btn">
                    <i class="ti-menu"></i>
                    <span>All Categories</span>
                    <ul class="depart-hover">
                        <c:forEach var="category" items="${productCategoryModel.listResult}">
                            <li><a href="#">${category.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <nav class="nav-menu mobile-menu">
                <ul>
                    <li class="${checkMenuHeader == "HOME"?"active":""}"><a href='<c:url value="/home"/>'>Home</a></li>
                    <li class="${checkMenuHeader == "SHOP"?"active":""}"><a
                            href='<c:url value="/shop?page=1"/>'>Shop</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="#">consultants</a></li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
        </div>
    </div>
</header>
<!-- Header End -->