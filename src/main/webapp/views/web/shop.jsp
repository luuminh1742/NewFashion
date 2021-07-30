<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="APICart" value="/api/cart"/>
<html>
<head>
    <title>Shop</title>
</head>
<body>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href='<c:url value="/home"/> '><i class="fa fa-home"></i> Home</a>
                    <c:choose>
                        <c:when test="${categoryId == 0}">
                            <span>Shop</span>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="category" items="${productCategoryModel.listResult}">
                                <c:if test="${category.id == categoryId}">
                                    <a href='<c:url value="/shop?category-id=0&page=1"/> '> Shop</a>
                                    <span>
                                            ${category.name}
                                    </span>
                                </c:if>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Product Shop Section Begin -->
<section class="product-shop spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                <div class="filter-widget">
                    <h4 class="fw-title">Categories</h4>
                    <ul class="filter-catagories">
                        <c:forEach var="category" items="${productCategoryModel.listResult}">
                            <li>
                                <a class="category-name <c:if test="${categoryId != 0 && categoryId == category.id}">active-category</c:if>"
                                   href='<c:url value="/shop?category-id=${category.id}&page=1"/> '>
                                        ${category.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="filter-widget">
                    <h4 class="fw-title">Brand</h4>
                    <div class="fw-brand-check">
                        <div class="bc-item">
                            <label for="bc-calvin">
                                Calvin Klein
                                <input type="checkbox" id="bc-calvin">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="bc-item">
                            <label for="bc-diesel">
                                Diesel
                                <input type="checkbox" id="bc-diesel">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="bc-item">
                            <label for="bc-polo">
                                Polo
                                <input type="checkbox" id="bc-polo">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="bc-item">
                            <label for="bc-tommy">
                                Tommy Hilfiger
                                <input type="checkbox" id="bc-tommy">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="filter-widget">
                    <h4 class="fw-title">Price</h4>
                    <div class="filter-range-wrap">
                        <div class="range-slider">
                            <div class="price-input">
                                <input type="text" id="minamount">
                                <input type="text" id="maxamount">
                            </div>
                        </div>
                        <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                             data-min="33" data-max="98">
                            <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                            <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                            <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                        </div>
                    </div>
                    <a href="#" class="filter-btn">Filter</a>
                </div>
                <div class="filter-widget">
                    <h4 class="fw-title">Color</h4>
                    <div class="fw-color-choose">
                        <div class="cs-item">
                            <input type="radio" id="cs-black">
                            <label class="cs-black" for="cs-black">Black</label>
                        </div>
                        <div class="cs-item">
                            <input type="radio" id="cs-violet">
                            <label class="cs-violet" for="cs-violet">Violet</label>
                        </div>
                        <div class="cs-item">
                            <input type="radio" id="cs-blue">
                            <label class="cs-blue" for="cs-blue">Blue</label>
                        </div>
                        <div class="cs-item">
                            <input type="radio" id="cs-yellow">
                            <label class="cs-yellow" for="cs-yellow">Yellow</label>
                        </div>
                        <div class="cs-item">
                            <input type="radio" id="cs-red">
                            <label class="cs-red" for="cs-red">Red</label>
                        </div>
                        <div class="cs-item">
                            <input type="radio" id="cs-green">
                            <label class="cs-green" for="cs-green">Green</label>
                        </div>
                    </div>
                </div>
                <div class="filter-widget">
                    <h4 class="fw-title">Size</h4>
                    <div class="fw-size-choose">
                        <div class="sc-item">
                            <input type="radio" id="s-size">
                            <label for="s-size">s</label>
                        </div>
                        <div class="sc-item">
                            <input type="radio" id="m-size">
                            <label for="m-size">m</label>
                        </div>
                        <div class="sc-item">
                            <input type="radio" id="l-size">
                            <label for="l-size">l</label>
                        </div>
                        <div class="sc-item">
                            <input type="radio" id="xs-size">
                            <label for="xs-size">xs</label>
                        </div>
                    </div>
                </div>
                <div class="filter-widget">
                    <h4 class="fw-title">Tags</h4>
                    <div class="fw-tags">
                        <a href="#">Towel</a>
                        <a href="#">Shoes</a>
                        <a href="#">Coat</a>
                        <a href="#">Dresses</a>
                        <a href="#">Trousers</a>
                        <a href="#">Men's hats</a>
                        <a href="#">Backpack</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 order-1 order-lg-2">
                <div class="product-show-option">
                    <div class="row">
                        <div class="col-lg-7 col-md-7">
                            <div class="select-option">
                                <select class="sorting">
                                    <option value="">Default Sorting</option>
                                </select>
                                <select class="p-show">
                                    <option value="">Show:</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="product-list">
                    <div class="row">
                        <c:forEach var="product" items="${productModel.listResult}">
                            <div class="col-lg-4 col-sm-6 mb-4">
                                <div class="product-item border border-light p-2 h-100">
                                    <div class="pi-pic">
                                        <img src='<c:url value="/fileupload/images/${product.image}"/>' height="280"
                                             alt="">
                                        <div class="sale pp-sale">Sale</div>
                                        <div class="icon">
                                            <i class="icon_heart_alt"></i>
                                        </div>
                                        <ul>
                                            <c:if test="${not empty USERMODEL}">
                                                <li class="w-icon active"><a
                                                        onclick="clickAddCart(${product.id},${USERMODEL.id})"><i
                                                        class="fa fa-cart-plus"></i></a></li>
                                                <script>
                                                    const clickAddCart = (product_id, account_id) => {
                                                        let data = {};
                                                        data["productId"] = product_id;
                                                        data["accountId"] = account_id;
                                                        data["quantity"] = 1;
                                                        $.ajax({
                                                            url: '${APICart}',
                                                            type: 'POST',
                                                            contentType: 'application/json',
                                                            data: JSON.stringify(data),
                                                            dataType: 'json',
                                                            success: function (result) {
                                                                alert("Added to cart");
                                                            },
                                                            error: function (error) {
                                                                alert("Add to cart failure");
                                                            }
                                                        });
                                                    }

                                                </script>
                                            </c:if>
                                            <c:if test="${empty USERMODEL}">
                                                <li class="w-icon active"><a href="" onclick="clickAddCart()"><i
                                                        class="fa fa-cart-plus"></i></a></li>
                                                <script>
                                                    const clickAddCart = () => {
                                                        alert('You are not logged in!');
                                                    }

                                                </script>
                                            </c:if>
                                            <li class="quick-view"><a href="#">+ Quick View</a></li>
                                            <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="pi-text">
                                            <%--<div class="catagory-name">Towel</div>--%>
                                        <a class="pb-3" href='<c:url value="/product?id=${product.id}"/>'>
                                            <h5 class="product-name">${product.name}</h5>
                                        </a>
                                        <div style="color: #e7ab3c;font-size: 20px;font-weight: 700;width: 100%;position: absolute;bottom: 0px;left: 0px">
                                            <span class="money">${product.price}</span> VNĐ
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>

                </div>
                <form action="<c:url value='/shop'/>" id="formSubmit" method="get" style="margin: 25px auto;display: flex;justify-content: center;">
                    <ul class="pagination" id="pagination"></ul>
                    <input type="hidden" value="${categoryId}" id="category-id" name="category-id">
                    <input type="hidden" value="" id="page" name="page">
                </form>

            </div>
        </div>
    </div>
</section>
<!-- Product Shop Section End -->

<script>
    let totalPages = ${ productModel.totalPage };
    let currentPage = ${ productModel.page };
    let categoryId = $('#category-id').val();
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 5,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#category-id').val(categoryId);
                    $('#page').val(page);
                    $('#formSubmit').submit();
                }
            }
        });
    });

</script>
</body>
</html>
