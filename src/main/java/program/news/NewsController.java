package program.news;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**************************************************
* @FileName : NewsController.java
* @Description: 뉴스 컨트롤러
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 7. 5.
* @Copyright : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping(value = {"/news"})
public class NewsController {
	
	@Autowired
//	private TextBoardService textBoardService;
	
	/**************************************************
	* @MethodName : newsList
	* @Description: 뉴스 리스트
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 5.
	**************************************************/
	@RequestMapping(value = {"/newsList"})
	public String newsList(Model model) {
		model.addAttribute("greeting", "Hello!");
		return "/news/newsList";
	}

}
	
	