package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 게시판 메인페이지 표시
	public String showMainpage() {
		return "board_main";
	}
	
	// 글 목록 표시
	public List<BoardVO> selectList() {
		List<BoardVO> list = sqlSession.selectList("b.post_list");
		return list; //DB에서 얻어낸 List를 반환
	}
	
	// 글 목록 표시
		public List<BoardVO> selectQuestionList() {
			List<BoardVO> qalist = sqlSession.selectList("b.question_list");
			return qalist; //DB에서 얻어낸 List를 반환
		}
		
	// 새 글 추가
	public int insertUser(BoardVO vo) {
		
		System.out.println(vo.getSection());
		// 맵퍼에게 vo 전달
		// 맵퍼로 전달되는 파라미터 값은 무조건 한 개
		int res = sqlSession.insert("b.board_insert", vo); 
		return res;
	}
	
	// 새 글 추가
	public int qainsertUser(BoardVO vo) {
		
		System.out.println(vo.getSection());
		// 맵퍼에게 vo 전달
		// 맵퍼로 전달되는 파라미터 값은 무조건 한 개
		int res = sqlSession.insert("b.question_insert", vo); 
		return res;
	}
	
}
