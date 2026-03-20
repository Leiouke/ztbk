package com.cnpiecsb.system.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.common.exception.SqlException;
import com.cnpiecsb.common.listener.InitialBeanListener;
import com.cnpiecsb.common.viewobject.Page;
import com.cnpiecsb.system.entity.Menu;
import com.cnpiecsb.system.entity.Role;
import com.cnpiecsb.system.entity.User;
import com.cnpiecsb.system.entity.viewobject.MenuNode;
import com.cnpiecsb.system.service.MenuService;
import com.cnpiecsb.system.service.UserService;

/**
 * 老板模式的用户管理, 很多操作性的方法新版使用sp模式了
 * 
 * @author user
 *
 */
@Controller
@RequestMapping("/system")
public class UserController {
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="menuService")
	private MenuService menuService;
	
	@Resource
	private InitialBeanListener initialBeanListener;  //存放了system.property配置项
	
	@RequestMapping(value="/home",method=RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("system/home");
        return mv;
    }
	
	@RequestMapping(value="/echarts",method=RequestMethod.GET)
    public ModelAndView echarts(){
		ModelAndView mv = new ModelAndView();
        mv.setViewName("system/echarts");
        return mv;
    }
	
	@RequestMapping(value="/userManage",method=RequestMethod.GET)
    public ModelAndView userList(){
		ModelAndView mv = new ModelAndView();
        mv.setViewName("system/userManage");
        return mv;
    }
	
	@RequestMapping(value="/userAdd",method=RequestMethod.GET)
    public ModelAndView toAdd(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("system/userAdd");
        return mv;
    }
	
	@RequestMapping(value="/addUser")
	@ResponseBody
    public String addUser(@ModelAttribute("user") User user) throws SqlException{
		user.setRegisterDate(new Date());
		user.setPassword(DigestUtils.sha1Hex(user.getPassword()));  //sha1加密
		user.setManager(false);  //添加管理员角色		
		userService.addUser(user);
		return "{\"success\":true}";
    }
	
	@RequestMapping(value="/userEdit",method=RequestMethod.GET)
    public ModelAndView toEdit(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		
        ModelAndView mv = new ModelAndView();
        mv.addObject("user", userService.getUser(id));
        mv.setViewName("system/userEdit");
        return mv;
    }
	
	/**
	 * no use
	 * 
	 * @param user
	 * @return
	 * @throws SqlException
	 */
	@RequestMapping(value="/editUser",method=RequestMethod.POST)
	@ResponseBody
    public Object editUser(@ModelAttribute("user") User user) throws SqlException{
		if (user.getPassword() != null && user.getPassword().length() > 0){
			user.setPassword(DigestUtils.sha1Hex(user.getPassword()));
		} else{
			user.setPassword(null);
		}
		user.setModifyDate(new Date());

		userService.editUser(user);
		return "{\"success\":true}";
    }
	
	@RequestMapping(value="/deleteUser",method=RequestMethod.POST)
	@ResponseBody
    public Object deleteUser(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		userService.deleteUser(id);
		return "{\"success\":true}";
    }
	
	@RequestMapping(value="/enableUser",method=RequestMethod.POST)
	@ResponseBody
    public Object enableUser(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		userService.doEnableUser(id);
		return "{\"success\":true}";
    }
	
	@RequestMapping(value="/disableUser",method=RequestMethod.POST)
	@ResponseBody
    public Object disableUser(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		userService.doDisableUser(id);
		return "{\"success\":true}";
    }
	
	@RequestMapping(value="/getUserList")
	@ResponseBody
	public Object getUserList(@RequestBody Map postData){
		Map searchMap = new HashMap();  //封装查询条件
		
		if (postData.get("account") != null && StringUtils.isNotEmpty(postData.get("account").toString())){
			searchMap.put("account", postData.get("account"));
		}
		
		if (postData.get("userName") != null && StringUtils.isNotEmpty(postData.get("userName").toString())){
			searchMap.put("userName", postData.get("userName"));
		}
		
		if (postData.get("status") != null && StringUtils.isNotEmpty(postData.get("status").toString())){
			searchMap.put("status", postData.get("status"));
		}
		
		if (postData.get("roleId") != null && StringUtils.isNotEmpty(postData.get("roleId").toString())){
			searchMap.put("roleId", postData.get("roleId"));
		}
		
		if (postData.get("job_no") != null && StringUtils.isNotEmpty(postData.get("job_no").toString())){
			searchMap.put("job_no", postData.get("job_no"));
		}
		
		if (postData.get("dep_org_code") != null && StringUtils.isNotEmpty(postData.get("dep_org_code").toString())){
			searchMap.put("dep_org_code", postData.get("dep_org_code"));
		}
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		int limit=0,offset=0;
		if(postData.get("limit")!=null&&!"".equals(postData.get("limit"))){
			limit = Integer.parseInt(postData.get("limit").toString());  //所取记录数
		}
		if(postData.get("offset")!=null&&!"".equals(postData.get("offset"))){
			offset = Integer.parseInt(postData.get("offset").toString());  //记录偏离值 	
		}
		if(postData.get("limit")==null&&postData.get("offset")==null){
			limit=Integer.MAX_VALUE;
		}
		searchMap.put("limit", limit);
		searchMap.put("offset", offset);
		//searchMap.put("status", 0);
		Page<User> userPage = userService.getUserList(searchMap);
		result.put("rows", userPage.getDataList());
		result.put("total", userPage.getTotalCount());
		return result;
	}
	
	/**
	 * 进入个人资料页面, 个人信息可以从session中拿出来
	 * 
	 * @return
	 */
	@RequestMapping(value="/toPersonal")
    public ModelAndView toPersonal(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("system/personalInfo");
        return mv;
    }
	
	@RequestMapping(value="/editPortrait",method=RequestMethod.POST)
	@ResponseBody
    public String editPortrait(HttpSession httpSession, HttpServletRequest request,MultipartFile file) throws SqlException, IOException{
		User user = new User();
		//解析器解析request的上下文
		/*CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(httpSession.getServletContext());*/
		// 先判断request中是否包涵multipart类型的数据，
//		if (multipartResolver.isMultipart(request)) {
			// 再将request中的数据转化成multipart类型的数据
			/*MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			
			MultipartFile portrait = multiRequest.getFile("portrait");      // 上传条码查询	
*/			
			if (file != null) {
				// 首先获得图片存放的根路径
				Properties props = initialBeanListener.getProps();
				String imagePath = (String) props.get("images.rootPath");
				
				// 目前以原文件名的方式上传, 后续在看看有无改进需要
				String fileName = file.getOriginalFilename();
				// 将上传的文件放到本地路径下
				FileUtils.copyInputStreamToFile(file.getInputStream(), new File(imagePath + "/portrait/" + fileName));
				user.setPortrait("/portrait/" + fileName);
			}			
			//user.setAccount(request.getParameter("account"));
			String my_id=request.getParameter("my_user_id");
			String job_no = request.getParameter("job_no");
			user.setId(Integer.parseInt(my_id));
			user.setModifyDate(new Date());
//			user.setJob_no(job_no);
			userService.editUser(user);
			//同时修改掉session里面的user值
			httpSession.setAttribute("user", userService.getUser(user.getId()));
//		}
		return "{\"success\":true}";
    }
	
	@RequestMapping(value="/editPersonal",method=RequestMethod.POST)
	@ResponseBody
    public String editPersonal(HttpSession httpSession, @ModelAttribute("user") User user) throws SqlException, IOException{		
		//user.setAccount(request.getParameter("account"));			
		user.setModifyDate(new Date());
		userService.editUser(user);
		
		//同时修改掉session里面的user值
		httpSession.setAttribute("user", userService.getUser(user.getId()));
		return "{\"success\":true}";
    }
	
	@RequestMapping(value="/toPassword")
    public ModelAndView toPassword(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("system/passwordEdit");
        return mv;
    }
	
	@RequestMapping(value="/editPassword",method=RequestMethod.POST)
	@ResponseBody
    public String editPassword(HttpServletRequest request, HttpSession httpSession) throws SqlException{
		User user = (User) httpSession.getAttribute("user");		
		user.setPassword(DigestUtils.sha1Hex(request.getParameter("password")));
		user.setPassword_modify_time("1");  // 说明密码也改过的标志
		
		userService.editUser(user);		
		return "{\"success\":true}";
    }
	
	/**
	 * 获得所有的用户-分账号, 不分页
	 * 
	 * @return
	 */
	@RequestMapping(value="/getAllUser")
	@ResponseBody
	public Object getAllUser(@RequestParam Map postData){
		Map searchMap = new HashMap();  //封装查询条件
		if(postData.get("status")!=null)
			searchMap.put("status", postData.get("status"));
		if(postData.get("userName")!=null&&!"".equals(postData.get("userName")))
			searchMap.put("userName", postData.get("userName"));
		if(postData.get("roleId")!=null&&!"".equals(postData.get("roleId")))
			searchMap.put("roleId", postData.get("roleId"));
		searchMap.put("limit", Integer.MAX_VALUE);		
		searchMap.put("offset", 0);		
//		searchMap.put("isManager", false);  // 非管理员
		
		Page<User> userPage = userService.getUserList(searchMap);
		return userPage.getDataList();
	}
	
	/**
	 * 获得所有启用的员工数据, 不分页  在预警配置里面使用
	 * 
	 * @return
	 */
	@RequestMapping(value="/getStaff")
	@ResponseBody
	public Object getStaff(@RequestParam Map postData){
		Map searchMap = new HashMap();  //封装查询条件
		if(postData.get("account")!=null&&!"".equals(postData.get("account")))
			searchMap.put("account", postData.get("account"));
		if(postData.get("userName")!=null&&!"".equals(postData.get("userName")))
			searchMap.put("userName", postData.get("userName"));
		if(postData.get("approve_role")!=null&&!"".equals(postData.get("approve_role")))
			searchMap.put("approve_role", postData.get("approve_role"));
		if(postData.get("dep_org_code")!=null&&!"".equals(postData.get("dep_org_code")))
			searchMap.put("dep_org_code", postData.get("dep_org_code"));
		
		List<Map> userList = userService.getStaff(searchMap);
		return userList;
	}
	
	// ---------- 以下用户快捷菜单相关            ------------------------ //
	
	/**
	 * 获得当前用户的快捷菜单列表
	 * 
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/getShortcutMenu")
	@ResponseBody
	public Object getShortcutMenu(HttpSession httpSession){
		User user = (User) httpSession.getAttribute("user");
		
		List<Menu> shortcutMenu = userService.getShortcutMenu(user.getAccount());
		return shortcutMenu;
	}
	
	/**
	 * 获得所有可以设为快捷菜单的菜单, 树模式, 界面上控制下只有二级菜单才可以作为快捷菜单
	 * 
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/getCanConfigMenus")
	@ResponseBody
	public Object getCanConfigMenus(HttpSession httpSession){
		User user = (User) httpSession.getAttribute("user");  //当前登录用户
		Role role = (Role) httpSession.getAttribute("role"); // 当前用户的角色
		
		List<MenuNode> cascadeMenu = new ArrayList<MenuNode>();
		if (role == null && user.isManager()){ // 超级管理员角色	
			cascadeMenu = menuService.getMenusCascade(); 
		} else {
			List<Integer> roleIds = new ArrayList<Integer>();
			roleIds.add(role.getRoleId());
			cascadeMenu = menuService.getMenusCascade(roleIds, role.getDefaultSubsystem(), false,user.getAccount());  // 注意角色id为roleId这个属性
		}
		
		/*// 获得所有二级菜单, 目前只考虑二级菜单可以被设定为快捷菜单
		List<Menu> secondaryMenus = new ArrayList<Menu>();
		for (MenuNode menuNode : cascadeMenu) {
			List<Menu> childMenu = menuNode.getChildMenu();
			if (childMenu != null)
				secondaryMenus.addAll(childMenu);
		}*/
		return cascadeMenu;
	}
	
	/**
	 * 提交用户快捷菜单数据
	 * 
	 * @param httpSession
	 * @param menuIds
	 * @return
	 */
	@RequestMapping(value="/commitUserMenu")
	@ResponseBody
    public Object commitUserMenu(HttpSession httpSession, @RequestParam(value="menuIds", required=true) int[] menuIds // 感觉request或者session参数必须放在@RequestParam之前, 如果有问题请找我
			){
		User user = (User) httpSession.getAttribute("user");  //当前登录用户
		userService.doCommitUserMenu(menuIds, user.getAccount());
		return "{\"success\":true}";
    }
	
	/**
	 * 切换角色
	 * 
	 * @param httpSession
	 * @param menuIds
	 * @return
	 */
//	@RequestMapping(value="/jobChangelist")
//    public ModelAndView jobChangelist(){
//        ModelAndView mv = new ModelAndView();
//        mv.setViewName("system/jobChangelist");
//        return mv;
//    }
	
	public static void main(String[] args) {
		String TARGET = "1111";
		 
//		String str = DigestUtils.sha256Hex(TARGET);  
//		System.out.println("sha256Hex:  "+str.length());  
//		str = DigestUtils.sha384Hex(TARGET);  
//		System.out.println("sha384Hex:  "+str.length());  
//		str = DigestUtils.sha512Hex(TARGET);  
//		System.out.println("sha512Hex:  "+str.length());  
		
		String str = DigestUtils.sha1Hex(TARGET);
		System.out.println("sha1Hex:  "+str);  

//		str = DigestUtils.sha1Hex(TARGET);
//		System.out.println("sha1Hex:  "+str);  
	}
}
