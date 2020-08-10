package com.ui.dao;

import java.util.List;

import com.ui.model.Type;

public interface TypeDAO {
	
	
	public String addType(Type m);
	 List<Type> getAllType();
	 Type getTypeById(int type_id);
	 String editType(Type m);
	  void deleteTypey(int type_id);
	  List<Type> getTypeByPage(int pagesize, int startindex);

}
