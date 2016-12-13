package dogo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dogo.dao.WenbenMapper;
import dogo.model.Wenben;

@Service("wenbenService")
public class WenbenServiceImpl implements WenbenService {
	
	private WenbenMapper wenbenMapper;

	public WenbenMapper getWenbenMapper() {
		return wenbenMapper;
	}
	@Resource
	public void setWenbenMapper(WenbenMapper wenbenMapper) {
		this.wenbenMapper = wenbenMapper;
	}

	public int selectAllWenbenCount(Map<String, Object> res)  {
		return wenbenMapper.selectAllWenbenCount(res);
	}

	public List<Wenben> selectAllWenben(Map<String, Object> res)
			 {
		return wenbenMapper.selectAllWenben(res);
	}

	public void insertWenben(Wenben wenben)  {
		wenbenMapper.insertSelective(wenben);
	}

	public void updateWenbenById(Wenben wenben)  {
		wenbenMapper.updateByPrimaryKeySelective(wenben);
	}

	public void deleteWenbenById(String id)  {
		wenbenMapper.deleteByPrimaryKey(id);
	}
	public Wenben selectWenbenById(String id)  {
		return wenbenMapper.selectByPrimaryKey(id);
	}
	public List<Wenben> selectAllWenbenBySign(String sign) {
		return wenbenMapper.selectAllWenbenBySign(sign);
	}
	public List<Wenben> selectWenbenBykeyword_id(String keyword_id) {
		return wenbenMapper.selectWenbenBykeyword_id(keyword_id);
	}
	

}
