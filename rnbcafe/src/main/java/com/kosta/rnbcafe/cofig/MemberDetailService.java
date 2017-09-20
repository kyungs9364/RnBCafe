package com.kosta.rnbcafe.cofig;

import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kosta.rnbcafe.member.dao.MemberDao;
import com.kosta.rnbcafe.member.dto.LoginUser;
import com.kosta.rnbcafe.member.dto.MemberDto;


@Service
public class MemberDetailService implements UserDetailsService {
	private static final Logger l = LoggerFactory.getLogger(MemberDetailService.class);
	
	@Autowired
	private MemberDao dao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDto memberDto = dao.select(username);
		LoginUser user = null;
		if (memberDto == null) {
			throw new UsernameNotFoundException("UsernameNotFound [" + username + "]");
		}
		user = createUser(memberDto);
		return  user;
	}
	
	private LoginUser createUser(MemberDto memberDto) {
        LoginUser loginUser = new LoginUser(memberDto);
        l.info("LoginUser == "+ loginUser.toString());
        if (loginUser.getRole()== 4) {
            loginUser.setRoles(Arrays.asList("ROLE_ADMIN"));
        } else {
            loginUser.setRoles(Arrays.asList("ROLE_USER"));
        }
        return loginUser;
    }

}
