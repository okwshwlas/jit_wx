package dogo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import dogo.model.SysWorkdaySample;
import dogo.model.SysWorktime;

public interface SysWorktimeMapper {
    int deleteByPrimaryKey(String id);

    int insert(SysWorktime record);

    int insertSelective(SysWorktime record);

    SysWorktime selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysWorktime record);

    int updateByPrimaryKey(SysWorktime record);
    
    List<SysWorktime> WX_findJgdwById(@Param("riqi")String riqi,@Param("jgid")String jgid);
}