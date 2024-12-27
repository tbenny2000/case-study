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

    // incoming to this method is the username that the person typed into the login form
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // first we load the user from the database
        User user = userDAO.findByEmailIgnoreCase(username);

        // if the user was not found then we get out of here immediately because its a bad login
        if (user == null) {
            // this is not good practice to log off usernames
            throw new UsernameNotFoundException("Username '" + username + "' not found in database");
        }

        // spring security configs for account management
        boolean accountIsEnabled = true;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;

        // load the user roles from our database
        List<UserRole> userRoles = userRoleDAO.findByUserId(user.getId());

        // convert our user roles into spring granted authorities
        List<GrantedAuthority> springRoles = buildGrantAuthorities(userRoles);

        // the person logged into the application is called the principal
        return new org.springframework.security.core.userdetails.User(user.getEmail(),
                user.getPassword(),
                accountIsEnabled,
                accountNonExpired,
                credentialsNonExpired,
                accountNonLocked,
                springRoles);
    }

    public List<GrantedAuthority> buildGrantAuthorities(List<UserRole> userRoles) {
        // first we create an empty list of spring granted authorities
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

        // loop over our user roles from the database
        for (UserRole role : userRoles) {
            // create a new simple granted authority for each user role in the databse
            SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role.getRoleName());
            authorities.add(authority);
        }

        return authorities;
    }
}

