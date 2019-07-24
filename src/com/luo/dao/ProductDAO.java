package com.luo.dao;

import java.util.Date;
import java.util.List;

import com.luo.Product;

public interface ProductDAO {
	public List<Product> getProducts();
	
	//获取商品并分页
	public List<Product> getProducts(int pageNo,int pageSize);
	//商品的查询
	public int findProducts(List<Product> list,int[] categoryId, String keyword,
									double lowNormalPrice, double highNormalPrice,
									double lowMemberPrice, double highMemberPrice,
									Date startDate, Date endDate, 
									int pageNo, int pageSize);

	
	public List<Product> findProducts(String name);
	
	//删除产品
	public boolean deleteProductByCategoryId(int categoryId);
	
	//更新产品
	public boolean updateProduct(Product p);
	
	public boolean addProduct(Product p);

	public int getProducts(List<Product> list, int pageNo, int pageSize);

	public List<Product> getRecentProducts(int count);

	public Product loadById(int id);


	
	
}
