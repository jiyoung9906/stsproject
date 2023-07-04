package com.korea.stsproject;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDAO;
import vo.BoardVO;

@Controller
public class BoardController<BoardService> {

	@Autowired // 자동주입(servlet-context에서 설정 잡혀있어야 사용 가능)
	HttpServletRequest request;

	@Autowired
	ServletContext application; // 애플리케이션의 정보를 담고있는 클래스

	public static final String PATH = "/WEB-INF/views/board/";

	BoardDAO board_dao;

	public BoardController(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}

	// 게시판 메인페이지 보기
	@RequestMapping(value={"/", "/board_main.do"})
	public String showMainPage() {
		return PATH + "board_main.jsp";
	}

	// 게시글 전체목록 보기
	@RequestMapping(value = {"/post_list.do" })
	public String vsList(Model model) {

		List<BoardVO> list = board_dao.selectList();
		model.addAttribute("list", list);
		return PATH + "post_list.jsp";
	}

	// 질문글 전체목록 보기
		@RequestMapping(value = {"/question_list.do" })
		public String qsList(Model model) {

			List<BoardVO> list = board_dao.selectList();
			model.addAttribute("list", list);
			return PATH + "question_list.jsp";
		}
		
	// 새 글 쓰기
	@RequestMapping("/write.do")
	public String insert(BoardVO vo) {
		// 절대경로를 찾기위한 준비
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);
		System.out.println("절대경로 : " + savePath);

		// 업로드를 위해 보내진 photo라는 이름의 파일정보
		MultipartFile photo = vo.getPhoto();

		String filename = "no_file";

		// 업로드 된 파일이 존재한다면
		if (!photo.isEmpty()) {
			// 업로드된 실제 파일의 이름
			filename = photo.getOriginalFilename();

			// 저장할 파일의 경로
			File saveFile = new File(savePath, filename);

			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else { // 이름 중복되도 갱신되지않고 따로 들어가게 하기 위함
				// 동일파일명에 대한 이름 수정
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				photo.transferTo(saveFile); // 없으면 파일형태로 만들어져서 꼭 있어야됨
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// vo에 파일명 세팅 후 DB에 insert
		vo.setFilename(filename);
		board_dao.insertUser(vo); // DAO로 가서 insertUser메서드 만들어야함

		// Controller에서 url매핑을 호출해야 하는 경우
		return "redirect:list.do";
	}

	// 글쓰기 종류 선택
	@RequestMapping("move_selected.do")
	public String moveSel(@RequestParam("section") String section) {
		System.out.println("Section: " + section);

		if (section.equals("post")) {
			return PATH + "board_write_post.jsp";
		} else if (section.equals("question")) {
			return PATH + "board_write_question.jsp";
		} else if (section.equals("diary")) {
			return PATH + "board_write_diary.jsp";
		}

		// 기본적으로는 board_write_post.jsp로 이동
		return PATH + "board_write_post.jsp";
	}
}
