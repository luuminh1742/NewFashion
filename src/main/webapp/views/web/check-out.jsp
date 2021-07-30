<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Check out</title>
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
                    <span>Check Out</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Shopping Cart Section Begin -->
<section class="checkout-section spad">
    <div class="container">
        <form action="#" class="checkout-form">
            <div class="row">
                <div class="col-lg-6">

                    <h4>Biiling Details</h4>
                    <div class="row">
                        <div class="col-lg-12">
                            <label for="fullname">Recipient's name <span>*</span></label>
                            <input type="text" id="fullname" value="${USERMODEL.fullName}">
                        </div>
                        <div class="col-lg-12">
                            <label for="address">Receiving address <span>*</span></label>
                            <input type="text" id="address" value="${USERMODEL.address}">
                        </div>
                        <div class="col-lg-6">
                            <label for="email">Email Address<span>*</span></label>
                            <input type="text" id="email" value="${USERMODEL.email}">
                        </div>
                        <div class="col-lg-6">
                            <label for="phone">Phone<span>*</span></label>
                            <input type="text" id="phone" value="${USERMODEL.phone}">
                        </div>
                        <div class="col-lg-12">
                            <div class="d-flex">
                                <input type="checkbox" style="width: 20px;height: 20px;margin-right: 10px" id="payment-online">
                                <label for="payment-online">Online payment</label>
                            </div>
                            <div class="d-flex">
                                <input type="checkbox" style="width: 20px;height: 20px;margin-right: 10px" id="payment-on-delivery">
                                <label for="payment-on-delivery">Payment on delivery</label>
                            </div>

                        </div>
                        <div class="col-lg-12">
                            <div class="order-btn">
                                <button type="submit" class="site-btn place-btn">Place Order</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="place-order">
                        <h4>Your Order</h4>
                        <div class="order-total">
                            <table class="order-table">
                                <thead>
                                <th>Product</th>
                                <th style="min-width: 125px;">Total</th>
                                </thead>
                                <tbody>
                                <c:forEach var="cart" items="${cartModel.listResult}">
                                    <tr class="mt-2">
                                        <td>
                                            <div class="d-flex">
                                                <img width="100" src='<c:url value="/fileupload/images/${cart.product.image}"/> '>
                                                <div class="p-3">
                                                    <a class="product-name text-dark" href='<c:url value="/product?id=${cart.productId}"/>'>
                                                            ${cart.product.name}
                                                    </a><br>
                                                    <span class="text-success">x ${cart.quantity}</span>
                                                </div>
                                            </div>

                                        </td>
                                        <td><span class="money">${cart.product.price * cart.quantity}</span> VND</td>
                                    </tr>
                                </c:forEach>


                                </tbody>
                            </table>
                            <%--<ul class="order-table">
                                <li>Product <span>Total</span></li>
                                <c:forEach var="cart" items="${cartModel.listResult}">
                                    <li class="fw-normal">${cart.product.name} x ${cart.quantity} <span>&nbsp VND</span><span class="money">${cart.product.price * cart.quantity}</span></li>
                                </c:forEach>
                                &lt;%&ndash;<li class="fw-normal">Combination x 1 <span>$60.00</span></li>
                                <li class="fw-normal">Combination x 1 <span>$60.00</span></li>
                                <li class="fw-normal">Combination x 1 <span>$120.00</span></li>
                                <li class="fw-normal">Subtotal <span>$240.00</span></li>
                                <li class="total-price">Total <span>$240.00</span></li>&ndash;%&gt;
                            </ul>--%>
                            <div>
                                <p>Subtotal: <span class="money">${cartModel.totalMoney}</span> VND</p>
                                <p>Ship: <span class="money">30000</span> VND</p>
                                <p>Total pay: <span class="money">${cartModel.totalMoney + 30000}</span> VND</p>
                            </div>
                            <%--<div class="payment-check">
                                <div class="pc-item">
                                    <label for="pc-check">
                                        Cheque Payment
                                        <input type="checkbox" id="pc-check">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="pc-item">
                                    <label for="pc-paypal">
                                        Paypal
                                        <input type="checkbox" id="pc-paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </div>--%>
                           <%-- <div class="order-btn">
                                <button type="submit" class="site-btn place-btn">Place Order</button>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- Shopping Cart Section End -->
</body>
</html>
