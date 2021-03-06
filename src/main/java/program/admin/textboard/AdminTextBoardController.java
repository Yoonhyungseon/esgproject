package program.admin.textboard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import program.admin.textboard.mapper.AdminTextBoardMapper;
import program.common.CamelMap;
import program.common.DataMap;
import program.common.service.CommonService;
import program.common.util.HttpUtil;

/**************************************************
 * @FileName : AdminTextBoardController.java
 * @Description: 관리자 페이지 뿜업 게시판 컨트롤러
 * @Author : Hyung-Seon. Yoon
 * @Version : 2021. 7. 5.
 * @Copyright : ⓒADUP. All Right Reserved
 **************************************************/
@Controller
@RequestMapping(value = { "/admin/textboard" })
public class AdminTextBoardController {
	private static final Logger logger = LoggerFactory.getLogger(AdminTextBoardController.class);

	@Autowired
	private CommonService commonService;
	/*
	 * @Autowired private TextBoardMapper textBoardMapper;
	 */
	@Autowired
	private AdminTextBoardMapper adminTBMapper;
	
//	private TextBoardService textBoardService;

	/**************************************************
	 * @MethodName : textboardList
	 * @Description: 관리자 페이지 뿜업 게시판 리스트
	 * @param model
	 * @return String
	 * @Author : Hyung-Seon. Yoon
	 * @Version : 2021. 7. 5.
	 **************************************************/
	@RequestMapping(value = { "/textboardList" })
	public String textboardList(Model model) {
		return "/admin/textboard/textboardList";
	}

	/**************************************************
	* @MethodName : textboardView
	* @Description: 관리자 페이지 뿜업 게시판 상세
	* @param request
	* @param model
	* @return String
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 26.
	**************************************************/
	@RequestMapping(value = { "/textboardView" })
	public String textboardView(HttpServletRequest request, Model model) {
		
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		HttpUtil.getParams(paramMap, model);
		
		return "/admin/textboard/textboardView";
	}

	/**************************************************
	 * @MethodName : textboardWrite
	 * @Description: 관리자 페이지 뿜업 게시판 작성
	 * @param model
	 * @return String
	 * @Author : Hyung-Seon. Yoon
	 * @Version : 2021. 7. 6.
	 **************************************************/
	@RequestMapping(value = { "/textboardWrite" })
	public String textboardWrite(Model model) {
		return "/admin/textboard/textboardWrite";
	}

	/**************************************************
	 * @MethodName : noticeList
	 * @Description: 관리자 페이지 공지사항 리스트
	 * @param model
	 * @return String
	 * @Author : Hyung-Seon. Yoon
	 * @Version : 2021. 7. 6.
	 **************************************************/
	@RequestMapping(value = { "/noticeList" })
	public String noticeList(Model model) {
		return "/admin/textboard/noticeList";
	}

	/**************************************************
	 * @MethodName : noticeView
	 * @Description: 관리자 페이지 공지사항 상세
	 * @param model
	 * @return String
	 * @Author : Hyung-Seon. Yoon
	 * @Version : 2021. 7. 6.
	 **************************************************/
	@RequestMapping(value = { "/noticeView" })
	public String noticeView(HttpServletRequest request,Model model) {
		
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		HttpUtil.getParams(paramMap, model);
		
		return "/admin/textboard/noticeView";
	}

	/**************************************************
	 * @MethodName : noticeWrite
	 * @Description: 관리자 페이지 공지사항 작성
	 * @param model
	 * @return String
	 * @Author : Hyung-Seon. Yoon
	 * @Version : 2021. 7. 6.
	 **************************************************/
	@RequestMapping(value = { "/noticeWrite" })
	public String noticeWrite(Model model) {
		return "/admin/textboard/noticeWrite";
	}

	/**************************************************
	 * @MethodName : ajaxSiteBoardSave
	 * @Description: 관리자 공지사항 등록
	 * @param request
	 * @param model
	 * @return String
	 * @Author : Ye-Jin. Jeong
	 * @Version : 2021. 8. 17.
	 **************************************************/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = { "/ajaxSiteBoardSave" }, method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	//public void ajaxSiteBoardSave(HttpServletRequest request, Model model) {

	public Boolean ajaxSiteBoardSave(HttpServletRequest request, Model model) {
	//public String ajaxSiteBoardSave(HttpServletRequest request, Model model) {
		logger.debug("AdminTextBoardController : ajaxSiteBoardSave - start");
		
		DataMap paramMap = HttpUtil.getRequestDataMap(request);

		int rst = 0;

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String adminId = authentication.getName();
		//String mode = paramMap.getString("mode");
		//String seq = paramMap.getString("seq");

		paramMap.put("adminId", adminId);

		paramMap.put("filePath", "SITE_BOARD");
		List<CamelMap> rstFileList = null;

		try {
			rstFileList = commonService.saveFile(request, paramMap);
			for (CamelMap fileMap : rstFileList) {
				logger.info("fileMap : {}", fileMap);
				paramMap.put("attFile", fileMap.get("saveFilePath") + "/" + fileMap.get("saveFileName"));
			}
			rst = adminTBMapper.insertSiteBoard(paramMap);
//			adminTBMapper.insertSiteBoard(paramMap);
			/*
			 * if ("MOD".equals(mode) && !StringUtil.isEmpty(seq)) { if
			 * (!StringUtil.isEmpty(paramMap.getString("attFile"))) {
			 * paramMap.put("fileName", paramMap.getString("orgAttFile"));
			 * commonService.deleteFile(paramMap); } sw =
			 * adminTBMapper.updateSiteBoard(paramMap); } else { sw =
			 * adminTBMapper.insertSiteBoard(paramMap); }
			 */
		} catch (Exception e) {
			logger.debug("사이트 공지사항 저장 오류", e);
		}
		logger.debug("AdminTextBoardController : ajaxSiteBoardSave - end");
		
		System.out.println(rst);
		//return "redirect:noticeResult";
		return rst>0 ? true : false;
	}
	
