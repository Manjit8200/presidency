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

import com.ui.dao.LocationDAO;
import com.ui.model.Location;
import com.ui.model.MasterMemberPlan;

public class LocationDAOImpl implements LocationDAO {
	
	@Autowired
    private DataSource dataSource;
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    JdbcTemplate jdbcTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanDAOImpl.class);
    
	@Override
	public String addLocation(Location m) {

		 logger.info("***** Add Location DAO Impl*****");
       String sql = "insert into location (location_code,location_name,location_mobile_no,location_phone_no,status,created_by,ip_address) values (?,?,?,?,?,?,?)";

       Connection conn = null;
       
       try
       {
   
       	conn = dataSource.getConnection();
           PreparedStatement ps = conn.prepareStatement(sql);
          
         
           ps.setInt(1, m.getLocation_code());  
           ps.setString(2, m.getLocation_name());
			ps.setString(3, m.getLocation_mobile_no());
			ps.setString(4, m.getLocation_phone_no());
			ps.setString(5, m.getStatus());
				ps.setInt(6, m.getCreatedBy());
				ps.setString(7, m.getIpAddress());
				

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
	public List<Location> getAllLocation() {
		  logger.info("+++++ GET Location NAME +++++");
		    List<Location> mmp = new ArrayList<Location>();
		    String s = "y";
		    String sql = "select location_id ,location_code,location_name,location_mobile_no,location_phone_no from location where status=? ";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, s);
		        Location m = null;
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            m = new Location();
		            m.setLocation_id(rs.getInt("location_id"));
		            m.setLocation_code(rs.getInt("location_code"));
		            m.setLocation_name(rs.getString("location_name"));
		            m.setLocation_mobile_no(rs.getString("location_mobile_no"));
		            m.setLocation_phone_no(rs.getString("location_phone_no"));
		       
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
	public Location getLocationById(int location_id) {

		Location m = null;
		String sql = "SELECT location_id,location_code,location_name,location_mobile_no,location_phone_no FROM location where location_id=?";
		
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, location_id);
			ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			m = new Location();
			m.setLocation_id(rs.getInt("location_id"));
			 m.setLocation_code(rs.getInt("location_code"));
	            m.setLocation_name(rs.getString("location_name"));
	            m.setLocation_mobile_no(rs.getString("location_mobile_no"));
	            m.setLocation_phone_no(rs.getString("location_phone_no"));
		
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
	public String editLocation(Location m) {
		   logger.info("+++++ EDIT Location +++++");
		    String sql = "update location set location_code=?, location_name=?, location_mobile_no=?, location_phone_no=?, status=?, created_by=?, ip_address=?  where location_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        

		           ps.setInt(1, m.getLocation_code());  
		           ps.setString(2, m.getLocation_name());
					ps.setString(3, m.getLocation_mobile_no());
					ps.setString(4, m.getLocation_phone_no());
					ps.setString(5, m.getStatus());
						ps.setInt(6, m.getCreatedBy());
						ps.setString(7, m.getIpAddress());
						 ps.setInt(8, m.getLocation_id()); 

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
	public void deleteLocation(int location_id) {
		  logger.info("+++++ DELETE MemberPlan +++++");
		    String status = "n";
		    String sql = "update location set status=? where location_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, status);
		        ps.setInt(2, location_id);
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
	public List<Location> getLocationByPage(int pagesize, int startindex) {
		// TODO Auto-generated method stub
		return null;
	}

}
