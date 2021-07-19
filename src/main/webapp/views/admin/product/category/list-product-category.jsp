<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIProductCategory" value="/api/product-category/edit"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý danh mục | Admin New Fashion</title>
</head>
<body>
	<div class="header">
		<h1 class="page-header">Quản lý danh mục</h1>
		<ol class="breadcrumb">
			<li><a href="#">Trang chủ</a></li>
			<li><a class="active" href="#">Quản lý danh mục</a></li>
		</ol>

	</div>
	<div id="page-inner">

		<!-- /. ROW  -->

		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div style="display: flex; justify-content: space-between;">
							<h3>Danh mục sản phẩm</h3>
							<button class="btn btn-primary btn-lg" data-toggle="modal"
								data-target="#myModal" onclick="clickAddNewProductCategory()">
								<i class="fa fa-plus-circle" class="text-light" style="size: 25px"></i>
								Thêm mới danh mục
							</button>
						</div>
						
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th># STT</th>
										<th>Tên danh mục</th>
										<th>Thao tác</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="countItem" value="${1}" />
									<c:forEach varStatus="loop" var="item"
										items="${model.listResult}">
										<tr>
											<td>${loop.index+1}</td>
											<td>${item.name}</td>
											<td>
												<button title="Chỉnh sửa danh mục"
													class="btn btn-warning btn-circle" data-toggle="modal"
													data-target="#myModal"
													onclick="clickEditProductCategory(${item.id},'${item.name}')">
													<i class="fa fa-pencil"></i>
												</button>

												<button title="Xóa danh mục"
													class="btn btn-danger btn-circle"
													onclick="clickDeleteProductCategory(${item.id})">
													<i class="fa fa-trash-o"></i>
												</button>
												
												<button title="Xem sản phẩm"
													class="btn btn-info btn-circle">
													<i class="fa fa-arrow-right"></i>
												</button>
												
											</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /. ROW  -->


		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel"></h4>
					</div>
					<div class="modal-body">
						<input id="id-edit" type="hidden"/>
						<textarea id="category-name" class="form-control" rows="5" cols=""
							placeholder="Nhập tên danh mục sản phẩm mới ..."></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
						>
							Hủy</button>
						<button type="button" class="btn btn-primary" onclick="clickSave()">Lưu thay
							đổi</button>
					</div>
				</div>
			</div>
		</div>

		<%@include file="/common/admin/footer.jsp"%>
	</div>
	<script type="text/javascript">
	
		function clickAddNewProductCategory(){
			$('#myModalLabel').text('Thêm mới danh mục sản phẩm');
			$('#category-name').val('');
			$('#id-edit').val('');
		}
		function clickEditProductCategory(id,name){
			$('#myModalLabel').text('Chỉnh sửa danh mục sản phẩm');
			$('#category-name').val(name);
			$('#id-edit').val(id);
		}
		function clickDeleteProductCategory(id){
			var confirmDelete = confirm("Xác nhận xóa danh mục này");
			if (confirmDelete) {
				var data = {};
				data['id'] = id;
				$.ajax({
					url: '${APIProductCategory}',
					type: 'DELETE',
					contentType: 'application/json',
					data: JSON.stringify(data),
					dataType: 'json',
					success: function (result) {
						alert("Xóa thành công");
						location.reload();
					},
					error: function (error) {
						alert("Xóa thất bại");
					}
				});
			}
		}
		
		function clickSave(){
			var data = {};
			data['id'] = $('#id-edit').val();
			data['name'] = $('#category-name').val();
			
			if(data['id'] == ''){
				addProductCategory(data);
			}else{
				editProductCategory(data);
			}
		}
		
		function addProductCategory(data){
			$.ajax({
				url: '${APIProductCategory}',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function (result) {
					alert("Thêm thành công");
					location.reload();
				},
				error: function (error) {
					alert("Thêm thất bại");
				}
			});
		}
		function editProductCategory(data){
			$.ajax({
				url: '${APIProductCategory}',
				type: 'PUT',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function (result) {
					alert("Cập nhật thành công");
					location.reload();
				},
				error: function (error) {
					alert("Cập nhật thất bại");
				}
			});
		}
		
	</script>
</body>
</html>