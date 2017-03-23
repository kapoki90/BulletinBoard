package kr.koreait.Kboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.Kboard.Mybatis.MySession;
import kr.koreait.Kboard.dao.KboardCommentDAO;
import kr.koreait.Kboard.dao.KboardDAO;
import kr.koreait.Kboard.vo.KboardCommentList;
import kr.koreait.Kboard.vo.KboardCommentVO;
import kr.koreait.Kboard.vo.KboardList;
import kr.koreait.Kboard.vo.KboardVO;

//	싱글톤 코딩
public class k_SelectService {
	// 자기 자신의 객체를 정적 멤버로 만든다.
	private static k_SelectService instance = new k_SelectService();

	// 클래스 외부에서 객체를 생성할 수 없도록 기본 생성자의 접근 권한을 private로 변경한다.
	private k_SelectService() {
	}

	// 자기 자신의 객체를 리턴하는 정적 메소드를 만든다.
	public static k_SelectService getInstance() {
		return instance;
	}

	public KboardList allList() {
		SqlSession mapper = MySession.getSession();
		KboardList list = new KboardList();
		ArrayList<KboardVO> mylist = KboardDAO.getInstance().allList(mapper);
		list.setList(mylist);
		return list;
	}

	// index.jsp에서 화면에 표시할 페이지 번호를 넘겨받고 mapper를 얻어오 얻어오는 메소드
	// 한 페이지에 표시할만큼의 글을 꺼내와 arraylist형으로 반환한다.
	public KboardList selectList(int currentPage) {

		KboardDAO dao = KboardDAO.getInstance();
		SqlSession mapper = MySession.getSession();
		int pageSize = 10;
		int totalCount = dao.selectCount(mapper);
		//System.out.println(totalCount);
		// 생성자로 9개변수 초기화(list.get으로 얻어올수있다.)
		KboardList list = new KboardList(pageSize, totalCount, currentPage);
		// mapper를 이용해 쿼리문 실행시 인자가 하나밖에 넘어가지 못하므로 hashmap 활용
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("startNo", list.getStartNo());
		hmap.put("endNo", list.getEndNo());
		// mapper,hash를 인자로 넘겨주고 테이블리스트 하나를 받는 메소드 호출
		ArrayList<KboardVO> mylist = dao.selectList(mapper, hmap);
		
		for(KboardVO vo : mylist) {
			vo.setCommentCount(KboardCommentDAO.getInstance().commentCount(mapper, vo.getIdx()));
		}
		list.setList(mylist);// 테이블리스트를 리스트+변수가 있는 클래스에 setter로 초기화

		mapper.close();
		return list;
	}

	//idx로 한개의 글정보를 꺼내온다.
	public KboardVO selectByidx(int idx) {
		SqlSession mapper = MySession.getSession();
		return KboardDAO.getInstance().selectByidx(mapper,idx);
	}
	
	//idx로 한개의 코멘트를 꺼내온다.
	public KboardCommentVO selectByidx_co(int idx) {
		SqlSession mapper = MySession.getSession();
		return KboardCommentDAO.getInstance().selectByidx_co(mapper,idx);
	}	
	
	
//	selectByIdx.jsp에서 부모글의 글번호를 넘겨받고 mapper를 얻어오는 메소드
	public KboardCommentList kboardCommentList(int idx) {
		SqlSession mapper = MySession.getSession();
		KboardCommentList comment = new KboardCommentList();
		comment.setList(KboardCommentDAO.getInstance().kboardCommentList(mapper, idx));
		mapper.close();
		return comment;
	}
	
//	delete.jsp로 부터 삭제할 카테고리 정보가 담긴 객체를 넘겨받고 mapper를 얻어오는 메소드
	public ArrayList<KboardVO> deleteSelect(KboardVO vo) {
		SqlSession mapper = MySession.getSession();
		ArrayList<KboardVO> deleteList = KboardDAO.getInstance().deleteSelect(mapper, vo);
		mapper.close();
		return deleteList;
	}
}
