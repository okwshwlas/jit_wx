package dogo.dao;

import java.util.List;

import dogo.model.FunctionRole;

public interface FunctionRoleMapper {
    int insert(FunctionRole record);

    int insertSelective(FunctionRole record);
    
    List<FunctionRole> selectAllByRoleid(String roleid);
    
    int deleteFunctionByRoleId(String roleid);
}