//package com.soccerstore.webapp.controller;
//
//import com.soccerstore.webapp.database.dao.CartItemDTO;
//import com.soccerstore.webapp.database.dao.OrderDAO;
//import com.soccerstore.webapp.database.dao.OrderDetailDAO;
//import com.soccerstore.webapp.database.dao.ProductDAO;
//import com.soccerstore.webapp.database.entity.Order;
//import com.soccerstore.webapp.database.entity.OrderDetail;
//import com.soccerstore.webapp.database.entity.Product;
//import com.soccerstore.webapp.database.entity.User;
//import com.soccerstore.webapp.security.AuthenticatedUserService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
//@Controller
//public class OrderController {
//
//    @Autowired
//    private OrderDAO orderDAO;
//
//    @Autowired
//    private OrderDetailDAO orderDetailDAO;
//
//    @Autowired
//    private ProductDAO productDAO;
//
//    @Autowired
//    private AuthenticatedUserService authenticatedUserService;
//
//    @GetMapping("/order/addToCart")
//    public ModelAndView addToCart(@RequestParam Integer id) {
//        User user = authenticatedUserService.loadCurrentUser();
//        if (user == null) {
//            return new ModelAndView("redirect:/login/login");
//        }
//
//        // Find existing cart or create new one
//        Order cart = orderDAO.findByUserIdAndOrderStatus(user.getId(), "CART");
//        if (cart == null) {
//            cart = new Order();
//            cart.setUserId(user.getId());
//            cart.setOrderStatus("CART");
//            cart.setOrderDate(new Date());
//            cart = orderDAO.save(cart);
//        }
//
//        // Get product
//        Product product = productDAO.findProductById(id);
//        if (product == null) {
//            return new ModelAndView("redirect:/product/search");
//        }
//
//        // Add to cart
//        OrderDetail detail = new OrderDetail();
//        detail.setOrderId(cart.getId());
//        detail.setProductId(product.getId());
//        detail.setQuantity(1);
//        detail.setPrice(product.getPrice());
//        orderDetailDAO.save(detail);
//
//        return new ModelAndView("redirect:/order/cart");
//    }
//
//    @GetMapping("/order/cart")
//    public ModelAndView viewCart() {
//        ModelAndView response = new ModelAndView("order/cart");
//
//        User user = authenticatedUserService.loadCurrentUser();
//        if (user == null) {
//            return new ModelAndView("redirect:/login/login");
//        }
//
//        Order cart = orderDAO.findByUserIdAndOrderStatus(user.getId(), "CART");
//        if (cart != null) {
//            List<OrderDetail> details = orderDetailDAO.findByOrdersId(cart.getId());
//            List<CartItemDTO> cartItems = new ArrayList<>();
//
//            for (OrderDetail detail : details) {
//                Product product = productDAO.findProductById(detail.getProductId());
//                CartItemDTO item = new CartItemDTO();
//                item.setProduct(product);
//                item.setQuantity(detail.getQuantity());
//                item.setPrice(detail.getPrice());
//                cartItems.add(item);
//            }
//
//            response.addObject("cartItems", cartItems);
//        }
//
//        return response;
//    }
//}




package com.soccerstore.webapp.controller;

import com.soccerstore.webapp.database.dao.CartItemDTO;
import com.soccerstore.webapp.database.dao.OrderDAO;
import com.soccerstore.webapp.database.dao.OrderDetailDAO;
import com.soccerstore.webapp.database.dao.ProductDAO;
import com.soccerstore.webapp.database.entity.Order;
import com.soccerstore.webapp.database.entity.OrderDetail;
import com.soccerstore.webapp.database.entity.Product;
import com.soccerstore.webapp.database.entity.User;
import com.soccerstore.webapp.security.AuthenticatedUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
public class OrderController {

    Logger log = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private OrderDetailDAO orderDetailDAO;

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    // ========== ADDING TO CART ==============
    @GetMapping("/order/addToCart")
    public ModelAndView addToCart(@RequestParam Integer id) {
        User user = authenticatedUserService.loadCurrentUser();
        if (user == null) {
            return new ModelAndView("redirect:/login/login");
        }

        // Find existing cart or create new one
        Order cart = orderDAO.findByUserIdAndOrderStatus(user.getId(), "CART");
        if (cart == null) {
            cart = new Order();
            cart.setUserId(user.getId());
            cart.setOrderStatus("CART");
            cart.setOrderDate(LocalDateTime.now());
            cart = orderDAO.save(cart);
        }

        // Get product
        Product product = productDAO.findProductById(id);
        if (product == null) {
            return new ModelAndView("redirect:/product/search");
        }

        // Add to cart
        OrderDetail detail = new OrderDetail();
        detail.setOrdersId(cart.getId());
        detail.setProductId(product.getId());
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
            List<OrderDetail> details = orderDetailDAO.findByOrdersId(cart.getId());
            List<CartItemDTO> cartItems = new ArrayList<>();

            for (OrderDetail detail : details) {
                Product product = productDAO.findProductById(detail.getProductId());
                CartItemDTO item = new CartItemDTO();
                item.setProduct(product);
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
            List<OrderDetail> details = orderDetailDAO.findByOrdersIdAndProductId(cart.getId(), id);
            for (OrderDetail detail : details) {
                orderDetailDAO.delete(detail);
            }
        }

        return new ModelAndView("redirect:/order/cart");
    }

    // ========== ORDER UPDATE CART ==============
    @PostMapping("/order/updateCart")
    public ModelAndView updateCart(@RequestParam Integer id, @RequestParam Integer quantity) {
        log.info("updateCart: id={}, quantity={}", id, quantity);
        User user = authenticatedUserService.loadCurrentUser();
        if (user == null) {
            return new ModelAndView("redirect:/login/login");
        }

        Order cart = orderDAO.findByUserIdAndOrderStatus(user.getId(), "CART");
        if (cart != null) {
            List<OrderDetail> details = orderDetailDAO.findByOrdersIdAndProductId(cart.getId(), id);
            if (details.size() > 0) {
                OrderDetail detail = details.get(0);
                if (quantity == 0) {
                    orderDetailDAO.delete(detail);
                } else {
                    detail.setQuantity(detail.getQuantity() + quantity);
                    if (detail.getQuantity() <= 0) {
                        orderDetailDAO.delete(detail);
                    } else {
                        orderDetailDAO.save(detail);
                    }
                }
            }
        }

        return new ModelAndView("redirect:/order/cart");
    }
}