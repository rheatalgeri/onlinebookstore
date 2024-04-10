package com.in6225.spring.onlinebookstore.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.in6225.spring.onlinebookstore.dao.BookDao;
import com.in6225.spring.onlinebookstore.model.Book;
import com.in6225.spring.onlinebookstore.model.Cart;
import com.in6225.spring.onlinebookstore.model.CartItem;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private BookDao bookDao;

    @PostMapping("/add")
    public String addToCart(@RequestParam("bookId") Long bookId, HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        Book book = bookDao.findBookById(bookId);
        if (book != null) {
            CartItem item = new CartItem();
            item.setBookId(bookId);
            item.setQuantity(1);
            item.setPrice(book.getPrice());

            cart.addItem(item);
        }

        return "redirect:/cart/view";
    }

    @GetMapping("/view")
    public String viewCart(HttpSession session, Model model) {
        Cart cart = (Cart) session.getAttribute("cart");
        model.addAttribute("cart", cart);
        return "user/cart";
    }

    @PostMapping("/remove")
    public String removeFromCart(@RequestParam("bookId") Long bookId, HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            cart.removeFromCart(bookId);
        }

        return "redirect:/cart/view";
    }
}
