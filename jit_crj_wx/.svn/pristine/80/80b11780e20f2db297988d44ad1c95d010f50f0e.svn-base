package dogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dogo.dao.CrjRyjbxxMapper;
import dogo.model.CrjRyjbxx;
import dogo.model.SysDictionary;
import dogo.model.YuYueRiqiBean;

@Service
public class SysDictionaryServiceImpl implements SysDictionaryServiceI{
	
	@Autowired
	private CrjRyjbxxMapper crjRyjbxxMapper;

	public void save(CrjRyjbxx crjRyjbxx) {
		
		crjRyjbxxMapper.insertSelective(crjRyjbxx);
	}
	
	public CrjRyjbxx selectByCardAndPhone(String sfzjhm, String lxdh) {
		return crjRyjbxxMapper.selectByCardAndPhone(sfzjhm, lxdh);
	}
	
	public SysDictionary listSysDictionaryByType(String sid, String type) {
		return crjRyjbxxMapper.listSysDictionaryByType(sid, type);
	}
	
	public List findYuYueByRiqi(String sid, String type) {
		return (List) crjRyjbxxMapper.findYuYueByRiqi(sid, type);
	}

}
