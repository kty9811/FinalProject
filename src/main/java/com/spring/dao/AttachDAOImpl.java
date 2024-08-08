package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.AttachVO;

public class AttachDAOImpl implements AttachDAO{

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession session) {
		this.sqlSession = session;
	}
	
	@Override
	public List<AttachVO> selectAttachByNno(int nno) throws SQLException {
		return sqlSession.selectList("Attach-Mapper.selectAttachByNno",nno);
	}

	@Override
	public AttachVO selectAttachByAno(int ano) throws SQLException {
		return sqlSession.selectOne("Attach-Mapper.selectAttachByAno",ano);
	}

	@Override
	public void insertAttach(AttachVO attach) throws SQLException {
		sqlSession.insert("Attach-Mapper.insertAttach",attach);
		
	}

	@Override
	public void deleteAttach(int ano) throws SQLException {
		sqlSession.delete("Attach-Mapper.deleteAttach",ano);
		
	}

	@Override
	public void deleteAllAttach(int nno) throws SQLException {
		sqlSession.delete("Attach-Mapper.deleteAllAttach",nno);
		
	}

	@Override
	public int selectAttachSeqNextVal() throws SQLException {
		return sqlSession.selectOne("Attach-Mapper.selectAttachSeqNextVal");
	}

}
