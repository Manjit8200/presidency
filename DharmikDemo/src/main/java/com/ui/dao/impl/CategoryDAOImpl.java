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

import com.ui.dao.CategoryDAO;
import com.ui.model.Category;
import com.ui.model.Location;

public class CategoryDAOImpl implements CategoryDAO{
	
	@Autowired
    private DataSource dataSource;
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    JdbcTemplate jdbcTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanDAOImpl.class);
    
	@Override
	public String addCategory(Category m) {
		 logger.info("***** Add Category DAO Impl*****");
	       String sql = "insert into category (category_code,category_name,category_desc,status,created_by,ip_address) values (?,?,?,?,?,?)";

	       Connection conn = null;
	       
	       try
	       {
	   
	       	conn = dataSource.getConnection();
	           PreparedStatement ps = conn.prepareStatement(sql);
	          
	         
	           ps.setString(1, m.getCategory_code());  
	           ps.setString(2, m.getCategory_name());
				ps.setString(3, m.getCategory_desc());
		
				ps.setString(4, m.getStatus());
					ps.setInt(5, m.getCreatedBy());
					ps.setString(6, m.getIpAddress());
					

	         
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
	public List<Category> getAllCategory() {

			  logger.info("+++++ GET Location NAME +++++");
			  
			    List<Category> mmp = new ArrayList<Category>();
			    String s = "y";
			    String sql = "select category_id ,category_code,category_name,category_desc from category where status=? ";
			    Connection conn = null;
			    try {
			        conn = dataSource.getConnection();
			        PreparedStatement ps = conn.prepareStatement(sql);
			        ps.setString(1, s);
			        Category m = null;
			        ResultSet rs = ps.executeQuery();
			        while (rs.next()) {
			            m = new Category();
			            
			            m.setCategory_id(rs.getInt("category_id"));
			            m.setCategory_code(rs.getString("category_code"));
			            m.setCategory_name(rs.getString("category_name"));
			            m.setCategory_desc(rs.getString("category_desc"));
			          
			       
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
	public String editCategory(Category m) {
		 logger.info("+++++ EDIT Location +++++");
		    String sql = "update category set category_code=?, category_name=?, category_desc=?, status=?, created_by=?, ip_address=?  where category_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        

		        ps.setString(1, m.getCategory_code());  
		           ps.setString(2, m.getCategory_name());
					ps.setString(3, m.getCategory_desc());
			
					ps.setString(4, m.getStatus());
						ps.setInt(5, m.getCreatedBy());
						ps.setString(6, m.getIpAddress());
						ps.setInt(7, m.getCategory_id());
						

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
	public void deleteCategory(int category_id) {

			  logger.info("+++++ DELETE MemberPlan +++++");
			    String status = "n";
			    String sql = "update category set status=? where category_id=?";
			    Connection conn = null;
			    try {
			        conn = dataSource.getConnection();
			        PreparedStatement ps = conn.prepareStatement(sql);
			        ps.setString(1, status);
			        ps.setInt(2, category_id);
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
	public List<Category> getLocationByPage(int pagesize, int startindex) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Category getCategoryById(int category_id) {
		Category m = null;
		String sql = "SELECT  category_id ,category_code,category_name,category_desc FROM category where category_id=?";
		
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, category_id);
			ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			m = new Category();
			
			
			m.setCategory_id(rs.getInt("category_id"));
            m.setCategory_code(rs.getString("category_code"));
            m.setCategory_name(rs.getString("category_name"));
            m.setCategory_desc(rs.getString("category_desc"));
          
		
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

}
