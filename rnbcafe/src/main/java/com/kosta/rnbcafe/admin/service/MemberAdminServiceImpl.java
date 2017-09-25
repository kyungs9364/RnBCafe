package com.kosta.rnbcafe.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.rnbcafe.admin.dao.MemberAdminDao;
import com.kosta.rnbcafe.member.dto.MemberDto;

@Service
public class MemberAdminServiceImpl implements MemberAdminService {

	@Autowired
	private MemberAdminDao memberAdminDao;

	@Override
	public List<MemberDto> memberList() {
		return memberAdminDao.memberList();
	}

	@Override
	public void levelUp(String lvid) {
		memberAdminDao.levelUp(lvid);
	}

}
