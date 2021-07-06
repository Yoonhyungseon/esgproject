package program.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**************************************************
* @FileName : ClientMemberController.java
* @Description: 사용자 맴버 컨트롤러
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 7. 5.
* @Copyright : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping(value = {"member"})
public class ClientMemberController {
	
//	@Autowired
//	private TextBoardService textBoardService;
	
	/**************************************************
	* @MethodName : join
	* @Description: 회원가입 페이지
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 5.
	**************************************************/
	@RequestMapping(value = {"/join"})
	public String join(Model model) {
		return "/member/join";
	}
	
	/**************************************************
	* @MethodName : joinCompleted
	* @Description: 회원가입 완료 페이지
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/joinCompleted"})
	public String joinCompleted(Model model) {
		return "/member/joinCompleted";
	}
	
	/**************************************************
	* @MethodName : login
	* @Description: 로그인 페이지
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/login"})
	public String login(Model model) {
		return "/member/login";
	}
	
	/**************************************************
	* @MethodName : findId
	* @Description: 아이디 찾기
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/findId"})
	public String findId(Model model) {
		return "/member/findId";
	}
	
	/**************************************************
	* @MethodName : findIdMention
	* @Description: 아이디 찾기 멘트
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/findIdMention"})
	public String findIdMention(Model model) {
		return "/member/findIdMention";
	}
	
	/**************************************************
	* @MethodName : findPassword
	* @Description: 비밀번호 찾기
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/findPassword"})
	public String findPassword(Model model) {
		return "/member/findPassword";
	}
	
	/**************************************************
	* @MethodName : findPasswordMention
	* @Description: 비밀번호 찾기 멘트
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/findPasswordMention"})
	public String findPasswordMention(Model model) {
		return "/member/findPasswordMention";
	}
	
	/**************************************************
	* @MethodName : withdrawal
	* @Description: 회원탈퇴
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/withdrawal"})
	public String withdrawal(Model model) {
		return "/member/withdrawal";
	}
	
	/**************************************************
	* @MethodName : withdrawalCompleted
	* @Description: 회원탈퇴 완료 멘트
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/withdrawalCompleted"})
	public String withdrawalCompleted(Model model) {
		return "/member/withdrawalCompleted";
	}
}
	
	