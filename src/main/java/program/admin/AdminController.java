package program.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


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

	@Autowired
//	private TextBoardService textBoardService;

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
}

