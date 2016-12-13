package dogo.dao;

import dogo.model.HuanyingTuwen;

public interface HuanyingTuwenMapper {
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
    int insert(HuanyingTuwen record);

    /**
     * 非空新增
     * @param record
     * @return
     */
    int insertSelective(HuanyingTuwen record);

    /**
     * 根据主键查询
     * @param id
     * @return
     */
    HuanyingTuwen selectByPrimaryKey(String id);

    /**
     * 非空修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(HuanyingTuwen record);

    /**
     * 修改
     * @param record
     * @return
     */
    int updateByPrimaryKey(HuanyingTuwen record);
}