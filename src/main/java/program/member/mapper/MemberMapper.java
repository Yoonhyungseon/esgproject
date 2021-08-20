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
	* @return int
	* @Author : Na-Young. Woo
	* @Version : 2021. 8. 14.
	**************************************************/
	public int memberinsert(DataMap paramMap);
	
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
}
