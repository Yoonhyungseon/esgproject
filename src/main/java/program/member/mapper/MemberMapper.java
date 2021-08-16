package program.member.mapper;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import program.common.DataMap;
import program.common.MemberVo;

@Repository
public interface MemberMapper {
	
	/**************************************************
	* @MethodName : memberinsert
	* @Description: 회원 추가
	* @param paramMap
	* @return int
	* @Author : Na-Young. Woo
	* @Version : 2021. 8. 14.
	**************************************************/
	public int memberinsert(DataMap paramMap);
	
}