	@RequestMapping(value= {"/noticeResult"})
	public String noticeResult() {
		return "/admin/textboard/noticeResult";
	}

	/**************************************************
	* @MethodName : getNoticeList
	* @Description: 관리자 공지사항 조회 컨트롤러
	* @param request
	* @param model
	* @return ModelAndView
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 18.
	**************************************************/
	@ResponseBody
	@RequestMapping(value = { "/getNoticeList" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getNoticeList(HttpServletRequest request, Model model) {
		logger.debug("AdminTextBoardController : getNoticeList - start");

		ModelAndView mv = new ModelAndView("jsonView");

		List<CamelMap> resultList = null;

		try {
			resultList = adminTBMapper.getNoticeList();
		} catch (Exception e) {
			logger.debug("게시글 리스트 조회 오류", e);
		}

		mv.addObject("resultList", resultList);

		logger.debug("AdminTextBoardController : getNoticeList - end");
		return mv;
	}

	/**************************************************
	 * @MethodName : getBoardInfo
	 * @Description: 관리자 공지사항 상세 조회 컨트롤러
	 * @param request
	 * @param model
	 * @return ModelAndView
	 * @Author : Ye-Jin. Jeong
	 * @Version : 2021. 8. 14.
	 **************************************************/
	@ResponseBody
	@RequestMapping(value = { "/getNoticeInfo" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getNoticeInfo(HttpServletRequest request, Model model) {
		logger.debug("AdminTextBoardController : getNoticeInfo - start");

		ModelAndView mv = new ModelAndView("jsonView");

		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		System.out.println(paramMap.toString());
		CamelMap resultInfo = null;

		try {
			resultInfo = adminTBMapper.getNoticeInfo(paramMap);
		} catch (Exception e) {
			logger.debug("게시글 조회 오류", e);
		}

		mv.addObject("resultInfo", resultInfo);

		logger.debug("AdminTextBoardController : getNoticeInfo - end");
		return mv;
	}
	
	/**************************************************
	* @MethodName : getBoardList
	* @Description: 게시글 리스트 컨트롤러
	* @param request
	* @param model
	* @return ModelAndView
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 26.
	**************************************************/
	@ResponseBody
	@RequestMapping(value = { "/getBoardList" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getBoardList(HttpServletRequest request, Model model) {
		logger.debug("AdminTextBoardController : getBoardList - start");

		ModelAndView mv = new ModelAndView("jsonView");

		List<CamelMap> resultList = null;

		try {
			resultList = adminTBMapper.getBoardList();
		} catch (Exception e) {
			logger.debug("게시글 리스트 조회 오류", e);
		}

		mv.addObject("resultList", resultList);

		logger.debug("AdminTextBoardController : getBoardList - end");
		return mv;
	}
	
	/**************************************************
	* @MethodName : getBoardInfo
	* @Description: 게시글 상세 조회 컨트롤러
	* @param request
	* @param model
	* @return ModelAndView
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 26.
	**************************************************/
	@ResponseBody
	@RequestMapping(value = { "/getBoardInfo" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getBoardInfo(HttpServletRequest request, Model model) {
		logger.debug("AdminTextBoardController : getBoardInfo - start");

		ModelAndView mv = new ModelAndView("jsonView");

		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		System.out.println(paramMap.toString());
		CamelMap resultInfo = null;

		try {
			resultInfo = adminTBMapper.getBoardInfo(paramMap);
		} catch (Exception e) {
			logger.debug("게시글 조회 오류", e);
		}

		mv.addObject("resultInfo", resultInfo);

		logger.debug("AdminTextBoardController : getBoardInfo - end");
		return mv;
	}
	
	/**************************************************
	* @MethodName : feedbackSave
	* @Description: 피드백 등록
	* @param request
	* @param model
	* @return Boolean
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 31.
	**************************************************/
	@ResponseBody
	@RequestMapping(value = { "/postFeedback" }, method = { RequestMethod.GET, RequestMethod.POST })
	public Boolean postFeedback(HttpServletRequest request, Model model) {
		logger.debug("AdminTextBoardController : postFeedback - start");
		
		DataMap paramMap = HttpUtil.getRequestDataMap(request);

		int rst = 0;
		
		try {
			rst = adminTBMapper.postFeedback(paramMap);
		} catch (Exception e) {
			logger.debug("피드백 저장 오류", e);
		}
		
		logger.debug("AdminTextBoardController : postFeedback - end");
		
		return rst>0 ? true : false;
	}
	/**************************************************
	* @MethodName : getCommentList
	* @Description: 글번호에 따른 댓글 리스트
	* @param request
	* @param model
	* @return ModelAndView
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 31.
	**************************************************/
	@ResponseBody
	@RequestMapping(value = { "/getCommentList" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getCommentList(HttpServletRequest request, Model model) {
		logger.debug("AdminTextBoardController : getCommentList - start");
		
		ModelAndView mv = new ModelAndView("jsonView");

		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		System.out.println(paramMap.toString());
	
		List<CamelMap> resultList = null;

		try {
			resultList = adminTBMapper.getCommentList(paramMap);
		} catch (Exception e) {
			logger.debug("게시글 조회 오류", e);
		}

		mv.addObject("resultList", resultList);

		logger.debug("AdminTextBoardController : getCommentList - end");
		return mv;
	}
}
