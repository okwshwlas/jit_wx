package dogo.dao;

import java.util.List;
import java.util.Map;

import dogo.model.Gongzhong;

public interface GongzhongMapper {
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
    int insert(Gongzhong record);

    /**
     * 非空新增
     * @param record
     * @return
     */
    int insertSelective(Gongzhong record);

    /**
     * 根据主键查询公众账号
     * @param id
     * @return
     */
    Gongzhong selectByPrimaryKey(String id);

    /**
     * 根据主键非空修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Gongzhong record);

    /**
     * 根据主键修改
     * @param record
     * @return
     */
    int updateByPrimaryKey(Gongzhong record);

	/**
	 * 查询记录数
	 * @param res
	 * @return
	 */
	int selectAllGZZHCount(Map<String, Object> res);

	/**
	 * 公众账号list
	 * @param res
	 * @return
	 */
	List<Gongzhong> selectAllGZZHByPage(Map<String, Object> res);
}