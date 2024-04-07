package com.in6225.spring.onlinebookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.in6225.spring.onlinebookstore.model.Book;
import com.in6225.spring.onlinebookstore.model.Order;
import com.in6225.spring.onlinebookstore.utils.JDBCUtils;

@Repository
public class OrderDao {
	
	private static final String GET_ALL_ORDERS = "SELECT orderId, userId, amount, createDateTime FROM orders";
	private final static String GET_BOOKS_BY_ORDERID = "SELECT b.bookId FROM book b JOIN orderbook ob ON b.bookId = ob.bookId WHERE ob.orderId = ?";
	private static final String GET_BOOKS_FOR_ORDER = "SELECT b.bookId, b.name, b.description, b.price FROM orderbook ob INNER JOIN book b ON ob.bookId = b.bookId WHERE ob.orderId = ?";
	private static final String INSERT_ORDER = "INSERT INTO orders (orderId, userId, amount, createDateTime) VALUES (?, ?, ?, ?)";
	private static final String INSERT_ORDERBOOK = "INSERT INTO bookorder (orderId, bookId) VALUES (?, ?)";
	
	public List<Order> getAllOrders() {
	    List<Order> orders = new ArrayList<>();

	    try (Connection connection = JDBCUtils.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ORDERS);
	         ResultSet rs = preparedStatement.executeQuery()) {

	        while (rs.next()) {
	            Long orderId = rs.getLong("orderId");
	            Double amount = rs.getDouble("amount");
	            Date dateTime = rs.getDate("createDateTime");
	            String userId = rs.getString("userId");
	            
	            // Retrieve book details for the order
	            List<Book> books = getBooksForOrder(orderId);

	            orders.add(new Order(orderId, books, amount, dateTime, userId));
	        }
	    } catch (SQLException exception) {
	        JDBCUtils.printSQLException(exception);
	    }

	    return orders;
	}

	private List<Book> getBooksForOrder(Long orderId) {
	    List<Book> books = new ArrayList<>();

	    try (Connection connection = JDBCUtils.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(GET_BOOKS_FOR_ORDER)) {
	        preparedStatement.setLong(1, orderId);
	        ResultSet rs = preparedStatement.executeQuery();

	        while (rs.next()) {
	            Long bookId = rs.getLong("bookId");
	            String name = rs.getString("name");
	            String description = rs.getString("description");
	            Double price = rs.getDouble("price");

	            books.add(new Book(bookId, name, price, description));
	        }
	    } catch (SQLException exception) {
	        JDBCUtils.printSQLException(exception);
	    }

	    return books;
	}

    
    public List<Book> getBooksByOrderId(Long orderId, Connection connection) {
	    List<Book> books = new ArrayList<Book>();

	    try (PreparedStatement preparedStatement = connection.prepareStatement(GET_BOOKS_BY_ORDERID)) {
	        preparedStatement.setLong(1, orderId);
	        ResultSet rs = preparedStatement.executeQuery();

	        while (rs.next()) {
	            Long bookId = rs.getLong("bookId");
	            String name = rs.getString("name");
	            Double price = rs.getDouble("price");
	            String description = rs.getString("description");
	            books.add(new Book(bookId, name, price, description));
	        }
	    } catch (SQLException exception) {
	        JDBCUtils.printSQLException(exception);
	    }

	    return books;
	}

    @SuppressWarnings("resource")
	public Long insertOrder(Map<String, Object> requestData) throws SQLException {
        Double amount = Double.parseDouble(String.valueOf(requestData.get("amount")));
        String userId = requestData.get("userId").toString();
        List<Book> booklist = (List<Book>) requestData.get("booklist");

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
           
            connection = JDBCUtils.getConnection();
            preparedStatement = connection.prepareStatement(INSERT_ORDER, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, userId);
            preparedStatement.setDouble(2, amount);
            preparedStatement.setTimestamp(3, new java.sql.Timestamp(System.currentTimeMillis()));
            preparedStatement.executeUpdate();

            // Get the generated order ID
            Long orderId = null;
            resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                orderId = resultSet.getLong(1);
            } else {
                throw new SQLException("Failed to retrieve generated order ID.");
            }

            preparedStatement = connection.prepareStatement(INSERT_ORDERBOOK);
            for (Book book : booklist) {
                preparedStatement.setLong(1, orderId);
                preparedStatement.setLong(2, book.getBookId());
                preparedStatement.executeUpdate();
            }

            return orderId;
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }


}
