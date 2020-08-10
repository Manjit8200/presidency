package com.ui.dao;

import java.util.List;


import com.ui.model.Product;

public interface ProductDAO {
	
	public String addProduct(Product m);
	public String addProductTaxData(Product m1);
	 List<Product> getAllProduct();
	 Product getProductById(int product_id);
	 String editProduct(Product m);
	  void deleteProduct(int product_id);
	  List<Product> getProductByPage(int pagesize, int startindex);
	public int getLastPr();
	
	 Product getProducTaxtById(int product_id);
	 
	 List<Product> getAllProductTax(int product_id);
	 
	 void deleteProductTax(int product_tax_id);
	 
	 

}
