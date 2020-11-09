package com.recruitment.team.model.service;

import java.util.List;

import javax.persistence.*;

import com.recruitment.model.entity.Township;







public class TownshipService {
	private EntityManager em;

	public TownshipService(EntityManager em) {
		this.em = em;
	}

	public List<Township> findAll() {
	
		TypedQuery<Township> query=em.createNamedQuery("Township.getAll", Township.class);
		List<Township> list = query.getResultList();
		return list;
	}
	public Township findById(int id) {

		return em.find(Township.class, id);
	}
}


