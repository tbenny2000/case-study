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
@EnableMethodSecurity  // Changed from @EnableGlobalMethodSecurity
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
                        "/login",
                        "/login/signup",
                        "/login/login").permitAll()
                .requestMatchers("/user/**").hasAnyAuthority("ADMIN", "USER")
                .anyRequest().authenticated()
        );

        http.userDetailsService(userDetailsService);

        http.formLogin(formLogin -> formLogin
//                .loginPage("/login/login")
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