package program.textboard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**************************************************
* @FileName : TextBoardController.java
* @Description: 뿜업 게시판 컨트롤러
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 7. 5.
* @Copyright : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping(value = {"board"})
public class TextBoardController {
	
//	@Autowired
//	private TextBoardService textBoardService;

	/**************************************************
	* @MethodName : textbordList
	* @Description: 뿜업 게시판 리스트
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 5.
	**************************************************/
	@RequestMapping(value = {"/textboardList"})
	public String textboardList(Model model) {
		return "contents/board/textboardList";
	}
	
}
	
	