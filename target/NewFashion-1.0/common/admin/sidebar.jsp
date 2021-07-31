<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<nav class="navbar-default navbar-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">

            <li>
                <a class='${menuSidebar == "home" ?"active-menu":""}' href='<c:url value = "/admin/home"/>'><i class="fa fa-dashboard"></i> Dashboard</a>
            </li>
            <li>
                <a class='${menuSidebar == "product-category" ?"active-menu":""}' href='<c:url value = "/admin/product-category"/>'><i class="fa fa-leanpub"></i> Quản lý danh mục</a>
            </li>
            <li>
                <a class='${menuSidebar == "product" ?"active-menu":""}' href='<c:url value = "/admin/product?type=list&page=1"/>'><i class="fa fa-snowflake-o"></i> Quản lý Sản phẩm</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-money"></i> Quản lý hóa đơn</a>
            </li>
            
            <li>
                <a href="#"><i class="fa fa-user"></i> Quản lý tài khoản</a>
            </li>
            
        </ul>

    </div>

</nav>