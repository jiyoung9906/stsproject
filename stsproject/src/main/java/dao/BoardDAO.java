package dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<BoardVO> selectList() {
//		List<BoardVO> list = sqlSession.selectList("b.board_list");
//		return list; //DB에서 얻어낸 List를 반환
		return null;
	}
	
	
}
