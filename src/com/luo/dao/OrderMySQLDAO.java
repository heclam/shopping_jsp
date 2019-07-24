package com.luo.dao;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import com.luo.Cart;
import com.luo.CartItem;
import com.luo.Product;
import com.luo.SalesItem;
import com.luo.SalesOrder;
import com.luo.User;
import com.luo.util.DB;

public class OrderMySQLDAO {

	public void save(SalesOrder so) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsKey = null;
		
		try {
			conn = DB.getConnection();
			boolean flag = conn.getAutoCommit();
			conn.setAutoCommit(false);//添加事务处理
			String sql = "insert into salesorder values(null,?,?,?,?)";
			pstmt = DB.getPreparedStatement(conn, sql,true);
			pstmt.setInt(1, so.getUser().getId());
			pstmt.setString(2, so.getAddr());
			pstmt.setTimestamp(3, so.getOdate());
			pstmt.setInt(4,so.getStatus());
			pstmt.executeUpdate();
			rsKey = pstmt.getGeneratedKeys();
			rsKey.next();
			int key = rsKey.getInt(1);
			
			String sqlItem  = "insert into salesitem values(null,?,?,?,?)";
			pstmt = DB.getPreparedStatement(conn, sqlItem);
			Cart cart = so.getCart();
			List<CartItem> items = cart.getItems();
			for(int i = 0;i<items.size();i++){
				CartItem ci = items.get(i);
				pstmt.setInt(1, ci.getProductid());
				pstmt.setDouble(2, ci.getPrice());
				pstmt.setInt(3, ci.getCount());
				pstmt.setInt(4, key);
				pstmt.addBatch();//批处理
			}
			pstmt.executeBatch();
			conn.commit();//事务处理
			conn.setAutoCommit(flag);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				conn.setAutoCommit(true);
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally {
			DB.closeResultSet(rsKey);
			DB.closeStatement(pstmt);
			DB.closeConnection(conn);
		}
	}

	public int getOrders(List<SalesOrder> list, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		int pageCount = 0;
		try {
			conn = DB.getConnection();
			rsCount = DB.executeQuery(conn,"select count(*) from salesorder");
			rsCount.next();
			pageCount = (rsCount.getInt(1)+(pageSize-1))/pageSize;
			//一下这句if语句不符合设计模式，这里业务处理层
			//if(pageNo > pageCount) pageNo = pageCount;
			
			String sql ="select salesorder.id,salesorder.userid,salesorder.addr,salesorder.odate,salesorder.status,"+
					"ruser.id uid,ruser.username username,ruser.password password,ruser.phone phone,ruser.addr uaddr,ruser.rdate rdate "+
					" from salesorder join ruser on (salesorder.userid=ruser.id) "+
					" limit "+(pageNo-1)*pageSize+","+pageSize;
System.out.println(sql);
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt("uid"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("uaddr"));
				u.setrDate(rs.getTimestamp("rdate"));
				
				SalesOrder so = new SalesOrder();
				so.setId(rs.getInt("id"));
				so.setAddr(rs.getString("addr"));
				so.setOdate(rs.getTimestamp("odate"));
				so.setStatus(rs.getInt("status"));
				so.setUser(u);
				
				list.add(so);
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

	public SalesOrder loadById(int id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		SalesOrder so = null;
		try {
			conn = DB.getConnection();
			String sql ="select salesorder.id,salesorder.userid,salesorder.addr,salesorder.odate,salesorder.status,"+
					"ruser.id uid,ruser.username username,ruser.password password,ruser.phone phone,ruser.addr uaddr,ruser.rdate rdate "+
					" from salesorder join ruser on (salesorder.userid=ruser.id) where salesorder.id ="+id;
System.out.println(sql);
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt("uid"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("uaddr"));
				u.setrDate(rs.getTimestamp("rdate"));
				
				so = new SalesOrder();
				so.setId(rs.getInt("id"));
				so.setAddr(rs.getString("addr"));
				so.setOdate(rs.getTimestamp("odate"));
				so.setStatus(rs.getInt("status"));
				so.setUser(u);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DB.closeResultSet(rs);
			DB.closeResultSet(rsCount);
			DB.closeConnection(conn);
		}
		return so;
	}

	public List<SalesItem> getSalesItems(SalesOrder salesOrder) {
		// TODO Auto-generated method stub
		Connection conn = null;
		ResultSet rs = null;
		List<SalesItem> list = new ArrayList<SalesItem>();
		try {
			conn = DB.getConnection();
			String sql ="select salesitem.id,salesitem.unitprice,salesitem.pcount,salesitem.orderid,"+
					"product.id pid,product.name,product.descr,product.normalprice,product.memberprice,product.pdate,product.categoryid "+
					" from salesitem join product on (salesitem.productid=product.id) "+
					"where salesitem.orderid="+salesOrder.getId();
System.out.println(sql);
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				Product p = new Product();
				p.setId(rs.getInt("pid"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryid(rs.getInt("categoryid"));
				
				SalesItem si = new SalesItem();
				si.setId(rs.getInt("id"));
				si.setProduct(p);
				si.setUnitPrice(rs.getDouble("unitprice"));
				si.setCount(rs.getInt("pcount"));
				si.setOrder(salesOrder);
				list.add(si);
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

	
}
