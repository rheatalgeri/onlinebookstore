<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.in6225.spring.onlinebookstore.model.Cart" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.ArrayList" %>
<%
    Cart cart = (Cart) session.getAttribute("cart");
    Gson gson = new Gson();
    String cartJson = gson.toJson(cart != null ? cart.getItems() : new ArrayList<>());
%>

<!DOCTYPE html>
<html>
<head>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script> <!-- For the trash icon -->
    <style>
        #app {
            min-width: 1080px;
        }
        .row {
            display: flex;
            flex-wrap: wrap;
        }
        .row > [class*='col-'] {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .panel {
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
                <div v-if="!bookList.length" class="card text-center" style="margin-bottom: 10px">
                    <div class="card-body">
                        Your cart is empty.
                    </div>
                </div>
                <div v-else class="card-body">
                    <h5 class="p-2">Order Summary</h5>
                    <p class="p-2">Date: {{ getDate() }}</p>
                    <div class="container text-center" style="margin-top: 10px; margin-bottom: 10px;"
                    v-for="book in bookList" :key="book.bookId">
                        <div class="row">
                            <div class="col-3">
                                <div class="p-3 col px-md-2 border bg-light panel">{{ book.title }}</div>
                            </div>
                            <div class="col-5">
                                <div class="p-3 col px-md-2 border bg-light panel">{{ book.description }}</div>
                            </div>
                            <div class="col-1">
                                <input type="number" v-model.number="book.quantity" min="1" class="form-control" @change="updateQuantity(book)">
                            </div>
                            <div class="col-2">
                                <div class="p-3 col border bg-light panel">{{ '$' + (book.price * book.quantity).toFixed(2) }}</div>
                            </div>
                            <div class="col-1">
                                <div class="p-2 panel">
                                    <button type="button" class="btn btn-default" @click="removeBook(book)">
                                        <i class="fa fa-trash" style="color: red"></i>
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
                <form id="/orderconfirmation">
	                <input class="btn btn-primary me-md-2" type="button" :disabled="!bookList.length"
	                value="Confirm Now">
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>

    <script type="text/javascript">
    const serverCartItems = <%=cartJson%>;
      Vue.createApp({
        data() {
            return {
              bookList: serverCartItems,
            }
          },
        computed: {
            amount() {
                return this.bookList.reduce((total, book) => total + (book.price * book.quantity), 0).toFixed(2);
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
            updateQuantity(book) {
                const cart = this.bookList;
                const index = cart.findIndex(item => item.bookId === book.bookId);
                if (index !== -1) {
                    cart[index].quantity = book.quantity;
                    localStorage.setItem("cart", JSON.stringify(cart));
                }
            },
            getDate() {
                var date = localStorage.getItem("todayDate");
                return date;
            }
        },
      }).mount('#app');
    </script>
</body>
</html>
