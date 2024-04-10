package com.in6225.spring.onlinebookstore.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.hibernate.Session;
//import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.in6225.spring.onlinebookstore.model.Book;
import com.in6225.spring.onlinebookstore.utils.HibernateUtil;
import com.in6225.spring.onlinebookstore.utils.JDBCUtils;

@Repository
public class BookDao {

	private static final String GET_BOOKS_BY_STRING = "SELECT bookId, name, price, description FROM book WHERE name LIKE ?";
	private static final String GET_ALL_BOOKS = "SELECT bookId, name, price, description FROM book";
    private static final String BEST_SELLERS_QUERY = "SELECT bookId, SUM(quantity) AS total_sold FROM orders GROUP BY bookId ORDER BY total_sold DESC LIMIT 3";
    private static final String GET_BOOKS_BY_ID = "SELECT name, price, description FROM book WHERE bookId LIKE ?";

    public List<Book> getAllBooks() {
    	List<Book> books = new ArrayList<Book>();

    	try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_BOOKS);) {
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String name = rs.getString("name");
				Double price = rs.getDouble("price");
				String description = rs.getString("description");
				books.add(new Book(name, price, description));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}

		return books;
    }
    
    public List<Book> searchBySubstring(String searchString) {
		List<Book> books = new ArrayList<Book>();

		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_BOOKS_BY_STRING);) {
			searchString = "%" + searchString + "%";
			preparedStatement.setString(1, searchString);
			ResultSet rs = preparedStatement.executeQuery();
			System.out.println(rs);
			while (rs.next()) {
				Long bookId = rs.getLong("bookId");
				String name = rs.getString("name");
				Double price = rs.getDouble("price");
				String description = rs.getString("description");
				books.add(new Book(bookId, name, price, description));
				System.out.println(bookId+" "+name+" "+price+" "+description);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}

		return books;
    }
    
    public List<String> getBestSellers() {
        List<String> bestSellers = new ArrayList<>();

        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(BEST_SELLERS_QUERY);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                String bookId = resultSet.getString("bookId");
                bestSellers.add(bookId);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bestSellers;
    }

	public Book findBookById(Long bookId) {

		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_BOOKS_BY_ID);) {
			
			preparedStatement.setLong(1, bookId);
			ResultSet rs = preparedStatement.executeQuery();
			
	        if (rs.next()) {
	            String name = rs.getString("name");
	            Double price = rs.getDouble("price");
	            String description = rs.getString("description");
	            
	            return new Book(bookId, name, price, description);
	        }
			
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}

		return null;
	}

    
}
