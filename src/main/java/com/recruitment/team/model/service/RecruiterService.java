package com.recruitment.team.model.service;

import javax.persistence.*;

import com.recruitment.model.entity.Recruiter;



public class RecruiterService {

	private EntityManager em;

	public RecruiterService(EntityManager em) {
		this.em = em;
	}

	public Recruiter login(String email,String pass) throws NoResultException{
	   TypedQuery<Recruiter> query=em.createQuery("SELECT u FROM Recruiter u WHERE u.email= :email AND u.password= :pass",Recruiter.class);
	   query.setParameter("email", email);
	   query.setParameter("pass", pass);
	   return query.getSingleResult();
   }

	public Recruiter findById(int id) {
		return em.find(Recruiter.class, id);
	}
}
