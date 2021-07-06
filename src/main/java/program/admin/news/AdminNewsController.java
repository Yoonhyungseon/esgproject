package program.admin.news;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**************************************************
* @FileName : AdminNewsController.java
* @Description: 관리자 뉴스 컨트롤러	
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 7. 5.
* @Copyright : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping(value = {"/admin/member"})
public class AdminNewsController {
	
//	@Autowired
//	private TextBoardService textBoardService;

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
		return "admin/member/newsList";
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
		return "admin/member/newsView";
	}
}
	
	