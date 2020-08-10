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

import com.ui.dao.MasterMemberPlanDAO;
import com.ui.model.MasterMemberPlan;

public class MasterMemberPlanDAOImpl implements MasterMemberPlanDAO {

	@Autowired
    private DataSource dataSource;
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    JdbcTemplate jdbcTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanDAOImpl.class);
    
	@Override
	public String addMasterMemberPlan(MasterMemberPlan m) {

		 logger.info("***** Add Master Member Plan DAO Impl*****");
        String sql = "insert into membership_plans (membership_plan_id,plan_name,plan_amount,plan_tenure,redemption_amount,redemption_validity,foodvoucher_amount,foodvoucher_validity,status,created_by,ip_address,plan_type) values (?,?,?,?,?,?,?,?,?,?,?,?)";
       
	
        Connection conn = null;
        
        try
        {
    
        	conn = dataSource.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
           
            ps.setInt(1, m.getPlan_id());
            ps.setString(2, m.getPlan_name());
            ps.setFloat(3, m.getPlan_amount());
	        ps.setInt(4, m.getTenure_year());   
            ps.setFloat(5, m.getRedemption_amount());
            ps.setInt(6, m.getRedemption_validity());
            ps.setFloat(7, m.getFoodvoucher_amount());
            ps.setInt(8, m.getFoodvoucher_validity());
            
            ps.setString(9, m.getStatus());
			ps.setInt(10, m.getCreatedBy());
			ps.setString(11, m.getIpAddress());
			ps.setString(12, m.getPlan_type());
          

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
	  public List<MasterMemberPlan> getAllMemberName() {
	    logger.info("+++++ GET ALL MasterMemberPlan NAME +++++");
	    List<MasterMemberPlan> mmp = new ArrayList<MasterMemberPlan>();
	    String s = "y";
	    String sql = "select membership_plan_id, plan_name,plan_tenure,plan_amount from membership_plans where status=? order by plan_name";
	    Connection conn = null;
	    try {
	        conn = dataSource.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, s);
	        MasterMemberPlan m = null;
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            m = new MasterMemberPlan();
	            m.setPlan_id(rs.getInt("membership_plan_id"));
	            m.setPlan_name(rs.getString("plan_name"));
	            m.setPlan_amount(rs.getFloat("plan_amount"));
	            m.setTenure_year(rs.getInt("plan_tenure"));
	       
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
		public MasterMemberPlan getMemberById(int plan_id) {


			MasterMemberPlan m = null;
			String sql = "SELECT membership_plan_id,plan_name,plan_amount,plan_tenure,redemption_amount,redemption_validity,foodvoucher_amount,foodvoucher_validity,plan_type FROM membership_plans where membership_plan_id=?";
			
			Connection conn = null;
			try {
				conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, plan_id);
				ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				m = new MasterMemberPlan();
				
				m.setPlan_id(rs.getInt("membership_plan_id"));
				m.setPlan_name(rs.getString("plan_name"));
				m.setPlan_amount(rs.getFloat("plan_amount"));        
				m.setTenure_year(rs.getInt("plan_tenure"));
				m.setRedemption_amount(rs.getFloat("redemption_amount"));
				m.setRedemption_validity(rs.getInt("redemption_validity"));
				m.setFoodvoucher_amount(rs.getFloat("foodvoucher_amount"));
				m.setFoodvoucher_validity(rs.getInt("foodvoucher_validity"));
				m.setPlan_type(rs.getString("plan_type"));
			
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
		public String editMasterMemberPlan(MasterMemberPlan masterMemberPlan) {
	
			    logger.info("+++++ EDIT Member +++++");
			    String sql = "update membership_plans set plan_name=?, plan_amount=?, plan_tenure=?, redemption_amount=?,redemption_validity=?,foodvoucher_amount=?,foodvoucher_validity=?, status=?, created_by=?, ip_address=? , plan_type=? where membership_plan_id=?";
			    Connection conn = null;
			    try {
			        conn = dataSource.getConnection();
			        PreparedStatement ps = conn.prepareStatement(sql);
			        
			        ps.setString(1, masterMemberPlan.getPlan_name());
			        ps.setFloat(2, masterMemberPlan.getPlan_amount());
			        ps.setInt(3, masterMemberPlan.getTenure_year());
			        ps.setFloat(4, masterMemberPlan.getRedemption_amount());
			        ps.setInt(5, masterMemberPlan.getRedemption_validity());
			        ps.setFloat(6, masterMemberPlan.getFoodvoucher_amount());
			        ps.setInt(7, masterMemberPlan.getFoodvoucher_validity());			        
			        ps.setString(8, masterMemberPlan.getStatus());
			        ps.setInt(9, masterMemberPlan.getCreatedBy());
			        ps.setString(10, masterMemberPlan.getIpAddress());	
			        ps.setString(11, masterMemberPlan.getPlan_type());	
			        ps.setInt(12, masterMemberPlan.getPlan_id());
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
		public void deleteMasterMemberPlan(int plan_id) {
			
			    logger.info("+++++ DELETE MemberPlan +++++");
			    String status = "n";
			    String sql = "update membership_plans set status=? where membership_plan_id=?";
			    Connection conn = null;
			    try {
			        conn = dataSource.getConnection();
			        PreparedStatement ps = conn.prepareStatement(sql);
			        ps.setString(1, status);
			        ps.setInt(2, plan_id);
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
		public List<MasterMemberPlan> getsMasterMemberPlanByPage(int pagesize, int startindex) {
	
			    logger.info("+++++ GET MasterMemberPlan BY PAGE +++++");
			    List<MasterMemberPlan> mmp = new ArrayList<MasterMemberPlan>();
			    String s = "y";
			    String sql = "SELECT membership_plan_id,plan_name,plan_amount,plan_tenure,redemption_amount,redemption_validity,foodvoucher_amount,foodvoucher_validity FROM membership_plans where status=? order by membership_plan_id limit ?,?";
			    Connection conn = null;
			    try {
			        conn = dataSource.getConnection();
			        PreparedStatement ps = conn.prepareStatement(sql);
			        ps.setString(1, s);
			        ps.setInt(2, startindex);
			        ps.setInt(3, pagesize);
			        MasterMemberPlan m = null;
			        ResultSet rs = ps.executeQuery();
			        while (rs.next()) {
			        	   m = new MasterMemberPlan();
				            m.setPlan_id(rs.getInt("membership_plan_id"));
				            m.setPlan_name(rs.getString("plan_name"));
				            m.setPlan_amount(rs.getFloat("plan_amount"));
				            m.setTenure_year(rs.getInt("plan_tenure"));
				       
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
