package com.g9.workshop.g9_workshop.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfiguration {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
        // None using csrf protection
        httpSecurity.csrf().disable();

        httpSecurity.authorizeRequests()
                .antMatchers("/mypage/*").hasAnyRole("USER", "ADMIN")
                .antMatchers("/admin/login", "/admin/register", "/admin/regiSucess").permitAll()
                .antMatchers("/admin/*").hasRole("ADMIN")
                .anyRequest().permitAll()

                // 로그인/아웃에 대한 부분
                .and()
                .formLogin().loginPage("/user/login")
                .failureUrl("/user/login?fail=true")
                .loginProcessingUrl("/login")
                .successHandler(new CustomAuthenticationSuccessHandler())
                .and()
                .logout()
                .logoutUrl("/user/logout")
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true)

                .and()
                .formLogin().loginPage("/admin/login")
                .failureUrl("/admin/login?fail=true")
                .loginProcessingUrl("/login")
                .successHandler(new CustomAuthenticationSuccessHandler())
                .and()
                .logout()
                .logoutUrl("/admin/logout")
                .logoutSuccessUrl("/admin/login")
                .invalidateHttpSession(true);

        return httpSecurity.build();

    }

    @Bean
    public BCryptPasswordEncoder encoderPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
