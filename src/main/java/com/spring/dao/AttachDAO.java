package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.AttachVO;

public interface AttachDAO {
	
	
	List<AttachVO> selectAttachByNno(int nno) throws SQLException;
	AttachVO selectAttachByAno(int ano)throws SQLException;
	
	void insertAttach(AttachVO attach)throws SQLException;
	void deleteAttach(int nno)throws SQLException;
	void deleteAllAttach(int nno)throws SQLException;
	int selectAttachSeqNextVal()throws SQLException;
}











