package com.cnpiecsb.system.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cnpiecsb.system.entity.DicDirectory;
import com.cnpiecsb.system.entity.Dictionary;
import com.cnpiecsb.system.service.DictionaryService;

@Controller
@RequestMapping("/system")
public class DictionaryController {
	@Resource(name="dictionaryService")
	private DictionaryService dictionaryService;
	
	/**
	 * 进入字典项管理界面
	 * 
	 * @return
	 */
	@RequestMapping(value="/dictionaryManage") 
    public ModelAndView dictionaryManage(){
		ModelAndView mv = new ModelAndView();
        mv.setViewName("system/dictionaryManage");
        return mv;
    }
	
	@RequestMapping(value="/dictionaryAdd",method=RequestMethod.GET)
    public ModelAndView toAdd(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("system/dictionaryAdd");
        return mv;
    }
	/**
	 * 增加字典项
	 * 
	 * @param dictionary
	 * @return
	 */
	@RequestMapping(value="/addDictionary",method=RequestMethod.POST)
	@ResponseBody
    public Object addDictionary(@ModelAttribute("dictionary") Dictionary dictionary){
		dictionaryService.addDictionary(dictionary);
		return "{\"success\":true}";
    }
	
	/**
	 * 进入修改字典项界面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/dictionaryEdit",method=RequestMethod.GET)
    public ModelAndView toEdit(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));		
        ModelAndView mv = new ModelAndView();
        mv.addObject("dictionary", dictionaryService.getDictionaryById(id));
        mv.setViewName("system/dictionaryEdit");
        return mv;
    }
	
	/**
	 * 修改字典项
	 * 
	 * @param dictionary
	 * @return
	 */
	@RequestMapping(value="/editDictionary",method=RequestMethod.POST)
	@ResponseBody
    public Object editDictionary(@ModelAttribute("dictionary") Dictionary dictionary){
		dictionaryService.editDictionary(dictionary);
		return "{\"success\":true}";
    }

	/**
	 * 删除字典项
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/deleteDictionary",method=RequestMethod.POST)
	@ResponseBody
    public Object deleteDictionary(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		dictionaryService.deleteDictionary(id);
		return "{\"success\":true}";
    }
	
	/**
	 * 修改字典项启用/注销状态
	 * 
	 * @param dictionary
	 * @return
	 */
	@RequestMapping(value="/doUpdateStatus",method=RequestMethod.POST)
	@ResponseBody
    public Object doUpdateStatus(@ModelAttribute("dictionary") Dictionary dictionary){
		dictionaryService.doUpdateStatus(dictionary);
		return "{\"success\":true}";
    }
	
	/**
	 * 获得指定目录ID的字典列表, 不分页
	 * 
	 * @param directoryId
	 * @return
	 */
	@RequestMapping(value="/getDictionaryList")
	@ResponseBody
	public Object getDictionaryList(@RequestParam String directoryId){
		List<Dictionary> dictionaryList=null;
		if(directoryId==null||"".equals(directoryId)){  // 获得第一个字典类型的所有字典项
			if(dictionaryService.getAllDirectory().size()>0){
				DicDirectory allDirectory = dictionaryService.getAllDirectory().get(0);
				dictionaryList = dictionaryService.getDictionaryByDirectoryId(allDirectory.getId()); 
			}			
		}else{
			int id=Integer.parseInt(directoryId);
			dictionaryList = dictionaryService.getDictionaryByDirectoryId(id);
		}			
		return dictionaryList;
	}
	
	/**
	 * 获得所有的字典目录, 不分页
	 * 
	 * @return
	 */
	@RequestMapping(value="/getAllDirectory")
	@ResponseBody
	public Object getAllDirectory(){
		List<DicDirectory> allDirectory = dictionaryService.getAllDirectory();
		return allDirectory;
	}
	
	/**
	 * 根据目录编码获得所有字典项, 不分页
	 * 
	 * @param code
	 * @return
	 */
	@RequestMapping(value="/getDictionaryByDirectoryCode")
	@ResponseBody
	public Object getDictionaryByDirectoryCode(@RequestParam String code){
		List<Dictionary> dictionaryList = dictionaryService.getDictionaryByDirectoryCode(code);
		return dictionaryList;
	}
	
	/**
	 * 获得指定目录ID的字典列表, 不分页, 排除掉非启用的字典项目
	 * 
	 * @param directoryId
	 * @return
	 */
	@RequestMapping(value="/getUsingDictionaryList")
	@ResponseBody
	public Object getUsingDictionaryList(@RequestParam String directoryId){
		List<Dictionary> dictionaryList=null;

		int id=Integer.parseInt(directoryId);
		dictionaryList = dictionaryService.getUsingDictionaryByDirectoryId(id);	
		
		return dictionaryList;
	}
}
