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

import com.ui.dao.MemberFamilyRegisterDAO;
import com.ui.model.MasterMemberRegister;
import com.ui.model.MemberFamilyRegister;
import com.ui.model.Product;

public class MemberFamilyRegisterDAOImpl implements MemberFamilyRegisterDAO {
	
	@Autowired
    private DataSource dataSource;
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    JdbcTemplate jdbcTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanDAOImpl.class);

	@Override
	public int getMemberLastId() {
	
			// TODO Auto-generated method stub
		
				
			    logger.info("+++++ GET MasterMember By Type +++++");
			   
			    String s = "y";
			    String sql = "SELECT max(member_id) as member_id  FROM master_member_register  where status= ?";
			   
			  
			    Connection conn = null;
			    try {
			        conn = dataSource.getConnection();
			        PreparedStatement ps = conn.prepareStatement(sql);
			        ps.setString(1, s);
			    
			 
			      int id=0;
			        ResultSet rs = ps.executeQuery();
			        while (rs.next()) {
			        	
				     id= rs.getInt("member_id");
				          
			        	System.out.println("/////////////////////Family DAO////////////////////////////"+id);
			        }
			        rs.close();
			        ps.close();
			        return id;
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
	public String addMemberFamilyRegister(MemberFamilyRegister m) {

			
		 logger.info("***** Add Master Family Member Register DAO Impl*****");
	 
	 String sql = "insert into members_family_details( member_id,member_family_first_name,member_family_middle_name, "
	 		+ "member_family_last_name, member_family_gender,member_family_type_of_relation,member_family_date_of_birth,"
	 		+ "member_family_blood_group,member_family_image,\n" + 
		    "member_family_email,member_family_mobile_no,member_family_phone,member_family_password,member_family_address1,"
		    + "member_family_address2, member_family_address3,member_family_pincode,member_family_coutry_id,member_family_state_id,"
		    + "member_family_city,family_membership_no,status,created_by,ip_address,family_member_barcode,family_member_qrcode)\n" + 
		    "  values (?,?,?,?,?,?,STR_TO_DATE(?,'%d/%m/%Y'),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" ;
	       		
		// String sql = "insert into members_family_details(member_id,member_family_first_name,member_family_last_name) values(?,?,?) ";
				 			
		        Connection conn = null;
		
		        try
		        {
		        	conn = dataSource.getConnection();
		            PreparedStatement ps = conn.prepareStatement(sql);
		           
		            ps.setInt(1, m.getMemberLastId()); 
		            ps.setString(2, m.getMember_family_first_name());
		            ps.setString(3, m.getMember_family_middle_name());
					ps.setString(4, m.getMember_family_last_name());
					
		            ps.setInt(5, m.getMember_family_gender());
		          
		            ps.setInt(6, m.getMember_family_type_of_relation());  
		            ps.setString(7, m.getMember_family_date_of_birth());
		            ps.setInt(8, m.getMember_family_blood_group());	         
		            ps.setString(9, m.getMember_family_image());
		            ps.setString(10, m.getMember_family_email());
		            ps.setString(11, m.getMember_family_mobile_no());     	
		            ps.setString(12, m.getMember_family_phone());
			        ps.setString(13, m.getMember_family_password());  
			        ps.setString(14, m.getMember_family_address1());
		            ps.setString(15, m.getMember_family_address2());
		            ps.setString(16, m.getMember_family_address3());
		            ps.setInt(17, m.getMember_family_pincode());
		            ps.setInt(18, m.getMember_family_coutry_id());
		            ps.setInt(19, m.getMember_family_state_id());
		            ps.setString(20, m.getMember_family_city());
		            ps.setString(21, m.getFamily_membership_no()); 
		            ps.setString(22, m.getStatus());
					ps.setInt(23, m.getCreatedBy());
					ps.setString(24, m.getIpAddress());
					ps.setString(25, m.getFamily_member_barcode());
					ps.setString(26, m.getFamily_member_qrcode());
		   

		            System.out.println("DaoIMPL");
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
	public List<MemberFamilyRegister> getMemberFamilyRelation() {
		// TODO Auto-generated method stub
		  logger.info("+++++ GET ALL Master Register Member NAME +++++");
		    List<MemberFamilyRegister> mmp = new ArrayList<MemberFamilyRegister>();
		    String s = "y";
		    String sql = " SELECT member_id,members_family_id,member_family_type_of_relation,member_family_first_name,member_family_last_name FROM members_family_details";
		      
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		      
		        MemberFamilyRegister m = null;
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            m = new MemberFamilyRegister();
		            m.setMember_id(rs.getInt("member_id"));
		            m.setMember_id(rs.getInt("members_family_id"));
		            m.setMember_family_first_name(rs.getString("member_family_first_name"));
		            m.setMember_family_last_name(rs.getString("member_family_last_name"));
		            m.setMember_family_type_of_relation(rs.getInt("member_family_type_of_relation"));
		      
		         
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
	public List<MemberFamilyRegister> getFamilyMemberId(int member_id) {
		 logger.info("+++++ GET MemberFamilyRegister NAME Id +++++");
		    List<MemberFamilyRegister> mmp = new ArrayList<MemberFamilyRegister>();
		    String s = "y";
		    String sql = " SELECT * FROM members_family_details where member_id=? and status=? ";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setInt(1, member_id);
		        ps.setString(2, s);
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		        	
		        	MemberFamilyRegister m =  new MemberFamilyRegister();

		            m.setMember_id(rs.getInt("member_id"));
			            m.setMembers_family_id(rs.getInt("members_family_id"));
			            m.setMember_family_first_name(rs.getString("member_family_first_name"));
			            m.setMember_family_last_name(rs.getString("member_family_last_name"));
			            m.setMember_family_type_of_relation(rs.getInt("member_family_type_of_relation"));
			            
			            m.setMember_family_gender(rs.getInt("member_family_gender"));
				           
				           m.setMember_family_date_of_birth(rs.getString("member_family_date_of_birth"));
				           m.setMember_family_blood_group(rs.getInt("member_family_blood_group"));         
				           m.setMember_family_image(rs.getString("member_family_image"));
				           m.setMember_family_email(rs.getString("member_family_email"));
				           m.setMember_family_mobile_no(rs.getString("member_family_mobile_no"));  	
				           m.setMember_family_phone(rs.getString("member_family_phone"));
					       m.setMember_family_password(rs.getString("member_family_password"));
					       m.setMember_family_address1(rs.getString("member_family_address1"));
				           m.setMember_family_address2(rs.getString("member_family_address2"));
				           m.setMember_family_address3(rs.getString("member_family_address3"));
				           m.setMember_family_pincode(rs.getInt("member_family_pincode"));
				           m.setMember_family_coutry_id(rs.getInt("member_family_coutry_id"));
				           m.setMember_family_state_id(rs.getInt("member_family_state_id"));
				           m.setMember_family_city(rs.getString("member_family_city"));
				           m.setFamily_membership_no(rs.getString("family_membership_no"));
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
	public MemberFamilyRegister getFamilyMemberById(int members_family_id) {
		
	    logger.info("+++++ GET MasterMember  +++++"   );
	   
	    String s = "y";
	    String sql = "SELECT * FROM members_family_details where members_family_id=?";
	   
	  
	    Connection conn = null;
	    try {
	        conn = dataSource.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);
	        
	        ps.setInt(1, members_family_id);
	      
	        MemberFamilyRegister m = null;
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	        	   m = new MemberFamilyRegister();
		           
		           m.setMember_id(rs.getInt("member_id"));
		           
		      
		            m.setMember_id(rs.getInt("members_family_id"));
		            m.setMember_family_first_name(rs.getString("member_family_first_name"));
		            m.setMember_family_middle_name(rs.getString("member_family_middle_name"));
		            m.setMember_family_last_name(rs.getString("member_family_last_name"));
		            m.setMember_family_type_of_relation(rs.getInt("member_family_type_of_relation"));
		            
		            m.setMember_family_gender(rs.getInt("member_family_gender"));
			           
			           m.setMember_family_date_of_birth(rs.getString("member_family_date_of_birth"));
			           m.setMember_family_blood_group(rs.getInt("member_family_blood_group"));         
			           m.setMember_family_image(rs.getString("member_family_image"));
			           m.setMember_family_email(rs.getString("member_family_email"));
			           m.setMember_family_mobile_no(rs.getString("member_family_mobile_no"));  	
			           m.setMember_family_phone(rs.getString("member_family_phone"));
				       m.setMember_family_password(rs.getString("member_family_password"));
				       m.setMember_family_address1(rs.getString("member_family_address1"));
			           m.setMember_family_address2(rs.getString("member_family_address2"));
			           m.setMember_family_address3(rs.getString("member_family_address3"));
			           m.setMember_family_pincode(rs.getInt("member_family_pincode"));
			           m.setMember_family_coutry_id(rs.getInt("member_family_coutry_id"));
			           m.setMember_family_state_id(rs.getInt("member_family_state_id"));
			           m.setMember_family_city(rs.getString("member_family_city"));
			           m.setFamily_membership_no(rs.getString("family_membership_no"));
	        	
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
	public String EditUser(MemberFamilyRegister m) {
		
		String sql1 = "update members_family_details set member_family_first_name =?,member_family_middle_name=?,member_family_last_name=?, member_family_gender=?,member_family_type_of_relation=?,member_family_date_of_birth=?,member_family_blood_group=?,member_family_image=?,member_family_email=?,member_family_mobile_no=?,member_family_phone=?,member_family_password=?,member_family_address1=?,member_family_address2=?, member_family_address3=?,member_family_pincode=?,member_family_coutry_id=?,member_family_state_id=?,member_family_city=?,family_membership_no=?,status=?,created_by=?,ip_address=? where members_family_id=? ";
		
		Connection conn = null;
		try
		{
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql1);

	            ps.setString(1, m.getMember_family_first_name());
	            System.out.println("=============="+m.getMember_family_middle_name());
	            ps.setString(2, m.getMember_family_middle_name());
				ps.setString(3, m.getMember_family_last_name());
				
	            ps.setInt(4, m.getMember_family_gender());
	          
	            ps.setInt(5, m.getMember_family_type_of_relation());  
	            ps.setString(6, m.getMember_family_date_of_birth());
	            ps.setInt(7, m.getMember_family_blood_group());	         
	            ps.setString(8, m.getMember_family_image());
	            ps.setString(9, m.getMember_family_email());
	            ps.setString(10, m.getMember_family_mobile_no());     	
	            ps.setString(11, m.getMember_family_phone());
		        ps.setString(12, m.getMember_family_password());  
		        ps.setString(13, m.getMember_family_address1());
	            ps.setString(14, m.getMember_family_address2());
	            ps.setString(15, m.getMember_family_address3());
	            ps.setInt(16, m.getMember_family_pincode());
	            ps.setInt(17, m.getMember_family_coutry_id());
	            ps.setInt(18, m.getMember_family_state_id());
	            ps.setString(19, m.getMember_family_city());
	            ps.setString(20, m.getFamily_membership_no()); 
	            ps.setString(21, m.getStatus());
				ps.setInt(22, m.getCreatedBy());
				ps.setString(23, m.getIpAddress());
		
				ps.setInt(24, m.getMembers_family_id());
				  System.out.println("=============="+ m.getMembers_family_id());
			ps.executeUpdate();
			
			return "Succes Fully Update";
		}
		catch (SQLException e)
		{
			
			System.out.println("=============="+e);
			return "Not Succesfully ";
        }
		finally
		{
            if (conn != null)
            {
            	try
            	{
            		conn.close();
                }
            	catch (SQLException e){
            		
            		
            	}
            }
        }
		
		
	}

	@Override
	public void deleteMemberFamily(int members_family_id) {
		 logger.info("+++++ deleteMemberFamily+++++");
		    String status = "n";
		    String sql = "update members_family_details set status=? where members_family_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, status);
		        ps.setInt(2, members_family_id);
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
