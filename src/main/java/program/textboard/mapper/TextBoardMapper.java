package program.textboard.mapper;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import program.common.CamelMap;
import program.common.DataMap;

@Repository
public interface TextBoardMapper {
	/*
	*//**************************************************
	 * @MethodName : getNow
	 * @Description: 데이터베이스 연동 확인
	 **************************************************//*
	public String getNow() throws SQLException;

	*//**************************************************
	 * @MethodName : selectTest
	 * @Description: DB 모든 칼럼 조회
	 **************************************************//*
	public List<BoardVo> selectAll() throws SQLException;

	*//**************************************************
	 * @MethodName : getBoardList
	 * @Description: 게시글 리스트 조회
	 **************************************************//*
	public List<BoardVo> getBoardList() throws SQLException;

	*//**************************************************
	 * @MethodName : getBoardDetail
	 * @Description: 게시글 상세 조회
	 **************************************************//*
	public BoardVo getBoardDetail(Long ssn) throws SQLException;

	*//**************************************************
	 * @MethodName : insertBoard
	 * @Description: 게시글 생성
	 **************************************************//*
	public int insertBoard(BoardVo params) throws SQLException;

	*//**************************************************
	 * @MethodName : updateBoard
	 * @Description: 게시글 수정
	 **************************************************//*
	public int updateBoard(BoardVo params) throws SQLException;

	*//**************************************************
	 * @MethodName : deleteBoard
	 * @Description: 게시글 삭제
	 **************************************************//*
	public int deleteBoard(Long ssn) throws SQLException;
	
	*//**************************************************
	 * @MethodName : deleteDB
	 * @Description: 게시글 데이터 베이스에서 삭제
	 **************************************************//*
	public void deleteDB() throws SQLException;
	
	*//**************************************************
	 * @MethodName : viewCount
	 * @Description: 게시물 조회수 업데이트
	 **************************************************//*
	public void viewCount(Long ssn) throws SQLException;
	
	*//**************************************************
	 * @MethodName : searchName
	 * @Description: 게시물 작성자로 검색 기능
	 **************************************************//*
	public List<BoardVo> searchName(String name) throws SQLException;
	
	*//**************************************************
	 * @MethodName : searchTitle
	 * @Description: 게시물 작성자로 검색 기능
	 **************************************************//*
	public List<BoardVo> searchTitle(String name) throws SQLException;*/
	
	/**************************************************
	* @MethodName : getBoardList
	* @Description: 게시글 리스트 조회
	* @return List<CamelMap>
	* @throws SQLException 
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 13.
	**************************************************/
	List<CamelMap> getBoardList() throws SQLException;

	
	/**************************************************
	* @MethodName : getBoardInfo
	* @Description: 게시글 상세 조회 
	* @param paramMap
	* @return CamelMap
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 14.
	**************************************************/
	CamelMap getBoardInfo(DataMap paramMap) throws SQLException;


	/**************************************************
	* @MethodName : posting
	* @Description: 게시글 등록
	* @param paramMap
	* @return
	* @throws SQLException Boolean
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 15.
	**************************************************/
	public Boolean posting(DataMap paramMap) throws SQLException;


	/**************************************************
	* @MethodName : getNoticeList
	* @Description: 공지사항 리스트
	* @return
	* @throws SQLException List<CamelMap>
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 24.
	**************************************************/
	List<CamelMap> getNoticeList() throws SQLException;


	/**************************************************
	* @MethodName : getNoticeInfo
	* @Description: 공지사항 상세
	* @param paramMap
	* @return
	* @throws SQLException CamelMap
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 24.
	**************************************************/
	CamelMap getNoticeInfo(DataMap paramMap) throws SQLException;


	/**************************************************
	* @MethodName : getNoticePrev
	* @Description: 이전 공지사항 조회
	* @param paramMap
	* @return CamelMap
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 24.
	**************************************************/
	CamelMap getNoticePrev(DataMap paramMap);


	/**************************************************
	* @MethodName : getNoticeNext
	* @Description: 다음 공지사항 조회
	* @param paramMap
	* @return CamelMap
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 24.
	**************************************************/
	CamelMap getNoticeNext(DataMap paramMap);
}
