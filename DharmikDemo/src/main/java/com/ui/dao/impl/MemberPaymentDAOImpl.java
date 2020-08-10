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

import com.ui.dao.MemberPaymentDAO;
import com.ui.model.MemberPayment;
import com.ui.model.Product;

public class MemberPaymentDAOImpl implements MemberPaymentDAO {
	
	
	@Autowired
    private DataSource dataSource;
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    JdbcTemplate jdbcTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanDAOImpl.class);

	
	@Override
	public String addMemberPayment(MemberPayment m) {
		 logger.info("***** addMemberPayment DAO Impl*****");
	       String sql = "insert into member_payment ( member_id,member_plan_amount,member_discount,member_currency, member_total_amount,status,created_by,ip_address) values (?,?,?,?,?,?,?,?)";

	       Connection conn = null;
	       
	       try
	       {
	   
	       	conn = dataSource.getConnection();
	           PreparedStatement ps = conn.prepareStatement(sql);
	               
	            ps.setInt(1, m.getMember_id());  
	            ps.setInt(2, m.getMember_plan_amount());
				ps.setFloat(3, m.getMember_discount());
				ps.setInt(4, m.getMember_currency());
				ps.setFloat(5, m.getMember_total_amount());
		
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
	public String addMemberPaymentTaxData(MemberPayment m1) {
		 logger.info("***** addMemberPaymentTaxData DAO Impl*****");
		   	
	     	String sql = "insert into member_payment_tax (member_id,tax_type,tax_value,status,created_by,ip_address,member_payment_id) values (?,?,?,?,?,?,?)";
			        Connection conn = null;
			
			        try
			        {
			        	conn = dataSource.getConnection();
			            PreparedStatement ps = conn.prepareStatement(sql);
			            
			            ps.setInt(1, m1.getMember_id()); 	
			            ps.setInt(2, m1.getTax_type());		
			            ps.setFloat(3, m1.getTax_value());			                
				        ps.setString(4, m1.getStatus());
						ps.setInt(5, m1.getCreatedBy());
						ps.setString(6, m1.getIpAddress());      
						ps.setInt(7, m1.getMember_payment_id());
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
	public int getLastPr() {
		// TODO Auto-generated method stub
		
		
	    logger.info("+++++ GET Last member Id +++++");
	   
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
		          
	        	System.out.println("/////////////////////member_id DAO////////////////////////////"+id);
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
	public List<MemberPayment> getAllMemberPayment(int member_id) {
		 logger.info("+++++ getAllMemberPayment +++++");

	    List<MemberPayment> mmp = new ArrayList<MemberPayment>();
	    String s = "y";
	    String sql = "SELECT * FROM member_payment where status=? and member_id=?";
	    Connection conn = null;
	    try {
	        conn = dataSource.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, s);
	        ps.setInt(2, member_id);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	        	  
	        	  MemberPayment m = new MemberPayment();
	   		   m.setMember_id(rs.getInt("member_id"));  
	   		  m.setMember_payment_id(rs.getInt("member_payment_id"));
	              m.setMember_plan_amount(rs.getInt("member_plan_amount"));  
	   			m.setMember_discount(rs.getFloat("member_discount"));  
	   			m.setMember_currency(rs.getInt("member_currency"));  
	   			m.setMember_total_amount(rs.getFloat("member_total_amount")); 
	   			m.setCreatedDate(rs.getString("created_date"));
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
	public MemberPayment getMemberPaymentById(int member_payment_id) {
		MemberPayment m = null;
		String s="y";
		String sql = "SELECT * FROM member_payment where status=? and member_payment_id=?";
		
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, s);
			ps.setInt(2, member_payment_id);
			ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			m = new MemberPayment();
			   m.setMember_id(rs.getInt("member_id"));  
			   m.setMember_payment_id(rs.getInt("member_payment_id"));
	              m.setMember_plan_amount(rs.getInt("member_plan_amount"));  
	   			m.setMember_discount(rs.getFloat("member_discount"));  
	   			m.setMember_currency(rs.getInt("member_currency"));  
	   			m.setMember_total_amount(rs.getFloat("member_total_amount"));          
	      
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
	public String editMemberPayment(MemberPayment m) {
		 logger.info("+++++  editMemberPayment +++++");
		    String sql = "update member_payment set member_plan_amount=?,member_discount=?,member_currency=?, member_total_amount=?, status=?, created_by=?, ip_address=?  where member_payment_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);           
	            ps.setInt(1, m.getMember_plan_amount());
				ps.setFloat(2, m.getMember_discount());
				ps.setInt(3, m.getMember_currency());
				ps.setFloat(4, m.getMember_total_amount());	
				ps.setString(5, m.getStatus());
				ps.setInt(6, m.getCreatedBy());
				ps.setString(7, m.getIpAddress());
				ps.setInt(8, m.getMember_payment_id());  

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
	@Override
	public void deleteMemberPayment(int member_payment_id) {
		  logger.info("+++++ DELETE product Tax +++++");
		    String status = "n";
		    String sql = "update member_payment set status=? where member_payment_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, status);
		        ps.setInt(2, member_payment_id);
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
	public MemberPayment getMemberPaymentTaxtById(int member_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberPayment> getAllMemberPaymentTax(int member_id) {
		 logger.info("+++++ GET Location NAME +++++");
		    List<MemberPayment> mmp = new ArrayList<MemberPayment>();
		    String s = "y";
		    String sql = " SELECT *, mt.tax_type_name FROM member_payment_tax left join master_tax mt on mt.tax_type_id = tax_type where member_id=? and status=? ";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setInt(1, member_id);
		        ps.setString(2, s);
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		        	MemberPayment m =  new MemberPayment();
		        	 
		        	m.setMember_id(rs.getInt("member_id"));  
		        	  m.setMember_tax_id(rs.getInt("member_tax_id"));  
		              m.setTax_type(rs.getInt("tax_type"));	
		              m.setTax_value(rs.getInt("tax_value")); 	
		              m.setTax_type_name(rs.getString("tax_type_name")); 

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
	public void deleteMemberPaymenttTax(int member_tax_id) {
		 logger.info("+++++ DELETE product Tax +++++");
		    String status = "n";
		    String sql = "update member_payment_tax set status=? where member_tax_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, status);
		        ps.setInt(2, member_tax_id);
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
	public int getLastPaymentId() {
	// TODO Auto-generated method stub
		
		
	    logger.info("+++++ GET Last member Id +++++");
	   
	    String s = "y";
	    String sql = "SELECT max(member_payment_id) as member_payment_id  FROM member_payment  where status= ?";
	   
	  
	    Connection conn = null;
	    try {
	        conn = dataSource.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, s);
	    
	 
	      int id1=0;
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	        	
		     id1= rs.getInt("member_payment_id");
		          
	        	System.out.println("/////////////////////member_payment_id DAO////////////////////////////"+id1);
	        }
	        rs.close();
	        ps.close();
	        return id1;
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
