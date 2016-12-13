package dogo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import dogo.model.Function;
import dogo.model.FunctionRole;
import dogo.model.Role;
import dogo.modeljson.AjaxJson;
import dogo.service.FunctionServiceI;
import dogo.service.RoleServiceI;
import dogo.service.UserServiceI;
import dogo.util.Page;
import dogo.util.Params;
/**
 * 角色控制类
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/roleControl/*")
public class RoleController {
	
	private static final Logger log = Logger.getLogger(RoleController.class);
	
	/**
	 * 角色service
	 */
	private RoleServiceI roleService;
	
	/**
	 * 用户service
	 */
	private UserServiceI userService;
	
	/**
	 * 菜单service
	 */
	private FunctionServiceI functionService;
	
	/**
	 * 查询所有角色 带分页
	 * @param roleVo
	 * @return
	 */
	@RequestMapping(value = "/selectAllRole.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectAllRole(Role roleVo,Page page) { // 查询全部角色
		Map<String, Object> res = new HashMap<String, Object>();
		try {
		Map<String,Object> paraMap=new HashMap<String, Object>();
//		paraMap.put("role", roleVo);
		paraMap.put("page", page);
		String countAllRole = roleService.selectAllCount(paraMap);
		if (countAllRole == null) {
			countAllRole = "0";
		}
		List<Role> list = roleService.selectAllPage(paraMap);
		res.put("rows", list);
		res.put("page", page.getPage());
		res.put("total", countAllRole);
		return res;
		} catch (Exception e) {
			log.error(e);
			return res;
		}
	}
	/**
	 * 根据ID查询详细信息
	 * @param roleVo
	 * @return
	 */
	@RequestMapping(value = "/selectRoleById.do", method = RequestMethod.POST)
	@ResponseBody
	public Role selectRoleById(Role roleVo)  { // 查询详细信息
		try{
		return roleService.selectById(roleVo.getRoleid());
		}catch(Exception e){
			log.error(e);
			return null;
		}
	}
	/**
	 * 添加角色
	 * @param roleVo
	 * @return
	 */
	@RequestMapping(value = "/insertRole.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson insertRole(Role roleVo)  { // 添加角色
		AjaxJson ajaxJson=new AjaxJson();
		try{
		roleVo.setRoleid(Params.getCode());
		roleService.insert(roleVo);
		ajaxJson.setMsg("保存成功");
		}catch(Exception e){
			log.error(e);
			ajaxJson.setMsg("保存失败");
		}
		return ajaxJson;
	}
	/**
	 * 删除全部
	 * @param roleVo
	 * @return
	 */
	@RequestMapping(value = "/deleteAllRole.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson deleteAllRole(Role roleVo){
		AjaxJson ajaxJson=new AjaxJson();
		try {
			String id = roleVo.getRoleid();
			roleVo.setRoleid(id);
			List list = roleService.selectAllUserByRoleid(id);
			if(list.size()!=0){
				ajaxJson.setMsg("角色下存在用户无法删除");
			}else{
				roleService.deleteRoleById(roleVo);
				roleService.deleteFunctionByRoleId(id);
				roleService.deleteUserRoleByRoleid(id);
				ajaxJson.setMsg("删除成功");
			}
		
		} catch (Exception e) {
			log.error(e);
			ajaxJson.setMsg("删除失败");
		}
		return ajaxJson;
	}
	/**
	 * 修改角色
	 * @param roleVo
	 * @return
	 */
	@RequestMapping(value = "/updateRole.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson updateRole(Role roleVo)  { // 修改角色
		AjaxJson ajaxJson=new AjaxJson();
		try{
		if (roleVo.getRoleid() != null) {
			roleService.updateByPrimaryKeySelective(roleVo);
			ajaxJson.setMsg("保存成功");
		}
	    }catch(Exception e){
	    	log.error(e);
	    	ajaxJson.setMsg("保存失败");
	    }
		return ajaxJson;
	}
	/**
	 * 查询已选菜单
	 * @param model
	 * @param roleVo
	 * @return
	 */
	@RequestMapping(value = "/selectFunction.do")
	public String selectFunction(Model model, FunctionRole vo) {
		try{
		List<Function> menuRs = functionService.selectAll();
		List<FunctionRole> roleMenu = roleService.selectFunctionRole(vo.getRoleid());
		
		model.addAttribute("menuRs", menuRs);
		model.addAttribute("roleMenu", roleMenu);
		model.addAttribute("roleId", vo.getRoleid());
		return "jsp/role/functionlist";
		}catch(Exception e){
			log.error(e);
			return "";
		}
	}
	@RequestMapping(value = "/getFunctionTree.do")
	@ResponseBody
	public String getFunctionTree(Model model, FunctionRole vo) {
		try{
			List<Function> menuRs = functionService.selectAll();
			List<FunctionRole> roleMenu = roleService.selectFunctionRole(vo.getRoleid());
			
			return getOrg(menuRs,roleMenu,"0").toJSONString();
			}catch(Exception e){
				log.error(e);
				return "";
			}
	}
	/**
	 * 分配菜单
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/addFunctionRole.do")
	@ResponseBody
	public AjaxJson addFunctionRole(FunctionRole vo,String menuid) {
		AjaxJson ajaxJson=new AjaxJson();
		try {
			String functionId[] = menuid.split(",");
			roleService.deleteFunctionByRoleId(vo.getRoleid());
			if (functionId != null) {
				for (int i = 0; i < functionId.length; i++) {
					vo.setFunctionid(functionId[i]);
					roleService.addFunctionRole(vo);
				}
			}
			ajaxJson.setMsg("分配菜单新增成功");
		} catch (Throwable e) {
			log.error(e);
			ajaxJson.setMsg("分配菜单新增失败");
		}
		return ajaxJson;
	}
	
	public static JSONArray getOrg(List<Function> orgList,List<FunctionRole> roleMenu,String pid){
		JSONArray jsonTree=new JSONArray();
		for(int i=0;i<orgList.size();i++){
			Function porgVo=new Function();
			porgVo=orgList.get(i);
			JSONObject jsonObj=new JSONObject();
			if(porgVo.getParentfunction()==null||"".equals(porgVo.getParentfunction())||pid.equals(porgVo.getParentfunction())){
				jsonObj.put("text", porgVo.getFunctionname());
				jsonObj.put("id", porgVo.getFunctionid());
				for(int h=0;h<roleMenu.size();h++){
					if(porgVo.getFunctionid().equals(roleMenu.get(h).getFunctionid())){
						boolean flag=false;//是否有子节点
						for(int k=0;k<orgList.size();k++){
							if(porgVo.getFunctionid().equals(orgList.get(k).getParentfunction())){
								flag=true;
								break;
							}
						}
						if(!flag){
							jsonObj.put("checked", true);
						}
					}
				}
				jsonObj=cTreed(orgList,roleMenu,porgVo,jsonObj);
				jsonTree.add(jsonObj);
			}
		}
		return jsonTree;
	}
	private static JSONObject cTreed(List<Function> orgList,List<FunctionRole> roleMenu,Function porgVo,JSONObject jsonTree){
		boolean flag=false;
		JSONArray jsonArray=null;
		for(int i=0;i<orgList.size();i++){
			Function orgVo=orgList.get(i);
			if(porgVo.getFunctionid().equals(orgVo.getParentfunction())){
				flag=true;
				jsonArray=new JSONArray();
				break;
			}
		}
		if(flag){
			for(int j=0;j<orgList.size();j++){
				Function orgVo=orgList.get(j);
				JSONObject jsonObj=new JSONObject();
				if(porgVo.getFunctionid().equals(orgVo.getParentfunction())){
					jsonObj.put("text", orgVo.getFunctionname());
					jsonObj.put("id", orgVo.getFunctionid());
					if(jsonArray!=null){
						if(jsonTree.get("children")==null||"".equals(jsonTree.get("children"))){
							jsonTree.put("children",getOrg(orgList,roleMenu,orgVo.getParentfunction()));
						}else{
							JSONArray array=(JSONArray)jsonTree.get("children");
							JSONArray array2=getOrg(orgList,roleMenu,orgVo.getParentfunction());
							for(int k=0;k<array2.size();k++){
								if(!array.contains(array2.get(k))){
									array.add(array2.get(k));
								}
							}
							jsonTree.put("children",array);
						}
					}else{
						for(int h=0;h<roleMenu.size();h++){
							if(orgVo.getFunctionid().equals(roleMenu.get(h).getFunctionid())){
								jsonObj.put("checked", true);
							}
						}
						jsonTree.putAll(jsonObj);
					}
					
					
				}
				if(jsonArray!=null){
				}
			}
		}
		return jsonTree;
	}

	public RoleServiceI getRoleService() {
		return roleService;
	}

	@Resource
	public void setRoleService(RoleServiceI roleService) {
		this.roleService = roleService;
	}

	public UserServiceI getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}

	public FunctionServiceI getFunctionService() {
		return functionService;
	}

	@Resource
	public void setFunctionService(FunctionServiceI functionService) {
		this.functionService = functionService;
	}
}
