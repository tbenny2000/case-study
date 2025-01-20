package com.soccerstore.webapp.security;

import com.soccerstore.webapp.database.dao.UserDAO;
import com.soccerstore.webapp.database.dao.UserRoleDAO;
import com.soccerstore.webapp.database.entity.User;
import com.soccerstore.webapp.database.entity.UserRole;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Component
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private UserRoleDAO userRoleDAO;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDAO.findByEmailIgnoreCase(username);

        if (user == null) {
            throw new UsernameNotFoundException("Username '" + username + "' not found in database");
        }

        boolean accountIsEnabled = true;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;

        List<UserRole> userRoles = userRoleDAO.findByUserId(user.getId());

        List<GrantedAuthority> springRoles = buildGrantAuthorities(userRoles);

        log.debug("User {} has roles: {}", username, springRoles);

        return new org.springframework.security.core.userdetails.User(user.getEmail(),
                user.getPassword(),
                accountIsEnabled,
                accountNonExpired,
                credentialsNonExpired,
                accountNonLocked,
                springRoles);
    }

    public List<GrantedAuthority> buildGrantAuthorities(List<UserRole> userRoles) {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

        for (UserRole role : userRoles) {
            SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role.getRoleName());
            authorities.add(authority);
        }

        return authorities;
    }
}
