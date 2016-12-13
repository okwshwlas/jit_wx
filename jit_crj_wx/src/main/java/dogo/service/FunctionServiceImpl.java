package dogo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dogo.dao.FunctionMapper;
import dogo.model.Function;

@Service
public class FunctionServiceImpl implements FunctionServiceI {

	private FunctionMapper functionMapper;

	public FunctionMapper getFunctionMapper() {
		return functionMapper;
	}

	@Autowired
	public void setFunctionMapper(FunctionMapper functionMapper) {
		this.functionMapper = functionMapper;
	}

	public List<Function> getAllParentFunctionByUserId(String userid) {
		return functionMapper.getAllParentFunctionByUserId(userid);
	}
	
	public List<String> selectChildZtree(List<Function> parentList,HttpServletRequest request, String userId) { 
		// 根据父类菜单的ID，查询出对应的子类菜单
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userId);
		List<String> childList = new ArrayList<String>();
		for (Function vo : parentList) { 
			// 通过拿到每个一级菜单,
			// 获取当前用户该一级菜单下的所有子菜单的集合,子菜单list和一级菜单list
			// 一一对应
			map.put("function", vo);
			String temp = recursionChildZtree(map, request, 0); 
			// 将用户ID,当前父类菜单对象封装Map，0代表为查询出的菜单为二级菜单,不可加入链接,返回的temp为
			// 该一级菜单对应的二级，三级菜单
			// json串,并追加到cList中,plist和cList中的元素下标一一对应
			if (temp.length() != 0) {
				childList.add("[" + temp.substring(0, temp.length() - 1) + "]");
			} else {
				childList.add(null);
			}
		}
		return childList;
	}
	public String recursionChildZtree(Map<String, Object> map,HttpServletRequest request, int status) {
		Map<String, Object> m;
		// 根据当前菜单和用户ID获取该菜单旗下用户拥有的所有子级菜单
		List<Function> listResult = this.getAllChildFunctionByUserId_ParentId(map); 
		String temp = "";
		for (Function function : listResult) { // 循环拿到每个子菜单
			if (function != null) {
				// 如果此菜单有父菜单,说明此菜单是二级菜单，继续查询三级菜单
				if (((Function) map.get("function")).getFunctionid().equals(function.getParentfunction())) 
				{
					m = new HashMap<String, Object>();
					m.put("function",function);
					m.put("userid", map.get("userid"));
					temp += recursionChildZtree(m, request, 1);
				}
				String icon = "";
				String url = "";
				// 0表示当前查询出的function是二级菜单,不可加链接, 还可以判定查询出的listResult 是否为空,如果空
				// 说明该菜单没子菜单，为终极菜单有URL
				// 1表示当前查询出的function是三级菜单,可加链接,
				icon = (status == 0) ? "1_open.png" : "1_close.png";
				url = (function.getFunctionurl() == null||"".equals(function.getFunctionurl())) ? "" : ",attributes:{\"url\" :\""
						+ request.getContextPath() + function.getFunctionurl()
						+ "\"}";
				temp += "{id : \"" + function.getFunctionid() + "\",pId:\""
						+ function.getParentfunction() + "\",icon:\""
						+ request.getContextPath() + "/css/zTreeStyle/img/diy/"
						+ icon + "\",name: \"";  
			    temp+=function.getFunctionname(); 
				temp+="\",open:true " + url + "},";
			}
		}
		return temp;
	}
	
	public List<Function> selectAll() {
		return functionMapper.selectAll();
	}

	public List<Function> getAllChildFunctionByUserId_ParentId(Map<String, Object> map) {
		
		return functionMapper.getAllChildFunctionByUserId_ParentId(map);
	}
	

}
