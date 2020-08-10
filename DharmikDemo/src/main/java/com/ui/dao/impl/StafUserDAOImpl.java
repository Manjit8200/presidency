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

import com.ui.dao.StafUserDAO;
import com.ui.model.MemberFamilyRegister;
import com.ui.model.Product;
import com.ui.model.StafUser;

public class StafUserDAOImpl implements StafUserDAO{
	
	@Autowired
    private DataSource dataSource;
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    JdbcTemplate jdbcTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanDAOImpl.class);


	@Override
	public String addStafUser(StafUser m) {
		 logger.info("***** addStafUser DAO Impl*****");
	       String sql = "insert into staff_user (stafuser_type,stafuser_number,stafuser_barcode,stafuser_qrcode,"
	       		+ "stafuser_firstname,stafuser_middlename,stafuser_lastname,stafuser_country_id,"
	       		+ "stafuser_state_id,stafuser_city,pincode,stafuser_image,stafuser_mobile_no,stafuser_phone,stafuser_email,"
	       		+ "stafuser_password,location_name,status,created_by,ip_address,address_line_1,address_line_2,address_line_3) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	       Connection conn = null;
	       
	       try
	       {
	   
	       	conn = dataSource.getConnection();
	           PreparedStatement ps = conn.prepareStatement(sql);
	            
	            ps.setString(1, m.getStafuser_type());  
	            ps.setString(2, m.getStafuser_number());
				ps.setString(3, m.getStafuser_barcode());
				ps.setString(4, m.getStafuser_qrcode());
				ps.setString(5, m.getStafuser_firstname());	
				ps.setString(6, m.getStafuser_middlename());
				ps.setString(7, m.getStafuser_lastname());
				ps.setInt(8, m.getStafuser_country_id());
				ps.setInt(9, m.getStafuser_state_id());
				ps.setString(10, m.getStafuser_city());
				ps.setInt(11, m.getPincode());
				ps.setString(12, m.getStafuser_image());			
				ps.setString(13, m.getStafuser_mobile_no());
				ps.setString(14, m.getStafuser_phone());
				ps.setString(15, m.getStafuser_email());
				ps.setString(16, m.getStafuser_password());
				ps.setString(17, m.getLocation_name());

				ps.setString(18, m.getStatus());
				ps.setInt(19, m.getCreatedBy());
				ps.setString(20, m.getIpAddress());
				ps.setString(21, m.getAddress_line_1());
				ps.setString(22, m.getAddress_line_2());
				ps.setString(23, m.getAddress_line_3());
			
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
	public List<StafUser> getAllStafUser() {
		// TODO Auto-generated method stub
		  logger.info("+++++ GET ALL Master Register Member NAME +++++");
		    List<StafUser> mmp = new ArrayList<StafUser>();
		    String s = "y";
		    String sql = " SELECT * FROM staff_user where status=?";
		      
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, s);
		        StafUser m = null;
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            m = new StafUser();
		            
		        	m.setStafuser_id(rs.getInt("stafuser_id"));
					 m.setStafuser_type(rs.getString("stafuser_type"));
			            m.setStafuser_number(rs.getString("stafuser_number"));
						m.setStafuser_barcode(rs.getString("stafuser_barcode"));
					    m.setStafuser_qrcode(rs.getString("stafuser_qrcode"));
						m.setStafuser_firstname(rs.getString("stafuser_firstname"));
						m.setStafuser_middlename(rs.getString("stafuser_middlename"));
						m.setStafuser_lastname(rs.getString("stafuser_lastname"));
						m.setStafuser_country_id(rs.getInt("stafuser_country_id"));
						m.setStafuser_state_id(rs.getInt("stafuser_state_id"));
						m.setStafuser_city(rs.getString("stafuser_city"));
						m.setPincode(rs.getInt("pincode"));
						m.setStafuser_image(rs.getString("stafuser_image"));		
						m.setStafuser_mobile_no(rs.getString("stafuser_mobile_no"));
						m.setStafuser_phone(rs.getString("stafuser_phone"));
						m.setStafuser_email(rs.getString("stafuser_email"));
						 m.setStafuser_password(rs.getString("stafuser_password"));
						m.setLocation_name(rs.getString("location_name"));
						
						 m.setAddress_line_1(rs.getString("address_line_1"));
						 m.setAddress_line_2(rs.getString("address_line_2"));
						 m.setAddress_line_3(rs.getString("address_line_3"));
					
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
	public StafUser getStafUserById(int stafuser_id) {
		StafUser m = null;
		 String s = "y";
		String sql = "SELECT * FROM staff_user where stafuser_id=? and status=? ";
		
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, stafuser_id);
			ps.setString(2, s);
			ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			m = new StafUser();
			m.setStafuser_id(rs.getInt("stafuser_id"));
			 m.setStafuser_type(rs.getString("stafuser_type"));
	            m.setStafuser_number(rs.getString("stafuser_number"));
				m.setStafuser_barcode(rs.getString("stafuser_barcode"));
			    m.setStafuser_qrcode(rs.getString("stafuser_qrcode"));
				m.setStafuser_firstname(rs.getString("stafuser_firstname"));
				m.setStafuser_middlename(rs.getString("stafuser_middlename"));
				m.setStafuser_lastname(rs.getString("stafuser_lastname"));
				m.setStafuser_country_id(rs.getInt("stafuser_country_id"));
				m.setStafuser_state_id(rs.getInt("stafuser_state_id"));
				m.setStafuser_city(rs.getString("stafuser_city"));
				m.setPincode(rs.getInt("pincode"));
				m.setStafuser_image(rs.getString("stafuser_image"));		
				m.setStafuser_mobile_no(rs.getString("stafuser_mobile_no"));
				m.setStafuser_phone(rs.getString("stafuser_phone"));
				m.setStafuser_email(rs.getString("stafuser_email"));
				 m.setStafuser_password(rs.getString("stafuser_password"));
				 m.setLocation_name(rs.getString("location_name"));
				
				 m.setAddress_line_1(rs.getString("address_line_1"));
				 m.setAddress_line_2(rs.getString("address_line_2"));
				 m.setAddress_line_3(rs.getString("address_line_3"));
		
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
	public String editStafUser(StafUser m) {
		 logger.info("+++++ EDIT staff_user +++++");
		    String sql = "update staff_user set stafuser_type=?,stafuser_number=?,stafuser_firstname=?,stafuser_middlename=?,stafuser_lastname=?,stafuser_country_id=?,stafuser_state_id=?,stafuser_city=?,pincode=?,stafuser_image=?,stafuser_mobile_no=?,stafuser_phone=?,stafuser_email=?,stafuser_password=?,location_name=?,status=?,created_by=?,ip_address=? ,address_line_1=?,address_line_2=?,address_line_3=? where stafuser_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        
		        ps.setString(1, m.getStafuser_type());  
	            ps.setString(2, m.getStafuser_number());
				ps.setString(3, m.getStafuser_firstname());	
				ps.setString(4, m.getStafuser_middlename());
				ps.setString(5, m.getStafuser_lastname());
				ps.setInt(6, m.getStafuser_country_id());
				ps.setInt(7, m.getStafuser_state_id());
				ps.setString(8, m.getStafuser_city());
				ps.setInt(9, m.getPincode());
				ps.setString(10, m.getStafuser_image());			
				ps.setString(11, m.getStafuser_mobile_no());
				ps.setString(12, m.getStafuser_phone());
				ps.setString(13, m.getStafuser_email());
				ps.setString(14, m.getStafuser_password());
				ps.setString(15, m.getLocation_name());	
				ps.setString(16, m.getStatus());
				ps.setInt(17, m.getCreatedBy());
				ps.setString(18, m.getIpAddress());
				ps.setString(19, m.getAddress_line_1());
				ps.setString(20, m.getAddress_line_2());
				ps.setString(21, m.getAddress_line_3());
				ps.setInt(22,m.getStafuser_id());
			

		        ps.executeUpdate();
		        return "Success";
		    } catch (SQLException e) {
		    	System.out.println("//////////////////////////////////////"+e);
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
	public void deleteStafUser(int stafuser_id) {
		 logger.info("+++++ DELETE deleteStafUser +++++");
		    String status = "n";
		    String sql = "update staff_user set status=? where stafuser_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, status);
		        ps.setInt(2, stafuser_id);
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



}
