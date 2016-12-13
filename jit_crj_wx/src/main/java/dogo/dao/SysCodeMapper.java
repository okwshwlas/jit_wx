package dogo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import dogo.model.SysCode;
import dogo.model.Wx_Pc;

public interface SysCodeMapper {
    int deleteByPrimaryKey(String id);

    int insert(SysCode record);

    int insertSelective(SysCode record);

    SysCode selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysCode record);

    int updateByPrimaryKey(SysCode record);
    
    List<SysCode> getYuyueCode(@Param("riqi")String riqi);
}