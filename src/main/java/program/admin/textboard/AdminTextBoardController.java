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
	
//	@Autowired
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
		return "/admin/textboard/textboardList";
	}
	
	/**************************************************
	* @MethodName : textboardView
	* @Description: 관리자 페이지 뿜업 게시판 상세
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/textboardView"})
	public String textboardView(Model model) {
		return "/admin/textboard/textboardView";
	}
	
	/**************************************************
	* @MethodName : textboardWrite
	* @Description: 관리자 페이지 뿜업 게시판 작성
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/textboardWrite"})
	public String textboardWrite(Model model) {
		return "/admin/textboard/textboardWrite";
	}
	
	/**************************************************
	* @MethodName : noticeList
	* @Description: 관리자 페이지 공지사항 리스트
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/noticeList"})
	public String noticeList(Model model) {
		return "/admin/textboard/noticeList";
	}
	
	/**************************************************
	* @MethodName : noticeView
	* @Description: 관리자 페이지 공지사항 상세
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/noticeView"})
	public String noticeView(Model model) {
		return "/admin/textboard/noticeView";
	}
	
	/**************************************************
	* @MethodName : noticeWrite
	* @Description: 관리자 페이지 공지사항 작성
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/noticeWrite"})
	public String noticeWrite(Model model) {
		return "/admin/textboard/noticeWrite";
	}
}
	
	