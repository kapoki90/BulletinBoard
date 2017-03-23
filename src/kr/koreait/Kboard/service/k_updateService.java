package kr.koreait.Kboard.service;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.Kboard.Mybatis.MySession;
import kr.koreait.Kboard.dao.KboardCommentDAO;
import kr.koreait.Kboard.dao.KboardDAO;
import kr.koreait.Kboard.vo.KboardCommentVO;
import kr.koreait.Kboard.vo.KboardVO;

public class k_updateService {
	// 자기 자신의 객체를 정적 멤버로 만든다.
	private static k_updateService instance = new k_updateService();

	// 클래스 외부에서 객체를 생성할 수 없도록 기본 생성자의 접근 권한을 private로 변경한다.
	private k_updateService() {
	}

	// 자기 자신의 객체를 리턴하는 정적 메소드를 만든다.
	public static k_updateService getInstance() {
		return instance;
	}

	public void update(KboardVO vo) {
		SqlSession mapper = MySession.getSession();
		KboardDAO.getInstance().update(mapper, vo);
		mapper.commit();
		mapper.close();
	}

	// commentOK.jsp에서 수정할 내용이 저장된 객체를 넘겨받고 mapper를 얻어오는 메소드
	public void updateComment(KboardCommentVO vo) {
		SqlSession mapper = MySession.getSession();

		KboardCommentDAO dao = KboardCommentDAO.getInstance();
		// 수정할 댓글의 비밀번호를 비교하기 위해 댓글 테이블에서 수정할 댓글을 얻어온다.
		KboardCommentVO comment = dao.selectByidx_co(mapper, vo.getIdx());
		// 수정할 댓글의 비밀번호(comment.getPassword())와 댓글을 수정하기 위해 입력한
		// 비밀번호(vo.getPassword())를
		// 비교한다.

		dao.updateComment(mapper, vo);
		mapper.commit();
		mapper.close();

	}

//	increment.jsp에서 조회수를 증가할 글번호를 넘겨받고 mapper를 얻어오는 메소드
	public int increment(int idx) {
		SqlSession mapper = MySession.getSession();
		int result = KboardDAO.getInstance().increment(mapper, idx);
		mapper.commit();
		mapper.close();
		return result;
	}
		
}
