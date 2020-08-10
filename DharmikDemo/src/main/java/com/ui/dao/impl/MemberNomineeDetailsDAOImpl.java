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

import com.ui.dao.MemberNomineeDetailsDAO;
import com.ui.model.Location;
import com.ui.model.MemberFamilyRegister;
import com.ui.model.MemberNomineeDetails;
import com.ui.model.Product;

public class MemberNomineeDetailsDAOImpl implements MemberNomineeDetailsDAO {
	@Autowired
    private DataSource dataSource;
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    JdbcTemplate jdbcTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanDAOImpl.class);

	@Override
	public String addMemberNomineeDetails(MemberNomineeDetails m) {
		

				
			 logger.info("***** Add Master NomineeDetails DAO Impl*****");
	      	String sql = "insert into member_nominee_details (member_id,nominee_firstname,nominee_middlename,nominee_lastname,nominee_address1,nominee_address2,nominee_address3,nominee_mobile_no,nominee_phone,nominee_email,nominee_pincode,nominee_coutry_id,nominee_state_id,nominee_city,status,created_by,ip_address) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	
			
	      	
	      	Connection conn = null;
			
			        try
			        {
			        
			        	conn = dataSource.getConnection();
			            PreparedStatement ps = conn.prepareStatement(sql);
			           
			            ps.setInt(1, m.getMember_id()); 	
			             ps.setString(2, m.getNominee_firstname());		
			            ps.setString(3, m.getNominee_middlename());
						ps.setString(4, m.getNominee_lastname());					
			            ps.setString(5, m.getNominee_address1());
			            ps.setString(6, m.getNominee_address2());
			            ps.setString(7, m.getNominee_address3());  
			            ps.setString(8, m.getNominee_mobile_no());
			            ps.setString(9, m.getNominee_phone());	         
			            ps.setString(10, m.getNominee_email());
			            ps.setInt(11, m.getNominee_pincode());
			          
			            ps.setInt(12, m.getNominee_coutry_id());     	
			            ps.setInt(13, m.getNominee_state_id());
				      
				        ps.setString(14, m.getNominee_city());
				        ps.setString(15, m.getStatus());
						ps.setInt(16, m.getCreatedBy());
						ps.setString(17, m.getIpAddress());      
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
	public MemberNomineeDetails getMemberNomineeById(int nominee_id) {
		MemberNomineeDetails m = null;
		String sql = "SELECT * FROM member_nominee_details where nominee_id=?";
		
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, nominee_id);
			ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			m = new MemberNomineeDetails();
			
			
			   m.setMember_id(rs.getInt("member_id"));	
			   m.setNominee_id(rs.getInt("nominee_id"));	
	           m.setNominee_firstname(rs.getString("nominee_firstname"));	
	           m.setNominee_middlename(rs.getString("nominee_middlename"));
			   m.setNominee_lastname(rs.getString("nominee_lastname"));
	           m.setNominee_address1(rs.getString("nominee_address1"));
	           m.setNominee_address2(rs.getString("nominee_address2"));
	           m.setNominee_address3(rs.getString("nominee_address3")); 
	           m.setNominee_mobile_no(rs.getString("nominee_mobile_no"));
	           m.setNominee_phone(rs.getString("nominee_phone"));
	           m.setNominee_email(rs.getString("nominee_email"));
	           m.setNominee_pincode(rs.getInt("nominee_pincode"));
	           m.setNominee_coutry_id(rs.getInt("nominee_coutry_id"));
	           m.setNominee_state_id(rs.getInt("nominee_state_id"));
		       m.setNominee_city(rs.getString("nominee_city"));
		       

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
	public String editMemberNomineeDetails(MemberNomineeDetails m) {
		 logger.info("+++++ EDIT MemberNomineeDetails  +++++");
		   
		    String sql = "update member_nominee_details set member_id=?,nominee_firstname=?,nominee_middlename=?,"
		    		+ "nominee_lastname=?,nominee_address1=?,nominee_address2=?,nominee_address3=?,"
		    		+ "nominee_mobile_no=?,nominee_phone=?,nominee_email=?,\n" + 
		    		"nominee_pincode=?,nominee_coutry_id=?,nominee_state_id=?,nominee_city=?,\n" + 
		    		"status=?, created_by=?, ip_address=? where nominee_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        
		      
		        ps.setInt(1, m.getMember_id()); 	
	            ps.setString(2, m.getNominee_firstname());		
	            ps.setString(3, m.getNominee_middlename());
				ps.setString(4, m.getNominee_lastname());					
	            ps.setString(5, m.getNominee_address1());
	            ps.setString(6, m.getNominee_address2());
	            ps.setString(7, m.getNominee_address3());  
	            ps.setString(8, m.getNominee_mobile_no());
	            ps.setString(9, m.getNominee_phone());	         
	            ps.setString(10, m.getNominee_email());
	            ps.setInt(11, m.getNominee_pincode());
	            ps.setInt(12, m.getNominee_coutry_id());     	
	            ps.setInt(13, m.getNominee_state_id());   
		        ps.setString(14, m.getNominee_city());
		        ps.setString(15, m.getStatus());
				ps.setInt(16, m.getCreatedBy());
				ps.setString(17, m.getIpAddress());   
				 ps.setInt(18, m.getNominee_id()); 
		        ps.executeUpdate();
		        return "Success";
		    } catch (SQLException e) {
		    	System.out.println("0000000000000000000"+e);
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
	public void deleteMemberNomineeDetails(int nominee_id) {
		 logger.info("+++++ DELETE MemberNomineeDetails +++++");
		    String status = "n";
		    String sql = "update member_nominee_details set status=? where nominee_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, status);
		        ps.setInt(2, nominee_id);
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
	public List<MemberNomineeDetails> NomineeDetails(int member_id) {
		 logger.info("+++++ GET NomineeDetails NAME +++++");
		    List<MemberNomineeDetails> mmp = new ArrayList<MemberNomineeDetails>();
		    String s = "y";
		    String sql = " SELECT * FROM member_nominee_details where member_id=? and status=? ";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setInt(1, member_id);
		        ps.setString(2, s);
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		        	MemberNomineeDetails m =  new MemberNomineeDetails();
		        	   m.setMember_id(rs.getInt("member_id"));	
					   m.setNominee_id(rs.getInt("nominee_id"));	
			           m.setNominee_firstname(rs.getString("nominee_firstname"));	
			           m.setNominee_middlename(rs.getString("nominee_middlename"));
					   m.setNominee_lastname(rs.getString("nominee_lastname"));
			           m.setNominee_address1(rs.getString("nominee_address1"));
			           m.setNominee_address2(rs.getString("nominee_address2"));
			           m.setNominee_address3(rs.getString("nominee_address3")); 
			           m.setNominee_mobile_no(rs.getString("nominee_mobile_no"));
			           m.setNominee_phone(rs.getString("nominee_phone"));
			           m.setNominee_email(rs.getString("nominee_email"));
			           m.setNominee_pincode(rs.getInt("nominee_pincode"));
			           m.setNominee_coutry_id(rs.getInt("nominee_coutry_id"));
			           m.setNominee_state_id(rs.getInt("nominee_state_id"));
				       m.setNominee_city(rs.getString("nominee_city"));

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

}