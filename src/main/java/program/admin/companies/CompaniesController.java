package program.admin.companies;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**************************************************
* @FileName : CompaniesController.java
* @Description: 관리자 기업 관리 컨트롤러
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 7. 5.
* @Copyright : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping(value = {"admin/Companies"})
public class CompaniesController {
	
	@Autowired
//	private TextBoardService textBoardService;
	
	/**************************************************
	* @MethodName : companiesList
	* @Description: 기업 리스트
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 5.
	**************************************************/
	@RequestMapping(value = {"/companiesList"})
	public String commentList(Model model) {
		return "admin/companiesList";
	}
}
	
	