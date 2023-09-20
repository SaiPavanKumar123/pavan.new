package com.example.ormsample;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmpRepository implements IEmpRepository {

	IDao d;

	@Autowired
	public EmpRepository(IDao d) {
		this.d = d;
	}

	// private final EmpRepository employeeRepository;
	//
	// @Autowired
	// public EmpRepository(EmpRepository employeeRepository) {
	// this.employeeRepository = employeeRepository;
	// }

	public List<Employee> getAllEmployees() {

		return d.getAllEmployees();
	}

}
