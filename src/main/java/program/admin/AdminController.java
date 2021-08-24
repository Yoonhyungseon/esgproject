package program.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**************************************************
* @FileName : AdminController.java
* @Description: 어드민 인덱스 컨트롤러
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 7. 5.
* @Copyright : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping(value = {"admin"})
public class AdminController {

//	@Autowired
//	private TextBoardService textBoardService;

	/**************************************************
	* @MethodName : login
	* @Description: 관리자 페이지 로그인 
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/login"})
	public String login(Model model) {
		return "admin/login";
	}
	
	/**************************************************
	* @MethodName : index
	* @Description: 어드민 인덱스 페이지
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 5.
	**************************************************/
	@RequestMapping(value = {"/index"})
	public String index(Model model) {
		return "admin/index";
	}
	@RequestMapping(value="/access-denied", method={RequestMethod.GET, RequestMethod.POST})
    public String access_denied(HttpServletRequest request, Model model) throws Exception {
		
		return "/admin/access_denied";
	}
}

