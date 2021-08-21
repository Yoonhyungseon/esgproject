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
	* @MethodName : memberinsert
	* @Description:
	* @param paramMap
	* @return SQLException int
	* @Author : Na-Young. Woo
	* @Version : 2021. 8. 14.
	**************************************************/
	public int memberinsert(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : getMemberInfo
	* @Description:
	* @param paramMap
	* @return
	* @throws SQLException CamelMap
	* @Author : Na-Young. Woo
	* @Version : 2021. 8. 19.
	**************************************************/
	public CamelMap getFindId(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : updatePw
	* @Description:
	* @param paramMap
	* @return
	* @throws SQLException int
	* @Author : Na-Young. Woo
	* @Version : 2021. 8. 22.
	**************************************************/
	public int updatePw(DataMap paramMap) throws SQLException;
}
