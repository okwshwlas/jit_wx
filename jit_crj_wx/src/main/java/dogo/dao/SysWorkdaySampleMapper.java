package dogo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import dogo.model.SysWorkdaySample;

public interface SysWorkdaySampleMapper {
    int deleteByPrimaryKey(String id);

    int insert(SysWorkdaySample record);

    int insertSelective(SysWorkdaySample record);

    SysWorkdaySample selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysWorkdaySample record);

    int updateByPrimaryKey(SysWorkdaySample record);
    
	//List<SysWorkdaySample> findYuYueByRiqi(String sid, String type);
	
	List<SysWorkdaySample> findYuYueByRiqi(@Param("dataTime")String dataTime,@Param("num")String num);
}