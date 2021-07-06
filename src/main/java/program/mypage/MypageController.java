package program.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**************************************************
* @FileName : MypageController.java
* @Description: 파이페이지 컨트롤러
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 7. 5.
* @Copyright : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping(value = {"mypage"})
public class MypageController {
	
//	@Autowired
//	private TextBoardService textBoardService;
	
	/**************************************************
	* @MethodName : index
	* @Description: 마이페이지 인덱스
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 5.
	**************************************************/
	@RequestMapping(value = {"/mypage"})
	public String index(Model model) {
		return "contents/mypage/index";
	}
	
	/**************************************************
	* @MethodName : commentList
	* @Description: 댓글 목록 페이지
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/commentList"})
	public String commentList(Model model) {
		return "contents/mypage/commentList";
	}
	
	/**************************************************
	* @MethodName : modifyInfo
	* @Description: 개인정보 수정
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/modifyInfo"})
	public String modifyInfo(Model model) {
		return "contents/mypage/modifyInfo";
	}
	
	/**************************************************
	* @MethodName : scrap
	* @Description: 스크랩한 목록
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/scrap"})
	public String scrap(Model model) {
		return "contents/mypage/scrap";
	}
	
	/**************************************************
	* @MethodName : usage
	* @Description: 포인트 사용내역
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/usage"})
	public String usage(Model model) {
		return "contents/mypage/usage";
	}
	
	/**************************************************
	* @MethodName : wallet
	* @Description: 내 지갑 페이지
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 6.
	**************************************************/
	@RequestMapping(value = {"/wallet"})
	public String wallet(Model model) {
		return "contents/mypage/wallet";
	}
}
	
	