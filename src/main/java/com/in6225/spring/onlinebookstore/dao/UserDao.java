package com.in6225.spring.onlinebookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import com.in6225.spring.onlinebookstore.model.User;
import com.in6225.spring.onlinebookstore.utils.JDBCUtils;

@Repository
public class UserDao {
	private static final String CREATE_NEW_USER = "INSERT INTO users (userId, password, contactNo, email, name) VALUES (?,?,?,?,?)";
	private static final String GET_ALL_USERS = "SELECT userId, contactNo, email, name FROM users";
	private static final String DELETE_CART_ITEM = "DELETE FROM cartitem WHERE userId = ?";
	private static final String DELETE_ORDER_BOOK = "DELETE ob FROM orderbook ob INNER JOIN orders o ON ob.orderId = o.orderId WHERE o.userId = ?";
	private static final String DELETE_ORDER = "DELETE FROM orders WHERE userId = ?";
	private static final String DELETE_USER = "DELETE FROM users WHERE userId = ?";



	public void createUser(String userId, String password, String contactNo, String email, String name)
			throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {

			connection = JDBCUtils.getConnection();
			preparedStatement = connection.prepareStatement(CREATE_NEW_USER, PreparedStatement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, userId);
			preparedStatement.setString(2, password);
			preparedStatement.setString(3, contactNo);
			preparedStatement.setString(4, email);
			preparedStatement.setString(5, name);
			preparedStatement.executeUpdate();

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

	public List<User> getAllUsers() {
		List<User> users = new ArrayList<User>();

		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_USERS);) {
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String userId = rs.getString("userId");
				String email = rs.getString("email");
				String contactNo = rs.getString("contactNo");
				String name = rs.getString("name");
				users.add(new User(userId, email, contactNo, name));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}

		return users;
	}

	public void deleteUser(String userId) {
	    try (Connection connection = JDBCUtils.getConnection();
	         PreparedStatement deleteCartItemStatement = connection.prepareStatement(DELETE_CART_ITEM);
	         PreparedStatement deleteOrderBookStatement = connection.prepareStatement(DELETE_ORDER_BOOK);
	         PreparedStatement deleteOrderStatement = connection.prepareStatement(DELETE_ORDER);
	         PreparedStatement deleteUserStatement = connection.prepareStatement(DELETE_USER)) {
	        
	        deleteCartItemStatement.setString(1, userId);
	        deleteCartItemStatement.executeUpdate();
	        
	        deleteOrderBookStatement.setString(1, userId);
	        deleteOrderBookStatement.executeUpdate();
	        
	        deleteOrderStatement.setString(1, userId);
	        deleteOrderStatement.executeUpdate();
	        
	        deleteUserStatement.setString(1, userId);
	        deleteUserStatement.executeUpdate();
	        
	    } catch (SQLException exception) {
	        JDBCUtils.printSQLException(exception);
	    }
	}

}
