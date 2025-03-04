package com.soccerstore.webapp.controller;

import com.soccerstore.webapp.database.dao.ProductDAO;
import com.soccerstore.webapp.database.entity.Product;
import com.soccerstore.webapp.form.CreateProductFormBean;
import com.soccerstore.webapp.security.FileUploadUtil;
import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.*;

@Controller
public class ProductController {

    @Autowired
    private FileUploadUtil fileUploadUtil;
    Logger log = LoggerFactory.getLogger(ProductController.class);

    @Autowired
    private ProductDAO productDAO;

    // ============= PRODUCT CREATE ================
    @GetMapping("/product/create")
    public ModelAndView createProduct(@RequestParam(required = false) Integer id) {
        ModelAndView response = new ModelAndView("product/create");

        // Add list of categories
        List<String> categories = Arrays.asList(
                "Balls",
                "Cleats",
                "Jerseys",
                "Shin Guards",
                "Goalkeeper Gear",
                "Training Equipment",
                "Accessories",
                "Team Uniforms",
                "Bags",
                "Protective Gear"
        );
        response.addObject("categories", categories);

        if (id != null) {
            Product product = productDAO.findById(id)
                    .orElseThrow(() -> new RuntimeException("Product not found with id: " + id));

            CreateProductFormBean form = new CreateProductFormBean();
            form.setId(product.getId());
            form.setName(product.getName());
            form.setDescription(product.getDescription());
            form.setPrice(product.getPrice());
            form.setImageUrl(product.getImageUrl());
            form.setCategory(product.getCategory());
            form.setStockQuantity(product.getStockQuantity());

            response.addObject("form", form);
        }
        return response;
    }

    // ================ PRODUCT CREATE SUBMIT =============
    @PostMapping("/product/createSubmit")
    public ModelAndView createSubmit(@Valid CreateProductFormBean form, BindingResult bindingResult) {
        ModelAndView response = new ModelAndView();

        if (bindingResult.hasErrors()) {
            response.setViewName("product/create");
            response.addObject("form", form);
            response.addObject("bindingResult", bindingResult);
            return response;
        }

        try {
            // Handle file upload if a file was provided
            if (form.getImageFile() != null && !form.getImageFile().isEmpty()) {
                String imageUrl = fileUploadUtil.saveFile(form.getImageFile());
                form.setImageUrl(imageUrl);
            }

            // Check if the product exists for an update
            Product product;
            if (form.getId() != null) {
                product = productDAO.findById(form.getId())
                        .orElseThrow(() -> new RuntimeException("Product not found with id: " + form.getId()));
            } else {
                product = new Product(); // Create a new product if no ID is provided
            }

            // Update or set product details
            product.setName(form.getName());
            product.setDescription(form.getDescription());
            product.setPrice(form.getPrice());
            product.setCategory(form.getCategory());
            product.setStockQuantity(form.getStockQuantity());
            product.setImageUrl(form.getImageUrl());

            // Save the product
            productDAO.save(product);

            response.setViewName("redirect:/product/search");

        } catch (IOException e) {
            // Handle file upload error
            response.setViewName("product/create");
            response.addObject("form", form);
            response.addObject("errorMessage", "Failed to upload image: " + e.getMessage());
        }

        return response;
    }

    // ============= DELETE PRODUCT ================
    @GetMapping("/product/delete/{id}")
    public ModelAndView deleteProduct(@PathVariable Integer id) {
        ModelAndView response = new ModelAndView("redirect:/product/search");

        // Find the product by ID
        Product product = productDAO.findProductById(id);

        if (product != null) {
            // Delete the product
            productDAO.delete(product);
        } else {
            // Add error message if product not found
            response.addObject("errorMessage", "Product not found with ID: " + id);
        }

        return response;
    }

    // ============= PRODUCT SEARCH ================
//    @GetMapping("/product/search")
//    public ModelAndView search(@RequestParam(required = false) String search,
//                               @RequestParam(required = false) String price) {
//        ModelAndView response = new ModelAndView("product/search");
//
//        List<Product> products;
//        if (search != null && !search.trim().isEmpty()) {
//            products = productDAO.findByNameContainingIgnoreCase(search);
//        } else {
//            products = productDAO.findAll();
//        }
//
//        //log.debug("Before sorting - Number of products: " + products.size());
//        //log.debug("Price sort parameter: " + price);
//
//        // Convert list to ArrayList if it isn't already
//        products = new ArrayList<>(products);
//
//        // Sort products by price
//        if ("low_to_high".equals(price)) {
//            products.sort(Comparator.comparingDouble(Product::getPrice));
//            //log.debug("Sorting low to high");
//        } else if ("high_to_low".equals(price)) {
//            products.sort((p1, p2) -> Double.compare(p2.getPrice(), p1.getPrice()));
//            //log.debug("Sorting high to low");
//        }
//
//        // Log all products prices for debugging
//        for (Product p : products) {
//            //log.debug("Product: " + p.getName() + " - Price: " + p.getPrice());
//        }
//
//        response.addObject("products", products);
//        response.addObject("search", search);
//
//        return response;
//    }

    @GetMapping("/product/search")
    public ModelAndView search(@RequestParam(required = false) String search,
                               @RequestParam(required = false) String price,
                               @RequestParam(required = false) String sort) {
        ModelAndView response = new ModelAndView("product/search");

        List<Product> products;
        if (search != null && !search.trim().isEmpty()) {
            products = productDAO.findByNameContainingIgnoreCase(search);
        } else {
            products = productDAO.findAll();
        }

        // Convert list to ArrayList if it isn't already
        products = new ArrayList<>(products);

        // Sort products based on parameter
        switch (sort != null ? sort : "") {
            case "name_asc":
                products.sort(Comparator.comparing(Product::getName));
                break;
            case "name_desc":
                products.sort(Comparator.comparing(Product::getName).reversed());
                break;
            case "price_low_to_high":
                products.sort(Comparator.comparingDouble(Product::getPrice));
                break;
            case "price_high_to_low":
                products.sort((p1, p2) -> Double.compare(p2.getPrice(), p1.getPrice()));
                break;
        }

        response.addObject("products", products);
        response.addObject("search", search);

        return response;
    }

    // ============= EDIT PRODUCT ==============
    @GetMapping("/product/edit/{id}")
    public ModelAndView editProduct(@PathVariable Integer id) {
        ModelAndView response = new ModelAndView("product/create");

        // Add list of categories
        List<String> categories = Arrays.asList(
                "Balls",
                "Cleats",
                "Jerseys",
                "Shin Guards",
                "Goalkeeper Gear",
                "Training Equipment",
                "Accessories",
                "Team Uniforms",
                "Bags",
                "Protective Gear"
        );
        response.addObject("categories", categories);

        // Using Optional
        Optional<Product> productOptional = productDAO.findById(id);
        if (productOptional.isEmpty()) {
            response.setViewName("redirect:/product/search");
            return response;
        }

        Product product = productOptional.get();
        CreateProductFormBean form = new CreateProductFormBean();
        form.setId(product.getId());
        form.setName(product.getName());
        form.setDescription(product.getDescription());
        form.setPrice(product.getPrice());
        form.setCategory(product.getCategory());
        form.setStockQuantity(product.getStockQuantity());
        form.setImageUrl(product.getImageUrl());

        response.addObject("form", form);
        return response;
    }

}
