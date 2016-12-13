package dogo.dao;

import java.util.List;
import java.util.Map;

import dogo.model.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(String roleid);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(String roleid);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    List<Role> selectAll();
    
    List<Role> selectAllPage(Map<String,Object> map);
    
    String selectAllCount(Map<String,Object> map);
}