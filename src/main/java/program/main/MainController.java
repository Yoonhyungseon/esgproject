package program.main;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**************************************************
* @FileName : MainController.java
* @Description: 메인 컨트롤러
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 7. 5.
* @Copyright : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping(value = {"/*"})
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

//	@Autowired
//	private TextBoardService textBoardService;

	/**************************************************
	* @MethodName : index
	* @Description: 인덱스 페이지
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 5.
	**************************************************/
	@RequestMapping(value = {"index","/*"})
	public String index(Model model) {
//		model.addAttribute("greeting", "Hello!");
		return "/index";
	}
	
	/**************************************************
	* @MethodName : sitemap
	* @Description: 사이트맵
	* @param request
	* @param model
	* @return String
	* @throws Exception 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 5.
	**************************************************/
	@RequestMapping(value="/sitemap", method={RequestMethod.GET, RequestMethod.POST})
    public String sitemap(HttpServletRequest request, Model model) throws Exception {		
		return "/sitemap";
	}
	
	/**************************************************
	* @MethodName : about
	* @Description: about 페이지
	* @param request
	* @param model
	* @return String
	* @throws Exception 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 11.
	**************************************************/
	@RequestMapping(value="/about", method={RequestMethod.GET, RequestMethod.POST})
    public String about(HttpServletRequest request, Model model) throws Exception {		
		return "/about";
	}
	
	/**************************************************
	* @MethodName : bootstrap 
	* @Description: bootstrap 페이지
	* @param model
	* @return String
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 16.
	**************************************************/
	@RequestMapping(value = {"/about"})
	public String about(Model model) {
		return "/bootstrap/about";
	}
	
	@RequestMapping(value = {"/contact"})
	public String contact(Model model) {
		return "/bootstrap/contact";
	}
	
	@RequestMapping(value = {"/errorPage"})
	public String error(Model model) {
		return "/bootstrap/error";
	}
	
	@RequestMapping(value = {"/mypage"})
	public String mypage(Model model) {
		return "/bootstrap/mypage";
	}
	
	@RequestMapping(value = {"/menu"})
	public String menu(Model model) {
		return "/bootstrap/menu";
	}
	
	@RequestMapping(value = {"/landing-single"})
	public String landing(Model model) {
		return "/bootstrap/landing-single";
	}
	
	@RequestMapping(value = {"/white_index"})
	public String white_index(Model model) {
		return "/bootstrap/white_index";
	}
	@RequestMapping(value="/access-denied", method={RequestMethod.GET, RequestMethod.POST})
    public String access_denied(HttpServletRequest request, Model model) throws Exception {
		
		return "/access_denied";
	}
	
	/**************************************************
	* @MethodName : contents
	* @Description: 컨텐츠 컨트롤러
	* @param menu
	* @param page
	* @param request
	* @param model
	* @return String
	* @throws Exception 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 7. 16.
	**************************************************/
	@RequestMapping(value="/{menu}/{page}", method={RequestMethod.GET, RequestMethod.POST})
    public String contents(@PathVariable String menu, @PathVariable String page, HttpServletRequest request, Model model) throws Exception {
		logger.info("contents controller");

		logger.info("menu : {}", menu);
		logger.info("page : {}", page);
		
		return "contents/"+menu+"/"+page;
	}
}
	
	