package dogo.service;

import java.util.List;

import dogo.model.CrjLstdYwInfo;

public interface CrjLstdYwInfoServiceI {

	void save(CrjLstdYwInfo crjLstdYwInfo);
	
	int insertSelective(CrjLstdYwInfo crjLstdYwInfo);
	/**
     * 查询 通过创建时间倒序 取第一条 判断使用
     * @param openid
     * @return
     */
	CrjLstdYwInfo selectByOpenIdPD(String openid);
	/**
     * 通过openid 查询历史记录 List
     * @param openid
     * @return
     */
    List<CrjLstdYwInfo> selectByOpenId(String openid);
    /**
     * 通过业务编号查询
     * @param ywbh
     * @return
     */
    CrjLstdYwInfo selectByYwbh(String ywbh);
    /**
     * 修改 通过id
     * @param record
     * @return
     */
    int updateById(CrjLstdYwInfo record);
    /**
     * 修改 通过ywbh
     * @param record
     * @return
     */
	int updateByYwbh(CrjLstdYwInfo record);
}
