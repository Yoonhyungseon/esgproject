package program.admin.textboard.mapper;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import program.common.CamelMap;
import program.common.DataMap;

@Repository
public interface AdminTextBoardMapper {

	/**************************************************
	* @MethodName : insertSiteBoard
	* @Description: 공지사항 등록
	* @param paramMap
	* @return
	* @throws SQLException boolean
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 18.
	**************************************************/
	int insertSiteBoard(DataMap paramMap) throws SQLException;

	boolean updateSiteBoard(DataMap paramMap) throws SQLException;

	/**************************************************
	* @MethodName : getNoticeList
	* @Description: 공지사항 리스트
	* @return
	* @throws SQLException List<CamelMap>
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 18.
	**************************************************/
	List<CamelMap> getNoticeList() throws SQLException;

	/**************************************************
	* @MethodName : getNoticeInfo
	* @Description: 공지사항 상세
	* @param paramMap
	* @return
	* @throws SQLException CamelMap
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 18.
	**************************************************/
	CamelMap getNoticeInfo(DataMap paramMap) throws SQLException;

	/**************************************************
	* @MethodName : getBoardList
	* @Description: 게시판 리스트
	* @return
	* @throws SQLException List<CamelMap>
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 26.
	**************************************************/
	List<CamelMap> getBoardList() throws SQLException;

	/**************************************************
	* @MethodName : getBoardInfo
	* @Description: 게시판 상세
	* @param paramMap
	* @return
	* @throws SQLException CamelMap
	* @Author : Ye-Jin. Jeong
	* @Version : 2021. 8. 26.
	**************************************************/
	CamelMap getBoardInfo(DataMap paramMap) throws SQLException;
}
