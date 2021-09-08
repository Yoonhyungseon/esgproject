package program.textboard.service;

import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import program.common.DataMap;
import program.common.util.HttpUtil;
import program.textboard.mapper.TextBoardMapper;


/**************************************************
 * @FileName : TextBoardService.java
 **************************************************/

@Service
public class TextBoardService {

	@Autowired
	private TextBoardMapper textBoardMapper;
//
//	/**************************************************
//	 * @MethodName : getNow
//	 * @Description: 데이터베이스 연동 확인
//	 **************************************************/
//	public String getNow() throws Exception {
//		return textBoardMapper.getNow();
//	}
//
//	/**************************************************
//	 * @MethodName : selectTest
//	 * @Description: DB 모든 칼럼 조회
//	 **************************************************/
//	public List<BoardVo> selectAll() throws Exception {
//		return textBoardMapper.selectAll();
//	}
//
//	/**************************************************
//	 * @MethodName : getBoardList
//	 * @Description: 게시글 리스트 조회
//	 **************************************************/
//	public List<BoardVo> getBoardList() throws Exception {
//		return textBoardMapper.getBoardList();
//	}
//
//	/**************************************************
//	 * @MethodName : getBoardDetail
//	 * @Description: 게시글 상세 조회
//	 **************************************************/
//	public BoardVo getBoardDetail(Long ssn) throws Exception {
//		return (BoardVo) textBoardMapper.getBoardDetail(ssn);
//	}
//
//	/**************************************************
//	 * @MethodName : registerBoard
//	 * @Description: 게시글 생성
//	 **************************************************/
//	public boolean registerBoard(BoardVo board) throws Exception {
//		int queryResult = 0;
////		System.out.println(board.toString());
//		if (board.getSsn() == null) {
//			queryResult = textBoardMapper.insertBoard(board); // 호출한 쿼리가 정상 실행하면 쿼리를 실행한 횟수가 저장
//		} else {
//			queryResult = textBoardMapper.updateBoard(board);
//		}
//		return (queryResult == 1) ? true : false;
//	}
//
//	/**************************************************
//	 * @MethodName : deleteBoard
//	 * @Description: 게시글 삭제
//	 **************************************************/
//	public boolean deleteBoard(Long ssn) throws Exception {
//		int queryResult = 0;
//		BoardVo board = textBoardMapper.getBoardDetail(ssn);
//		if (board != null && "N".equals(board.getDelete_yn())) {
//			queryResult = textBoardMapper.deleteBoard(ssn);
//		}
////		System.out.println(board.toString());
//		return (queryResult == 1) ? true : false;
//	}
//
//	/**************************************************
//	 * @MethodName : deleteDB
//	 * @Description: 게시물 데이터베이스에서 삭제
//	 **************************************************/
//	public void deleteDB() throws Exception {
//		textBoardMapper.deleteDB();
//	}
//	
//	/**************************************************
//	 * @MethodName : viewCount
//	 * @Description: 게시물 조회수 업데이트
//	 **************************************************/
//	public void viewCount(Long ssn) throws Exception {
//		textBoardMapper.viewCount(ssn);
//	}
//	
//	/**************************************************
//	 * @MethodName : searchName
//	 * @Description: 게시물 작성자로 검색 기능
//	 **************************************************/
//	public List<BoardVo> searchName(String name) throws Exception {	
//		return textBoardMapper.searchName(name);
//	}
//	
//	/**************************************************
//	 * @MethodName : searchTitle
//	 * @Description: 게시물 제목으로 검색 기능
//	 **************************************************/
//	public List<BoardVo> searchTitle(String name) throws Exception {	
//		return textBoardMapper.searchTitle(name);
//	}

	public String updatePick(HashMap<String, String> map) throws SQLException {
		
		String checkScrap=textBoardMapper.selectScrap(map);
		
		if(checkScrap.equals("0")) {
			System.out.println("MyScrap update");
			textBoardMapper.insertScrap(map);
		}else if(checkScrap.equals("1")){
			System.out.println("MyScrap delete");
			textBoardMapper.deleteScrap(map);
		}else { 
			System.out.println("오류");
			return null;
		}
		return checkScrap;
	}
}

