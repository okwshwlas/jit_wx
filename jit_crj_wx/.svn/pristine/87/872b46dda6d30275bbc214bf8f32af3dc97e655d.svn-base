package dogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dogo.dao.TzggMapper;
import dogo.model.Tzgg;

@Service
public class TzggServiceImpl implements TzggServiceI{
	
	@Autowired
	private TzggMapper tzggMapper;

	public List<Tzgg> selectAllTzggByIdcardAndstatue(Tzgg tzgg) {
		return tzggMapper.selectAllTzggByIdcardAndstatue(tzgg);
	}

	public Tzgg selectById(String id) {
		return tzggMapper.selectByPrimaryKey(id);
	}

}
