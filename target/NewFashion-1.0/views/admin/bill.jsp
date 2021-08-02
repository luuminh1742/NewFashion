<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url value="/api/order" var="APIOrder"/>
<c:url var="URLOldOrder" value="/admin/bill?type=old&page=1"/>
<c:url var="APIGetBill" value="/api/bill"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Management | Admin New Fashion</title>
</head>
<body>

<div class="header">
    <h1 class="page-header">
        Order Management
    </h1>
    <ol class="breadcrumb">
        <li><a href='<c:url value="/admin/home"/> '>Home</a></li>
        <li><a href="active">Order Management</a></li>
    </ol>

</div>
<div id="page-inner">
    <div class="panel panel-default">
        <ul class="nav nav-tabs">
            <li class=' ${type == "new" ?"active":""}'>
                <a href='<c:url value="/admin/bill?type=new&page=1"/>'
                >New orders</a>
            </li>
            <li class='${type == "old" ?"active":""}'>
                <a href='<c:url value="/admin/bill?type=old&page=1"/>'
                >Order confirmed</a>
            </li>
        </ul>
        <div class="tab-content p-2">
            <div class="">
                <c:if test="${billModel.listResult.size() == 0}">
                    <h3 style="text-align: center;
                                font-weight: bold;
                                margin: 35px">
                        No orders
                    </h3>
                </c:if>
                <c:forEach var="bill" items="${billModel.listResult}">
                    <div class="my-item-bill
                            ${bill.status == false ?"my-border-danger":"my-border-success"}"
                         data-toggle="modal" data-target="#exampleModalCenter"
                         onclick="clickViewBill(${bill.id})">
                        <p>Code Orders : #${bill.id}</p>
                        <p>Created date : ${bill.createdDate}</p>
                        <c:if test="${bill.status == false}">
                            <p>Status : The store has not received orders.</p>
                            <input value="Get orders" type="button" class="btn btn-success"
                                onclick="clickGetOrders(${bill.id})"
                            >
                            <input value="Delete orders" type="button" class="btn btn-danger"
                                   onclick="clickDeleteOrders(${bill.id})"
                            >
                        </c:if>
                        <c:if test="${bill.status == true}">
                            <p>Status : The store has received the order.</p>
                        </c:if>

                    </div>
                </c:forEach>
            </div>
            <form action="<c:url value='/admin/product'/>"
                  id="formSubmit" method="get"
                  style="text-align: center">
                <ul class="pagination" id="pagination"></ul>
                <input type="hidden" value="${type}" id="type" name="type"/>
                <input type="hidden" value="" id="page" name="page">
            </form>
        </div>
    </div>
    <%@include file="/common/admin/footer.jsp" %>
</div>

<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered  modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title" id="exampleModalLongTitle">Bill</h2>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h4>Receiver's information</h4>
                <br>
                <table class="table table-bordered">
                    <tr>
                        <td>Receiver Name</td>
                        <td id="receiverName">Luu Ba Minh</td>
                    </tr>
                    <tr>
                        <td>Receiver Address</td>
                        <td id="receiverAddress">TH</td>
                    </tr>
                    <tr>
                        <td>Receiver Phone</td>
                        <td id="receiverPhone">0999888776</td>
                    </tr>
                    <tr>
                        <td>Created Date</td>
                        <td id="createdDate">1/1/2021</td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td id="status">aaa</td>
                    </tr>
                </table>
                <br>
                <h4>Order details</h4>
                <br>
                <table class="table table-bordered">
                    <thead>
                    <th>Product name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                    </thead>
                    <tbody id="order-detail">

                    </tbody>

                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Print</button>
            </div>
        </div>
    </div>
</div>

<script>
    let totalPages = ${ billModel.totalPage };
    let currentPage = ${ billModel.page };
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 5,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#page').val(page);
                    $('#formSubmit').submit();
                }
            }
        });
    });

    const clickViewBill = (bill_id) => {

        fetch('${APIGetBill}'+'?bill-id='+bill_id)
            .then(res => res.json())
            .then(out =>{
                $('#receiverName').text(out['receiverName']);
                $('#receiverAddress').text(out['receiverAddress']);
                $('#receiverPhone').text(out['receiverPhone']);
                $('#createdDate').text(out['date']);
                $('#status').text(out['status']?"The store has received the order."
                    :"store has not received orders.");
                $('#order-detail').html("");
                let total = 0;
                out["billDetails"].map(item=>{
                    let totalmoney = item.currentlyPrice * item.quantity;
                    total += totalmoney;
                    $('#order-detail').append(
                        '<tr>'+
                        '<td>'+item.productName+'</td>'+
                        '<td>'+item.quantity+'</td>'+
                        '<td><span class="money">'+item.currentlyPrice+'</span> VND</td>'+
                        '<td><span class="money">'+totalmoney+'</span> VND</td>'+
                        '</tr>'
                    );
                });
                $('#order-detail').append(
                    '<tr>'+
                    '<td colspan="3">Ship</td>'+
                    '<td><span class="money">'+30000+'</span> VND</td>'+
                    '</tr>'
                );
                total+=30000;
                $('#order-detail').append(
                    '<tr>'+
                    '<td colspan="3">Total Money</td>'+
                    '<td><span class="money">'+total+'</span> VND</td>'+
                    '</tr>'
                );
            })
            .catch(err => console.log(err));

    }

    const clickGetOrders = (id)=>{
        let data = {};
        data["id"] = id;
        $.ajax({
            url: '${APIOrder}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: (result) => {
                alert("Order received!");
                window.location = '${URLOldOrder}';
            },
            error: (error) => {
                alert("Received failed order!");
            }
        });
    }

    const clickDeleteOrders = (id)=>{
        let confirmDelete = confirm("Confirm delete this order?");
        if (confirmDelete) {
            let data = {};
            data["id"] = id;
            $.ajax({
                url: '${APIOrder}',
                type: 'DELETE',
                contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'json',
                success: (result) => {
                    alert("Deleted order successfully.!");
                    location.reload();
                },
                error: (error) => {
                    alert("Delete failed order.!");
                }
            });
        }
    }
</script>


</body>
</html>
