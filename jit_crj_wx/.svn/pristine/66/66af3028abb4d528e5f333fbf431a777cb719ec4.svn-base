package dogo.dao;

import java.util.List;
import java.util.Map;

import dogo.model.Function;

public interface FunctionMapper {
    int deleteByPrimaryKey(String functionid);

    int insert(Function record);

    int insertSelective(Function record);

    Function selectByPrimaryKey(String functionid);

    int updateByPrimaryKeySelective(Function record);

    int updateByPrimaryKey(Function record);
    
    List<Function> getAllParentFunctionByUserId(String userid);
    
    List<Function> getAllChildFunctionByUserId_ParentId(Map<String, Object> map);
    
    List<Function> selectAll();
}