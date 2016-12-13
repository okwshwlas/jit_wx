package dogo.service;

import java.util.List;
import java.util.Map;

import dogo.model.Keywords;

public interface KeywordsService {
	
	
	/**
	 * 查询所有关键字,不带分页
	 * @return
	 * @ 
	 */
	public List<Keywords> selectKeywords()  ;
	
	/**
	 * 查询关键字记录数
	 * @param res 
	 * @return
	 * @ 
	 */
	int selectAllKeywordsCount(Map<String, Object> res)  ;
	
	/**
	 * 带分页查询所有关键字
	 * @param map
	 * @return
	 */
	List<Keywords> selectAllKeywordsByPage(Map<String, Object> map)  ;

	public void insertKeywords(Keywords keywords)  ;

	public Keywords selectKeywordsById(String id)  ;

	public void updateKeywords(Keywords keywords)  ;

	public void deleteSingleKeywords(Keywords keywords)  ;

}
