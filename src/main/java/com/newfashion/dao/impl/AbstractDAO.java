package com.newfashion.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.newfashion.dao.GenericDAO;
import com.newfashion.mapper.RowMapper;

public class AbstractDAO<E> implements GenericDAO<E> {

	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/newfashion?useSSL=false";
			String user = "root";
			String password = "minh@1234";
			return DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			return null;
		}
	}

	
	public void setParameters(PreparedStatement statement, Object... parameters) {
		try {
			int sizeParameter =  parameters.length;
			for (int i = 0; i < sizeParameter; i++) {
				int index = i + 1;
				Object para = parameters[i];
				if (para instanceof Integer) {
					statement.setInt(index, (Integer) para);
				}else if(para instanceof String) {
					statement.setString(index, (String) para);
				}else if(para instanceof Timestamp) {
					statement.setTimestamp(index, (Timestamp) para);
				}else if(para instanceof Short) {
					statement.setShort(index, (short) para);
				}else if(para instanceof Byte) {
					statement.setByte(index, (byte) para);
				}else if(para instanceof Boolean) {
					statement.setBoolean(index, (Boolean) para);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * Phuong thuc truy van du lieu. Select cac table trong database
	 */
	@Override
	public List<E> query(String sql, RowMapper<E> rowMapper, Object... parameters) {
		List<E> results = new ArrayList<>();
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		Connection connection = null;
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			setParameters(statement,parameters);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				results.add(rowMapper.mapRow(resultSet));
			}
			return results;
		} catch (SQLException ex) {
			return null;
		} finally {
			try {
				if (statement != null)
					statement.close();
				if (resultSet != null)
					resultSet.close();
				if (connection != null)
					connection.close();
			} catch (SQLException ex) {
				return null;
			}
		}
	}

	@Override
	public E findById(String sql,RowMapper<E> rowMapper,Object...parameters) {
		List<E> result = query(sql, rowMapper, parameters);
		return result.isEmpty() ? null : result.get(0);
	}


	@Override
	public Integer insert(String sql, Object... parameters) {
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement statement = null;
		Integer id = null;
		try {
			connection = getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
			setParameters(statement, parameters);
			statement.executeUpdate();
			resultSet = statement.getGeneratedKeys();
			if (resultSet.next())
				id = resultSet.getInt(1);
			connection.commit();
			return id;
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			return null;
		} finally {
			try {
				if (connection != null)
					connection.close();
				if (statement != null)
					statement.close();
				if (resultSet != null)
					resultSet.close();
			} catch (SQLException e2) {
				return null;
			}

		}
	}


	@Override
	public boolean update(String sql, Object... parameters) {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement(sql);
			setParameters(statement, parameters);
			statement.executeUpdate();
			connection.commit();
			return true;
		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
					return false;
				}
			}
			return false;
		} finally {
			try {
				if (connection != null)
					connection.close();
				if (statement != null)
					statement.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
				return false;
			}
		}
	}

}
