//import org.junit.jupiter.api.ClassOrderer;
//import org.junit.jupiter.api.Test;
//import org.junit.jupiter.api.TestMethodOrder;
//import org.junit.jupiter.params.ParameterizedTest;
//import org.junit.jupiter.params.provider.ValueSource;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//@TestMethodOrder(ClassOrderer.OrderAnnotation.class)
//public class ProductDAOTest {
//
//    @Autowired
//    private ProductDAO productDAO;
//
//    @Test
//    @Order(1)
//    public void testCreateProduct() {
//        Product product = new Product("Test Shoe", 99.99);
//        Product saved = productDAO.save(product);
//        assertNotNull(saved.getId());
//    }
//
//    @ParameterizedTest
//    @ValueSource(strings = {"Nike", "Adidas", "Puma"})
//    public void testSearchProducts(String brand) {
//        List<Product> products = productDAO.findByBrand(brand);
//        assertFalse(products.isEmpty());
//    }
//
//    @Test
//    public void testStreamOperation() {
//        List<Product> products = productDAO.findAll();
//        double averagePrice = products.stream()
//                .mapToDouble(Product::getPrice)
//                .average()
//                .orElse(0.0);
//        assertTrue(averagePrice > 0);
//    }
//}
