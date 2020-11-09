package com.recruitment.team.model.service;

import java.util.List;

import javax.persistence.*;
import com.recruitment.model.entity.Company;





public class CompanyService {

	private EntityManager em;
	
	public CompanyService(EntityManager em) {
		this.em = em;
	}

	public List<Company> findAll() {

		TypedQuery<Company> query=em.createNamedQuery("Company.findAll", Company.class);
		return query.getResultList();
	}
	
	public void save(Company company) {
		em.getTransaction().begin();
		if(company.getId()==0) {
			em.persist(company);	
		}
		else {
			em.merge(company);
		}
	
		em.getTransaction().commit();
		
	}
	public Company findById(int id) {
		return em.find(Company.class, id);
	
	}
	public void delete(int id) {
		em.getTransaction().begin();
		Company company=em.find(Company.class, id);
		em.remove(company);
		em.getTransaction().commit();
		
	}


}
