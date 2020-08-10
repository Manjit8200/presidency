package com.ui.dao;


import java.util.List;

import com.ui.model.SubCategory;
public interface SubCategoryDAO {

	
	public String addSubCategory(SubCategory m);
	 List<SubCategory> getAllSubCategory();
	 SubCategory getSubCategoryById(int sub_category_id);
	 String editSubCategory(SubCategory m);
	  void deleteSubCategory(int sub_category_id);
	
	  List<SubCategory> getSubCategoryByPage(int pagesize, int startindex);
}
