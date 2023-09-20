package com.example.ormsample;

import java.util.List;

public interface IDao {

	List<Employee> getAllEmployees();

	void persist(Employee e);

}
