package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Student;

public class StudentDAO {
	private Connection conn;
	
	public StudentDAO(Connection conn) {
		this.conn=conn;
		System.out.println("StudentDAO Connection:"+conn);
	}

	

	public List<Student> getAllStudents() {
	    List<Student> list = new ArrayList<>();
	    try {
	        String sql = "SELECT * FROM Student";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Student s = new Student();
	            s.setId(rs.getInt("id"));
	            s.setName(rs.getString("name"));
	            s.setRollNo(rs.getString("rollNo"));
	            s.setDepartment(rs.getString("department"));
	            s.setEmail(rs.getString("email"));
	            list.add(s);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	public Student getStudentById(int id) {
	    Student s = null;
	    try {
	        String sql = "SELECT * FROM Student WHERE id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            s = new Student();
	            s.setId(rs.getInt("id"));
	            s.setName(rs.getString("name"));
	            s.setRollNo(rs.getString("rollNo"));
	            s.setDepartment(rs.getString("department"));
	            s.setEmail(rs.getString("email"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return s;
	}


	public boolean addStudent(Student s) {
		try {
			String sql = "INSERT INTO Student (name, rollNo, department, email) VALUES (?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, s.getName());
			ps.setString(2, s.getRollNo());
			ps.setString(3, s.getDepartment());
			ps.setString(4, s.getEmail());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean updateStudent(Student s) {
	    boolean rowUpdated = false;
	    try {
	        String sql = "UPDATE Student SET name=?, rollNo=?, department=?, email=? WHERE id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, s.getName());
	        ps.setString(2, s.getRollNo());
	        ps.setString(3, s.getDepartment());
	        ps.setString(4, s.getEmail());
	        ps.setInt(5, s.getId());

	        rowUpdated = ps.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return rowUpdated;
	}
	
	
	public boolean deleteStudent(int id) {
	    boolean deleted = false;
	    try {
	        String sql = "DELETE FROM Student WHERE id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, id);
	        deleted = ps.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return deleted;
	}



}
