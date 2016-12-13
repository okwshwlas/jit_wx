package dogo.dao;

import dogo.model.Huanying;

public interface HuanyingMapper {
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
    int insert(Huanying record);

    /**
     * 非空新增
     * @param record
     * @return
     */
    int insertSelective(Huanying record);

    /**
     * 根据主键查询
     * @param id
     * @return
     */
    Huanying selectByPrimaryKey(String id);

    /**非空修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Huanying record);

    /**非空修改
     * @param record
     * @return
     */
    int updateByPrimaryKeyWithBLOBs(Huanying record);

    /**修改
     * @param record
     * @return
     */
    int updateByPrimaryKey(Huanying record);
}