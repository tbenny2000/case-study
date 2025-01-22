package com.soccerstore.webapp.controller;

import com.soccerstore.webapp.database.dao.*;
import com.soccerstore.webapp.database.entity.Order;
import com.soccerstore.webapp.database.entity.OrderDetail;
import com.soccerstore.webapp.database.entity.Product;
import com.soccerstore.webapp.database.entity.User;
import com.soccerstore.webapp.security.AuthenticatedUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
public class OrderController {
    private final Logger log = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private OrderDetailDAO orderDetailDAO;

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    // ========== ADDING PRODUCTS TO CART ==============
    @GetMapping("/order/addToCart")
    public ModelAndView addToCart(@RequestParam Integer id) {
        User user = authenticatedUserService.loadCurrentUser();
        if (user == null) {
            return new ModelAndView("redirect:/login/login");
        }

        // Find existing cart or create a new one
        Order cart = orderDAO.findByUserIdAndOrderStatus(user.getId(), "CART");
        if (cart == null) {
            cart = new Order();
            cart.setUser(user); // Associate the User object directly
            cart.setOrderStatus("CART");
            cart.setOrderDate(LocalDateTime.now());
            orderDAO.save(cart);
        }

        // Get product
        Product product = productDAO.findProductById(id);
        if (product == null) {
            return new ModelAndView("redirect:/product/search");
        }

        // Add to cart
        OrderDetail detail = new OrderDetail();
        detail.setOrder(cart); // Link the cart directly
        detail.setProduct(product); // Link the product directly
        detail.setQuantity(1);
        detail.setPrice(product.getPrice());
        orderDetailDAO.save(detail);

        return new ModelAndView("redirect:/order/cart");
    }

    // ========== ORDER CART ==============
    @GetMapping("/order/cart")
    public ModelAndView viewCart() {
        ModelAndView response = new ModelAndView("order/cart");

        User user = authenticatedUserService.loadCurrentUser();
        if (user == null) {
            return new ModelAndView("redirect:/login/login");
        }

        Order cart = orderDAO.findByUserIdAndOrderStatus(user.getId(), "CART");
        if (cart != null) {
            List<OrderDetail> details = orderDetailDAO.findByOrder(cart);
            List<CartItemDTO> cartItems = new ArrayList<>();

            for (OrderDetail detail : details) {
                CartItemDTO item = new CartItemDTO();
                item.setProduct(detail.getProduct());
                item.setQuantity(detail.getQuantity());
                item.setPrice(detail.getPrice());
                cartItems.add(item);
            }

            response.addObject("cartItems", cartItems);
        }
        return response;
    }

    // ========== ORDER REMOVE FROM CART ==============
    @GetMapping("/order/removeFromCart")
    public ModelAndView removeFromCart(@RequestParam Integer id) {
        User user = authenticatedUserService.loadCurrentUser();
        if (user == null) {
            return new ModelAndView("redirect:/login/login");
        }

        Order cart = orderDAO.findByUserIdAndOrderStatus(user.getId(), "CART");
        if (cart != null) {
            OrderDetail detail = orderDetailDAO.findByOrderAndProductId(cart, id);
            if (detail != null) {
                orderDetailDAO.delete(detail);
            }
        }
        return new ModelAndView("redirect:/order/cart");
    }

    // ========== ORDER UPDATE CART ==============
    @PostMapping("/order/updateCart")
    public ModelAndView updateCart(@RequestParam Integer id, @RequestParam Integer quantity) {
        log.debug("Received update request - ID: {}, Quantity: {}", id, quantity);

        User user = authenticatedUserService.loadCurrentUser();
        if (user == null) {
            log.error("No user found in session");
            return new ModelAndView("redirect:/login/login");
        }

        try {
            Order cart = orderDAO.findByUserIdAndOrderStatus(user.getId(), "CART");
            if (cart != null) {
                OrderDetail detail = orderDetailDAO.findByOrderAndProductId(cart, id);
                if (detail != null) {
                    int newQuantity = detail.getQuantity() + quantity;
                    log.debug("Current quantity: {}, New quantity will be: {}",
                            detail.getQuantity(), newQuantity);

                    if (newQuantity <= 0) {
                        log.debug("Removing item from cart as quantity <= 0");
                        orderDetailDAO.delete(detail);
                    } else {
                        detail.setQuantity(newQuantity);
                        orderDetailDAO.save(detail);
                        log.debug("Updated quantity successfully");
                    }
                } else {
                    log.error("No OrderDetail found for product ID: {}", id);
                }
            } else {
                log.error("No cart found for user ID: {}", user.getId());
            }
        } catch (Exception e) {
            log.error("Error updating cart", e);
            throw e;  // Let Spring handle the error
        }

        return new ModelAndView("redirect:/order/cart");
    }

