package com.webforum.service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.webforum.model.Member;
import com.webforum.repository.MemberRepository;

@Service
public class MemberService {
	
	@Autowired
	private MemberRepository repo;
	
	public Page<Member> listAll(int pageNumber) {
		Pageable pageable = PageRequest.of(pageNumber - 1, 5);
		return repo.findAll(pageable);
	}
	
	public void save(Member member) {
		repo.save(member);
	}
	
	public Member getMember(int id) {
		Optional<Member> result = repo.findById(id);
		return result.get();
	}
	
	public void deleteMember(int id) {
		repo.deleteById(id);
	}
	
	public List<Member> searchMember(String keyword) {
		return repo.searchMember(keyword);
	}
}
