
package com.ui.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ui.dao.SubCategoryDAO;

import com.ui.model.SubCategory;

public class SubCategoryDAOImpl implements SubCategoryDAO{

	@Autowired
    private DataSource dataSource;
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    JdbcTemplate jdbcTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanDAOImpl.class);
    
	@Override
	public String addSubCategory(SubCategory m) {
		// TODO Auto-generated method stub
		logger.info("***** Add Sub Category DAO Impl*****");
	       String sql = "insert into subcategory (category_id,sub_category_code,sub_category_name,sub_category_desc,status,created_by,ip_address) values (?,?,?,?,?,?,?)";

	       Connection conn = null;
	       
	       try
	       {
	   
	       	conn = dataSource.getConnection();
	           PreparedStatement ps = conn.prepareStatement(sql);
	          
	         
	           ps.setInt(1, m.getCategory_id());  
	           ps.setString(2, m.getSub_category_code());
				ps.setString(3, m.getSub_category_name());
				ps.setString(4, m.getSub_category_desc());
				ps.setString(5, m.getStatus());
				ps.setInt(6, m.getCreatedBy());
				ps.setString(7, m.getIpAddress());
					

	         
	           ps.executeUpdate();
	       }
	       catch (SQLException e)
	       {
	           throw new RuntimeException(e);
	       }
	       finally
	       {
	           if (conn != null)
	           {
	               try
	               {
	                   conn.close();
	               }
	               catch (SQLException e) {}
	           }
	       }
	       return "Success";
	   }

	@Override
	public List<SubCategory> getAllSubCategory() {
		  logger.info("+++++ getAllSubCategory NAME +++++");
		  
		    List<SubCategory> mmp = new ArrayList<SubCategory>();
		    String s = "y";
		    String sql = "SELECT  cc.category_id ,cc.category_name ,sc.sub_category_id ,sub_category_code,sub_category_name,sub_category_desc\n" + 
		    		" FROM subcategory sc\n" + 
		    		" left join category cc\n" + 
		    		" on cc.category_id =  sc.category_id  where sc.status=? ";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, s);
		        SubCategory m = null;
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            m = new SubCategory();
		            
		            m.setCategory_id(rs.getInt("category_id"));
		            m.setSub_category_id(rs.getInt("sub_category_id"));
		            m.setCategory_name(rs.getString("category_name"));
		            m.setSub_category_code(rs.getString("sub_category_code"));
		            m.setSub_category_name(rs.getString("sub_category_name"));
		            m.setSub_category_desc(rs.getString("sub_category_desc"));
		          
		       
		            mmp.add(m);
		        }
		        rs.close();
		        ps.close();
		        return mmp;
		    } catch (SQLException e) {
		        throw new RuntimeException(e);
		    } finally {
		        if (conn != null) {
		            try {
		                conn.close();
		            } catch (SQLException e) {
		            }
		        }
		    }
		  }

	@Override
	public SubCategory getSubCategoryById(int sub_category_id) {
		SubCategory m = null;
		String sql = "SELECT  cc.category_id, cc.category_name ,sub_category_id ,sub_category_code,sub_category_name,sub_category_desc\n" + 
				"FROM subcategory sc left join category cc on  cc.category_id = sc.category_id\n" + 
				"where sub_category_id=?";
		
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, sub_category_id);
			ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			m = new SubCategory();
			
			
			   	m.setCategory_id(rs.getInt("category_id"));
			   	m.setCategory_name(rs.getString("category_name"));
			 	m.setSub_category_id(rs.getInt("sub_category_id"));
	            m.setSub_category_code(rs.getString("sub_category_code"));
	            m.setSub_category_name(rs.getString("sub_category_name"));
	            m.setSub_category_desc(rs.getString("sub_category_desc"));
	          
		
		}
		rs.close();
		ps.close();
		
		return m;
	} 
		catch (SQLException e) {
		
			throw new RuntimeException(e);
		} 
			finally {
		if (conn != null) {
			try {
					conn.close();
				} catch (SQLException e) {
			}
		  }
		}

	}

	@Override
	public String editSubCategory(SubCategory m) {
		 logger.info("+++++ editSubCategory +++++");
		 String sql = "update subcategory set category_id=? ,sub_category_code=?, sub_category_name=?, sub_category_desc=?, status=?, created_by=?, ip_address=?  where sub_category_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        

		        	ps.setInt(1, m.getCategory_id());  
		           ps.setString(2, m.getSub_category_code());
					ps.setString(3, m.getSub_category_name());
					ps.setString(4, m.getSub_category_desc());
					ps.setString(5, m.getStatus());
					ps.setInt(6, m.getCreatedBy());
					ps.setString(7, m.getIpAddress());
					ps.setInt(8, m.getSub_category_id()); 	

		        ps.executeUpdate();
		        return "Success";
		    } catch (SQLException e) {
		        return "Data not updated!";
		    } finally {
		        if (conn != null) {
		            try {
		                conn.close();
		            } catch (SQLException e) {
		            }
		        }
		    }
		  }
	

	@Override
	public void deleteSubCategory(int sub_category_id) {
		  logger.info("+++++ deleteSubCategory +++++");
		    String status = "n";
		    String sql = "update subcategory set status=? where sub_category_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, status);
		        ps.setInt(2, sub_category_id);
		        ps.executeUpdate();
		    } catch (SQLException e) {
		        throw new RuntimeException(e);
		    } finally {
		        if (conn != null) {
		            try {
		                conn.close();
		            } catch (SQLException e) {
		            }
		        }
		    }
		    
		  }
	@Override
	public List<SubCategory> getSubCategoryByPage(int pagesize, int startindex) {
		// TODO Auto-generated method stub
		return null;
	}


}
