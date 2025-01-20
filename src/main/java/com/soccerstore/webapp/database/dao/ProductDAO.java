package com.soccerstore.webapp.database.dao;

import com.soccerstore.webapp.database.entity.Product;
import jakarta.validation.constraints.NotBlank;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface ProductDAO extends JpaRepository<Product, Integer> {
    List<Product> findByNameContainingIgnoreCase(String name);

    // Searches across multiple fields
    @Query("SELECT p FROM Product p WHERE " +
            "LOWER(p.name) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
            "LOWER(p.description) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
            "LOWER(p.category) LIKE LOWER(CONCAT('%', :searchTerm, '%'))")
    List<Product> search(@Param("searchTerm") String searchTerm);


    List<Product> findByName(@NotBlank(message = "Name is required") String name);

    Product findByCategory(@NotBlank(message = "Category is required") String category);

    @Query(value = "select * from products order by name asc;", nativeQuery = true)
    List<Product> findAllProducts();

    // Change this from findById to Optional
    Optional<Product> findById(Integer id);  // This comes from JpaRepository

    // Or create a custom method name
    Product findProductById(Integer id);     // This would be your custom method

}
