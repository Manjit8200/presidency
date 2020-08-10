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

import com.ui.dao.MasterMemberRegisterDAO;
import com.ui.model.MasterMemberPlan;
import com.ui.model.MasterMemberRegister;

public class MasterMemberRegisterDAOImpl implements MasterMemberRegisterDAO {
	
	@Autowired
    private DataSource dataSource;
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    JdbcTemplate jdbcTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanDAOImpl.class);
    

	@Override
	public String addMasterMemberRegister(MasterMemberRegister m) {
		
	 logger.info("***** Add MasterMember Register DAO Impl*****");
	        String sql = "insert into master_member_register (member_id,plan_id,tenure_year,membership_number,"
	        		+ "membership_barcode,membership_qrcode,start_date,end_date,member_firstname,\n" + 
	        		"member_middlename,member_lastname,address_id,address_line_1,address_line_2,address_line_3,member_country_id,member_state_id,"
	        		+ "member_city, pincode,member_image,member_phone ,member_mobile_no ,member_email,"
	        		+ "member_password,status,created_by,ip_address,sequence)"
	        		+ " values (?,?,?,?,?,?,STR_TO_DATE(?,'%d/%m/%Y'),STR_TO_DATE(?,'%d/%m/%Y'),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	       

	        Connection conn = null;
	        
	        try
	        {
	  
	    
	        	conn = dataSource.getConnection();
	            PreparedStatement ps = conn.prepareStatement(sql);
	           
	            ps.setInt(1, m.getMember_id());
	            ps.setInt(2, m.getPlan_id());
	            ps.setInt(3, m.getTenure_year());
		       
	            ps.setString(4, m.getMembership_number());
	            ps.setString(5, m.getMembership_barcode());
				ps.setString(6, m.getMembership_qrcode());
	            ps.setString(7, m.getStart_date());
	            ps.setString(8, m.getEnd_date());
	            ps.setString(9, m.getMember_firstname());
	            
	            ps.setString(10, m.getMember_middlename());
	            ps.setString(11, m.getMember_lastname());
	            ps.setInt(12, m.getAddress_id());
	            ps.setString(13, m.getAddress_line_1());
	            ps.setString(14, m.getAddress_line_2());
	            ps.setString(15, m.getAddress_line_3());
	            ps.setInt(16, m.getMember_country_id());
		        ps.setInt(17, m.getMember_state_id());  
		        ps.setString(18, m.getMember_city());
	            ps.setInt(19, m.getPincode());
	            ps.setString(20, m.getMember_image());
	            ps.setString(21, m.getMember_phone());
	            ps.setString(22, m.getMember_mobile_no());
	            ps.setString(23, m.getMember_email());
	            ps.setString(24, m.getMember_password());            
	            ps.setString(25, m.getStatus());
				ps.setInt(26, m.getCreatedBy());
				ps.setString(27, m.getIpAddress());
				ps.setInt(28, m.getSequence());
				
	          

	            System.out.println("Controller");
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
	public String addMasterMemberRegister1(MasterMemberRegister m) {
		
		 logger.info("***** Add MasterMember Register DAO Impl*****");

			String sql2 ="insert into member_payment (member_id,status) values (?,'y')";
		        Connection conn = null;
		        
		        try
		        {
		        	conn = dataSource.getConnection();
		            PreparedStatement ps = conn.prepareStatement(sql2);
		           
		            ps.setInt(1, m.getMember_id());
		            
		          

		            System.out.println("Controller");
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
	public MasterMemberRegister getMemberPlanSequence(int plan_id) {
		// TODO Auto-generated method stub
	
			
		    logger.info("+++++ GET MasterMember By Type +++++");
		   
		    String s = "y";
		    String sql = "SELECT max(mr.sequence) as sequence,mp.plan_type FROM master_member_register mr ,membership_plans mp \n" + 
		    		" where mr.status=? \n" + 
		    		"and mr.plan_id=? and mp.membership_plan_id = ?";
		   
		  
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, s);
		        ps.setInt(2, plan_id);
		        ps.setInt(3, plan_id);
		        MasterMemberRegister m = null;
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		        	   m = new MasterMemberRegister();
			            m.setSequence(rs.getInt("sequence"));
			           m.setPlan_type(rs.getString("plan_type"));
		        	
		        }
		        rs.close();
		        ps.close();
		        return m;
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
	public List<MasterMemberRegister> getAllMemberRegisterName() {
		    logger.info("+++++ GET ALL Master Register Member NAME +++++");
		    List<MasterMemberRegister> mmp = new ArrayList<MasterMemberRegister>();
		    String s = "y";
		    String sql = " select mr.membership_qrcode,mr.membership_barcode,mr.member_id,mr.member_email,mr.member_mobile_no,mp.membership_plan_id,mr.membership_number,member_firstname,member_lastname, mp.plan_name,mr.plan_id FROM master_member_register mr left join membership_plans mp on mp.membership_plan_id = mr.plan_id where mr.status=?";
		      
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, s);
		        MasterMemberRegister m = null;
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            m = new MasterMemberRegister();
		            m.setMember_id(rs.getInt("member_id"));
		            m.setPlan_id(rs.getInt("membership_plan_id"));
		            m.setMember_firstname(rs.getString("member_firstname"));
		            m.setMember_lastname(rs.getString("member_lastname"));
		           m.setPlan_name(rs.getString("plan_name"));
		           m.setMembership_number(rs.getString("membership_number"));
		           m.setMember_email(rs.getString("member_email"));
		           m.setMember_mobile_no(rs.getString("member_mobile_no"));
		           m.setMembership_qrcode(rs.getString("membership_qrcode"));
		           m.setMembership_barcode(rs.getString("membership_barcode"));
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
	public MasterMemberRegister getRegisterMemberById(int member_id) {

		MasterMemberRegister m = null;
		String sql = "SELECT max(member_id) as member_id,membership_number,sequence,member_firstname,member_lastname FROM master_member_register where member_id=?";
		
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, member_id);
			ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			m = new MasterMemberRegister();
			
				m.setMember_id(rs.getInt("member_id"));		   
			   m.setMembership_number(rs.getString("membership_number"));
			   m.setSequence(rs.getInt("sequence"));
			   m.setMember_firstname(rs.getString("member_firstname"));
			   m.setMember_lastname(rs.getString("member_lastname"));

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
	public List<MasterMemberRegister> getRegisterMemberByPage(int pagesize, int startindex) {
	    logger.info("+++++ GET MasterMemberPlan BY PAGE +++++");
	    List<MasterMemberRegister> mmp = new ArrayList<MasterMemberRegister>();
	    String s = "y";
	    String sql = " select mr.member_id,mp.membership_plan_id,mr.membership_number,member_firstname,member_lastname, mp.plan_name,mr.plan_id FROM master_member_register mr left join  membership_plans mp on mp.membership_plan_id = mr.plan_id where mr.status=? limit ?,? ";
		      Connection conn = null;
	    try {
	        conn = dataSource.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, s);
	        ps.setInt(2, startindex);
	        ps.setInt(3, pagesize);
	        MasterMemberRegister m = null;
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	        	   m = new MasterMemberRegister();
	        	   m.setMember_id(rs.getInt("member_id"));
	        	   m.setPlan_id(rs.getInt("membership_plan_id"));
		           m.setMember_firstname(rs.getString("member_firstname"));
		           m.setMember_lastname(rs.getString("member_lastname"));
		           m.setPlan_name(rs.getString("plan_name"));
		           m.setMembership_number(rs.getString("membership_number"));
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
	public String editRegisterMember(MasterMemberRegister m) {
		// TODO Auto-generated method stub
	
	   logger.info("+++++-------------------------------------------- EDIT Member Register +++++");
	   
	    String sql = "update master_member_register set plan_id=?,tenure_year=?,"
	    		+ "membership_number=?,start_date=STR_TO_DATE(?,'%d/%m/%Y'),end_date=STR_TO_DATE(?,'%d/%m/%Y'),member_firstname=?,"
	    		+ "member_middlename=?,member_lastname=?,address_line_1=?,"
	    		+ "address_line_2=?,address_line_3=?,member_country_id=?,"
	    		+ "member_state_id=?,member_city=?, pincode=?,member_image=?,"
	    		+ "member_phone=?,member_mobile_no=?,member_email=?,"
	    		+ "member_password=? ,status=?, created_by=?, ip_address=? where member_id=?";
	    Connection conn = null;
	    try {
	        conn = dataSource.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);
	     
            ps.setInt(1, m.getPlan_id());
            ps.setInt(2, m.getTenure_year());		       
            ps.setString(3, m.getMembership_number());        
            ps.setString(4, m.getStart_date());
            ps.setString(5, m.getEnd_date());
            ps.setString(6, m.getMember_firstname());
            ps.setString(7, m.getMember_middlename());
            ps.setString(8, m.getMember_lastname());      
            ps.setString(9, m.getAddress_line_1());
            ps.setString(10, m.getAddress_line_2());
            ps.setString(11, m.getAddress_line_3());
            ps.setInt(12, m.getMember_country_id());
	        ps.setInt(13, m.getMember_state_id());  
	        ps.setString(14, m.getMember_city());
            ps.setInt(15, m.getPincode());
            ps.setString(16, m.getMember_image());  
            ps.setString(17, m.getMember_phone());
            ps.setString(18, m.getMember_mobile_no());
            ps.setString(19, m.getMember_email());
            ps.setString(20, m.getMember_password());  
            ps.setString(21, m.getStatus());
			ps.setInt(22, m.getCreatedBy());
			ps.setString(23, m.getIpAddress());
			
			
            ps.setInt(24, m.getMember_id());
	        ps.executeUpdate();
	        return "Success";
	    } catch (SQLException e) {
	        return "Data not updated!"+e;
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
	public void deleteRegisterMember(int member_id) {
		  logger.info("+++++ DELETE MemberRegister +++++");
		    String status = "n";
		    String sql = "update master_member_register set status=? where member_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, status);
		        ps.setInt(2, member_id);
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
	public MasterMemberRegister getRegisterMember(int member_id) {
	
		
	    logger.info("+++++ GET MasterMember  +++++"   );
	   
	    String s = "y";
	    String sql = "select member_id,mp.membership_plan_id,membership_number,member_firstname,member_lastname, mp.plan_name , plan_id,tenure_year,membership_number,\n" + 
	    		"	        		membership_barcode,membership_qrcode, DATE_FORMAT(start_date,'%d/%m/%Y') as start_date, DATE_FORMAT(end_date,'%d/%m/%Y') as end_date ,member_firstname, \n" + 
	    		"	        		member_middlename,member_lastname,address_line_1,address_line_2,address_line_3,\n" + 
	    		"	        		member_country_id,member_state_id,\n" + 
	    		"	        		member_city, pincode,member_image,member_phone ,member_mobile_no ,member_email,\n" + 
	    		"	        		member_password\n" + 
	    		"FROM master_member_register mr \n" + 
	    		"left join  membership_plans mp\n" + 
	    		" on mp.membership_plan_id = mr.plan_id \n" + 
	    		" where mr.status=? and member_id=?" + 
	    		" ";
	   
	  
	    Connection conn = null;
	    try {
	        conn = dataSource.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, s);
	        ps.setInt(2, member_id);
	      
	        MasterMemberRegister m = null;
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	        	   m = new MasterMemberRegister();
		           
		           m.setMember_id(rs.getInt("member_id"));
		           
		           m.setPlan_id(rs.getInt("plan_id"));
		             m.setTenure_year(rs.getInt("tenure_year"));
			       
		             m.setMembership_number(rs.getString("membership_number"));
		            m.setMembership_barcode(rs.getString("membership_barcode"));
					 m.setMembership_qrcode(rs.getString("membership_qrcode"));
		             m.setStart_date(rs.getString("start_date"));
		             m.setEnd_date(rs.getString("end_date"));
		             m.setMember_firstname(rs.getString("member_firstname"));
		             m.setMember_middlename(rs.getString("member_middlename"));
		             m.setMember_lastname(rs.getString("member_lastname"));
		             m.setAddress_line_1(rs.getString("address_line_1"));
		             m.setAddress_line_2(rs.getString("address_line_2"));
		             m.setAddress_line_3(rs.getString("address_line_3"));
		             m.setMember_country_id(rs.getInt("member_country_id"));
			         m.setMember_state_id(rs.getInt("member_state_id"));
			         m.setMember_city(rs.getString("member_city"));
		             m.setPincode(rs.getInt("pincode"));
		             m.setMember_image(rs.getString("member_image"));
		             m.setMember_phone(rs.getString("member_phone"));
		             m.setMember_mobile_no(rs.getString("member_mobile_no"));
		             m.setMember_email(rs.getString("member_email"));
		             m.setMember_password(rs.getString("member_password"));
		           
	        	
	        }
	        rs.close();
	        ps.close();
	        return m;
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
	public MasterMemberRegister getRegisterMemberAmount(int member_id) {
		
	    logger.info("+++++ GET MasterMember By Type +++++");
	   
	    String s = "y";
	    String sql = "SELECT mr.member_id,mp.membership_plan_id, mp.plan_name,mr.plan_id,mp.plan_amount,mp.redemption_amount FROM master_member_register mr LEFT JOIN  membership_plans mp ON mp.membership_plan_id = mr.plan_id WHERE mr.member_id = ? AND mr.status= ?";
	   
	  
	    Connection conn = null;
	    try {
	        conn = dataSource.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, member_id);
	        ps.setString(2, s);
	       
	      
	        MasterMemberRegister m = null;
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	        	   m = new MasterMemberRegister();
	        	   m.setMember_id(rs.getInt("member_id"));
	        	   m.setPlan_id(rs.getInt("plan_id"));
	        	
	        	   m.setPlan_id(rs.getInt("membership_plan_id"));
		        
		           m.setPlan_name(rs.getString("plan_name"));
		           m.setPlan_amount(rs.getFloat("plan_amount"));
		           m.setRedemption_amount(rs.getFloat("redemption_amount"));
	        	
	        }
	        rs.close();
	        ps.close();
	        return m;
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