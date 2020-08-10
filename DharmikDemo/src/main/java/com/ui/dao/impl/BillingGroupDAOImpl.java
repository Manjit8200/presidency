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

import com.ui.dao.BillingGroupDAO;
import com.ui.model.BillingGroup;
import com.ui.model.MasterChoice;

public class BillingGroupDAOImpl implements BillingGroupDAO {
	@Autowired
    private DataSource dataSource;
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    JdbcTemplate jdbcTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanDAOImpl.class);
	@Override
	public String addBillingGroup(BillingGroup m) {
		// TODO Auto-generated method stub

		 logger.info("***** addbilling_group DAO Impl*****");
     String sql = "insert into billing_group (billing_group__name,billing_group_code,billing_group_title,billing_group_hsn,billing_group_desc,status,created_by,ip_address) values (?,?,?,?,?,?,?,?)";

       	
     
     Connection conn = null;
     
     try
     {
 
     	conn = dataSource.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
        
       
         	ps.setString(1, m.getBilling_group__name());  
         	ps.setString(2, m.getBilling_group_code());
            ps.setString(3, m.getBilling_group_title());
            ps.setString(4, m.getBilling_group_hsn());
            ps.setString(5, m.getBilling_group_desc());
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
	public List<BillingGroup> getAllBillingGroupe() {
		 logger.info("+++++ GET getAllBillingGroup +++++");
		    List<BillingGroup> mmp = new ArrayList<BillingGroup>();
		    String s = "y";
		    String sql = "select * from billing_group where status=? ";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, s);
		        BillingGroup m = null;
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            m = new BillingGroup();
		            m.setBilling_group_id(rs.getInt("billing_group_id"));
		            m.setBilling_group__name(rs.getString("billing_group__name"));
		       
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
