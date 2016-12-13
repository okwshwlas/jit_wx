package dogo.dao;

import java.util.List;

import dogo.model.UserRole;

public interface UserRoleMapper {
    int insert(UserRole record);

    int insertSelective(UserRole record);
    
    int deleteByRoleid(String roleid);
    
    List selectAllUserByRoleid(String roleid);
    
    String selectRoleName(String userid);
    
    int deleteRoleByUserId(String userid);
    
    int addRolesName(UserRole userRole);
}