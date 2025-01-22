package com.soccerstore.webapp.database.dao;

import com.soccerstore.webapp.database.entity.Product;
import jakarta.validation.constraints.NotBlank;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductDAO extends JpaRepository<Product, Integer> {
    @Query("SELECT p FROM Product p WHERE " +
            "LOWER(p.name) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
            "LOWER(p.description) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR " +
            "LOWER(p.category) LIKE LOWER(CONCAT('%', :searchTerm, '%'))")
    List<Product> search(@Param("searchTerm") String searchTerm);

    List<Product> findByName(String name);

    Product findByCategory(String category);

    @Query(value = "select * from products order by name asc;", nativeQuery = true)
    List<Product> findAllProducts();

    List<Product> findByNameContainingIgnoreCase(String search);

    Product findProductById(Integer id);

}
