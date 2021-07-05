package program.member;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@Autowired
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
}
	
	