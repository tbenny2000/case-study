//package com.soccerstore.webapp;
//
//import com.soccerstore.webapp.database.dao.UserDAO;
//import com.soccerstore.webapp.database.entity.User;
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
//import java.util.stream.Collectors;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//@SpringBootTest
//@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
//public class UserDAOTest {
//
//    @Autowired
//    private UserDAO userDAO;
//
//    private static final Logger log = LoggerFactory.getLogger(UserDAOTest.class);
//
//    private static Integer savedUserId;
//
//    @Test
//    @org.junit.jupiter.api.Order(1)
//    void testCreateUser() {
//        log.info("Testing user creation");
//        User user = new User();
//        user.setEmail("test@example.com");
//        user.setPassword("password");
//        user.setFirstName("John");
//        user.setLastName("Doe");
//
//        User savedUser = userDAO.save(user);
//        savedUserId = savedUser.getId();
//
//        assertNotNull(savedUser.getId());
//        assertEquals("test@example.com", savedUser.getEmail());
//    }
//
//    @ParameterizedTest
//    @CsvSource({
//            "john.doe@example.com, John, Doe",
//            "jane.doe@example.com, Jane, Doe",
//            "bob.smith@example.com, Bob, Smith"
//    })
//    @org.junit.jupiter.api.Order(2)
//    void testCreateMultipleUsers(String email, String firstName, String lastName) {
//        log.info("Testing user creation with parameters: {}, {}, {}", email, firstName, lastName);
//        User user = new User();
//        user.setEmail(email);
//        user.setPassword("password");
//        user.setFirstName(firstName);
//        user.setLastName(lastName);
//
//        User savedUser = userDAO.save(user);
//        assertNotNull(savedUser.getId());
//        assertEquals(email, savedUser.getEmail());
//    }
//
//    @Test
//    @org.junit.jupiter.api.Order(3)
//    void testStreamOperations() {
//        log.info("Testing stream operations on users");
//        List<User> users = userDAO.findAll();
//
//        // Using lambda and streams to filter and map users
//        List<String> userEmails = users.stream()
//                .filter(user -> user.getLastName().equals("Doe"))
//                .map(User::getEmail)
//                .collect(Collectors.toList());
//
//        log.info("Doe family emails: {}", userEmails);
//        assertFalse(userEmails.isEmpty());
//    }
//
////    @Test
////    @org.junit.jupiter.api.Order(4)
////    void testDeleteUser() {
////        log.info("Testing user deletion");
////        userDAO.deleteById(savedUserId);
////        Optional<User> deletedUser = userDAO.findById(savedUserId);
////        assertTrue(deletedUser.isEmpty());
////    }
//}
