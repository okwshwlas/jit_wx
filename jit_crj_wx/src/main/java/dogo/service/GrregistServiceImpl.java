package dogo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dogo.dao.GrregistMapper;
import dogo.model.Grregist;

@Service
public class GrregistServiceImpl implements GrregistServiceI{
	
	@Autowired
	private GrregistMapper grregistMapper;

	public void save(Grregist grregist) {
		
		grregistMapper.insertSelective(grregist);
	}

	public Grregist selectByCardAndPhone(String idcard, String phonenum) {
		return grregistMapper.selectByCardAndPhone(idcard, phonenum);
	}

}
