package program.mypage;

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

import program.mypage.mapper.MypageMapper;
import program.common.CamelMap;
import program.common.DataMap;
import program.common.util.HttpUtil;


/**************************************************
* @FileName : MypageController.java
* @Description: 파이페이지 컨트롤러
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 7. 5.
* @Copyright : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping(value = {"mypage"})
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private MypageMapper mypageMapper;
	
	/**************************************************
	* @MethodName : index
	* @Description: 마이페이지 인덱스
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 5.
	**************************************************/
	@RequestMapping(value = {"/mypage"})
	public String index(Model model) {
		return "contents/mypage/index";
	}
	
	/**************************************************
	* @MethodName : modifyinfo
	* @Description: 개인정보 수정
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 5.
	**************************************************/
	@RequestMapping(value = {"/modifyinfo"})
	public String modifyinfo(Model model) {
		return "contents/mypage/modifyInfo";
	}
	
	/**************************************************
	* @MethodName : commentList
	* @Description: 댓글 목록 페이지
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/commentList"})
	public String commentList(Model model) {
		return "contents/mypage/commentList";
	}
	
	/**************************************************
	* @MethodName : modifyInfo
	* @Description: 개인정보 수정
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/modifyInfo"})
	public String modifyInfo(Model model) {
		return "contents/mypage/modifyInfo";
	}
	
	/**************************************************
	* @MethodName : scrap
	* @Description: 스크랩한 목록
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/scrap"})
	public String scrap(Model model) {
		return "contents/mypage/scrap";
	}
	
	/**************************************************
	* @MethodName : usage
	* @Description: 포인트 사용내역
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/usage"})
	public String usage(Model model) {
		return "contents/mypage/usage";
	}
	
	/**************************************************
	* @MethodName : wallet
	* @Description: 내 지갑 페이지
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/wallet"})
	public String wallet(Model model) {
		return "contents/mypage/wallet";
	}
	
	/**************************************************
	* @MethodName : postList
	* @Description:
	* @param model
	* @return String
	* @Author : Beom-Ki, Lee
	* @Version : 2021. 7. 10.
	**************************************************/
	@RequestMapping(value = {"/postList"})
	public String postList(Model model) {
		return "contents/mypage/postList";
	}
	
	
	
	/************************AJAX*********************************************/
	
	/**************************************************
	* @MethodName : getThisMemberInfo
	* @Description: 현재 접속 회원 정보 조회
	* @param request
	* @param model
	* @return ModelAndView
	* @Author : Beom-Ki, Lee
	* @Version : 2021. 8. 8.
	**************************************************/
	@ResponseBody
	@RequestMapping(value = {"/getThisMemberInfo"}, method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getThisMemberInfo(HttpServletRequest request, Model model) {
		logger.debug("MypageController : getThisMemberInfo - start");

		ModelAndView mv = new ModelAndView("jsonView");
		
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		CamelMap resultInfo = null;
		
		try {
			resultInfo = mypageMapper.getThisMemberInfo(paramMap);
		} catch (Exception e) {
			logger.debug("현재 접속 회원정보 조회 오류", e);
		}
		
		mv.addObject("resultInfo",resultInfo);
		
		logger.debug("MypageController : getThisMemberInfo - end");

		return mv;
	}
	
	
	/**************************************************
	* @MethodName : getBoardList
	* @Description: 게시판 목록 조회
	* @param request
	* @param model
	* @return ModelAndView
	* @Author : Beom-Ki, Lee
	* @Version : 2021. 8. 21.
	**************************************************/
	@ResponseBody
	@RequestMapping(value = {"/getBoardList"}, method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getBoardList(HttpServletRequest request, Model model) {
		logger.debug("MypageController : getBoardList - start");

		ModelAndView mv = new ModelAndView("jsonView");
		
		List<CamelMap> resultList = null;
		
		try {
			resultList = mypageMapper.getBoardList();
		} catch (Exception e) {
			logger.debug("게시글 목록 조회 오류", e);
		}
		
		mv.addObject("resultList",resultList);
		
		logger.debug("MypageController : getBoardList - end");
		return mv;
	}
	
	
}
	
	