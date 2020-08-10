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

import com.ui.dao.MemberPersonalInformationDAO;
import com.ui.model.MemberPayment;
import com.ui.model.MemberPersonalInformation;
import com.ui.model.Product;

public class MemberPersonalInformationDAOImpl implements MemberPersonalInformationDAO{
	@Autowired
    private DataSource dataSource;
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    JdbcTemplate jdbcTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanDAOImpl.class);

	@Override
	public String addMemberPersonalChoice(MemberPersonalInformation m) {
		
		 logger.info("***** addMember ChoiceDAO Impl*****");
     	String sql = "insert into member_personal_choice(member_id,members_family_id,member_family_type_of_relation,member_family_choices,status,created_by,ip_address) values (?,?,?,?,?,?,?)";	
		
     	//String sql = "insert into member_personal_information (member_id,member_profession,member_other_Club_membership,member_club_name,member_marriage_anniversary,members_family_id,member_family_type_of_relation,member_family_choices,member_house_owend,createdBy,ipAddress,status) values (?,?,?,?,STR_TO_DATE(?,'%d/%m/%Y'),?,?,?,?,?,?,?)";
		        Connection conn = null;
		
		        try
		        {
		        
		        	conn = dataSource.getConnection();
		            PreparedStatement ps = conn.prepareStatement(sql);
		            
		            ps.setInt(1, m.getMember_id()); 	
		        
		            ps.setInt(2, m.getMembers_family_id());
		            ps.setInt(3, m.getMember_family_type_of_relation());      	
		            ps.setString(4, m.getMember_family_choices());                  
			        ps.setString(5, m.getStatus());
					ps.setInt(6, m.getCreatedBy());
					ps.setString(7, m.getIpAddress());      
					System.out.println("mkkk--------------------------------------------------------mkkkk");
		            ps.executeUpdate();
		        }
		        catch (SQLException e)
		        {
		        	System.out.println("?--------------------------------------------------------"+e);
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
	public String addMemberPersonalInformation1(MemberPersonalInformation m1) {
		
		 logger.info("***** addMemberPersonalInformation1 DAO Impl*****");
    	
     	String sql = "insert into member_personal_info (member_id,member_profession,member_other_Club_membership,member_club_name,member_marriage_anniversary,member_house_owend,status,created_by,ip_address) values (?,?,?,?,STR_TO_DATE(?,'%d/%m/%Y'),?,?,?,?)";
		        Connection conn = null;
		
		        try
		        {
		        
		        	conn = dataSource.getConnection();
		            PreparedStatement ps = conn.prepareStatement(sql);
		            
		            ps.setInt(1, m1.getMember_id()); 	
		            ps.setInt(2, m1.getMember_profession());		
		            ps.setInt(3, m1.getMember_other_Club_membership());
					ps.setString(4, m1.getMember_club_name());					
		            ps.setString(5, m1.getMember_marriage_anniversary());	        
		            ps.setInt(6, m1.getMember_house_owend());	                    
			        ps.setString(7, m1.getStatus());
					ps.setInt(8, m1.getCreatedBy());
					ps.setString(9, m1.getIpAddress());      
					System.out.println("mkkk--------------------------------------------------------mkkkk");
		            ps.executeUpdate();
		        }
		        catch (SQLException e)
		        {
		        	System.out.println("+++++++?????????????"+e);
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
	public List<MemberPersonalInformation> getAllMemberPersonalInformation(int member_id) {
		 logger.info("+++++ getMemberPersonalInformation +++++");

		    List<MemberPersonalInformation> mmp = new ArrayList<MemberPersonalInformation>();
		    String s = "y";
		    
		    String sql = "SELECT mp.member_id,fr.family_name,fr.id ,mf.member_family_first_name,mf.member_family_last_name,mp.member_profession_id,mp.members_family_id,mp.member_family_type_of_relation,mp.member_family_choices\n" + 
		    		" FROM member_personal_choice mp \n" + 
		    		" left join members_family_details mf on mp.members_family_id = mf.members_family_id\n" + 
		    		" left join family_relation fr on mp.member_family_type_of_relation = fr.id \n" + 
		    		" where mp.status=? and mp.member_id =?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, s);
		        ps.setInt(2, member_id);
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		        	  
		        	MemberPersonalInformation m = new MemberPersonalInformation();
		        		
		        	    m.setMember_id(rs.getInt("member_id"));
		        	  	m.setMembers_family_id(rs.getInt("members_family_id"));
			            m.setMember_family_type_of_relation(rs.getInt("member_family_type_of_relation"));     
			            m.setMember_family_choices(rs.getString("member_family_choices"));
			            m.setId(rs.getInt("id"));
			            m.setFamily_name(rs.getString("family_name"));
			            m.setMember_family_first_name(rs.getString("member_family_first_name"));
			            m.setMember_family_last_name(rs.getString("member_family_last_name"));
			            
			            
		          
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
	public MemberPersonalInformation getMemberPersonalInfo(int member_id) {
		MemberPersonalInformation m = null;
		 String s = "y";
		String sql = "select * from member_personal_info where member_id=? and status=?";		
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, member_id);
			ps.setString(2, s);
			ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			m = new MemberPersonalInformation();
         
		    m.setMember_club_name(rs.getString("member_club_name"));
		    m.setMember_profession(rs.getInt("member_profession"));
		    m.setMember_other_Club_membership(rs.getInt("member_other_Club_membership"));
		    m.setMember_house_owend(rs.getInt("member_house_owend"));
		    m.setMember_marriage_anniversary(rs.getString("member_marriage_anniversary"));
		    
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
	public String editMemberPersonalInformation(MemberPersonalInformation m1) {
		 logger.info("+++++ EDIT editMemberPersonalInformation +++++");
		    String sql = "update member_personal_info set member_profession=?,member_other_Club_membership=?,member_club_name=?, member_marriage_anniversary=STR_TO_DATE(?,'%d/%m/%Y'),member_house_owend=?,status=?,created_by=?,ip_address=?  where member_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        

		      	System.out.println("11111111111"+m1.getMember_profession());
		      	System.out.println("22222"+m1.getMember_club_name());
		    	System.out.println("3333"+m1.getMember_id());
		    	
		      	ps.setInt(1, m1.getMember_profession());		
	            ps.setInt(2, m1.getMember_other_Club_membership());
				ps.setString(3, m1.getMember_club_name());					
	            ps.setString(4, m1.getMember_marriage_anniversary());	        
	            ps.setInt(5, m1.getMember_house_owend());	                    
		        ps.setString(6, m1.getStatus());
				ps.setInt(7, m1.getCreatedBy());
				ps.setString(8, m1.getIpAddress());
				ps.setInt(9, m1.getMember_id());

		        ps.executeUpdate();
		        return "Success";
		    } catch (SQLException e) {
		    	System.out.println("------------------"+e);
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
}


