package com.luo;
import java.util.List;
import java.sql.*;
import java.util.ArrayList;

import com.luo.util.*;
//数据访问层
//实现访问数据库的数据
public class CategoryDAO {
	public static void save(Category c){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DB.getConnection();
			String sql = "insert into category values(null,?,?,?,?,?)";
			pstmt = DB.getPreparedStatement(conn, sql);
			pstmt.setString(1, c.getName());
			System.out.println(c.getName());
			pstmt.setString(2, c.getDescr());
			pstmt.setInt(3, c.getPid());
			pstmt.setInt(4, c.isLeaf()?0:1);
			pstmt.setInt(5, c.getGrade());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeStatement(pstmt);
			DB.closeConnection(conn);
		}
		
	}
	public static void getCategories(List<Category> list,int id){
		Connection conn = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConnection();
			String sql = "select * from category where pid = "+id;
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setPid(rs.getInt("pid"));
				c.setLeaf(rs.getInt("isleaf") ==0?true:false);
				c.setGrade(rs.getInt("grade"));
				list.add(c);
				if(!c.isLeaf()){
					getCategories(list, c.getId());
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			DB.closeConnection(conn);
		}
	}
	
	public static void addChildCategory(int pid ,String name, String descr) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			boolean status = conn.getAutoCommit();
			conn.setAutoCommit(false);
			String gradeSql = "select * from category where id ="+pid;
			rs = DB.executeQuery(conn, gradeSql);
			rs.next();
			int grade = rs.getInt("grade");
			String sql = "insert into category values(null,?,?,?,?,?)";
			pstmt = DB.getPreparedStatement(conn, sql);
			pstmt.setString(1, name);
			pstmt.setString(2, descr);
			pstmt.setInt(3, pid);
			pstmt.setInt(4, 0);
			pstmt.setInt(5,grade+1 );
			pstmt.executeUpdate();
			//更新父节点非叶子节点
			DB.executeUpdate(conn,"update category set isleaf = 1 where id="+pid);
			conn.commit();
			conn.setAutoCommit(status);
		} catch (SQLException e) {
			try {
				conn.rollback();//事务回滚
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			DB.closeStatement(pstmt);
			DB.closeConnection(conn);
		}
		
	}
	
	public static void deleteCategory(int id, int pid) {
		// TODO Auto-generated method stub
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			boolean status = conn.getAutoCommit();
			conn.setAutoCommit(false);
			rs = DB.executeQuery(conn, "select * from category where pid="+id);
			while(rs.next()){
				deleteCategory(rs.getInt("id"),rs.getInt("pid"));
			}
			String deleteSql ="delete  from category where id ="+id;
			DB.executeUpdate(conn, deleteSql);
			rs = DB.executeQuery(conn, "select count(*) from category where pid="+pid);
			int count =0;
			if(rs.next()){
				count = rs.getInt(1);
			}
			if(count == 0){
			String updateSql = "update category set isleaf=0 where pid ="+pid;
			//更新父节点非叶子节点
			DB.executeUpdate(conn,updateSql);
			}
			conn.commit();
			conn.setAutoCommit(status);
		} catch (SQLException e) {
			try {
				conn.rollback();//事务回滚
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			DB.closeConnection(conn);
		}
		
	}
}
