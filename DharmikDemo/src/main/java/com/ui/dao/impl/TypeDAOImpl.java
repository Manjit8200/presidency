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

import com.ui.dao.TypeDAO;
import com.ui.model.SubCategory;
import com.ui.model.Type;

public class TypeDAOImpl implements TypeDAO {

	
	@Autowired
    private DataSource dataSource;
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    JdbcTemplate jdbcTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanDAOImpl.class);
   
    
	@Override
	public String addType(Type m) {
		 logger.info("***** Add Type DAO Impl*****");
	       String sql = "insert into type (category_id,sub_category_id,type_code,type_name,type_desc,status,created_by,ip_address) values (?,?,?,?,?,?,?,?)";

	       Connection conn = null;
	       
	       try
	       {
	   
	       	conn = dataSource.getConnection();
	           PreparedStatement ps = conn.prepareStatement(sql);
	          
	         
	            ps.setInt(1, m.getCategory_id());  
	            ps.setInt(2, m.getSub_category_id());
				ps.setString(3, m.getType_code());
				ps.setString(4, m.getType_name());
				ps.setString(5, m.getType_desc());
				ps.setString(6, m.getStatus());
				ps.setInt(7, m.getCreatedBy());
				ps.setString(8, m.getIpAddress());
					

	         
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
	public List<Type> getAllType() {
		  logger.info("+++++ getAllType NAME +++++");
		  
		    List<Type> mmp = new ArrayList<Type>();
		    String s = "y";
		    String sql = "select category_id,type_id,sub_category_id,type_code,type_name,type_desc from type where status=? ";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, s);
		        Type m = null;
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            m = new Type();
		            
		            m.setCategory_id(rs.getInt("category_id"));
		            m.setSub_category_id(rs.getInt("sub_category_id"));
		            m.setType_id(rs.getInt("type_id"));
		            m.setType_code(rs.getString("type_code"));
		            m.setType_name(rs.getString("type_name"));
		            m.setType_desc(rs.getString("type_desc"));
		            
		         
		          
		       
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
	public Type getTypeById(int type_id) {
		Type m = null;
		String sql = "SELECT  category_id ,sub_category_id ,type_id ,type_code,type_name,type_desc FROM type where type_id=?";
		
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, type_id);
			ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			m = new Type();
			
			
			   	m.setCategory_id(rs.getInt("category_id"));
			 	m.setSub_category_id(rs.getInt("sub_category_id"));
			 	  m.setType_id(rs.getInt("type_id"));
			 	  m.setType_code(rs.getString("type_code"));
		            m.setType_name(rs.getString("type_name"));
		            m.setType_desc(rs.getString("type_desc"));
		
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
	public String editType(Type m) {
		 logger.info("+++++ editType +++++");
		 String sql = "update type set category_id=? ,sub_category_id=?,type_code=?, type_name=?, type_desc=?, status=?, created_by=?, ip_address=?  where type_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        

		        ps.setInt(1, m.getCategory_id());  
	            ps.setInt(2, m.getSub_category_id());
				ps.setString(3, m.getType_code());
				ps.setString(4, m.getType_name());
				ps.setString(5, m.getType_desc());
				ps.setString(6, m.getStatus());
				ps.setInt(7, m.getCreatedBy());
				ps.setString(8, m.getIpAddress());	
				 ps.setInt(9, m.getType_id());

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
	public void deleteTypey(int type_id) {
		 logger.info("+++++ deleteSubCategory +++++");
		    String status = "n";
		    String sql = "update type set status=? where type_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, status);
		        ps.setInt(2, type_id);
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
	public List<Type> getTypeByPage(int pagesize, int startindex) {
		// TODO Auto-generated method stub
		return null;
	}

}
