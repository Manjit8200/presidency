package com.ui.dao;

import java.util.List;

import com.ui.model.Category;

public interface CategoryDAO {
	
	public String addCategory(Category m);
	 List<Category> getAllCategory();
	 Category getCategoryById(int category_id);
	 String editCategory(Category m);
	  void deleteCategory(int category_id);
	  List<Category> getLocationByPage(int pagesize, int startindex);

}
