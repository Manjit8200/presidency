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

import com.ui.dao.ProductDAO;

import com.ui.model.Location;
import com.ui.model.Product;

public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
    private DataSource dataSource;
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    JdbcTemplate jdbcTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanDAOImpl.class);

	@Override
	public String addProduct(Product m) {
		 logger.info("***** addProduct DAO Impl*****");
	       String sql = "insert into product (category_id,location_id,sub_category_id,type_id,product_name,"
	       		+ "product_code,product_hsncode,product_desc,price_type,subscription ,non_subscription,"
	       		+ "guest,visitor,billing_group_id,status,created_by,ip_address) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	       Connection conn = null;
	       
	       try
	       {
	   
	       	conn = dataSource.getConnection();
	           PreparedStatement ps = conn.prepareStatement(sql);
	               
	            ps.setInt(1, m.getCategory_id());  
	            ps.setString(2, m.getLocation_id());
				ps.setInt(3, m.getSub_category_id());
				ps.setInt(4, m.getType_id());
				ps.setString(5, m.getProduct_name());
				ps.setString(6, m.getProduct_code());
				ps.setString(7, m.getProduct_hsncode());
				ps.setString(8, m.getProduct_desc());
				ps.setInt(9, m.getPrice_type());
				ps.setFloat(10, m.getSubscription());
				ps.setFloat(11, m.getNon_subscription());
				ps.setFloat(12, m.getGuest());
				ps.setFloat(13, m.getVisitor());
				ps.setInt(14, m.getBilling_group_id());
				ps.setString(15, m.getStatus());
				ps.setInt(16, m.getCreatedBy());
				ps.setString(17, m.getIpAddress());

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
	public List<Product> getAllProduct() {
		  logger.info("+++++ GET Location NAME +++++");
		    List<Product> mmp = new ArrayList<Product>();
		    String s = "y";
		    String sql = "select pr.product_id, pr.category_id,cc.category_name,pr.sub_category_id,sc.sub_category_name,pr.type_id,tp.type_name, \n" + 
		    		"pr.product_name from product pr left join category cc on cc.category_id = pr.category_id\n" + 
		    		"left join subcategory sc on sc.sub_category_id = pr.sub_category_id \n" + 
		    		"left join type tp on tp.type_id = pr.type_id where pr.status=? ";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, s);
		        Product m = null;
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            m = new Product();
		            
		            m.setSub_category_id(rs.getInt("sub_category_id"));
		            m.setCategory_id(rs.getInt("category_id"));
				     
		            m.setSub_category_name(rs.getString("sub_category_name"));
			      
		            m.setCategory_name(rs.getString("category_name"));
		            m.setType_id(rs.getInt("type_id"));   
		            m.setType_name(rs.getString("type_name"));
		            m.setProduct_id(rs.getInt("product_id"));  
		            m.setProduct_name(rs.getString("product_name"));

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
	public Product getProductById(int product_id) {
		Product m = null;
		 String s = "y";
		String sql = "select pr.location_id as location_id, pr.product_id,pr.product_code,pr.product_hsncode,pr.product_desc,pr.price_type,pr.subscription,\n" + 
				"pr.non_subscription,pr.guest,pr.visitor,pr.billing_group_id\n" + 
				", pr.category_id,cc.category_name,pr.sub_category_id,sc.sub_category_name,pr.type_id,tp.type_name, \n" + 
				"pr.product_name  ,ll.location_name from product pr left join category cc on cc.category_id = pr.category_id\n" + 
				"left join subcategory sc on sc.sub_category_id = pr.sub_category_id  left join location ll on ll.location_id = pr.location_id \n" + 
				"left join type tp on tp.type_id = pr.type_id where pr.product_id=? and pr.status=? ";
		
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, product_id);
			ps.setString(2, s);
			ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			m = new Product();
		    m.setSub_category_id(rs.getInt("sub_category_id"));
            m.setCategory_id(rs.getInt("category_id"));
		    m.setLocation_id(rs.getString("location_id"));     
            m.setSub_category_name(rs.getString("sub_category_name"));
	        m.setLocation_name(rs.getString("location_name")); 
            m.setCategory_name(rs.getString("category_name"));
            m.setType_id(rs.getInt("type_id"));   
            m.setType_name(rs.getString("type_name"));
            m.setProduct_id(rs.getInt("product_id"));  
            m.setProduct_name(rs.getString("product_name"));
            
            m.setProduct_code(rs.getString("product_code"));
			m.setProduct_hsncode(rs.getString("product_hsncode"));
			m.setProduct_desc(rs.getString("product_desc"));
			m.setPrice_type(rs.getInt("price_type"));
			m.setSubscription(rs.getFloat("subscription"));
			m.setNon_subscription(rs.getFloat("non_subscription"));
			m.setGuest(rs.getFloat("guest"));
			m.setVisitor(rs.getFloat("visitor"));
			m.setBilling_group_id(rs.getInt("billing_group_id"));
		
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
	public String editProduct(Product m) {
		 logger.info("+++++ EDIT Product +++++");
		    String sql = "update product set category_id =?,location_id=?,sub_category_id=?,type_id=?,product_name=?,product_code=?,product_hsncode=?,product_desc=?,price_type=?,subscription=? ,non_subscription=?, guest=?,visitor=?,billing_group_id=?, status=?, created_by=?, ip_address=?  where product_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        

		        ps.setInt(1, m.getCategory_id());  
	            ps.setString(2, m.getLocation_id());
				ps.setInt(3, m.getSub_category_id());
				ps.setInt(4, m.getType_id());
				ps.setString(5, m.getProduct_name());
				ps.setString(6, m.getProduct_code());
				ps.setString(7, m.getProduct_hsncode());
				ps.setString(8, m.getProduct_desc());
				ps.setInt(9, m.getPrice_type());
				ps.setFloat(10, m.getSubscription());
				ps.setFloat(11, m.getNon_subscription());
				ps.setFloat(12, m.getGuest());
				ps.setFloat(13, m.getVisitor());
				ps.setInt(14, m.getBilling_group_id());
				ps.setString(15, m.getStatus());
				ps.setInt(16, m.getCreatedBy());
				ps.setString(17, m.getIpAddress());
				ps.setInt(18, m.getProduct_id());

		        ps.executeUpdate();
		        return "Success";
		    } catch (SQLException e) {
		    	System.out.println("/////////////////////////////////////////////"+e);
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
	public void deleteProduct(int product_id) {
		  logger.info("+++++ DELETE product +++++");
		    String status = "n";
		    String sql = "update product set status=? where product_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, status);
		        ps.setInt(2, product_id);
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
	public List<Product> getProductByPage(int pagesize, int startindex) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String addProductTaxData(Product m1) {
		 logger.info("***** addProductTaxData DAO Impl*****");
	   	
	     	String sql = "insert into product_tax (product_id,tax_type,tax_value,status,created_by,ip_address) values (?,?,?,?,?,?)";
			        Connection conn = null;
			
			        try
			        {
			        	conn = dataSource.getConnection();
			            PreparedStatement ps = conn.prepareStatement(sql);
			            
			            ps.setInt(1, m1.getProduct_id()); 	
			            ps.setInt(2, m1.getTax_type());		
			            ps.setFloat(3, m1.getTax_value());			                
				        ps.setString(4, m1.getStatus());
						ps.setInt(5, m1.getCreatedBy());
						ps.setString(6, m1.getIpAddress());      
					
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
	
			
		    logger.info("+++++ GET Last Product Id +++++");
		   
		    String s = "y";
		    String sql = "SELECT max(product_id) as product_id  FROM product  where status= ?";
		   
		  
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, s);
		    
		 
		      int id=0;
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		        	
			     id= rs.getInt("product_id");
			          
		        	System.out.println("/////////////////////product_id DAO////////////////////////////"+id);
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
	public Product getProducTaxtById(int product_id) {
		Product m = null;
		String sql = " SELECT * FROM product_tax where product_id=? ";
		
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, product_id);
			ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			m = new Product();
            m.setProduct_id(rs.getInt("product_id"));  
           	
            m.setTax_type(rs.getInt("tax_type"));	
            m.setTax_value(rs.getInt("tax_value")); 		                
	      
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
	public List<Product> getAllProductTax(int product_id) {
		  logger.info("+++++ GET Location NAME +++++");
		    List<Product> mmp = new ArrayList<Product>();
		    String s = "y";
		    String sql = "SELECT *, mt.tax_type_name FROM product_tax left join master_tax mt on mt.tax_type_id = tax_type where product_id=? and status=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setInt(1, product_id);
		        ps.setString(2, s);
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		        	  Product m =  new Product();
		        	  m.setProduct_id(rs.getInt("product_id"));  
		        	  m.setProduct_tax_id(rs.getInt("product_tax_id"));  
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
	public void deleteProductTax(int product_tax_id) {
		  logger.info("+++++ DELETE product Tax +++++");
		    String status = "n";
		    String sql = "update product_tax set status=? where product_tax_id=?";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, status);
		        ps.setInt(2, product_tax_id);
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








