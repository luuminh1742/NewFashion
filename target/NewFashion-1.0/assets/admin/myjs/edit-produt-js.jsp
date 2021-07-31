<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIProduct" value="/api/product/edit"/>
<c:url var="APIProductImage" value="/api/product-image/edit"/>
<c:url var="EditProductUrl" value="/admin/product?type=edit&&id="/>
<script>

var editor = '';
$(document).ready(function () {
    editor = CKEDITOR.replace('productDetail');
    /* CKFinder.setupCKEditor(editor, '/ckfinder/') */
});

$('#btnDeleteImageProduct').hide();

var imageProduct = {
		id:null,
		name:"",
		base64:"",
		productId:-1
}

function openModal(){
	$('#images').val('');
	$('#blah').attr('src', 'http://placehold.it/220x132');
	$('#btnDeleteImageProduct').hide();
}
function closeModal(){
	
}
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	imageProduct.name = input.files[0].name;
        	imageProduct.base64 = e.target.result;
        	imageProduct.productId = $('#id').val()
        	$('#blah').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}


function clickSaveImage(){
	
	if(imageProduct.name == ""){
		alert("Bạn chưa chọn ảnh");
		return;
	}
	
	$.ajax({
        url: '${APIProductImage}',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(imageProduct),
        dataType: 'json',
        success: function (result) {
            alert("Lưu ảnh thành công");
            location.reload();
        },
        error: function (error) {
            alert("Lưu ảnh thất bại");
        }
    });
}


function clickUpdateImageProduct(id,name){
	$('#btnDeleteImageProduct').show();
	imageProduct.id = id;
	imageProduct.name = name;
	$('#blah').attr('src', '<c:url value="/fileupload/images/'+name+'"/>');
}

$('#btnDeleteImageProduct').click(()=>{
	var confirmDelete = confirm("Xác nhận xóa ảnh này?");
	if (confirmDelete) {
		
		$.ajax({
            url: '${APIProductImage}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(imageProduct),
            dataType: 'json',
            success: function (result) {
                alert("Xóa ảnh thành công");
                location.reload();
            },
            error: function (error) {
                alert("Xóa ảnh thất bại");
            }
        });
		
	}
});

function changeStatus (){
    if($('#status').is(":checked")){
        $('#lableStatus').text("Hiển thị");
    }else{
        $('#lableStatus').text("Ẩn");
    }
}



var listImage = [];

function clickSaveProduct(){
    //event.preventDefault();

    var data = {};
    var formData = $('#formSubmit').serializeArray();
    $.each(formData, function (i, v) {
        data["" + v.name + ""] = v.value;
    });
    data["categoryId"] = $('#categoryId').val();
    data["status"] = $('#status').is(":checked");
    data["productDetail"] = editor.getData();
    //var fileList = $('#images').prop("files");
    data["productImages"] = listImage;
    if(data["id"] == ""){
        addProduct(data);
    }else{
    	updateProduct(data);
    }
}

function addProduct(data){
    $.ajax({
        url: '${APIProduct}',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (result) {
            alert("Thêm sản phẩm thành công");
            //location.reload();
            window.location = '${EditProductUrl}'+result["id"];
        },
        error: function (error) {
            alert("Thêm sản phẩm thất bại");
        }
    });
}
function updateProduct(data){
    $.ajax({
        url: '${APIProduct}',
        type: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (result) {
            alert("Cập nhật sản phẩm thành công");
            location.reload();
        },
        error: function (error) {
            alert("Cập nhật sản phẩm thất bại");
        }
    });
}
</script>