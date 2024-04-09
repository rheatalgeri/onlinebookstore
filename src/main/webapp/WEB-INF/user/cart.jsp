<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>


<head>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>

	<style>
	#app {
		min-width: 1080px;
	}
	.row {
		display: -webkit-box;
		display: -webkit-flex;
		display: -ms-flexbox;
		display: flex;
		flex-wrap: wrap;
	}
	.row > [class*='col-'] {
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
	.panel {
		display: -webkit-flex;
  		display: flex;
  		align-items: center;
    	justify-content: center;
	}
	</style>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div id="app">
        <div class="container col-md-8 col-md-offset-3" style="overflow: auto">
            <h1>Cart</h1>
            <div class="card">
                <div v-if="!bookList?.length" class="card text-center" style="margin-bottom: 10px">
                    <div class="card-body">
                        
                    </div>
                </div>
                <div v-else class="card-body">
                    <h5 class="p-2">Order Summary</h5>
                    <p class="p-2">Date: {{ getDate() }}</p>
                    <div class="container text-center" style="margin-top: 10px; margin-bottom: 10px;"
                    v-for="book in bookList">
                        <div class="row">
                            <div class="col-3">
                                <div class="p-3 col px-md-2 border bg-light panel">{{ book.title }}</div>
                            </div>
                            <div class="col-6">
                                <div class="p-3 col px-md-2 border bg-light panel">{{ book.description }}</div>
                            </div>
                            <div class="col-2">
                                <div class="p-3 col border bg-light panel">{{ '$' + book.price }}</div>
                            </div>
                            <div class="col-1">
                                <div class="p-2 panel">
                                    <button type="button" class="btn btn-default" @click="removeBook(book)">
                                        <i class="fa fa-trash-o fa-lg" style="color: red"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="p-2 card-text" style="text-align: right; margin-top: 50px">
                        <h5>Total: {{ '$' + amount }}</h5>
                    </div>
                </div>
            </div>
            <div class="d-grid d-md-flex justify-content-md-end" style="margin-top: 50px">
                <input class="btn btn-primary me-md-2" type="button" onclick="location.href='<%=request.getContextPath()%>'"
                value="Order More">
                <input class="btn btn-primary me-md-2" type="button" :disabled="!bookList?.length"
                onclick="location.href='<%=request.getContextPath()%>/order/confirmation.jsp'"
                value="Confirm Now">
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>

<script type="text/javascript">
  Vue.createApp({
    data() {
      return {
    	  bookList: [],
      }
    },
    created() {
    	var cartDate = localStorage.getItem("todayDate");
    	if (!cartDate) {
    		localStorage.setItem("todayDate", new Date().toLocaleDateString('en-GB'));
    	} else if (cartDate !== new Date().toLocaleDateString('en-GB')) {  //To see if items in cart are outdated
    		localStorage.setItem("todayDate", new Date().toLocaleDateString('en-GB'));
    		localStorage.removeItem("cart");
    		this.bookList = [];
    	}
    	
    	var cart = localStorage.getItem("cart");
    	if (cart?.length > 0) {
    		this.bookList = JSON.parse(cart);
    	}
    },
    computed: {
        amount() {
        	var totalAmount = 0;
        	for (let i = 0; i < this.bookList.length; i++) {
        		totalAmount += this.bookList[i].price;
        	}
        	return totalAmount.toFixed(2);
        }
    },
    methods: {
        removeBook(book) {
        	var msg = "Are you sure to delete this book?";
        	if (confirm(msg) == true) {
        		const index = this.bookList.indexOf(book);
            	if (index > -1) {
            		this.bookList.splice(index, 1);
            		localStorage.setItem("cart", JSON.stringify(this.bookList));
            	}
        	}
        },
        getDate() {
        	var date = localStorage.getItem("todayDate");
        	return date;
        }
    },
  }).mount('#app');
</script>

</html>