    // =========== CHECKOUT ORDER ===============
    @GetMapping("/order/checkout")
    public ModelAndView showCheckout() {
        ModelAndView response = new ModelAndView("order/checkout");

        User user = authenticatedUserService.loadCurrentUser();
        if (user == null) {
            return new ModelAndView("redirect:/login/login");
        }

        Order cart = orderDAO.findByUserIdAndOrderStatus(user.getId(), "CART");
        if (cart == null) {
            return new ModelAndView("redirect:/order/cart");
        }

        List<OrderDetail> details = orderDetailDAO.findByOrder(cart);
        double total = 0.0;
        List<CartItemDTO> cartItems = new ArrayList<>();

        for (OrderDetail detail : details) {
            CartItemDTO item = new CartItemDTO();
            item.setProduct(detail.getProduct());
            item.setQuantity(detail.getQuantity());
            item.setPrice(detail.getPrice());
            cartItems.add(item);
            total += detail.getQuantity() * detail.getPrice();
        }

        response.addObject("cartItems", cartItems);
        response.addObject("total", total);

        return response;
    }

    // =========== PLACING AN ORDER ===============
    @PostMapping("/order/placeOrder")
    public ModelAndView placeOrder(@RequestParam(required = false) String comments) {
        ModelAndView response = new ModelAndView("order/confirmation");

        User user = authenticatedUserService.loadCurrentUser();
        if (user == null) {
            return new ModelAndView("redirect:/login/login");
        }

        Order cart = orderDAO.findByUserIdAndOrderStatus(user.getId(), "CART");
        if (cart != null) {
            cart.setOrderStatus("PLACED");
            cart.setOrderDate(LocalDateTime.now());
            cart.setComments(comments);

            orderDAO.save(cart);

            List<OrderDetail> details = orderDetailDAO.findByOrder(cart);
            List<CartItemDTO> cartItems = new ArrayList<>();
            double total = 0.0;

            for (OrderDetail detail : details) {
                CartItemDTO item = new CartItemDTO();
                item.setProduct(detail.getProduct());
                item.setQuantity(detail.getQuantity());
                item.setPrice(detail.getPrice());
                cartItems.add(item);
                total += detail.getQuantity() * detail.getPrice();
            }

            response.addObject("order", cart);
            response.addObject("cartItems", cartItems);
            response.addObject("total", total);
        }
        return response;
    }

    @GetMapping("/order/history")
    public ModelAndView orderHistory() {
        ModelAndView response = new ModelAndView("order/history");

        User user = authenticatedUserService.loadCurrentUser();
        if (user == null) {
            return new ModelAndView("redirect:/login/login");
        }

        List<Order> orders = orderDAO.findByUserIdAndOrderStatusNot(user.getId(), "CART");
        List<OrderHistoryDTO> orderHistory = new ArrayList<>();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMM dd, yyyy HH:mm");

        for (Order order : orders) {
            OrderHistoryDTO historyItem = new OrderHistoryDTO();
            historyItem.setOrder(order);
            historyItem.setDetails(orderDetailDAO.findByOrder(order));
            // Format the date here
            if (order.getOrderDate() != null) {
                historyItem.setFormattedDate(order.getOrderDate().format(formatter));
            } else {
                historyItem.setFormattedDate("No Date");
            }
            orderHistory.add(historyItem);
        }

        response.addObject("orderHistory", orderHistory);
        return response;
    }
}