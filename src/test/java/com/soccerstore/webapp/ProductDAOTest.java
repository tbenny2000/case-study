//package com.soccerstore.webapp;
//
//import com.soccerstore.webapp.database.dao.ProductDAO;
//import com.soccerstore.webapp.database.entity.Product;
//import org.junit.jupiter.api.MethodOrderer;
//import org.junit.jupiter.api.Test;
//import org.junit.jupiter.api.TestMethodOrder;
//import org.junit.jupiter.params.ParameterizedTest;
//import org.junit.jupiter.params.provider.CsvSource;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import java.util.List;
//import java.util.Optional;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//@SpringBootTest
//@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
//public class ProductDAOTest {
//
//    @Autowired
//    private ProductDAO productDAO;
//
//    private static final Logger log = LoggerFactory.getLogger(ProductDAOTest.class);
//
//    private static Integer savedProductId;
//
//    @Test
//    @org.junit.jupiter.api.Order(1)
//    void testCreateProduct() {
//        log.info("Testing product creation");
//        Product product = new Product();
//        product.setName("Test Soccer Ball");
//        product.setPrice(29.99);
//        product.setStockQuantity(10);
//        product.setCategory("Balls");
//        product.setDescription("Test Description");
//
//        Product savedProduct = productDAO.save(product);
//        savedProductId = savedProduct.getId();
//
//        assertNotNull(savedProduct.getId());
//        assertEquals("Test Soccer Ball", savedProduct.getName());
//    }
//
//    @ParameterizedTest
//    @CsvSource({
//            "Test Soccer Ball, 29.99, Balls",
//            "Soccer Cleats, 89.99, Footwear",
//            "Soccer Jersey, 59.99, Apparel"
//    })
//    @org.junit.jupiter.api.Order(2)
//    void testCreateMultipleProducts(String name, double price, String category) {
//        log.info("Testing product creation with parameters: {}, {}, {}", name, price, category);
//        Product product = new Product();
//        product.setName(name);
//        product.setPrice(price);
//        product.setCategory(category);
//        product.setStockQuantity(10);
//
//        Product savedProduct = productDAO.save(product);
//        assertNotNull(savedProduct.getId());
//        assertEquals(name, savedProduct.getName());
//    }
//
//    @Test
//    @org.junit.jupiter.api.Order(3)
//    void testStreamOperations() {
//        log.info("Testing stream operations on products");
//        List<Product> products = productDAO.findAll();
//
//        // Using lambda and streams to calculate average price
//        double avgPrice = products.stream()
//                .mapToDouble(Product::getPrice)
//                .average()
//                .orElse(0.0);
//
//        log.info("Average product price: {}", avgPrice);
//        assertTrue(avgPrice > 0);
//    }
//
////    @Test
////    @org.junit.jupiter.api.Order(4)
////    void testDeleteProduct() {
////        log.info("Testing product deletion");
////        productDAO.deleteById(savedProductId);
////        Optional<Product> deletedProduct = productDAO.findById(savedProductId);
////        assertTrue(deletedProduct.isEmpty());
////    }
//}
