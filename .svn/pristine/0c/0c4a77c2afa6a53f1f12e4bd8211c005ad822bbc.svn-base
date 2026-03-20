package com.cnpiecsb.system.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.common.exception.BussinessException;
import com.cnpiecsb.common.exception.SqlException;
import com.cnpiecsb.common.viewobject.AjaxResult;
import com.cnpiecsb.common.viewobject.Page;
import com.cnpiecsb.system.entity.Role;
import com.cnpiecsb.system.entity.Subsystem;
import com.cnpiecsb.system.entity.User;
import com.cnpiecsb.system.service.MenuService;
import com.cnpiecsb.system.service.RoleService;
import com.cnpiecsb.system.service.SubsystemService;
import com.cnpiecsb.system.service.UserService;

/**
 * 跟系统登录登出有关的控制器
 * 
 * @author wkh
 *
 */
@Controller
public class PlatformController{
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="roleService")
	private RoleService roleService;
	
	@Resource(name="menuService")
	private MenuService menuService;
	
	@Resource(name="subsystemService")
	private SubsystemService subsystemService;
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
    public Object login(HttpSession httpSession, HttpServletRequest request) throws BussinessException{
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		
		password = DigestUtils.sha1Hex(password);
		
		User user = userService.doLogin(account, password);  // 登录account实际使用的是工号, job_no
		if (user == null){
			AjaxResult result = new AjaxResult();
			result.setSuccess(false);
			result.setErrorMsg("用户名或者密码错误或者该账号已被停用！");
			//throw new BussinessException();  // 手动抛出错误后,下面代码就不再执行了!
			return result;
		}
		httpSession.setAttribute("user", user);  //当前登录用户
		
		List<Role> roles = roleService.getRolesByAccount(user.getAccount());  // 目前只考虑单角色问题
		if(roles.size() == 0 && !user.isManager()){
			AjaxResult result = new AjaxResult();
			result.setSuccess(false);
			result.setErrorMsg("该用户没有角色无法登陆！");
			//throw new BussinessException();  // 手动抛出错误后,下面代码就不再执行了!
			return result;
		}
		
		AjaxResult result = new AjaxResult();
		result.setSuccess(true);
		return result;	
    }
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
    public String logout(HttpSession httpSession) throws SqlException{
		// 获得当前用户ID
		User user = (User) httpSession.getAttribute("user");
		userService.doLogout(user.getId());
		
		httpSession.invalidate();  //使当前session无效
        return "redirect:/login.jsp";
    }
	
	/**
	 * 换角色重新登录
	 * 
	 * @param httpSession
	 * @param request
	 * @return
	 */
