package dogo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/testController")
public class TestController {

	/*private TestServiceI userService;

	public TestServiceI getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(TestServiceI userService) {
		this.userService = userService;
	}*/

	/*@RequestMapping("/{id}/showUser")
	public String showUser(@PathVariable String id, HttpServletRequest request) {
		User u = userService.getUserById(id);
		request.setAttribute("user", u);
		return "showUser";
	}*/

}
