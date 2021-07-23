<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><dec:title default="Trang chủ" /></title>
<!-- Bootstrap Styles-->
<link href='<c:url value="/assets/admin/css/bootstrap.css"/>'
	rel="stylesheet" />
<%-- <!-- FontAwesome Styles-->
<link href='<c:url value="/assets/admin/css/font-awesome.css"/>'
	rel="stylesheet" /> --%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Morris Chart Styles-->
<link
	href='<c:url value="/assets/admin/js/morris/morris-0.4.3.min.css"/>'
	rel="stylesheet" />
<!-- Custom Styles-->
<link href='<c:url value="/assets/admin/css/custom-styles.css"/>'
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href='<c:url value="/assets/admin/js/Lightweight-Chart/cssCharts.css"/>'>
<!-- jQuery Js -->
<script src='<c:url value="/assets/admin/js/jquery-1.10.2.js"/>'></script>
<script
	src='<c:url value="/assets/admin/plugins/ckeditor/ckeditor.js"/>'></script>
</head>
<body>
	<div id="wrapper">
		<%@include file="/common/admin/header.jsp"%>
		<%@include file="/common/admin/sidebar.jsp"%>
		<div id="page-wrapper">
			<dec:body />
		</div>

	</div>

	<!-- JS Scripts-->

	<!-- Bootstrap Js -->
	<script src='<c:url value="/assets/admin/js/bootstrap.min.js"/>'></script>

	<!-- Metis Menu Js -->
	<script src='<c:url value="/assets/admin/js/jquery.metisMenu.js"/>'></script>
	<!-- Morris Chart Js -->
	<script
		src='<c:url value="/assets/admin/js/morris/raphael-2.1.0.min.js"/>'></script>
	<script src='<c:url value="/assets/admin/js/morris/morris.js"/>'></script>


	<script src='<c:url value="/assets/admin/js/easypiechart.js"/>'></script>
	<script src="assets/js/easypiechart-data.js"></script>

	<script
		src='<c:url value="/assets/admin/js/Lightweight-Chart/jquery.chart.js"/>'></script>

	<!-- Custom Js -->
	<script src='<c:url value="/assets/admin/js/custom-scripts.js"/>'></script>


	<!-- Chart Js -->
	<script type="text/javascript"
		src='<c:url value="/assets/admin/js/Chart.min.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/assets/admin/js/chartjs.js"/>'></script>

</body>
</html>