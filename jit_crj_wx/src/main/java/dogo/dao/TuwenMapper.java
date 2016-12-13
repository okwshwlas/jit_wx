package dogo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import dogo.model.Tuwen;

public interface TuwenMapper {
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
    int insert(Tuwen record);

    /**
     * 根据主键查询
     * @param id
     * @return
     */
    Tuwen selectByPrimaryKey(String id);

    /**
     * 非空修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Tuwen record);

    /**
     * 修改
     * @param record
     * @return
     */
    int updateByPrimaryKey(Tuwen record);
    

    /**
     * 查询所有图文带分页
     * @param map
     * @return
     */
    List<Tuwen> selectAllTuwenByPage(Map<String, Object> map);
    
    /**
     * 查询总记录数
     * @param map
     * @return
     */
    int selectAllCount(Map<String, Object> map);

    
	/**
	 * 非空新增
	 * @param tuwen
	 * @throws Exception
	 */
	void insertTuwen(Tuwen tuwen) ;

	/**
	 * 根据id删除
	 * @param id
	 */
	void deleteTuwenById(String id);

	/**
	 * 根据parentid删除
	 * @param id
	 */
	void deleteTuwenByParentId(String id);

	/**
	 * 根据parentid查询list
	 * @param par
	 * @return 图文list
	 */
	List<Tuwen> selectByPatentId(Map<String, Object> par);

	/**
	 * 根据主键修改parentid
	 * @param tuwen
	 */
	void updateParentIdByPrimaryKey(Tuwen tuwen);

	/**
	 * 查询当前id是否已经是子id
	 * @param tuwen
	 * @return 返回0则不是子id,也可添加,否则不可以
	 */
	int selectHasParentId(Tuwen tuwen);

    /**
     * 按照关键字删除
     * @param id
     */
    void deleteByKeywordsId(String id);

	/**
	 * 查询关键字是可用
	 * @param map
	 * @return
	 */
	int selectisNotkeyword(Map<String,Object> map);
	
	/**
	 * 根据关键词标示或关键词查询所有图文
	 * @param sign
	 * @return
	 */
	List<Tuwen> selectAllTuwenBySign(String sign);
	
	 /**
     * 根据keyword_id查询图文集合
     * @param keyword_id
     * @return
     */
    @Select("select * from dogo_tuwen where keyword_id=#{keyword_id,jdbcType=VARCHAR}")
    List<Tuwen> selectTuwenBykeyword_id(String keyword_id);
	
}