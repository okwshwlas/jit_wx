package dogo.service;

import java.util.List;

import dogo.model.CustomMenu;

public interface CustomMenuServiceI {
	
	public List<CustomMenu> selectAllCustomMenu();
	
	public CustomMenu selectByPrimaryKey(String id);
	
	public int updateByPrimaryKeySelective(CustomMenu record);
	
	public List<CustomMenu> selectAllChildCustomMenuByParentid(String parentid);
	
	public List<CustomMenu> selectAllQiyongCustomMenu(String parentid,String status);
	
	public List<CustomMenu> selectAllQiyongCustomMenu1(String parentid,String status);

}
