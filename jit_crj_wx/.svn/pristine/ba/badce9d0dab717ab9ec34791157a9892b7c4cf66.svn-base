package dogo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import dogo.model.Tuwen;
import dogo.model.Wenben;

public interface WenbenMapper {
    /**
     * 根据主键删除
     * @param id
     * @return
     */
    int deleteByPrimaryKey(String id);

    /**
     * 新增
     * @param record
     * @return
     */
    int insert(Wenben record);

    /**
     * 非空新增
     * @param record
     * @return
     */
    int insertSelective(Wenben record);

    /**
     * 根据主键查询
     * @param id
     * @return
     */
    Wenben selectByPrimaryKey(String id);

    /**
     * 非空修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Wenben record);

    /**
     * 非空修改
     * @param record
     * @return
     */
    int updateByPrimaryKeyWithBLOBs(Wenben record);

    /**
     * 修改
     * @param record
     * @return
     */
    int updateByPrimaryKey(Wenben record);

	/**
	 * 查询记录数
	 * @param res
	 * @return
	 */
	int selectAllWenbenCount(Map<String, Object> res);

	/**
	 * 文本list
	 * @param res
	 * @return
	 */
	List<Wenben> selectAllWenben(Map<String, Object> res);

	/**
	 * 查询关键字是否存在
	 * @param map
	 * @return
	 */
	int selectisNotkeyword(Map<String,Object> map);
	
	/**
	 * 根据关键词标示或关键词查询所有文本
	 * @param sign
	 * @return
	 */
	List<Wenben> selectAllWenbenBySign (String sign);
	
	 /**
     * 根据keyword_id查询文本集合
     * @param keyword_id
     * @return
     */
    @Select("select * from dogo_wenben where keyword_id=#{keyword_id,jdbcType=VARCHAR}")
    List<Wenben> selectWenbenBykeyword_id(String keyword_id);
	
}