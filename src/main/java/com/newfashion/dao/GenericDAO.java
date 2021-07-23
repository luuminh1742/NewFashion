package com.newfashion.dao;

import java.util.List;

import com.newfashion.mapper.RowMapper;

public interface GenericDAO<E> {
	List<E> query(String sql,RowMapper<E> rowMapper,Object...parameters);
	Integer insert(String sql,Object...parameters);
	boolean update(String sql,Object...parameters);
	E findById(String sql,RowMapper<E> rowMapper,Object...parameters);
}
