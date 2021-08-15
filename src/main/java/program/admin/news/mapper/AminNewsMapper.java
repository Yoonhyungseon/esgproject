package program.admin.news.mapper;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import program.common.CamelMap;
import program.common.DataMap;

/**************************************************
* @FileName : AdminMemberMapper.java
* @Description: 뉴스 관리 인터페이스
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 8. 2.
**************************************************/
@Repository
public interface AminNewsMapper {

	/**************************************************
	* @MethodName : getNewsList
	* @Description:  뉴스 리스트 조회
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 8. 2.
	**************************************************/
	public List<CamelMap> getNewsList() throws SQLException;
	
	/**************************************************
	* @MethodName : getNewsInfo
	* @Description: 뉴스 상세 조회
	* @return CamelMap
	* @throws SQLException 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 8. 2.
	**************************************************/
	public CamelMap getNewsInfo(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : newsdelete
	* @Description: 뉴스 삭제 
	* @param paramMap
	* @return int
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 8. 8.
	**************************************************/
	public int newsdelete(DataMap paramMap);
}
