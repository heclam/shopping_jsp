package com.luo.dao;

import java.util.Date;
import java.util.List;

import com.luo.Product;

public interface ProductDAO {
	public List<Product> getProducts();
	
	//��ȡ��Ʒ����ҳ
	public List<Product> getProducts(int pageNo,int pageSize);
	//��Ʒ�Ĳ�ѯ
	public int findProducts(List<Product> list,int[] categoryId, String keyword,
									double lowNormalPrice, double highNormalPrice,
									double lowMemberPrice, double highMemberPrice,
									Date startDate, Date endDate, 
									int pageNo, int pageSize);

	
	public List<Product> findProducts(String name);
	
	//ɾ����Ʒ
	public boolean deleteProductByCategoryId(int categoryId);
	
	//���²�Ʒ
	public boolean updateProduct(Product p);
	
	public boolean addProduct(Product p);

	public int getProducts(List<Product> list, int pageNo, int pageSize);

	public List<Product> getRecentProducts(int count);

	public Product loadById(int id);


	
	
}
