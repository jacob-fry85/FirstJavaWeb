package com.webforum.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.webforum.model.Member;
import com.webforum.util.HibernateUtil;

public class MemberDao {

	public void saveMember(Member member) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the member object
			session.save(member);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	public boolean validate(String email, String password) {

		Transaction transaction = null;
		Member member = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			member = (Member) session.createQuery("FROM Member m WHERE m.email = :email").setParameter("email", email)
					.uniqueResult();

			if(member != null && member.getPassword().equals(password)) {
				return true;
			}
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return false;
	}

}
