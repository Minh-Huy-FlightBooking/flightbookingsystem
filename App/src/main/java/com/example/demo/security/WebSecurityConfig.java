package com.example.demo.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    private static final String PASSENGER_ROLE = "PASSENGER";
    private static final String ADMINISTRATOR_ROLE = "ADMINISTRATOR";
    private static final String EMPLOYEE_ROLE = "EMPLOYEE";

    @Autowired
    private DataSource dataSource;

    @Autowired
    AuthenticationSuccessHandlerCustom authenticationSuccessHandlerCustom;

    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
                .passwordEncoder(NoOpPasswordEncoder.getInstance())
                .dataSource(dataSource)
                .usersByUsernameQuery("SELECT username, password, enabled FROM account WHERE username=?")
                .authoritiesByUsernameQuery("SELECT a.username, r.role FROM account_role ar " +
                        " INNER JOIN account a ON a.account_id = ar.account_id" +
                        " INNER JOIN  role r ON r.role_id = ar.role_id" +
                        " WHERE a.username=?");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        http
//                .authorizeRequests()
//                    .antMatchers("/").authenticated()
//                    .antMatchers("/administrator").hasAuthority(ADMINISTRATOR_ROLE)
//                    .antMatchers("/employee").hasAuthority(EMPLOYEE_ROLE)
//                    .antMatchers("/passenger").hasAuthority(PASSENGER_ROLE)
//                    .and()
//                .formLogin()
//                    .permitAll()
//                    .successHandler(authenticationSuccessHandlerCustom)
//                    .and()
//                .logout()
//                    .permitAll()
//        ;
        http
                .authorizeRequests()
                    .antMatchers("/").permitAll()
                    .antMatchers("/admin/**").hasAuthority(ADMINISTRATOR_ROLE)
                    .antMatchers("/employee/**").hasAuthority(EMPLOYEE_ROLE)
                    .antMatchers("/passenger/**").hasAuthority(PASSENGER_ROLE)
                    .anyRequest().authenticated()
                    .and()
                .formLogin()
                    .loginPage("/login")
                    .permitAll()
                    .successHandler(authenticationSuccessHandlerCustom)
                    .and()
                .logout()
                    .permitAll()
                    .and()
                .httpBasic();
        ;
    }
}

