package program.indices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**************************************************
* @FileName : IndicesController.java
* @Description: 소비자 지수 페이지 컨트롤러
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 7. 5.
* @Copyright : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping(value = {"indices"})
public class IndicesController {
	
	@Autowired
//	private TextBoardService textBoardService;

	/**************************************************
	* @MethodName : indices
	* @Description: 소비자 지수 페이지
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 5.
	**************************************************/
	@RequestMapping(value = {"/indices"})
	public String indices(Model model) {
		return "/indices/indices";
	}
}
	
	