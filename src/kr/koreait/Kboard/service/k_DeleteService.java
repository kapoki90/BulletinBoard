package kr.koreait.Kboard.service;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.Kboard.Mybatis.MySession;
import kr.koreait.Kboard.dao.KboardCommentDAO;
import kr.koreait.Kboard.dao.KboardDAO;
import kr.koreait.Kboard.vo.KboardVO;

public class k_DeleteService {
//	자기 자신의 객체를 정적 멤버로 만든다.
	private static k_DeleteService instance = new k_DeleteService();
//	클래스 외부에서 객체를 생성할 수 없도록 기본 생성자의 접근 권한을 private로 변경한다.
	private k_DeleteService() {
	}
//	자기 자신의 객체를 리턴하는 정적 메소드를 만든다.
	public static k_DeleteService getInstance() {
		return instance;
	}
	
	public void delete(int idx){
		SqlSession mapper = MySession.getSession();
		KboardDAO.getInstance().delete(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	
	public void deleteComment(int idx){
		SqlSession mapper = MySession.getSession();
		KboardCommentDAO.getInstance().deletecomment(mapper,idx);
		mapper.commit();
		mapper.close();
	}
}
