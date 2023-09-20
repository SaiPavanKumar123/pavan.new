package com.example.ormsample;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "pavan")
public class Employee {

	@Column(name = "emno")

	private Integer empNo;
	@Column(name = "dept_no")
	private Integer deptNo;
	@Column(name = "job")
	private String job;
	@Column(name = "sal")
	private Double salary;
	@Column(name = "ename")
	private String eName;

	public Employee(Integer empNo, Integer deptNo, String job, Double salary, String eName) {
		this.empNo = empNo;
		this.deptNo = deptNo;
		this.job = job;
		this.salary = salary;
		this.eName = eName;
	}

	// Getters and setters

	public Integer getEmpNo() {
		return empNo;
	}

	public void setEmpNo(Integer empNo) {
		this.empNo = empNo;
	}

	public Integer getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(Integer deptNo) {
		this.deptNo = deptNo;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	// Default constructor

	public Employee() {
	}
}
