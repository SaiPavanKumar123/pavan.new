package com.example.ormsample;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository
public class DAO implements IDao {

	@PersistenceContext
	private EntityManager emp;

	@Override
	public void persist(Employee e) {
		emp.persist(e);
	}

	@Override
	public List<Employee> getAllEmployees() {
		return emp.createQuery("select e from pavan e").getResultList();
	}
}
