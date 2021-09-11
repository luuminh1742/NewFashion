<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIGetBill" value="/api/bill"/>
<c:url value="/api/order" var="APIOrder"/>
<h4 class="font-weight-bold">My Purchases</h4>
<br>
<div class="row">
    <c:forEach var="bill" items="${billModel.listResult}">
        <%--<div class="col-md-12 p-3 bg-light border-left mb-3
           ${bill.status == false ?"border-danger":"border-success"}" style="cursor: pointer;"
             data-toggle="modal" data-target="#exampleModalCenter"
             onclick="clickViewBill(${bill.id})">
            <p>Code Orders : #${bill.id}</p>
            <p>Created date : ${bill.createdDate}</p>
            <c:if test="${bill.status == false}">
                <p>Status : The store has not received orders.</p>
            </c:if>
            <c:if test="${bill.status == true}">
                <p>Status : The store has received the order.</p>
            </c:if>
        </div>--%>
        <div class="col-md-12 p-3 bg-light border-left mb-3
           ${bill.checkStatus == 0 ?"border-warning": bill.checkStatus == 1?"border-success":"border-danger"}" style="cursor: pointer;"
             data-toggle="modal" data-target="#exampleModalCenter"
             onclick="clickViewBill(${bill.id})">
            <p>Code Orders : #${bill.id}</p>
            <p>Created date : ${bill.createdDate}</p>
            <c:choose>
                <c:when test = "${bill.checkStatus == 0}">
                    <p>Status : Wait for confirmation.</p>
                </c:when>

                <c:when test = "${bill.checkStatus == 1}">
                    <p>Status : Order confirmed.</p>
                </c:when>

                <c:otherwise>
                    <p>Status : Order canceled.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </c:forEach>
</div>


<!-- Modal -->

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
                <button type="button" class="btn btn-danger" id="bntCancelOrder">Cancel Order</button>
                <input hidden id="idBill" value="" type="number">
            </div>
        </div>
    </div>
</div>


<script>
    const clickViewBill = (bill_id) => {

        fetch('${APIGetBill}'+'?bill-id='+bill_id)
            .then(res => res.json())
            .then(out =>{
                    $('#receiverName').text(out['receiverName']);
                    $('#receiverAddress').text(out['receiverAddress']);
                    $('#receiverPhone').text(out['receiverPhone']);
                    $('#createdDate').text(out['date']);
                    let checkStatus = out['checkStatus'];
                    $('#status').text(checkStatus === 0 ?"Wait for confirmation."
                        :checkStatus === 1? "Order confirmed.":"Order canceled");
                    $('#order-detail').html("");
                    if(checkStatus === 0){
                        $('#bntCancelOrder').show();
                        $('#idBill').val(out['id']);
                    }else{
                        $('#bntCancelOrder').hide();
                    }
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

    $('#bntCancelOrder').click(()=>{
        let idBill = $('#idBill').val();
        clickDeleteOrders(idBill);
    })

    const clickDeleteOrders = (id)=>{
        let confirmDelete = confirm("Confirm cancel this order?");
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
                    alert("Cancel order successfully.!");
                    location.reload();
                },
                error: (error) => {
                    alert("Cancel failed order.!");
                }
            });
        }
    }
</script>
