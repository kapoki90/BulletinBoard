package kr.koreait.Kboard.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.Kboard.Mybatis.MySession;
import kr.koreait.Kboard.dao.KboardCommentDAO;
import kr.koreait.Kboard.dao.KboardDAO;
import kr.koreait.Kboard.vo.KboardCommentVO;
import kr.koreait.Kboard.vo.KboardVO;

// 	싱글톤 코딩
public class k_InsertService {
//	자기 자신의 객체를 정적 멤버로 만든다.
	private static k_InsertService instance = new k_InsertService();
//	클래스 외부에서 객체를 생성할 수 없도록 기본 생성자의 접근 권한을 private로 변경한다.
	private k_InsertService() {
	}
//	자기 자신의 객체를 리턴하는 정적 메소드를 만든다.
	public static k_InsertService getInstance() {
		return instance;
	}
// 메인글 테이블에 저장할 메인글이 저장된 객체를 넘겨받고 mapper를 얻어오는 메소드
	public void insert(KboardVO vo) {
		SqlSession mapper = MySession.getSession();

		// vo.setSubject(vo.getSubject().replace(">", "&gt;").replace("<",
		// "&lt;"));
		// vo.setContent(vo.getContent().replace(">", "&gt;").replace("<",
		// "&lt;").replace("\n", "<br/>"));

		KboardDAO.getInstance().insert(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	public void reply(KboardVO vo) {
		SqlSession mapper = MySession.getSession();
		KboardDAO dao = KboardDAO.getInstance();
		
//		서브 카테고리를 저장해야 하므로 레벨(lev)과 카테고리를 출력하는 순서(seq)를 1씩 증가시킨다.
		vo.setLev(vo.getLev() + 1);			// lev 1증가
		vo.setSeq(vo.getSeq() + 1);			// seq 1증가
		
//		나중에 입력된 서브 카테고리가 맨 위에 출력되게 하기 위해서 조건에 만족하는 seq를 1씩 증가시킨다.
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("ref", vo.getRef());//ref:어떤글의 답글인가를 알기위한 변수
		hmap.put("seq", vo.getSeq());//seq:답글 정렬을 위한 변수
		dao.putsubcatogory(mapper, hmap);
		
		
//		새 서브 카테고리가 삽입될 위치를 정했으므로 테이블에 새 서브 카테고리를 삽입한다.
		dao.reply(mapper, vo);
		
		mapper.commit();
		mapper.close();
	}
	
	public void insertComment(KboardCommentVO vo){
		SqlSession mapper = MySession.getSession();
		KboardCommentDAO.getInstance().insertComment(mapper, vo);
		mapper.commit();
		mapper.close();
	}
}
