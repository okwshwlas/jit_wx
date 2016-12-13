package dogo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dogo.dao.UserMapper;
import dogo.dao.UserRoleMapper;
import dogo.model.User;
import dogo.model.UserRole;
@Service
public class UserServiceImpl implements UserServiceI {

	private UserMapper userMapper;
	
	private UserRoleMapper userRoleMapper;
	
	public UserMapper getUserMapper() {
		return userMapper;
	}

	@Autowired
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}




	public User selectByWhere(User record) {
		
		return userMapper.selectByWhere(record);
	}

	public User yzdl(User record) {
		return userMapper.yzdl(record);
	}

	public List<User> selectAllUserByPage(Map<String, Object> map) {
		return userMapper.selectAllUserByPage(map);
	}

	public int selectAllCount(Map<String, Object> map) {
		return userMapper.selectAllCount(map);
	}

	
	public List<User> selectAllUserByRoleid(String roleid) {
		return userMapper.selectAllUserByRoleid(roleid);
	}
	
	public String selectRoleName(UserRole userRole) {
		return userRoleMapper.selectRoleName(userRole.getUserid());
	}
	
	public int deleteRoleByUserId(String userid) {
		return userRoleMapper.deleteRoleByUserId(userid);
	}
	public int addRolesName(UserRole userRole) {
		return userRoleMapper.addRolesName(userRole);
	}
	public User selectUserById(User userVo) {
		return userMapper.selectByPrimaryKey(userVo.getUserid());
	}
	public User findUserByUserCode(User user){
		return userMapper.findUserByUserCode(user.getUsercode());
	}
	public int updateUser(User user) {
		return userMapper.updateByPrimaryKeyWithBLOBs(user);
	}
	public int insertUser(User user) {
		return userMapper.insertSelective(user);
	}
	public int deleteUser(User user) {
		return userMapper.deleteByPrimaryKey(user.getUserid());
	}
	public UserRoleMapper getUserRoleMapper() {
		return userRoleMapper;
	}
	@Autowired
	public void setUserRoleMapper(UserRoleMapper userRoleMapper) {
		this.userRoleMapper = userRoleMapper;
	}
	
}
