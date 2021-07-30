<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><dec:title default="Trang chủ"/> | New Fashion</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href='<c:url value="/assets/web/css/bootstrap.min.css"/>' type="text/css"/>
    <link rel="stylesheet" href='<c:url value="/assets/web/css/font-awesome.min.css"/>' type="text/css"/>
    <link rel="stylesheet" href='<c:url value="/assets/web/css/themify-icons.css"/>' type="text/css"/>
    <link rel="stylesheet" href='<c:url value="/assets/web/css/elegant-icons.css"/>' type="text/css"/>
    <link rel="stylesheet" href='<c:url value="/assets/web/css/owl.carousel.min.css"/>' type="text/css"/>
    <link rel="stylesheet" href='<c:url value="/assets/web/css/nice-select.css"/>' type="text/css"/>
    <link rel="stylesheet" href='<c:url value="/assets/web/css/jquery-ui.min.css"/>' type="text/css"/>
    <link rel="stylesheet" href='<c:url value="/assets/web/css/slicknav.min.css"/>' type="text/css"/>
    <link rel="stylesheet" href='<c:url value="/assets/web/css/style.css"/>' type="text/css"/>
    <link rel="stylesheet" href='<c:url value="/assets/web/css/my-style.css"/>' type="text/css"/>

    <!--  phân trang  -->
    <script src='<c:url value="/assets/web/js/jquery-3.3.1.min.js"/>'></script>
    <script src='<c:url value="/assets/web/js/bootstrap.min.js"/>'></script>
    <script src="<c:url value='/assets/paging/jquery.twbsPagination.js'/>"></script>
    <script src="<c:url value='/assets/web/js/simple.money.format.js'/>"></script>
</head>
<body>
<%@include file="/common/web/header.jsp" %>

<dec:body/>

<%@include file="/common/web/footer.jsp" %>


<!-- Js Plugins -->
<script src='<c:url value="/assets/web/js/jquery-ui.min.js"/>'></script>
<script src='<c:url value="/assets/web/js/jquery.countdown.min.js"/>'></script>
<script src='<c:url value="/assets/web/js/jquery.nice-select.min.js"/>'></script>
<script src='<c:url value="/assets/web/js/jquery.zoom.min.js"/>'></script>
<script src='<c:url value="/assets/web/js/jquery.dd.min.js"/>'></script>
<script src='<c:url value="/assets/web/js/jquery.slicknav.js"/>'></script>
<script src='<c:url value="/assets/web/js/owl.carousel.min.js"/>'></script>
<script src='<c:url value="/assets/web/js/main.js"/>'></script>
<script>
    $('.money').simpleMoneyFormat();
</script>
</body>
</html>