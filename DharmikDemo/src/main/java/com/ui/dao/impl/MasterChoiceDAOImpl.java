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

import com.ui.dao.MasterChoiceDAO;
import com.ui.model.MasterChoice;



public class MasterChoiceDAOImpl implements MasterChoiceDAO{

	@Autowired
    private DataSource dataSource;
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    JdbcTemplate jdbcTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanDAOImpl.class);
	
	@Override
	public String addMasterChoice(MasterChoice m) {
		// TODO Auto-generated method stub

				 logger.info("***** addMasterChoice DAO Impl*****");
		      String sql = "insert into master_choice (choice_name,status,created_by,ip_address) values (?,?,?,?)";

		      Connection conn = null;
		      
		      try
		      {
		  
		      	conn = dataSource.getConnection();
		          PreparedStatement ps = conn.prepareStatement(sql);
		         
		        
		          	ps.setString(1, m.getChoice_name());  
		          
					ps.setString(2, m.getStatus());
					ps.setInt(3, m.getCreatedBy());
					ps.setString(4, m.getIpAddress());
						

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
	public List<MasterChoice> getAllMasterChoice() {
		 logger.info("+++++ GET getAllMasterChoice +++++");
		    List<MasterChoice> mmp = new ArrayList<MasterChoice>();
		    String s = "y";
		    String sql = "select * from master_choice where status=? ";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, s);
		        MasterChoice m = null;
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            m = new MasterChoice();
		            m.setChoice_id(rs.getInt("choice_id"));
		            m.setChoice_name(rs.getString("choice_name"));
		       
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
