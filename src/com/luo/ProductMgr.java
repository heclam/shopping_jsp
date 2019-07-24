package com.luo;

import java.util.Date;
import java.util.List;

import com.luo.dao.ProductDAO;
import com.luo.dao.ProductMySQLDAO;

public class ProductMgr {
		
		private static ProductMgr pm = null;
		
		static{
			if(pm == null){
				pm = new ProductMgr();
				pm.setDao(new ProductMySQLDAO());
			}
		}
		private ProductMgr(){}
		
		public static ProductMgr getInstance(){
			return pm;
		}
		
		ProductDAO dao = null;
		
		public List<Product> getProducts(){
			return dao.getProducts();
		}
		
		public List<Product> getRecentProducts(int count){
			return dao.getRecentProducts(count);
		}
		
		//获取商品并分页
		public List<Product> getProducts(int pageNo,int pageSize){
			return dao.getProducts(pageNo, pageSize);
		}
		
		//获取商品分页并得到他的总页数
		public int getProducts(List<Product> list,int pageNo,int pageSize){
			return dao.getProducts(list,pageNo,pageSize);
		}
		
		//商品的查询
		public int findProducts(List<Product> list,int []categoryId,
											String keyword,
											double lowNormalPrice,
											double highNormalPrice,
											double lowMemberPrice,
											double highMemberPrice,
											Date startDate,
											Date endDate,
											int pageNo,
											int pageSize){
			return dao.findProducts(list,categoryId, keyword, lowNormalPrice, 
									highNormalPrice, lowMemberPrice, highMemberPrice,
									startDate, endDate,pageNo,pageSize);
		}
		
		public List<Product> findProducts(String name){
			return null;
		}
		//根据 id查找商品
		public Product loadById(int id){
			return dao.loadById(id);
		}
		//删除产品
		public boolean deleteProductByCategoryId(int categoryId){
			return false;
		}
		
		//更新产品
		public boolean updateProduct(Product p){
			return false;
		}

		public ProductDAO getDao() {
			return dao;
		}

		public void setDao(ProductDAO dao) {
			this.dao = dao;
		}
		
		public boolean addProduct(Product p){
			return dao.addProduct(p);
		}
}
