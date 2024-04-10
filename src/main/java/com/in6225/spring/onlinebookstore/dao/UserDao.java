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
	
	public void createUser(String userId, String password, String contactNo, String email, String name) throws SQLException {

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
}
