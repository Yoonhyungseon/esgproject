package program.admin.news;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import program.common.CamelMap;
import program.common.DataMap;
import program.common.util.HttpUtil;


/**************************************************
* @FileName : AdminNewsController.java
* @Description: 관리자 뉴스 컨트롤러	
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 7. 5.
* @Copyright : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping(value = {"/admin"})
public class AdminNewsController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminNewsController.class);
	
//	@Autowired
//	private AminNewsMapper adminNewsMapper;

	/**************************************************
	* @MethodName : newsList
	* @Description: 관리자 뉴스 리스트
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 5.
	**************************************************/
	@RequestMapping(value = {"/newsList"})
	public String newsList(Model model) {
		return "admin/news/newsList";
	}
	
	/**************************************************
	* @MethodName : newsView
	* @Description: 관리자 뉴스 상세
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/newsView"})
	public String newsView(Model model) {
		return "admin/news/newsView";
	}
	
	/*************************************************AJAX*************************************************/

	/**************************************************
	* @MethodName : getNewsList
	* @Description: 뉴스 리스트 조회 컨트롤러
	* @param request
	* @param model
	* @return ModelAndView
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 8. 2.
	**************************************************/
	@ResponseBody
	@RequestMapping(value = {"/getNewsList"}, method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getNewsList(HttpServletRequest request, Model model) {
		logger.debug("AdminNewsController : getNewsList - start");

		ModelAndView mv = new ModelAndView("jsonView");
		
		List<CamelMap> resultList = null;
		
		try {
//			resultList = adminNewsMapper.getNewsList();
		} catch (Exception e) {
			logger.debug("뉴스 리스트 조회 오류", e);
		}
		
		mv.addObject("resultList",resultList);
		
		logger.debug("AdminNewsController : getNewsList - end");
		return mv;
	}
	
	/**************************************************
	* @MethodName : getNewsInfo
	* @Description: 뉴스 상세 조회 컨트롤러
	* @param request
	* @param model
	* @return ModelAndView
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 8. 2.
	**************************************************/
	@ResponseBody
	@RequestMapping(value = {"/getNewsInfo"}, method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getNewsInfo(HttpServletRequest request, Model model) {
		logger.debug("AdminNewsController : getNewsInfo - start");

		ModelAndView mv = new ModelAndView("jsonView");
		
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		CamelMap resultInfo = null;
		
		try {
//			resultInfo = adminNewsMapper.getNewsInfo(paramMap);
		} catch (Exception e) {
			logger.debug("뉴스 상세 조회 오류", e);
		}
		
		mv.addObject("resultInfo",resultInfo);
		
		logger.debug("AdminNewsController : getNewsInfo - end");
		return mv;
	}
	
	/**************************************************
	* @MethodName : newsdelete
	* @Description: 뉴스 삭제 컨트롤러
	* @param request
	* @param model
	* @return boolean
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 8. 8.
	**************************************************/
	@ResponseBody
	@RequestMapping(value = {"/newsdelete"}, method = {RequestMethod.GET, RequestMethod.POST })
	public boolean newsdelete(HttpServletRequest request, Model model) {
		logger.debug("AdminNewsController : newsdelete - start");

		DataMap paramMap = HttpUtil.getRequestDataMap(request);

		int result = 0;
		
		try {
//			result = adminNewsMapper.newsdelete(paramMap);
		} catch (Exception e) {
			logger.debug("뉴스 삭제 오류", e);
		}
		
		logger.debug("AdminNewsController : newsdelete - end");
		return result > 0 ? true : false;
	}
}
	
	