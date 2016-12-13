package dogo.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dogo.dao.HuanyingTuwenMapper;
import dogo.model.HuanyingTuwen;

@Service("huanyingTuwenService")
public class HuanyingTuwenServiceImpl implements HuanyingTuwenService {

	HuanyingTuwenMapper huanyingTuwenMapper;
	
	public HuanyingTuwenMapper getHuanyingTuwenMapper() {
		return huanyingTuwenMapper;
	}
	@Resource
	public void setHuanyingTuwenMapper(HuanyingTuwenMapper huanyingTuwenMapper) {
		this.huanyingTuwenMapper = huanyingTuwenMapper;
	}

	public void updateHuanyingTuwenParentById(HuanyingTuwen huanyingTuwen){
		huanyingTuwenMapper.updateByPrimaryKeySelective(huanyingTuwen);
	}
	public void addHuanyingTuwen(HuanyingTuwen huanyingTuwen) {
		huanyingTuwenMapper.insertSelective(huanyingTuwen);
	}
	public HuanyingTuwen selectByPrimaryKey(String id) {
		return huanyingTuwenMapper.selectByPrimaryKey(id);
	}
	
}
