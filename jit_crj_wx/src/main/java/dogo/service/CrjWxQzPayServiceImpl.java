package dogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dogo.dao.CrjJjywMapper;
import dogo.dao.CrjPaylogMapper;
import dogo.model.CrjJjyw;
import dogo.model.CrjPaylog;

@Service
public class CrjWxQzPayServiceImpl implements CrjWxQzPayServicel{
	
	
	@Autowired
	CrjPaylogMapper crjPaylogMapper;

	@Override
	public int deleteByPrimaryKey(String id) {
		return crjPaylogMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(CrjPaylog record) {
		// TODO Auto-generated method stub
//		System.out.println("1111");
		return crjPaylogMapper.insert(record);
	}

	@Override
	public int insertSelective(CrjPaylog record) {
		// TODO Auto-generated method stub
		return crjPaylogMapper.insertSelective(record);
	}

	@Override
	public CrjPaylog selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return crjPaylogMapper.selectByPrimaryKey(id);
	}

	@Override
	public CrjPaylog selectByBizNo(String bizNo) {
		// TODO Auto-generated method stub
		return crjPaylogMapper.selectByBizNo(bizNo);
	}

	@Override
	public int updateByPrimaryKeySelective(CrjPaylog record) {
		// TODO Auto-generated method stub
		return crjPaylogMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(CrjPaylog record) {
		// TODO Auto-generated method stub
		return crjPaylogMapper.updateByPrimaryKey(record);
	}
	

	
}