//	@RequestMapping(value="/reLogin")
//	public String reLogin(HttpSession httpSession, HttpServletRequest request){
//		// 获得当前用户ID
//		User user = (User) httpSession.getAttribute("user");
//		
//		String account = request.getParameter("account");
//		
//		user = userService.loginWithAccount(user.getJob_no(), account);  // 登录account实际使用的是工号, job_no
//		
//        httpSession.setAttribute("user", user);  //当前登录用户
//		
//		Role role = roleService.getRole(user.getAccount());  // 目前只考虑单角色问题
//		httpSession.setAttribute("role", role);
//		
//		return "redirect:/index";
//	}
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
    public ModelAndView index(HttpSession httpSession, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		User user = (User) httpSession.getAttribute("user");  //当前登录用户
		
		List<Role> roles = roleService.getRolesByAccount(user.getAccount());  // 目前只考虑单角色问题
		httpSession.setAttribute("roles", roles);
		
		// 获得默认角色	
		Role defaultRole = null;
		// 所有角色id号
		List<Integer> roleIds = new ArrayList<Integer>();
		for (Role role : roles) {
			roleIds.add(role.getRoleId());
			if (role.isIs_default()) {
				defaultRole = role;
				httpSession.setAttribute("defaultRole", role);  // 将当前角色放到 defaultRole的回话中
			}
		}
		
//		List<Role> roles = (List<Role>) httpSession.getAttribute("roles"); // 当前用户的角色
		
		String subsystemId = request.getParameter("subsystemId");
		
		if (roles.size() == 0 && user.isManager()){ // 超级管理员角色	
			// 保存在session中
			httpSession.setAttribute("menuList", menuService.getMenusCascade()); 
		} else {  
//			List<Integer> roleIds = new ArrayList<Integer>();

			// 其他非超级管理员角色, 菜单也使用默认角色的菜单
			httpSession.setAttribute("menuList", menuService.getMenusCascade(roleIds, subsystemId == null ? defaultRole.getDefaultSubsystem() : Integer.parseInt(subsystemId), true,user.getAccount()));  // 注意角色id为roleId这个属性
			
			Map searchMap = new HashMap();  //封装查询条件
			searchMap.put("limit", Integer.MAX_VALUE);
			searchMap.put("offset", 0);
			Page<Subsystem> subsystemPage = subsystemService.getSubsystemList(searchMap);
			httpSession.setAttribute("subsystemList", subsystemPage.getDataList());
			
			// subsystemId 为默认角色 对应的默认子系统
			request.setAttribute("subsystemId", subsystemId == null ? defaultRole.getDefaultSubsystem() : subsystemId);
		}
        mv.setViewName("index");
        return mv;
    }
	
	@RequestMapping(value="/home",method=RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("home");
        return mv;
    }
	
	@RequestMapping(value="/loginOa",method=RequestMethod.POST)
	@ResponseBody
    public void loginOa(HttpSession httpSession, HttpServletRequest request,HttpServletResponse response) throws BussinessException, IOException{
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		
		password = DigestUtils.sha1Hex(password);
		
		User user = userService.doLogin(account, password);  // 登录account实际使用的是工号, job_no
		if (user == null){
			AjaxResult result = new AjaxResult();
			result.setSuccess(false);
			result.setErrorMsg("用户名或者密码错误或者该账号已被停用！");
			return;
		}
		httpSession.setAttribute("user", user);  //当前登录用户
		
		List<Role> roles = roleService.getRolesByAccount(user.getAccount());  // 目前只考虑单角色问题
		if(roles.size() == 0 && !user.isManager()){
			AjaxResult result = new AjaxResult();
			result.setSuccess(false);
			result.setErrorMsg("该用户没有角色无法登陆！");
			return;
		}
		
		response.sendRedirect("/itoms/index");
    }
	
	@RequestMapping(value="/loginTZ",method=RequestMethod.GET)
	@ResponseBody
    public void loginTZ(HttpSession httpSession,HttpServletResponse response,String account) throws BussinessException, IOException{
		
		//password = DigestUtils.sha1Hex(password);
		
		User user_account = userService.getUserByAccount(account);
		
		User user = userService.doLogin(account, user_account.getPassword());  // 登录account实际使用的是工号, job_no
		if (user == null){
			AjaxResult result = new AjaxResult();
			result.setSuccess(false);
			result.setErrorMsg("用户名或者密码错误或者该账号已被停用！");
			//throw new BussinessException();  // 手动抛出错误后,下面代码就不再执行了!
			return;
		}
		httpSession.setAttribute("user", user);  //当前登录用户
		
		List<Role> roles = roleService.getRolesByAccount(user.getAccount());  // 目前只考虑单角色问题
		if(roles.size() == 0 && !user.isManager()){
			AjaxResult result = new AjaxResult();
			result.setSuccess(false);
			result.setErrorMsg("该用户没有角色无法登陆！");
			//throw new BussinessException();  // 手动抛出错误后,下面代码就不再执行了!
			return;
		}
		
		response.sendRedirect("/ztbk/index");
		response.setHeader("Refresh", "5;url=" + "/ztbk/index");
    }
}
