package program.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import program.admin.member.mapper.AdminMemberMapper;
import program.common.CamelMap;
import program.common.DataMap;
import program.common.util.HttpUtil;
import program.common.util.RestMessageUtil;
import program.member.mapper.MemberMapper;
import program.security.Account;

/**************************************************
* @FileName   : RestMemberController.java
* @Description: 회원관리 REST 컨트롤러
* @Author     : june85
* @Version    : 2021. 3. 25
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/
@RestController
@RequestMapping("/rest/member")
public class RestMemberController {
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private AdminMemberMapper adminMemberMapper;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(RestMemberController.class);
	
	/**************************************************
	* @MethodName : login
	* @Description: 사이트맵
	* @param request
	* @param model
	* @return String
	* @throws Exception
	* @Author     : june85
	* @Version    : 2021. 3. 26
	**************************************************/
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/login", method={RequestMethod.POST})
    public Object login(@RequestBody DataMap reqMap, HttpServletRequest request, Model model) throws Exception {
		logger.debug("rest userMember controller login - start");
		String path = "/rest/member/login";
		DataMap resultMap = RestMessageUtil.getResultDataMap("999", path);
		
		if(!reqMap.isEmpty()) {
			if("N".equals(reqMap.getString("snsType"))) {
				logger.info("snsType : {}",reqMap.getString("snsType"));
				//회원여부 체크
				Account userAccount = adminMemberMapper.getLoginInfo(reqMap.getString("loginId"));
				
				//회원아닐경우 등록
				if (userAccount == null) {
					logger.info("회원 아닐경우 등록 처리");
					
					int rst = 0;
					DataMap accoutMap = new DataMap();
					accoutMap.put("userId", reqMap.getString("loginId"));
					accoutMap.put("userPw", passwordEncoder.encode(reqMap.getString("loginPass")));
					accoutMap.put("nickName", reqMap.getString("nickname"));
					accoutMap.put("email", reqMap.getString("email"));
					accoutMap.put("gender", reqMap.getString("gender"));
					accoutMap.put("userType", "G");
					
					rst = mapper.saveMember(accoutMap);
				}
			}
			
			try {
				String userName = reqMap.getString("loginId");
				String password = reqMap.getString("loginPass");
				UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(userName, password);
		        Authentication authentication = authenticationManager.authenticate(token);
		        
		        SecurityContextHolder.getContext().setAuthentication(authentication);
		        
		        DataMap history = new DataMap();
		        Account account = (Account)authentication.getPrincipal();
		        history.put("memNum", account.getId());
		        
		        try {
		        	mapper.setLoginProc(history);
		        }catch(Exception e) {
		        	logger.error("LoginHistory Error", e);
		        }
		        
		        resultMap = RestMessageUtil.getResultDataMap("200", path);
			}catch(BadCredentialsException be) {
				resultMap = RestMessageUtil.getResultDataMap("404", path);
			}catch(UsernameNotFoundException ne) {
				resultMap = RestMessageUtil.getResultDataMap("404", path);
			}catch(Exception e) {
				resultMap.put("message", e.getMessage());
			}
		}else {
			resultMap = RestMessageUtil.getResultDataMap("111", path);
		}
		
		logger.debug("rest userMember controller login - end");
		return resultMap;
	}
	
	/**************************************************
	* @MethodName : GetLoginUserInfo
	* @Description: 로그인중인 사용자 정보 조회
	* @param request
	* @return ModelAndView
	* @throws Exception 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 4. 1.
	**************************************************/
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/login/GetLoginUserInfo", method={RequestMethod.POST})
	@ResponseBody
    public Object GetLoginUserInfo(HttpServletRequest request) throws Exception {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		ModelAndView mv = new ModelAndView("jsonView");
		String path = "/rest/member/login/GetLoginUserInfo";
		CamelMap resultInfo = null;
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if (authentication.getPrincipal() != "anonymousUser") {
			try {
		        Account account = (Account)authentication.getPrincipal();
				paramMap.put("userSeq", account.getId());
				
				resultInfo = mapper.GetLoginUserInfo(paramMap);
			} catch (Exception e) {
				logger.debug("로그인중인 사용자 정보 조회 오류", e);
				logger.debug("회원 정보 조회 오류", e);
			}
		} else {
			logger.debug("로그인하지 않은 상태");
			paramMap = RestMessageUtil.getResultDataMap("404", path);
			return paramMap;
		}
		
		mv.addObject("resultInfo", resultInfo);
		
		return mv;
	}
	
	/**************************************************
	* @MethodName : join
	* @Description: 일반회원 회원가입
	* @param request
	* @return ModelAndView
	* @throws Exception 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 3. 31.
	**************************************************/
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/join", method={RequestMethod.POST})
	@ResponseBody
    public boolean join(HttpServletRequest request) throws Exception {
		logger.debug("rest userMember controller join - start");

		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		int queryResult = 0;
		
		String userName = paramMap.getString("userId");
		String password = paramMap.getString("userPw");
		String email = paramMap.getString("email");
		
		paramMap.put("userPw", passwordEncoder.encode(password));
		paramMap.put("email", email);

		try {
			queryResult = mapper.saveMember(paramMap);
			
			UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(userName, password);
	        Authentication authentication = authenticationManager.authenticate(token);
	        SecurityContextHolder.getContext().setAuthentication(authentication);
		} catch (Exception e) {
			logger.debug("회원가입 회원정보 저장 오류", e);
		}
		
		logger.debug("rest userMember controller join - end");
		return (queryResult == 1) ? true : false;
	}
	
	/**************************************************
	* @MethodName : idCheck
	* @Description: 일반회원 회원가입: id 중복 검사
	* @param reqMap
	* @param request
	* @param model
	* @return boolean
	* @throws Exception 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 3. 30.
	**************************************************/
	@RequestMapping(value="/join/idCheck", method={RequestMethod.POST})
	@ResponseBody
    public boolean idCheck(HttpServletRequest request) throws Exception {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		int queryResult = 0;

		try {
			queryResult = mapper.idCheck(paramMap);
		} catch (Exception e) {
			logger.debug("아이디 중복검사 조회 오류", e);
		}
		
		return (queryResult == 0) ? true : false;
	}
	
	/**************************************************
	* @MethodName : findId
	* @Description: 일반회원 아이디 찾기
	* @param request
	* @return ModelAndView
	* @throws Exception 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 3. 31.
	**************************************************/
	@RequestMapping(value="/findId", method={RequestMethod.POST})
	@ResponseBody
    public ModelAndView findId(HttpServletRequest request) throws Exception {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		ModelAndView mv = new ModelAndView("jsonView");

		List<CamelMap> resultList = null;

		try {
			resultList = mapper.findId(paramMap);
		} catch (Exception e) {
			logger.debug("아이디 찾기 조회 오류", e);
		}
		mv.addObject("resultList", resultList);
		
		return mv;
	}
	
	/**************************************************
	* @MethodName : pwReassign
	* @Description: 일반회원 비밀번호 찾기 비밀번호 재설정
	* @param request
	* @return boolean
	* @throws Exception 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 4. 1.
	**************************************************/
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/findPw/pwReassign", method={RequestMethod.POST})
	@ResponseBody
    public boolean pwReassign(HttpServletRequest request) throws Exception {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		int queryResult = 0;
		
		String password = paramMap.getString("userPw");
		paramMap.put("userPw", passwordEncoder.encode(password));

		try {
			queryResult = mapper.pwReassign(paramMap);
			queryResult += mapper.pwReassignHis(paramMap);
		} catch (Exception e) {
			logger.debug("비밀번호 재설정 저장 오류", e);
		}
		
		return (queryResult == 2) ? true : false;
	}
	
	/**************************************************
	* @MethodName : userInfoModify
	* @Description: 사용자 개인정보 수정
	* @param request
	* @return boolean
	* @throws Exception 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 4. 1.
	**************************************************/
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/userInfoModify", method={RequestMethod.POST})
	@ResponseBody
    public boolean userInfoModify(HttpServletRequest request, HttpServletResponse response) throws Exception {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		int queryResult = 0;
		
		String email = paramMap.getString("email");
		
		if (!paramMap.getString("userPw").equals("")) {
			String password = paramMap.getString("userPw");
			paramMap.put("userPw", passwordEncoder.encode(password));
		}else {
			paramMap.put("userPw", paramMap.getString("userPwOrigin"));
		}
		
		paramMap.put("email", email);
		paramMap.put("userPhone", paramMap.getString("top")+paramMap.getString("middle")+paramMap.getString("bottom"));

		try {
			queryResult = mapper.userInfoModify(paramMap);
		} catch (Exception e) {
			logger.debug("비밀번호 재설정 저장 오류", e);
		}
		
		try {
	        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			new SecurityContextLogoutHandler().logout(request,response,authentication);
			logger.debug("로그아웃 성공");
		} catch (Exception e) {
			logger.debug("로그아웃 실패", e);

		}

		return (queryResult == 1) ? true : false;
	}
	
	/**************************************************
	* @MethodName : withdrawal
	* @Description: 사용자 회원 탈퇴 업데이트
	* @param request
	* @param response
	* @return boolean
	* @throws Exception 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 4. 2.
	**************************************************/
	@RequestMapping(value="/withdrawal", method={RequestMethod.POST})
	@ResponseBody
    public boolean withdrawal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		int queryResult = 0;
		
		try {
			queryResult = mapper.userWithdrawal(paramMap);
		} catch (Exception e) {
			logger.debug("회원탈퇴 업데이트 오류", e);
		}
		
		try {
	        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			new SecurityContextLogoutHandler().logout(request,response,authentication);
			logger.debug("로그아웃 성공");
		} catch (Exception e) {
			logger.debug("로그아웃 실패", e);
		}

		return (queryResult == 1) ? true : false;
	}
}
