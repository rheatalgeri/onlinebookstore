package com.in6225.spring.onlinebookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import com.in6225.spring.onlinebookstore.model.CartItem;
import com.in6225.spring.onlinebookstore.utils.JDBCUtils;

@Repository
public class CartItemDao {

    private static final String INSERT_CART_ITEM = "INSERT INTO cartitem (userId, bookId, quantity) VALUES (?, ?, ?)";
    private static final String UPDATE_CART_ITEM_QUANTITY = "UPDATE cartitem SET quantity = ? WHERE userId = ? AND bookId = ?";
    private static final String DELETE_CART_ITEM = "DELETE FROM cartitem WHERE userId = ? AND bookId = ?";
    private static final String GET_QUANTITY_CARTITEM = "SELECT quantity FROM cartitem WHERE userId = ? AND bookId = ?";
    private static final String GET_CARTITEMS = "SELECT c.bookId, c.quantity, b.name, b.price  FROM cartitem c JOIN book b ON c.bookId = b.bookId WHERE c.userId = ?";
    private static final String CHECKIFBOOKISINCART = "SELECT COUNT(*) FROM cartitem WHERE userId = ? AND bookId = ?";
    private static final String DELETE_CART_ITEMS_BY_USER = "DELETE FROM cartitem WHERE userId = ?";
    
    public void addCartItem(String userId, Long bookId, int quantity) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CART_ITEM)) {
            preparedStatement.setString(1, userId);
            preparedStatement.setLong(2, bookId);
            preparedStatement.setInt(3, quantity);
            preparedStatement.executeUpdate();
        } catch (SQLException exception) {
            JDBCUtils.printSQLException(exception);
        }
    }

    public void updateCartItemQuantity(String userId, Long bookId, int quantity) {
        try (Connection connection = JDBCUtils.getConnection();
              PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CART_ITEM_QUANTITY)) {
            preparedStatement.setInt(1, quantity);
            preparedStatement.setString(2, userId);
            preparedStatement.setLong(3, bookId);
            preparedStatement.executeUpdate();
        } catch (SQLException exception) {
            JDBCUtils.printSQLException(exception);
        }
    }

    public void deleteCartItem(String userId, Long bookId) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CART_ITEM)) {
            preparedStatement.setString(1, userId);
            preparedStatement.setLong(2, bookId);
            preparedStatement.executeUpdate();
        } catch (SQLException exception) {
            JDBCUtils.printSQLException(exception);
        }
    }

	public int getCurrentQuantity(String userId, Long bookId) {
        try (Connection connection = JDBCUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(GET_QUANTITY_CARTITEM)) {
        	   preparedStatement.setString(1, userId);
               preparedStatement.setLong(2, bookId);
               int quantity = preparedStatement.executeUpdate();
               return quantity;
           } catch (SQLException exception) {
               JDBCUtils.printSQLException(exception);
               return 0;
           }
	}

	public List<CartItem> findAllCartItemsByUserId(String userId) {
		List<CartItem>cartItems=new ArrayList<CartItem>();
		try (Connection connection = JDBCUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(GET_CARTITEMS)) {
        	
        	preparedStatement.setString(1, userId);
        	ResultSet rs= preparedStatement.executeQuery();
            
        	while(rs.next()) {
        		 Long bookId = rs.getLong("bookId");
                 int quantity = rs.getInt("quantity");
                 String bookName = rs.getString("name");
                 Double price = rs.getDouble("price");
                 cartItems.add(new CartItem(bookId, quantity, bookName, price));
                 System.out.println(bookId +"  "+quantity+"  "+ bookName+"  "+ price);
        	}
               
           } catch (SQLException exception) {
               JDBCUtils.printSQLException(exception);
           }
        return cartItems;
	}
	public boolean isBookInCart(String userId, Long bookId) {
	    int count = 0;
	    
	    try (Connection connection = JDBCUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(CHECKIFBOOKISINCART)) {
	        
	    	preparedStatement.setString(1, userId);
	    	preparedStatement.setLong(2, bookId);
	        
	        ResultSet rs = preparedStatement.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return count > 0;
	}

	public void clearCartByUserId(String userId) {
        try (Connection connection = JDBCUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CART_ITEMS_BY_USER)) {
               preparedStatement.setString(1, userId);
               preparedStatement.executeUpdate();
           } catch (SQLException exception) {
               JDBCUtils.printSQLException(exception);
           }
	}
	
	

}
