package com.luo.dao;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.luo.Product;
import com.luo.util.DB;

public class ProductMySQLDAO implements ProductDAO {

	@Override
	public List<Product> getProducts() {
		// TODO Auto-generated method stub
		Connection conn = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		try {
			conn = DB.getConnection();
			String sql ="select * from product";
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				Product p = new Product();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setDescr(rs.getString(3));
				p.setNormalprice(rs.getDouble(4));
				p.setMemberprice(rs.getDouble(5));
				p.setPdate(rs.getTimestamp(6));
				p.setCategoryid(rs.getInt(7));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DB.closeResultSet(rs);
			DB.closeConnection(conn);
		}
		return list;
	}

	@Override
	public List<Product> getProducts(int pageNo, int pageSize) {
		Connection conn = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		try {
			conn = DB.getConnection();
			String sql ="select * from product limit "+(pageNo-1)*pageSize+","+pageSize;
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				Product p = new Product();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setDescr(rs.getString(3));
				p.setNormalprice(rs.getDouble(4));
				p.setMemberprice(rs.getDouble(5));
				p.setPdate(rs.getTimestamp(6));
				p.setCategoryid(rs.getInt(7));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DB.closeResultSet(rs);
			DB.closeConnection(conn);
		}
		return list;
		
	}

	public int getProducts(List<Product> list, int pageNo, int pageSize){
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		int pageCount = 0;
		try {
			conn = DB.getConnection();
			rsCount = DB.executeQuery(conn,"select count(*) from product");
			rsCount.next();
			pageCount = (rsCount.getInt(1)+(pageSize-1))/pageSize;
			//一下这句if语句不符合设计模式，这里业务处理层
			//if(pageNo > pageCount) pageNo = pageCount;
			
			String sql ="select * from product limit "+(pageNo-1)*pageSize+","+pageSize;
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				Product p = new Product();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setDescr(rs.getString(3));
				p.setNormalprice(rs.getDouble(4));
				p.setMemberprice(rs.getDouble(5));
				p.setPdate(rs.getTimestamp(6));
				p.setCategoryid(rs.getInt(7));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DB.closeResultSet(rs);
			DB.closeResultSet(rsCount);
			DB.closeConnection(conn);
		}
		return pageCount;
	}
	
	@Override
	public int  findProducts(List<Product> list,int[] categoryId, String keyword, double lowNormalPrice, double highNormalPrice,
			double lowMemberPrice, double highMemberPrice, Date startDate,Date endDate, int pageNo,
			int pageSize) {
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		int  pageCount = 0;
		try {
			conn = DB.getConnection();
			String sql = "select * from product where 1=1 ";
			String strId = "";
			if(categoryId != null && categoryId.length>0){
				strId +="(";
				for(int i = 0 ;i<categoryId.length;i++){
					if(i<categoryId.length-1){
						strId += categoryId[i]+",";
					}else{
						strId += categoryId[i];
					}
				}
				strId += ")";
				sql += " and categoryid in "+strId;
			}
			if(keyword != null && !keyword.trim().equals("")){
				sql += " and name like '%"+keyword+"%' or descr like '%"+keyword+"%'";
			}
			if(lowNormalPrice>=0){
				sql += " and normalprice>"+lowNormalPrice;
			}
			if(highNormalPrice >0){
				sql += " and normalprice<"+highNormalPrice;
			}
			if(lowMemberPrice >= 0){
				sql += " and memberprice>"+lowMemberPrice;
			}
			
			if(highMemberPrice >0){
				sql += " and memberprice<"+highMemberPrice;
			}
			if( startDate != null){
				sql += " and pdate >='"+new SimpleDateFormat("YY-MM-dd").format(startDate)+"'";
			}
			if( endDate != null){
				sql += " and pdate <='"+new SimpleDateFormat("YY-MM-dd").format(endDate)+"'";
			}
			String SqlCount = sql.replaceFirst("select \\*", "select count(*)");
System.out.println("sqlCount:"+SqlCount);
			rsCount = DB.executeQuery(conn, SqlCount);
				rsCount.next();
				pageCount = (rsCount.getInt(1)+pageSize-1)/pageSize;
			
			sql += " limit "+(pageNo-1)*pageSize+","+pageSize;
System.out.println(sql);
			rs = DB.executeQuery(conn, sql);
			
				while(rs.next()){
					Product p = new Product();
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setDescr(rs.getString("descr"));
					p.setNormalprice(rs.getDouble("normalprice"));
					p.setMemberprice(rs.getDouble("memberprice"));
					p.setPdate(rs.getTimestamp("pdate"));
					p.setCategoryid(rs.getInt("categoryid"));
					list.add(p);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			DB.closeConnection(conn);
		}
		return pageCount;
	}
	
	@Override
	public List<Product> findProducts(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteProductByCategoryId(int categoryId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateProduct(Product p) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addProduct(Product p) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DB.getConnection();
			String sql ="insert into product value(null,?,?,?,?,?,?)";
			pstmt = DB.getPreparedStatement(conn, sql);
			//pstmt.setInt(1, p.getId());
			pstmt.setString(1, p.getName());
			pstmt.setString(2, p.getDescr());
			pstmt.setDouble(3, p.getMemberprice());
			pstmt.setDouble(4, p.getMemberprice());
			pstmt.setTimestamp(5, p.getPdate());
			pstmt.setInt(6, p.getCategoryid());
			pstmt.executeUpdate();		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//捕获到异常就返回false
			return false;
		}finally {
			DB.closeStatement(pstmt);
			DB.closeConnection(conn);
			
		}
		
		return true;
	}

	@Override
	public List<Product> getRecentProducts(int count) {
		List<Product> products = new ArrayList<Product>();
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			String sql = "select * from product order by pdate limit 1,"+count;
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryid(rs.getInt("categoryid"));
				products.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DB.closeResultSet(rs);
			DB.closeConnection(conn);
		}
		return products;
	}

	@Override
	public Product loadById(int id) {
		// TODO Auto-generated method stub
		Product p = null;
		Connection conn = null;
		ResultSet rs = null;
		try{
			conn = DB.getConnection();
			String sql = "select * from product where id="+id;
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryid(rs.getInt("categoryid"));
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			DB.closeResultSet(rs);
			DB.closeConnection(conn);
		}
		return p;
	}

	


}
