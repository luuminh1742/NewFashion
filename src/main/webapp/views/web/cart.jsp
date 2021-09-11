<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="APICart" value="/api/cart"/>
<html>
<head>
    <title>Shopping Cart</title>
</head>
<body>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href='<c:url value="/home"/> '><i class="fa fa-home"></i> Home</a>
                    <a href='<c:url value="/shop?page=1"/> '>Shop</a>
                    <span>Shopping Cart</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Shopping Cart Section Begin -->
<section class="shopping-cart spad">
    <div class="container">
        <div class="row">
            <c:if test="${cartModel.listResult.size() == 0}">
                <div style="flex:1">
                    <img src='<c:url value="/assets/web/img/cart-empty.jpg"/> '
                         style="display: block; margin-left: auto; margin-right: auto;"
                    >
                </div>
            </c:if>
            <c:if test="${cartModel.listResult.size() != 0}">
                <div class="col-lg-12">
                    <div class="cart-table">
                        <table>
                            <thead>
                            <tr>
                                <th>Image</th>
                                <th class="p-name">Product Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th><i class="ti-close"></i></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var = "subtotal" scope = "session" value = "${0}"/>
                            <c:forEach varStatus="loop" var="cart" items="${cartModel.listResult}">
                                <tr id="data_cart_${cart.productId}">
                                    <td class="cart-pic first-row"><img width="170" height="170" src='<c:url value="/fileupload/images/${cart.product.image}"/> ' alt=""></td>
                                    <td class="cart-title first-row">
                                        <h5>${cart.product.name}</h5>
                                    </td>
                                    <td class="p-price first-row"><span class="money">${cart.product.price}</span> VND</td>
                                    <td class="qua-col first-row">
                                        <div class="quantity">
                                            <input type="number" class="form-control"
                                                   value="${cart.quantity}" onclick="changeQuantity(this,${cart.accountId},${cart.productId})"
                                                   style="width: 75px; text-align: center;">
                                        </div>
                                    </td>
                                    <td class="total-price first-row" id="total_price_${cart.productId}"><span class="money">${cart.product.price * cart.quantity}</span> VND</td>
                                    <td class="close-td first-row"><i class="ti-close" onclick="clickDeleteCartItem(${cart.accountId},${cart.productId})"></i></td>
                                </tr>
                                <input hidden value="${cart.product.price}" id="price_${cart.productId}">
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="cart-buttons">
                                <a href='<c:url value="/shop?category-id=0&page=1"/> ' class="primary-btn continue-shop">Continue shopping</a>

                            </div>
                        </div>
                        <div class="col-lg-4 offset-lg-4">
                            <div class="proceed-checkout">
                                <ul>
                                    <li class="subtotal">Subtotal <span>&nbsp VND</span> <span class="money">${cartModel.totalMoney}</span></li>
                                    <li class="subtotal">Ship <span>&nbsp VND</span> <span class="money">30000</span></li>
                                    <li class="cart-total">Total <span>&nbsp VND</span> <span class="money">${cartModel.totalMoney + 30000}</span> </li>
                                </ul>
                                <a href='<c:url value="/check-out"/> ' class="proceed-btn">PROCEED TO CHECK OUT</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>

        </div>
    </div>
</section>
<!-- Shopping Cart Section End -->

<script>


    const changeQuantity = (quantity,account_id,product_id)=>{
        let _quantity = Number($(quantity).val());
        let data = {};
        data["productId"] = product_id;
        data["accountId"] = account_id;
        data["quantity"] = _quantity;
        if(_quantity == 0){
            clickDeleteCartItem(account_id,product_id);
        }else{
            $.ajax({
                url: '${APICart}',
                type: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'json',
                success: (result) => {
                    $('#total_price_'+product_id).text(
                        Number($('#price_'+product_id).val()) * _quantity + ' VND'
                    );
                },
                error: (error) => {
                    alert("ERROR!");
                }
            });
        }
    }
    const clickDeleteCartItem = (account_id,product_id)=>{
        let data = {};
        data["productId"] = product_id;
        data["accountId"] = account_id;
        $.ajax({
            url: '${APICart}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: (result) => {
                alert("Product removed from cart.");
                $('#data_cart_'+product_id).remove();
            },
            error: (error) => {
                alert("Deleting the product from the cart failed.");
            }
        });
    }
</script>

</body>
</html>
