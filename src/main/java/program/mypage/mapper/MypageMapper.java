package program.mypage.mapper;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import program.common.CamelMap;
import program.common.DataMap;


/**************************************************
* @FileName : MypageMapper.java
* @Description: 마이페이지 인터페이스
* @Author : Beom-Ki. Lee
* @Version : 2021. 8. 8.
**************************************************/
@Repository
public interface MypageMapper {
	
	/**************************************************
	* @MethodName : getThisMemberInfo
	* @Description: 현재 접속자 회원 정보 조회
	* @param paramMap
	* @return
	* @throws SQLException CamelMap
	* @Author : Beom-Ki, Lee
	* @Version : 2021. 8. 8.
	**************************************************/
	public CamelMap getThisMemberInfo(DataMap paramMap) throws SQLException;
	
	
	/**************************************************
	* @MethodName : getBoardList
	* @Description: 게시글 목록 조회
	* @return
	* @throws SQLException List<CamelMap>
	* @Author : Beom-Ki, Lee
	* @Version : 2021. 8. 21.
	**************************************************/
	public List<CamelMap> getBoardList() throws SQLException;

}
