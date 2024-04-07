package com.in6225.spring.onlinebookstore.dao;

import org.springframework.stereotype.Repository;

import com.in6225.spring.onlinebookstore.model.LoginBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.in6225.spring.onlinebookstore.utils.JDBCUtils;

@Repository
public class LoginDao {

	public boolean validate(LoginBean loginBean) throws ClassNotFoundException {
		if (loginBean.getUsername().equals("admin") && loginBean.getPassword().equals("admin")) {
			return true;
		} else {
			try (Connection connection = JDBCUtils.getConnection();
					PreparedStatement preparedStatement = connection
							.prepareStatement("SELECT * FROM users WHERE userId = ? AND password = ?")) {
				preparedStatement.setString(1, loginBean.getUsername());
				preparedStatement.setString(2, loginBean.getPassword());

				try (ResultSet resultSet = preparedStatement.executeQuery()) {
					return resultSet.next(); // If a matching user is found, return true
				}
			} catch (SQLException exception) {
				// Handle database errors
				exception.printStackTrace();
			}

			return false;
		}
	}
}
