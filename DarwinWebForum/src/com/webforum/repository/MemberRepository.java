package com.webforum.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.webforum.model.Member;

public interface MemberRepository extends PagingAndSortingRepository<Member, Integer>{
	
	@Query(value="SELECT m FROM Member m WHERE m.name LIKE '%' || : keyword || '%'" 
				+ " OR m.email LIKE '%' || : keyword || '%'"
				+ " OR m.address LIKE '%' || :keyword || '%'")
	public List<Member> searchMember(@Param("keyword") String keyword);
}
