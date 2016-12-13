package dogo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import dogo.model.CustomMenu;

public interface CustomMenuMapper {
	
	/**
	 * 根据主键删除
	 * @param id
	 * @return
	 */
    int deleteByPrimaryKey(String id);

    /**
     * 保存
     * @param record
     * @return
     */
    int insert(CustomMenu record);

    /**
     * 保存过滤null
     * @param record
     * @return
     */
    int insertSelective(CustomMenu record);

    /**
     * 根据主键查询
     * @param id
     * @return
     */
    CustomMenu selectByPrimaryKey(String id);

    /**
     * 修改过滤null
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(CustomMenu record);

    /**
     * 修改
     * @param record
     * @return
     */
    int updateByPrimaryKeyWithBLOBs(CustomMenu record);

    /**
     * 修改
     * @param record
     * @return
     */
    int updateByPrimaryKey(CustomMenu record);
    
    /**
     * 查询所有
     * @return
     */
    @Select("select * from dogo_custommenu")
    List<CustomMenu> selectAllCustomMenu();
    
    /**
     * 根据父节点查出所有子节点
     * @param parentid
     * @return
     */
    @Select("select * from dogo_custommenu where parentid=#{parentid,jdbcType=VARCHAR}")
    List<CustomMenu> selectAllChildCustomMenuByParentid(String parentid);
    
    /**
     * 根据父ID和状态查询
     * @param parentid
     * @return
     */
    @Select("select * from dogo_custommenu where parentid=#{0} and status=#{1}")
    List<CustomMenu> selectAllQiyongCustomMenu(String parentid,String status);
    

    /**
     * 根据父ID和状态查询
     * @param parentid
     * @return
     */
    @Select("select * from dogo_custommenu where parentid is null and status=#{1}")
    List<CustomMenu> selectAllQiyongCustomMenu1(String parentid,String status);
    
}