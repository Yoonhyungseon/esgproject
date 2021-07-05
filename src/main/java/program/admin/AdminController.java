package program.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import program.common.BoardVo;
import program.textboard.service.TextBoardService;


@Controller
@RequestMapping(value = {"/*","/board"})
public class AdminController {
	
	@Autowired
	private TextBoardService textBoardService;

	/**************************************************
	* @MethodName : hello
	* @Description: index 페이지
	**************************************************/
	@RequestMapping(value = {"","/*"})
	public String index(Model model) {
		model.addAttribute("greeting", "Hello!");
		return "/index";
	}
	
	/**************************************************
	* @MethodName : sitemap
	* @Description: sitemap 페이지
	**************************************************/
	@RequestMapping(value="/sitemap", method={RequestMethod.GET, RequestMethod.POST})
    public String sitemap(HttpServletRequest request, Model model) throws Exception {		
		return "sitemap";
	}
	
	/**************************************************
	* @MethodName : getNow
	* @Description: 데이터베이스 연동 확인
	**************************************************/
	
	@RequestMapping("/test")
    public String getNow(Model model) throws Exception {
		String getNow = textBoardService.getNow();
		model.addAttribute("DBtest", getNow);
		return "/board/getNow";
	}
	
	/**************************************************
	* @MethodName : selectAll
	* @Description: DB 모든 칼럼 조회
	**************************************************/
	@RequestMapping(value={"/test/show"})
    public String selectAll(Model model) throws Exception {
		List<BoardVo> board = textBoardService.selectAll();
		model.addAttribute("lists", board);
//		System.out.println(board.toString());
		return "/board/testlist";
	}
	
	/**************************************************
	* @MethodName : getList
	* @Description: 게시물 리스트 조회
	**************************************************/
	@RequestMapping(value = "/listAll")
	public String getList(Model model) throws Exception {		
		model.addAttribute("goSearch", 0);
		model.addAttribute("listAll", textBoardService.getBoardList());
		return "/board/listLists";
	}
	
	/**************************************************
	* @MethodName : openBoardDetail
	* @Description: 게시물 리스트 조회
	**************************************************/
	@GetMapping(value = "/view.do")
	public String openBoardDetail(@RequestParam(value = "ssn", required = false) Long ssn, Model model) throws Exception {
		if (ssn == null) {
			System.out.println("올바르지 않은 접근, 게시글 리스트로 리다이렉트");
			return "redirect:/board/listAll";
		}
		textBoardService.viewCount(ssn);
		BoardVo board = textBoardService.getBoardDetail(ssn);		
		if (board == null || "Y".equals(board.getDelete_yn())) {
			System.out.println("없는 게시글이거나, 이미 삭제된 게시글, 게시글 리스트로 리다이렉트");
			return "redirect:/board/listAll";
		}
		model.addAttribute("board", board);
		return "/board/view";
	}
	
	/**************************************************
	* @MethodName : openBoardWrite
	* @Description: 게시물 글쓰기
	**************************************************/
	@GetMapping(value = "/write.do")
	public String openBoardWrite(@RequestParam(value = "ssn", required = false) Long ssn, Model model) throws Exception {
		if (ssn == null) {
			model.addAttribute("board", new BoardVo());		
			return "/board/write";
		} else {
			BoardVo board = textBoardService.getBoardDetail(ssn);
			if (board == null) {
				System.out.println("없는 게시글이거나, 이미 삭제된 게시글, 게시글 리스트로 리다이렉트");
				return "redirect:/board/listAll";
			}
			model.addAttribute("board", board);
			return "/board/update";
		}
	}
	
