package program.admin.textboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**************************************************
* @FileName : AdminTextBoardController.java
* @Description: 관리자 페이지 뿜업 게시판 컨트롤러
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 7. 5.
* @Copyright : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping(value = {"/admin/textboard"})
public class AdminTextBoardController {
	
	@Autowired
//	private TextBoardService textBoardService;

	
	/**************************************************
	* @MethodName : textboardList
	* @Description: 관리자 페이지 뿜업 게시판 리스트
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 5.
	**************************************************/
	@RequestMapping(value = {"/textboardList"})
	public String textboardList(Model model) {
		model.addAttribute("greeting", "Hello!");
		return "/admin/textboardList";
	}
}
	
	