package com.kosta.rnbcafe.member.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

/**
 * 스프링 시큐어리티에서 사용될 로그인객체 (관리자인지, 사용자인지)
 */

@Data
public class LoginUser implements UserDetails  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5606830803903617823L;
	
	private String id;
	private String pwd;
	private String name;
	private int gender;
	private String birth;
	private String phone;
	private int role;
	private String regdate;
	private List<String> roles;
	
    public LoginUser(MemberDto memberDto){
    	this.id = memberDto.getId();
    	this.pwd = memberDto.getPwd();
    	this.name = memberDto.getName();
    	this.gender = memberDto.getGender();
    	this.birth = memberDto.getBirth();
    	this.phone = memberDto.getPhone();
    	this.role = memberDto.getRole();
    	this.regdate = memberDto.getRegdate();
    }

	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for (String role : roles) {
            authorities.add(new SimpleGrantedAuthority(role));
        }
        return authorities;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return true;
	} 

	
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	@Override
	public boolean isEnabled() {		
		return true;
	}


	@Override
	public String getPassword() {
		return pwd;
	}


	@Override
	public String getUsername() {
		return id;
	}	
	
}
