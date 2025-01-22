package com.soccerstore.webapp.database.dao;

import com.soccerstore.webapp.database.entity.UserRole;
import com.soccerstore.webapp.database.entity.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRoleDAO extends JpaRepository<UserRole, Long> {

    List<UserRole> findByUserId(Integer userId);
}
