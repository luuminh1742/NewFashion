<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="APICart" value="/api/cart"/>
<html>
<head>
    <title>${productModel.name}</title>
</head>
<body>

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href='<c:url value="/home"/> '><i class="fa fa-home"></i> Home</a>
                    <a href='<c:url value="/shop"/> '>Shop</a>
                    <span>Detail</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Product Shop Section Begin -->
<section class="product-shop spad page-details">
    <div class="container">
        <div class="row">

            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="product-pic-zoom">
                            <img class="product-big-img"
                                 src='<c:url value="/fileupload/images/${productModel.productImages.get(0).name}"/> '
                                 alt="">
                            <div class="zoom-icon">
                                <i class="fa fa-search-plus"></i>
                            </div>
                        </div>
                        <div class="product-thumbs">
                            <div class="product-thumbs-track ps-slider owl-carousel">
                                <c:forEach var="image" items="${productModel.productImages}">
                                    <div class="pt active"
                                         data-imgbigurl='<c:url value="/fileupload/images/${image.name}"/> '>
                                        <img src='<c:url value="/fileupload/images/${image.name}"/>'
                                             style="height: 220px;width: 100%;" alt=""></div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="product-details">
                            <div class="pd-title">
                                <span>oranges</span>
                                <h3>${productModel.name}</h3>
                                <a href="#" class="heart-icon"><i class="icon_heart_alt"></i></a>
                            </div>
                            <div class="pd-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <span>(5)</span>
                            </div>
                            <div style="padding:20px 0px">
                                <h4 style="color: #e7ab3c; font-weight: 700;"><span
                                        class="money">${productModel.price}</span> VND</h4>
                            </div>
                            <%--<div class="pd-desc">
                                <h4><p class="money"></p> VND</h4>
                            </div>--%>

                            <div class="pd-size-choose">
                                <h6>Size</h6>
                                <div class="sc-item">
                                    <input type="radio" id="sm-size">
                                    <label for="sm-size">s</label>
                                </div>
                                <div class="sc-item">
                                    <input type="radio" id="md-size">
                                    <label for="md-size">m</label>
                                </div>
                                <div class="sc-item">
                                    <input type="radio" id="lg-size">
                                    <label for="lg-size">l</label>
                                </div>
                                <div class="sc-item">
                                    <input type="radio" id="xl-size">
                                    <label for="xl-size">xs</label>
                                </div>
                            </div>
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input id="quantity" type="text" value="1">
                                </div>
                                <c:if test="${not empty USERMODEL}">
                                    <a href="" class="primary-btn pd-cart"
                                       onclick="clickAddCart(${productModel.id},${USERMODEL.id})">Add To Cart</a>
                                    <script>
                                        const clickAddCart = (product_id, account_id) => {
                                            let data = {};
                                            data["productId"] = product_id;
                                            data["accountId"] = account_id;
                                            data["quantity"] = Number($('#quantity').val());
                                            if (data["quantity"] <= 0) {
                                                alert("Invalid product quantity!");
                                                return;
                                            }
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
                                    <a href="" class="primary-btn pd-cart" onclick="clickAddCart()">Add To Cart</a>
                                    <script>
                                        const clickAddCart = () => {
                                            alert('You are not logged in!');
                                        }

                                    </script>
                                </c:if>

                            </div>
                            <%--<ul class="pd-tags">
                                <li><span>CATEGORIES</span>: More Accessories, Wallets & Cases</li>
                                <li><span>TAGS</span>: Clothing, T-shirt, Woman</li>
                            </ul>
                            <div class="pd-share">
                                <div class="p-code">Sku : 00012</div>
                                <div class="pd-social">
                                    <a href="#"><i class="ti-facebook"></i></a>
                                    <a href="#"><i class="ti-twitter-alt"></i></a>
                                    <a href="#"><i class="ti-linkedin"></i></a>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
                <div class="product-tab">
                    <div class="tab-item">
                        <ul class="nav" role="tablist">
                            <li>
                                <a class="active" data-toggle="tab" href="#tab-1" role="tab">DESCRIPTION</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#tab-3" role="tab">Customer Reviews (02)</a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-item-content">
                        <div class="tab-content">
                            <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                                <div class="product-content">
                                    <div class="row">
                                        ${productModel.productDetail}
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab-3" role="tabpanel">
                                <div class="customer-review-option">
                                    <h4>2 Comments</h4>
                                    <div class="comment-option">
                                        <div class="co-item">
                                            <div class="avatar-pic">
                                                <img src='<c:url value="/assets/web/img/product-single/avatar-1.png"/>'
                                                     alt="">
                                            </div>
                                            <div class="avatar-text">
                                                <div class="at-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <h5>Brandon Kelley <span>27 Aug 2019</span></h5>
                                                <div class="at-reply">Nice !</div>
                                            </div>
                                        </div>
                                        <div class="co-item">
                                            <div class="avatar-pic">
                                                <img src='<c:url value="/assets/web/img/product-single/avatar-2.png"/>'
                                                     alt="">
                                            </div>
                                            <div class="avatar-text">
                                                <div class="at-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <h5>Roy Banks <span>27 Aug 2019</span></h5>
                                                <div class="at-reply">Nice !</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="personal-rating">
                                        <h6>Your Ratind</h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                    </div>
                                    <div class="leave-comment">
                                        <h4>Leave A Comment</h4>
                                        <form action="#" class="comment-form">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <input type="text" placeholder="Name">
                                                </div>
                                                <div class="col-lg-6">
                                                    <input type="text" placeholder="Email">
                                                </div>
                                                <div class="col-lg-12">
                                                    <textarea placeholder="Messages"></textarea>
                                                    <button type="submit" class="site-btn">Send message</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Shop Section End -->

<!-- Related Products Section End -->
<div class="related-products spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Related Products</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach var="item" items="${newProduct}">
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src='<c:url value="/fileupload/images/${item.image}"/>' alt="" height="280">
                            <div class="icon">
                                <i class="icon_heart_alt"></i>
                            </div>
                            <ul>
                                <li class="w-icon active"><a href="#"><i class="fa fa-cart-plus"></i></a></li>
                                <li class="quick-view"><a href="#">+ Quick View</a></li>
                                <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                                <%--<div class="catagory-name">Shoes</div>--%>
                            <a class="pb-3" href='<c:url value="/product?id=${item.id}"/>'>
                                <h5 class="product-name">${item.name}</h5>
                            </a>
                            <div style="color: #e7ab3c;font-size: 20px;font-weight: 700;width: 100%;position: absolute;bottom: 0px;left: 0px">
                                <span class="money">${item.price}</span> VNĐ
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- Related Products Section End -->

</body>
</html>
