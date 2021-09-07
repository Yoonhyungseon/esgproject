package program.member.mapper;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import program.common.CamelMap;
import program.common.DataMap;
import program.common.MemberVo;

@Repository
public interface MemberMapper {
	
	/**************************************************
	* @MethodName : setLoginProc
	* @Description: 
	* @param paramMap
	* @return int
	* @throws SQLException 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 3. 30.
	**************************************************/
	public int setLoginProc(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : setLoginHistory
	* @Description:
	* @param paramMap
	* @return int
	* @throws SQLException 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 3. 30.
	**************************************************/
	public int setLoginHistory(DataMap paramMap) throws SQLException;

	/**************************************************
	* @MethodName : idCheck
	* @Description: 일반회원 회원가입: id 중복 검사
	* @param paramMap
	* @return int
	* @throws SQLException 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 3. 30.
	**************************************************/
	public int idCheck(DataMap paramMap) throws SQLException;

	/**************************************************
	* @MethodName : saveMember
	* @Description: 일반회원 회원가입
	* @param paramMap
	* @return int
	* @throws SQLException 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 3. 31.
	**************************************************/
	public int saveMember(DataMap paramMap) throws SQLException;

	/**************************************************
	* @MethodName : findId
	* @Description: 일반회원 아이디 찾기
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 3. 31.
	**************************************************/
	public List<CamelMap> findId(DataMap paramMap) throws SQLException;

	/**************************************************
	* @MethodName : pwReassign
	* @Description: 일반회원 비밀번호 찾기 비밀번호 재설정
	* @param paramMap
	* @return int
	* @throws SQLException 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 4. 1.
	**************************************************/
	public int pwReassign(DataMap paramMap) throws SQLException;

	/**************************************************
	* @MethodName : pwReassignHis
	* @Description: 일반회원 비밀번호 찾기 비밀번호 재설정 히스토리
	* @param paramMap
	* @return int
	* @throws SQLException 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 4. 1.
	**************************************************/
	public int pwReassignHis(DataMap paramMap) throws SQLException;

	/**************************************************
	* @MethodName : GetLoginUserInfo
	* @Description: 로그인중인 사용자 정보 조회 사용자 정보 조회
	* @param paramMap
	* @return CamelMap
	* @throws SQLException 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 4. 1.
	**************************************************/
	public CamelMap GetLoginUserInfo(DataMap paramMap) throws SQLException;

	/**************************************************
	* @MethodName : userInfoModify
	* @Description: 사용자 개인정보 수정
	* @param paramMap
	* @return CamelMap
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 4. 1.
	**************************************************/
	public int userInfoModify(DataMap paramMap) throws SQLException;

	/**************************************************
	* @MethodName : userWithdrawal
	* @Description: 사용자 회원 탈퇴 업데이트
	* @param paramMap
	* @return int
	* @throws SQLException 
	* @Author : Hyung-Seon. Yoon
	* @Version : 2021. 4. 2.
	**************************************************/
	public int userWithdrawal(DataMap paramMap) throws SQLException;
	
    /**************************************************
    * @MethodName : getFindId
    * @Description:
    * @param paramMap
    * @return
    * @throws SQLException CamelMap
    * @Author : Na-Young. Woo
    * @Version : 2021. 9. 7.
    **************************************************/
    public CamelMap getFindId(DataMap paramMap) throws SQLException;
}