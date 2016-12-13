package dogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dogo.dao.CustomMenuMapper;
import dogo.model.CustomMenu;
@Service("customMenuServiceI")
public class CustomMenuServiceImpl implements CustomMenuServiceI{
	
	private CustomMenuMapper customMenuMapper;

	public CustomMenuMapper getCustomMenuMapper() {
		return customMenuMapper;
	}

	@Autowired
	public void setCustomMenuMapper(CustomMenuMapper customMenuMapper) {
		this.customMenuMapper = customMenuMapper;
	}

	public List<CustomMenu> selectAllCustomMenu() {
		return customMenuMapper.selectAllCustomMenu();
	}

	public CustomMenu selectByPrimaryKey(String id) {
		return customMenuMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(CustomMenu record) {
		return customMenuMapper.updateByPrimaryKeySelective(record);
	}

	public List<CustomMenu> selectAllChildCustomMenuByParentid(String parentid) {
		return customMenuMapper.selectAllChildCustomMenuByParentid(parentid);
	}

	public List<CustomMenu> selectAllQiyongCustomMenu(String parentid,String status) {
		return customMenuMapper.selectAllQiyongCustomMenu(parentid, status);
	}

	public List<CustomMenu> selectAllQiyongCustomMenu1(String parentid,String status) {
		return customMenuMapper.selectAllQiyongCustomMenu1(parentid, status);
	}

}
