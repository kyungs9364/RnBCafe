package com.kosta.rnbcafe.cofig;

import java.util.Arrays;

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
	
	@Autowired
	private MemberDao dao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDto memberDto = dao.select(username);
		if (memberDto == null) {
			throw new UsernameNotFoundException("UsernameNotFound [" + username + "]");
		}
		LoginUser user = createUser(memberDto);
		return  user;
	}
	
	private LoginUser createUser(MemberDto memberDto) {
        LoginUser loginUser = new LoginUser(memberDto);
        if (loginUser.getRole()== 1) {
            loginUser.setRoles(Arrays.asList("ROLE_ADMIN"));
        } else {
            loginUser.setRoles(Arrays.asList("ROLE_USER"));
        }
        return loginUser;
    }

}
