package com.g9.workshop.g9_workshop.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.configurations.PrincipalAdmin;
import com.g9.workshop.g9_workshop.configurations.PrincipalUser;
import com.g9.workshop.g9_workshop.user.dao.SharedDao;

@Service
public class LoginService implements UserDetailsService {

    @Autowired
    SharedDao sharedDao;

    @Autowired
    HttpServletRequest request;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // [GYEONG] hidden으로 파라미터를 받아서 각자 다른 로그인 쿼리 날리기
        String userType = request.getParameter("userType");
        String sqlMapId = "";

        if (userType.equals("user")) {
            sqlMapId = "LoginMapper.selectByUID";
        } else if (userType.equals("admin")) {
            sqlMapId = "LoginMapper.selectAdmin";
        } else {
            throw new UsernameNotFoundException("Invalid user type");
        }
        Object usernameObj = username;
        Map<String, String> resultMap = (Map<String, String>) sharedDao.getOne(sqlMapId, usernameObj);

        // session 등록
        if (userType.equals("user")) {
            PrincipalUser principalUser = new PrincipalUser(resultMap);
            return principalUser;
        } else if (userType.equals("admin")) {
            PrincipalAdmin principalAdmin = new PrincipalAdmin(resultMap);
            return principalAdmin;
        }

        return null;

    }
}
