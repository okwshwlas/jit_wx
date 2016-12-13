package dogo.dao;

import java.util.List;
import java.util.Map;

import dogo.model.Keywords;

public interface KeywordsMapper {
    /**
     * 根据主键删除
     * @param id
     * @return
     */
    int deleteByPrimaryKey(String id) ;

    /**
     * 新增
     * @param record
     * @return
     */
    int insert(Keywords record) ;

    /**
     * 非空新增
     * @param record
     * @return
     */
    int insertSelective(Keywords record) ;

    /**
     * 根据主键查询
     * @param id
     * @return
     */
    Keywords selectByPrimaryKey(String id) ;

    /**
     * 非空根据主键修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Keywords record) ;

    /**
     * 根据主键修改全部字段
     * @param record
     * @return
     */
    int updateByPrimaryKey(Keywords record) ;
    
    /**
     * 查询所有关键词,不带分页
     * 
     */
	List<Keywords> selectKeywords() ;
	
	/**
	 * 带分页查询所有关键字
	 * @param map
	 * @return
	 */
	List<Keywords> selectAllKeywordsByPage(Map<String,Object> map) ;
	
	/**
	 * 查询关键字记录数
	 * @return
	 * @throws Exception
	 */
	int selectAllKeywordsCount(Map<String,Object> map) ;
}