package dogo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dogo.dao.HuanyingMapper;
import dogo.dao.HuanyingTuwenMapper;
import dogo.dao.TuwenMapper;
import dogo.model.Huanying;
import dogo.model.HuanyingTuwen;
import dogo.model.Tuwen;

@Service("huanyingService")
public class HuanyingServiceImpl implements HuanyingService {

	private HuanyingMapper huanyingMapper;
	
	private TuwenMapper tuwenMapper;
	
	private HuanyingTuwenMapper huanyingTuwenMapper;
	
	public HuanyingTuwenMapper getHuanyingTuwenMapper() {
		return huanyingTuwenMapper;
	}
	@Resource
	public void setHuanyingTuwenMapper(HuanyingTuwenMapper huanyingTuwenMapper) {
		this.huanyingTuwenMapper = huanyingTuwenMapper;
	}

	public TuwenMapper getTuwenMapper() {
		return tuwenMapper;
	}

	@Resource
	public void setTuwenMapper(TuwenMapper tuwenMapper) {
		this.tuwenMapper = tuwenMapper;
	}

	public HuanyingMapper getHuanyingMapper() {
		return huanyingMapper;
	}

	@Resource
	public void setHuanyingMapper(HuanyingMapper huanyingMapper) {
		this.huanyingMapper = huanyingMapper;
	}


	public Huanying selectHuanyingWenbenById(String id) {
		return huanyingMapper.selectByPrimaryKey(id);
	}

	public void updateHuanyingById(Huanying huanying) {
		huanyingMapper.updateByPrimaryKeySelective(huanying);
	}

	public HuanyingTuwen selectAllHuanyingtuwenById(String id) {
		HuanyingTuwen huanyingTuwen = huanyingTuwenMapper.selectByPrimaryKey(id);
		Map<String,Object> par = new HashMap<String, Object>();
		par.put("id", id);
		List<Tuwen> list = tuwenMapper.selectByPatentId(par);
		huanyingTuwen.setList(list);
		return huanyingTuwen;
	}

}
