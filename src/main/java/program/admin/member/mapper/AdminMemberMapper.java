package program.admin.member.mapper;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import program.common.CamelMap;
import program.common.DataMap;

/**************************************************
* @FileName : AdminMemberMapper.java
* @Description: 관리자 회원정보 인터페이스
* @Author : Hyung-Seon. Yoon
* @Version : 2021. 8. 2.
**************************************************/
@Repository
public interface AdminMemberMapper {

	/**************************************************
	* @MethodName : getMemberList
	* @Description: 관리자 회원 리스트 조회
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 8. 2.
	**************************************************/
	public List<CamelMap> getMemberList() throws SQLException;
	
	/**************************************************
	* @MethodName : getMemberInfo
	* @Description: 회원정보 상세 조회
	* @return CamelMap
	* @throws SQLException 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 8. 2.
	**************************************************/
	public CamelMap getMemberInfo(DataMap paramMap) throws SQLException;

	public int insertMemberInfo(DataMap paramMap) throws SQLException;
}
