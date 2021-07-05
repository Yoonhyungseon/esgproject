package program.admin.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


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
	
//	@Autowired
//	private TextBoardService textBoardService;

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
}
	
	