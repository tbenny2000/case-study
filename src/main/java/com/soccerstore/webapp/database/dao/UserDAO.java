package com.soccerstore.webapp.database.dao;

import com.soccerstore.webapp.database.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserDAO extends JpaRepository<User, Long> {

    User findByEmail(String email);
    User save(User user);

    User findByEmailIgnoreCase(String email);


    @Query("select u from User u where u.firstName = :firstName")
    List<User> findByFirstName(String firstName);

    List<User> findByLastName(String lastName);

    // Corrected method name to match entity field names
    List<User> findByFirstNameAndLastNameOrderByIdDesc(String firstName, String lastName);

    String id(Integer id);
    List<User> findByFirstNameContainingIgnoreCase(String firstName);
    User findById(Integer id);
}
