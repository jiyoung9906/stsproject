package com.korea.stsproject;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.BoardDAO;
import vo.BoardVO;

@Controller
public class BoardController {

	@Autowired // 자동주입(servlet-context에서 설정 잡혀있어야 사용 가능)
	HttpServletRequest request;

	@Autowired
	ServletContext application; // 애플리케이션의 정보를 담고있는 클래스

	public static final String PATH = "/WEB-INF/views/board/";

	BoardDAO board_dao;

	public BoardController(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}
	
	// 게시글 전체목록 보기
	@RequestMapping(value = { "/", "list.do" })
	public String vsList(Model model) {

		List<BoardVO> list = board_dao.selectList();
		model.addAttribute("list", list);
		return PATH + "board_list.jsp";
	}
	
}
