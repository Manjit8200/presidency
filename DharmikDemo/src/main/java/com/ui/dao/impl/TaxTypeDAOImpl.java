
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

import com.ui.dao.TaxTypeDAO;

import com.ui.model.TaxType;

public class TaxTypeDAOImpl implements TaxTypeDAO {
	@Autowired
    private DataSource dataSource;
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    JdbcTemplate jdbcTemplate;

    private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanDAOImpl.class);

	@Override
	public List<TaxType> getAllTaxType() {
		  logger.info("+++++getAllTaxType +++++");
		    List<TaxType> mmp = new ArrayList<TaxType>();
		    String s = "y";
		    String sql = "select * from master_tax ";
		    Connection conn = null;
		    try {
		        conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        
		        TaxType m = null;
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            m = new TaxType();
		            
		          m.setTax_type_id(rs.getInt("tax_type_id"));
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

  
  
  }
 