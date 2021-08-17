package program.admin.textboard.mapper;

import java.sql.SQLException;


import org.springframework.stereotype.Repository;

import program.common.DataMap;

@Repository
public interface AdminTextBoardMapper {

	boolean insertSiteBoard(DataMap paramMap) throws SQLException;

	boolean updateSiteBoard(DataMap paramMap) throws SQLException;
}
