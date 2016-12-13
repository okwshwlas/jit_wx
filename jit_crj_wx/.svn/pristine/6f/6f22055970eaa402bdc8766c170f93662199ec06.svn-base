package dogo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import dogo.model.SysDictionary;
import dogo.model.SysWorkdaySample;

public interface SysDictionaryMapper {
    int insert(SysDictionary record);

    int insertSelective(SysDictionary record);
    
	List<SysDictionary> listSysDictionaryByType(@Param("type")String type,@Param("pid")String pid,@Param("count")String count);


}