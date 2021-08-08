package program.admin.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import program.admin.member.mapper.AdminMemberMapper;
import program.common.CamelMap;
import program.common.DataMap;
import program.common.util.HttpUtil;


/**************************************************
* @FileName : AdminMemberController.java
* @Description: 관리자 회원 컨트롤러	
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 7. 5.
* @Copyright : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping(value = {"/admin/member"})
public class AdminMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);

	@Autowired
	private AdminMemberMapper adminMemberMapper;

	/**************************************************
	* @MethodName : memberList
	* @Description: 관리자 회원목록 페이지
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 5.
	**************************************************/
	@RequestMapping(value = {"/memberList"})
	public String memberList(Model model) {
		return "admin/member/memberList";
	}
	
	/**************************************************
	* @MethodName : memberView
	* @Description: 관리자 회원목록 상세
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/memberView"})
	public String memberView(HttpServletRequest request, Model model) {
		
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		HttpUtil.getParams(paramMap, model);
		
		return "admin/member/memberView";
	}
	
	/**************************************************
	* @MethodName : memberWrite
	* @Description: 관리자 회원목록 수정
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/memberWrite"})
	public String memberWrite(Model model) {
		return "admin/member/memberWrite";
	}
	
	/*************************************************AJAX*************************************************/
	
	/**************************************************
	* @MethodName : getMemberList
	* @Description: 관리자 회원 정보 조회 컨트롤러
	* @param request
	* @param model
	* @return ModelAndView
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 8. 2.
	**************************************************/
	@ResponseBody
	@RequestMapping(value = {"/getMemberList"}, method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getMemberList(HttpServletRequest request, Model model) {
		logger.debug("AdminMemberController : getMemberList - start");

		ModelAndView mv = new ModelAndView("jsonView");
		
		List<CamelMap> resultList = null;
		
		try {
			resultList = adminMemberMapper.getMemberList();
		} catch (Exception e) {
			logger.debug("회원 리스트 조회 오류", e);
		}
		
		mv.addObject("resultList",resultList);
		
		logger.debug("AdminMemberController : getMemberList - end");
		return mv;
	}
	
	/**************************************************
	* @MethodName : getMemberInfo
	* @Description: 회원정보 상세 조회 컨트롤러
	* @param request
	* @param model
	* @return ModelAndView
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 8. 2.
	**************************************************/
	@ResponseBody
	@RequestMapping(value = {"/getMemberInfo"}, method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getMemberInfo(HttpServletRequest request, Model model) {
		logger.debug("AdminMemberController : getMemberInfo - start");

		ModelAndView mv = new ModelAndView("jsonView");
		
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		CamelMap resultInfo = null;
		
		try {
			resultInfo = adminMemberMapper.getMemberInfo(paramMap);
		} catch (Exception e) {
			logger.debug("회원정보 조회 오류", e);
		}
		
		mv.addObject("resultInfo",resultInfo);
		
		logger.debug("AdminMemberController : getMemberInfo - end");
		return mv;
	}
	
	/**************************************************
	* @MethodName : memberdelete
	* @Description: 회원 삭제 컨트롤러
	* @param request
	* @param model
	* @return boolean
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 8. 8.
	**************************************************/
	@ResponseBody
	@RequestMapping(value = {"/memberdelete"}, method = {RequestMethod.GET, RequestMethod.POST })
	public boolean memberdelete(HttpServletRequest request, Model model) {
		logger.debug("AdminMemberController : memberdelete - start");

		DataMap paramMap = HttpUtil.getRequestDataMap(request);

		int result = 0;
		
		try {
			result = adminMemberMapper.memberdelete(paramMap);
		} catch (Exception e) {
			logger.debug("회원정보 조회 오류", e);
		}
		
		logger.debug("AdminMemberController : memberdelete - end");

		return result > 0 ? true : false;
	}
}
	
	