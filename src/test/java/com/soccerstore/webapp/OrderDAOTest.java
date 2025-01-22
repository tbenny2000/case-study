//package com.soccerstore.webapp;
//
//import com.soccerstore.webapp.database.dao.OrderDAO;
//import com.soccerstore.webapp.database.dao.UserDAO;
//import com.soccerstore.webapp.database.entity.Order;
//import com.soccerstore.webapp.database.entity.User;
//import org.junit.jupiter.api.BeforeAll;
//import org.junit.jupiter.api.MethodOrderer;
//import org.junit.jupiter.api.Test;
//import org.junit.jupiter.api.TestMethodOrder;
//import org.junit.jupiter.params.ParameterizedTest;
//import org.junit.jupiter.params.provider.ValueSource;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import java.time.LocalDateTime;
//import java.util.List;
//import java.util.Optional;
//import java.util.stream.Collectors;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//@SpringBootTest
//@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
//public class OrderDAOTest {
//
//    @Autowired
//    private OrderDAO orderDAO;
//
//    @Autowired
//    private UserDAO userDAO;
//
//    private static final Logger log = LoggerFactory.getLogger(OrderDAOTest.class);
//
//    private static Integer savedOrderId;
//    private static User testUser;
//
//    @BeforeAll
//    static void setup(@Autowired UserDAO userDAO) {
//        // Create test user
//        User user = new User();
//        user.setEmail("test@test.com");
//        user.setPassword("password");
//        user.setFirstName("Test");
//        user.setLastName("User");
//        testUser = userDAO.save(user);
//    }
//
//    @Test
//    @org.junit.jupiter.api.Order(1)
//    void testCreateOrder() {
//        log.info("Testing order creation");
//        Order order = new Order();
//        order.setUser(testUser);
//        order.setOrderStatus("CART");
//        order.setOrderDate(LocalDateTime.now());
//
//        Order savedOrder = orderDAO.save(order);
//        savedOrderId = savedOrder.getId();
//
//        assertNotNull(savedOrder.getId());
//        assertEquals("CART", savedOrder.getOrderStatus());
//        log.info("Order created with ID: {}", savedOrder.getId());
//    }
//
//    @Test
//    @org.junit.jupiter.api.Order(2)
//    void testReadOrder() {
//        log.info("Testing order retrieval");
//        Order foundOrder = orderDAO.findById(savedOrderId).orElse(null);
//        assertNotNull(foundOrder);
//        assertEquals("CART", foundOrder.getOrderStatus());
//    }
//
//    @ParameterizedTest
//    @ValueSource(strings = {"PLACED", "SHIPPED", "DELIVERED"})
//    @org.junit.jupiter.api.Order(3)
//    void testUpdateOrderStatus(String status) {
//        log.info("Testing order status update to: {}", status);
//        Order order = orderDAO.findById(savedOrderId).orElseThrow();
//        order.setOrderStatus(status);
//        Order updatedOrder = orderDAO.save(order);
//        assertEquals(status, updatedOrder.getOrderStatus());
//    }
//
//    @Test
//    @org.junit.jupiter.api.Order(4)
//    void testStreamOperations() {
//        log.info("Testing stream operations on orders");
//        List<Order> orders = orderDAO.findAll();
//
//        // Using streams to find orders with specific status
//        List<String> orderStatuses = orders.stream()
//                .map(Order::getOrderStatus)
//                .distinct()
//                .sorted()
//                .collect(Collectors.toList());
//
//        log.info("Unique order statuses: {}", orderStatuses);
//        assertFalse(orderStatuses.isEmpty());
//    }
//
//    @Test
//    @org.junit.jupiter.api.Order(5)
//    void testDeleteOrder() {
//        log.info("Testing order deletion");
//        orderDAO.deleteById(savedOrderId);
//        Optional<Order> deletedOrder = orderDAO.findById(savedOrderId);
//        assertTrue(deletedOrder.isEmpty());
//    }
//}
