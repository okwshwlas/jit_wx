package dogo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dogo.dao.GongzhongMapper;
import dogo.model.Gongzhong;

@Service("gongzhongZhanghaoService")
public class GongzhongZhanghaoServiceImpl implements GongzhongZhanghaoService {

	private GongzhongMapper gongzhongMapper;

	public GongzhongMapper getGongzhongMapper() {
		return gongzhongMapper;
	}
	@Resource
	public void setGongzhongMapper(GongzhongMapper gongzhongMapper) {
		this.gongzhongMapper = gongzhongMapper;
	}
	public int selectAllGZZHCount(Map<String, Object> res)  {
		return gongzhongMapper.selectAllGZZHCount(res);
	}
	public List<Gongzhong> selectAllGZZHByPage(Map<String, Object> res)
			 {
		return gongzhongMapper.selectAllGZZHByPage(res);
	}
	public void insertGongzhongZhanghao(Gongzhong gongzhong)   {
		gongzhongMapper.insertSelective(gongzhong);
	}
	public Gongzhong selectGongzhongZhanghaoById(String id)  {
		return gongzhongMapper.selectByPrimaryKey(id);
	}
	public void updateGongzhongZhanghao(Gongzhong gongzhong)  {
		gongzhongMapper.updateByPrimaryKeySelective(gongzhong);
	}
	public void deleteGongzhongZhanghao(String id)  {
		gongzhongMapper.deleteByPrimaryKey(id);
	}
	
	
}
