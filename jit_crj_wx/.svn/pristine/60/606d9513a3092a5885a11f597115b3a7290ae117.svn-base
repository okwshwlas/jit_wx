package dogo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import dogo.model.Function;

public interface FunctionServiceI {
	
	/**
	 * 根据userid查询所有父菜单
	 * @param userid
	 * @return
	 */
	public  List<Function> getAllParentFunctionByUserId(String userid);
	
	/**
	 * 根据userid和菜单父ID查询所有菜单
	 * @param map
	 * @return
	 */
	List<Function> getAllChildFunctionByUserId_ParentId(Map<String, Object> map);
	
	/**
	 * 查询子菜单
	 * @param parentList
	 * @param request
	 * @param userId
	 * @return
	 */
	List<String> selectChildZtree(List<Function> parentList,HttpServletRequest request, String userId);
	
	/**
	 * 查询所有菜单（不带分页）
	 * @return
	 */
	List<Function> selectAll();

}
