<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIProduct" value="/api/product/edit"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Management | Admin New Fashion</title>
</head>
<body>
	<div class="header">
		<div class="page-header" style="display: flex;justify-content: space-between;">
			<h1>Product Management</h1>
			<div class="form-outline">
				<input type="search" id="form1" class="form-control" placeholder="Search product"
					   aria-label="Search" style="margin: 5px 0px;"/>
			</div>
		</div>

		<ol class="breadcrumb">
			<li><a href="#">Home</a></li>
			<li><a href="active">Product Management</a></li>
		</ol>

	</div>
	<div id="page-inner">

		<!-- /. ROW  -->

		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div style="display: flex; justify-content: space-between;">
							<h3>List of products</h3>
							<a class="btn btn-primary btn-lg"
							href='<c:url value="/admin/product?type=edit"/>'>
								<i class="fa fa-plus-circle" class="text-light" style="size: 25px"></i>
								Thêm sản phẩm
							</a>
						</div>

					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Tên danh sản phẩm</th>
										<th>Ảnh đại diện</th>
										<th>Giá</th>
										<th>Giảm giá</th>
										<th>Số lượng có</th>
										<th>Ngày tạo</th>
										<th>Người tạo</th>
										<th>Ngày cập nhật</th>
										<th>Người cập nhật</th>
										<th>Trạng thái</th>
										<th>Thao tác</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="countItem" value="${1}" />
									<c:forEach var="item"
										items="${model.listResult}">
										<tr>
											<td>${item.name}</td>
											<td>
												<img alt="Ảnh sản phẩm"
												 src='<c:url value="/fileupload/images/${item.image}"/>'
												 class="img-thumbnail" width="150"
												/>
											</td>
											<td>${item.price} VNĐ</td>
											<td>${item.discount} %</td>
											<td>${item.quantity}</td>
											<td>${item.createdDate}</td>
											<td>${item.createdBy}</td>
											<td>${item.modifiedDate}</td>
											<td>${item.modifiedBy}</td>
											<td>
												
												<c:choose>
										            <c:when test="${item.status == true}">
										                <span class="text-success font-weight-bold">Hiển thị</span> 
										            </c:when>
										
										            <c:otherwise>
										                <span class="text-danger font-weight-bold">Ẩn</span> 
										            </c:otherwise>
										        </c:choose>
											</td>
											<td>
												<a title="Chỉnh sửa sản phẩm" style="margin:auto 5px;"
													href='<c:url value="/admin/product?type=edit&&id=${item.id}"/>'
												>	
													<i class="fa fa-pencil" style="font-size:28px;color:#ff8100;"></i>
												</a>

												<a title="Xóa sản phẩm" style="margin:auto 5px;"
												onclick="clickDeleteProduct(${item.id})"
												>
													<i class="fa fa-trash-o" style="font-size:28px;color:#ff0500;"></i>
												</a>
												
												
											</td>
										</tr>
									</c:forEach>

								</tbody>
								
								
							</table>

							<form action="<c:url value='/admin/product'/>" id="formSubmit" method="get">
								<ul class="pagination" id="pagination"></ul>
								<input type="hidden" value="" id="type" name="type" />
								<input type="hidden" value="" id="page" name="page">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /. ROW  -->

		<%@include file="/common/admin/footer.jsp"%>
	</div>
<script type="text/javascript">


	var totalPages = ${ model.totalPage };
	var currentPage = ${ model.page };
	$(function () {
		window.pagObj = $('#pagination').twbsPagination({
			totalPages: totalPages,
			visiblePages: 5,
			startPage: currentPage,
			onPageClick: function (event, page) {
				if (currentPage != page) {
					$('#type').val('list');
					$('#page').val(page);
					$('#formSubmit').submit();
				}
			}
		});
	});


function clickDeleteProduct(id){
	let confirmDelete = confirm("Confirm deletion of this product?");
	if (confirmDelete) {
		var data = {};
		data['id'] = id;
		$.ajax({
			url: '${APIProduct}',
			type: 'DELETE',
			contentType: 'application/json',
			data: JSON.stringify(data),
			dataType: 'json',
			success: function (result) {
				alert("Delete successfully.");
				location.reload();
			},
			error: function (error) {
				alert("Delete failed.");
			}
		});
	}
}
</script>
</body>
</html>