	/**************************************************
	 * @MethodName : registerBoard
	 * @Description: 게시물 등록
	 **************************************************/
	@PostMapping(value = "/register.do")
	public String registerBoard(@ModelAttribute BoardVo params, Model model) throws DataAccessException, Exception {
//		System.out.println(params.toString());
		if (params.getName() == "" || params.getTitle() == "" || params.getContents() == "") {
			if (params.getName() == "") {
				params.setName("익명");
			}
			if (params.getTitle() == "" || params.getContents() == "") {
				// TODO => 제목 또는 내용이 없음
				model.addAttribute("goSearch", 0);
				model.addAttribute("board", params);
				return "/board/write";
			}
		}
		boolean isRegistered = textBoardService.registerBoard(params);
		if (isRegistered == false) {
			// TODO => 게시글 등록에 실패하였다는 메시지를 전달
		}
		model.addAttribute("goSearch", 0);
		model.addAttribute("listAll", textBoardService.getBoardList());
		return "/board/listLists";
	}

	/**************************************************
	 * @MethodName : searchName
	 * @Description: 게시물 작성자로 검색 기능
	 **************************************************/
	@PostMapping(value = "/searchName")
	public String searchName(@ModelAttribute BoardVo params, Model model) throws DataAccessException, Exception{		
		if (params.getName() == "") {
			model.addAttribute("goSearch", 0);
			model.addAttribute("listAll", textBoardService.getBoardList());
			return "/board/listLists";
		}
		List<BoardVo> board = textBoardService.searchName(params.getName());
		if (board.size() == 0) {
			System.out.println("검색 결과 없음");
		}
		model.addAttribute("goSearch", 1);
		model.addAttribute("listAll", board);
		return "/board/listLists";
	}
	
	/**************************************************
	 * @MethodName : searchTitle
	 * @Description: 게시물 제목으로로 검색 기능
	 **************************************************/
	@PostMapping(value = "/searchTitle")
	public String searchTitle(@ModelAttribute BoardVo params, Model model) throws DataAccessException, Exception{		
		if (params.getName() == "") {
			model.addAttribute("goSearch", 0);
			model.addAttribute("listAll", textBoardService.getBoardList());
			return "/board/listLists";
		}
		List<BoardVo> board = textBoardService.searchTitle(params.getName());
		if (board.size() == 0) {
			System.out.println("검색 결과 없음");
		}
		model.addAttribute("goSearch", 1);
		model.addAttribute("listAll", board);
		return "/board/listLists";
	}

	/**************************************************
	 * @MethodName : deleteBoard
	 * @Description: 게시물 삭제 (ajax 이용)
	 **************************************************/
    @ResponseBody
	@RequestMapping(value = "delete.do", method = RequestMethod.POST)
	public boolean deleteBoard(Long ssn) throws Exception {
//    	System.out.println(ssn);
		boolean isDeleted = textBoardService.deleteBoard(ssn);
		return isDeleted;
	}

	/**************************************************
	 * @MethodName : deleteDB
	 * @Description: 게시물 데이터베이스에서 삭제
	 **************************************************/
	@GetMapping(value = "/deleteBD")
	public String deleteDB(Model model) throws Exception {
		textBoardService.deleteDB();
		model.addAttribute("lists", textBoardService.selectAll());
		return "/board/testlist";
	}	
	
	/************************************************************************************TEST**************************************************************************************************/
	
	
	/**************************************************
	 * @throws Exception 
	 * @MethodName : ajaxTestControllerMethod
	 * @Description: ajax 테스트 (컨트롤러 -> 뷰로 데이터 전송)
	 **************************************************/
	@ResponseBody
	@GetMapping(value = "/ajaxTest")
//	public List<BoardVo> ajaxTest() throws Exception {
	public List<BoardVo> ajaxTest() throws Exception {
		System.out.println("sending VO");
		return textBoardService.selectAll();
	}	 
	
	/**************************************************
	 * @throws Exception 
	 * @MethodName : memberRegi
	 * @Description: ajax 테스트 (뷰 -> 컨트롤러로 데이터 전송)
	 **************************************************/
	@ResponseBody
	@RequestMapping(value = "/ajaxTest2", method = RequestMethod.POST)
	public List<BoardVo> memberRegi(String name, BoardVo dto, HttpServletRequest request) throws Exception {	
		
		System.out.println("receiving String");
		System.out.println("request = "+request.getParameter("name"));
		System.out.println("dto = "+dto.getName());
		System.out.println("Stirng = "+name+"\n");
		return textBoardService.selectAll();
	}
}
	
	