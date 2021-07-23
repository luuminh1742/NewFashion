<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý sản phẩm | Admin New Fashion</title>

</head>
<body>
<div class="header">
    <h1 class="page-header">Quản lý sản phẩm</h1>
    <ol class="breadcrumb">
        <li><a href="#">Trang chủ</a></li>
        <li><a href="#">Quản lý sản phẩm</a></li>
        <c:choose>
            <c:when test="${model.id != null}">
                <li><a href="#">Chỉnh sửa sản phẩm</a></li>
            </c:when>

            <c:otherwise>
                <li><a href="#">Thêm mới sản phẩm</a></li>
            </c:otherwise>
        </c:choose>

    </ol>

</div>
<div id="page-inner">

    <!-- /. ROW  -->

    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div style="display: flex;justify-content: space-between;">
                        <div style="display: flex;">
                            <a style="padding: 8px 10px;" title="Trở lại"
                               href='<c:url value="/admin/product?type=list"/>'>
                                <i class="fa fa-long-arrow-left" style="font-size: 25px"></i>
                            </a>
                            <c:choose>
                                <c:when test="${model.id != null}">
                                    <h3>Chỉnh sửa sản phẩm</h3>
                                </c:when>
                                <c:otherwise>
                                    <h3>Thêm sản phẩm</h3>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <input type="button" class="btn btn-primary" value="Lưu sản phẩm"
                        onclick="clickSaveProduct()">
                    </div>

                </div>
                <hr/>
                <div class="panel-body">
                    <form id="formSubmit">
                        <div class="form-group row">
                            <label class="col-md-2" for="categoryId">Danh mục sản phẩm</label>
                            <div class="col-md-10">
                                <select class="form-control" id="categoryId">
                                    <option value="0" ${model.id == null?"selected":""}>----- Chọn danh mục sản phẩm -----</option>
                                    <c:forEach var="item" items="${productCategoryModel.listResult}">
                                        <option value="${item.id}" ${model.id == null?"" : model.categoryId == item.id ? "selected":""}>${item.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="form-group row">
                            <label class="col-md-2" for="status">Trạng thái</label>
                            <div class="col-md-10" type="text">
                                <input id="status" name="status" type="checkbox"
                                       class="" ${model.status?"checked":""}
                                onclick="changeStatus()">
                                <label for="status" id="lableStatus"> ${model.status?"Hiển thị":"Ẩn"}</label>

                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2" for="name">Tên sản phẩm</label>
                            <div class="col-md-10" type="text">
                                <input id="name" name="name" placeholder="Tên sản phẩm"
                                       class="form-control" value="${model.name}">
                            </div>
                        </div>


                        <div class="form-group row">
                            <label class="col-md-2" for="price">Giá (VNĐ)</label>
                            <div class="col-md-10">
                                <input id="price" name="price" placeholder="Giá sản phẩm"
                                       class="form-control" type="number"  value="${model.price}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2" for="discount">Giảm giá (%)</label>
                            <div class="col-md-10">
                                <input id="discount" name="discount" placeholder="Giảm giá ? %"
                                       class="form-control" type="number"  value="${model.discount}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2" for="quantity">Lượng có</label>
                            <div class="col-md-10">
                                <input id="quantity" name="quantity" placeholder="Số lượng sản phẩm hiện có"
                                       class="form-control" type="number" value="${model.quantity}">
                            </div>
                        </div>
                     

                        <div class="form-group row">
                            <label class="col-md-2" for="productDetail">Chi tiết sản phẩm</label>
                            <div class="col-md-10">
									<textarea id="productDetail" name="productDetail" placeholder="Chi tiết sản phẩm"
                                              class="form-control">${model.productDetail}</textarea>
                            </div>
                        </div>
                        <input hidden id="id" name="id" value="${model.id}">
                    </form>

                </div>
            </div>
        </div>
    	<div class="col-md-4">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<div style="display: flex;justify-content: space-between;">
                        <div style="display: flex;">
                            <h3>Ảnh sản phẩm</h3>
                        </div>
                        <input type="button" class="btn btn-primary" value="Thêm ảnh" 
                        data-toggle="modal" data-target="#uploadImageModal" 
                        onclick="openModal()"
                        <c:if test="${model.id == null}">disabled</c:if>
                          >
                    </div>
    			</div>
    			<hr/>
    			<div class="panel-body">
                        <div class="row">
							<c:forEach var="image" items="${model.productImages}">
								<img title="${image.name}" src='<c:url value="/fileupload/images/${image.name}"/>' 
									style="width: 100%; padding:20px;"
									data-toggle="modal" data-target="#uploadImageModal" 
									 onclick="clickUpdateImageProduct(${image.id},'${image.name}')"
								>
							</c:forEach>
                            
                        </div>
                     
    			</div>
    		</div>
    	</div>
    </div>
    <!-- /. ROW  -->

    <%@include file="/common/admin/footer.jsp" %>
</div>

<!-- Modal -->
<div class="modal fade" id="uploadImageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">
        Thêm ảnh sản phẩm
        </h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <input id="images" name="images" type="file" onchange="readURL(this);"
                                       class="form-control" accept="image/*" >
                                       <br>
          <div class="form-group row">
                 <div class="col-md-12" id="view-images">
 					<img id="blah" src="http://placehold.it/220x132" alt="your image"
                             style="border: 0.1px solid black;width: inherit;"/>
                 </div>
             </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal()">Hủy</button>
        <button type="button" class="btn btn-primary" onclick="clickSaveImage()">Lưu thay đổi</button>
        <button id="btnDeleteImageProduct" type="button" class="btn btn-danger">Xóa ảnh</button>
      </div>
    </div>
  </div>
</div>

<%@include file="/assets/admin/myjs/edit-produt-js.jsp" %>

</body>
</html>