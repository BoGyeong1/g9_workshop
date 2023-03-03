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
                // 권한 설정
                .antMatchers("/user/login").permitAll() // USER 로그인 모두 접속가능
                .antMatchers("/admin/login", "/admin/register", "/admin/regiSucess").permitAll() // admin 로그인 등록 권한 없이
                                                                                                 // 모두 접근가능
                .antMatchers("/admin/**").hasRole("ADMIN") // admin 페이지는 admin 권한 가진자만 가능
                .antMatchers("/mypage/**", "/cart/**", "/order/**").authenticated() // mypage, cart, order는 로그인한 자는 모두
                                                                                    // 접속가능
                .anyRequest().permitAll() // 다른페이지는 로그인 안한 사람도 모두 접속가능

                // 로그인/아웃에 대한 부분

                .and()
                .formLogin().loginPage("/admin/login")
                .failureUrl("/admin/login?fail=true")
                .loginProcessingUrl("/login")
                .successHandler(new CustomAuthenticationSuccessHandler())
                .and()
                .logout()
                .logoutUrl("/admin/logout")
                .logoutSuccessUrl("/admin/login")
                .invalidateHttpSession(true)

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

        ;

        return httpSecurity.build();

    }

    @Bean
    public BCryptPasswordEncoder encoderPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
