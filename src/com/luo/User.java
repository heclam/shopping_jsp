package com.luo;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import com.luo.util.*;

public class User {
	private int id;
	private String username;
	private String password;
	private String phone;
	private String addr;
	private Timestamp  rDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Timestamp getrDate() {
		return rDate;
	}
	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}
	public void save(){//��ע�����ݲ������ݿ���
		Connection conn = DB.getConnection();
		String sql = "insert into ruser values(null,?,?,?,?,?)";
		PreparedStatement pstmt = DB.getPreparedStatement(conn, sql);
		try {
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, phone);
			pstmt.setString(4, addr);
			pstmt.setTimestamp(5,rDate);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeStatement(pstmt);
			DB.closeConnection(conn);
		}
	}
	
	public  boolean userUpdate(String username,String phone,String addr){
		//����������ò����������޸ģ�ֱ��
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			String sql = "update ruser set username = ? ,phone = ?,addr = ? where id = "+this.id;
			pstmt = DB.getPreparedStatement(conn, sql);
			pstmt.setString(1, username);
			pstmt.setString(2, phone);
			pstmt.setString(3, addr);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeStatement(pstmt);
			DB.closeConnection(conn);
		}
		return false;
	}

	//����Ǹ��µĵڶ����÷��������Ĳ���Ҫ��jspҳ�����ã�����u.setUsername()
//	public  boolean userUpdate(){
//		//����������ò����������޸ģ�ֱ��
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		try {
//			conn = DB.getConnection();
//			String sql = "update ruser set username = ? ,phone = ?,addr = ? where id = "+this.id;
//			pstmt = DB.getPreparedStatement(conn, sql);
//			pstmt.setString(1, username);
//			pstmt.setString(2, phone);
//			pstmt.setString(3, addr);
//			pstmt.executeUpdate();
//			return true;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return false;
//	}
}
