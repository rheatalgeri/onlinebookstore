package com.in6225.spring.onlinebookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.in6225.spring.onlinebookstore.model.Book;
import com.in6225.spring.onlinebookstore.model.CartItem;
import com.in6225.spring.onlinebookstore.model.Order;
import com.in6225.spring.onlinebookstore.model.OrderBook;
import com.in6225.spring.onlinebookstore.utils.JDBCUtils;

import java.util.UUID;

@Repository
public class OrderDao {

	private static final String GET_ALL_ORDERS = "SELECT orderId, userId, amount, createDateTime FROM orders";
	private final static String GET_BOOKS_BY_ORDERID = "SELECT b.bookId FROM book b JOIN orderbook ob ON b.bookId = ob.bookId WHERE ob.orderId = ?";
	private static final String GET_BOOKS_FOR_ORDER = "SELECT b.bookId, b.name, b.description, b.price FROM orderbook ob INNER JOIN book b ON ob.bookId = b.bookId WHERE ob.orderId = ?";
	private static final String INSERT_ORDER = "INSERT INTO orders (orderId, userId, amount, createDateTime) VALUES (?, ?, ?, ?)";
	private static final String INSERT_ORDERBOOK = "INSERT INTO orderbook (orderId, bookId, quantity) VALUES (?, ?, ?)";
	private static final String GET_ORDERS_BY_USER = "SELECT orderId, userId, amount, createDateTime FROM orders WHERE userId = ?";

	@Autowired
	CartItemDao cartItemDao;

	public long idGen() {
		UUID uuid = UUID.randomUUID();
		long higherBits = uuid.getMostSignificantBits();
		return Math.abs(higherBits);
	}

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

	public Long insertOrder(Double amount, String userId, List<OrderBook> booklist) throws SQLException {

		try (Connection connection = JDBCUtils.getConnection()) {
			connection.setAutoCommit(false);

			try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER,
					PreparedStatement.RETURN_GENERATED_KEYS)) {
				Long orderId = idGen();
				preparedStatement.setLong(1, orderId);
				preparedStatement.setString(2, userId);
				preparedStatement.setDouble(3, amount);
				preparedStatement.setTimestamp(4, new java.sql.Timestamp(System.currentTimeMillis()));
				preparedStatement.executeUpdate();

				ResultSet resultSet = preparedStatement.getGeneratedKeys();

				resultSet.close();

				for (OrderBook orderBook : booklist) {
					orderBook.setOrderId(orderId);
					insertOrderBook(connection, orderBook);
				}

				connection.commit();
				return orderId;
			} catch (Exception e) {
				connection.rollback();
				throw e;
			}
		}
	}

	private void insertOrderBook(Connection connection, OrderBook orderBook) throws SQLException {
		try (PreparedStatement orderBookStmt = connection.prepareStatement(INSERT_ORDERBOOK)) {
			orderBookStmt.setLong(1, orderBook.getOrderId());
			orderBookStmt.setLong(2, orderBook.getBookId());
			orderBookStmt.setInt(3, orderBook.getQuantity());
			orderBookStmt.executeUpdate();
		}
	}

	public List<Order> getOrdersByUser(String userId) {
		List<Order> orders = new ArrayList<>();
		Connection connection = JDBCUtils.getConnection();
		try (PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDERS_BY_USER)) {
			preparedStatement.setString(1, userId);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Long orderId = rs.getLong("orderId");
				Double amount = rs.getDouble("amount");
				Date dateTime = rs.getDate("createDateTime");
				List<Book> books = getBooksForOrder(orderId);

				orders.add(new Order(orderId, books, amount, dateTime, userId));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}

		return orders;
	}

	public Long createOrderFromCart(String userId) throws SQLException {
		List<CartItem> cartItems = cartItemDao.findAllCartItemsByUserId(userId);
		List<OrderBook> bookList = new ArrayList<>();
		double totalAmount = 0;

		for (CartItem item : cartItems) {
			OrderBook orderBook = new OrderBook(item.getBookId(), item.getQuantity());
			bookList.add(orderBook);
			totalAmount += item.getPrice() * item.getQuantity();
		}

		return insertOrder(totalAmount, userId, bookList);
	}

}
