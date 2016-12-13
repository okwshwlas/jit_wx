package dogo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dogo.dao.KeywordsMapper;
import dogo.dao.TuwenMapper;
import dogo.model.Keywords;

@Service("keywordsService")
public class KeywordsServiceImpl implements KeywordsService {

	private KeywordsMapper keywordsMapper;
	
	public KeywordsMapper getKeywordsMapper() {
		return keywordsMapper;
	}
	@Autowired
	public void setKeywordsMapper(KeywordsMapper keywordsMapper) {
		this.keywordsMapper = keywordsMapper;
	}
	private TuwenMapper tuwenMapper;
	
	public TuwenMapper getTuwenMapper() {
		return tuwenMapper;
	}
	@Resource
	public void setTuwenMapper(TuwenMapper tuwenMapper) {
		this.tuwenMapper = tuwenMapper;
	}
	public List<Keywords> selectKeywords()   {
		return keywordsMapper.selectKeywords();
	}
	public List<Keywords> selectAllKeywordsByPage(Map<String,Object> map)   {
		return keywordsMapper.selectAllKeywordsByPage(map);
	}
	public int selectAllKeywordsCount(Map<String,Object> map)   {
		return keywordsMapper.selectAllKeywordsCount(map);
	}
	public void insertKeywords(Keywords keywords)   {
		 keywordsMapper.insertSelective(keywords);
	}
	public Keywords selectKeywordsById(String id)   {
		return  keywordsMapper.selectByPrimaryKey(id);
	}
	public void updateKeywords(Keywords keywords)   {
		keywordsMapper.updateByPrimaryKeySelective(keywords);
	}
	public void deleteSingleKeywords(Keywords keywords)   {
		String id = keywords.getId();
		if(null!=id){
			keywordsMapper.deleteByPrimaryKey(id);
			tuwenMapper.deleteByKeywordsId(id);
		}
	}

	

}
