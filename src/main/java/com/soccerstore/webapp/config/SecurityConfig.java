package com.soccerstore.webapp.config;

import com.soccerstore.webapp.security.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests((authorize) -> authorize
                .requestMatchers(
                        "/",
                        "/pub/**",
                        "/index",
                        "/login/**",
                        "/product/search",  // Allow product browsing
                        "/product/details/**", // Allow viewing product details
                        "/css/**",
                        "/js/**",
                        "/images/**"
                ).permitAll()
                // Restricted paths
                .requestMatchers("/product/create", "/product/edit/**").hasAnyAuthority("ADMIN")
                .requestMatchers("/admin/**").hasAuthority("ADMIN")
                .requestMatchers("/user/profile/**").authenticated()  // Only authenticated users can access their profile
                .requestMatchers("/checkout/**").authenticated()  // Require login for checkout
                .anyRequest().permitAll()  // Allow public access by default
        );

        http.userDetailsService(userDetailsService);

        http.formLogin(formLogin -> formLogin
                .loginPage("/login/login")
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/")
                .failureUrl("/login/login?error=true")
                .permitAll());

        http.logout(formLogout -> formLogout
                .invalidateHttpSession(true)
                .logoutUrl("/login/logout")
                .logoutSuccessUrl("/")
                .deleteCookies("username", "JSESSIONID"));

        http.headers(headers ->
                headers.frameOptions(frameOptions ->
                        frameOptions.sameOrigin()
                )
        );

        http.csrf(csrf -> csrf.disable());

        return http.build();
    }

    @Bean(name = "passwordEncoder")
    public PasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
        return authConfig.getAuthenticationManager();
    }
}