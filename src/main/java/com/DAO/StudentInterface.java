package com.DAO;

import com.model.Student;

public interface StudentInterface {
	
	
	public boolean addStudent(Student s);
	public boolean  updateStudent(Student s);
	public boolean deleteStudent(int id);
	public Student getStudentById(int id);
	
	

}
