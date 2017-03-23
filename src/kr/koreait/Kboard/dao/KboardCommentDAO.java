package kr.koreait.Kboard.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.Kboard.vo.KboardCommentVO;

public class KboardCommentDAO {
	private static KboardCommentDAO instance = new KboardCommentDAO();
	private KboardCommentDAO() { }
	public static KboardCommentDAO getInstance() { return instance; }
	
//	InsertService.java에서 mapper와 댓글 테이블에 저장할 데이터가 저장된 객체를 넘겨받고 댓글을 저장하는
//	xml 파일의 insert SQL 명령을 실행하는 메소드
	public void insertComment(SqlSession mapper, KboardCommentVO vo) {
		mapper.insert("insertComment", vo);
	}
	
//	SelectService.java에서 mapper와 메인글의 글번호를 넘겨받고 댓글 테이블의 댓글 목록을 얻어오는 xml 파일의 
//	insert SQL 명령을 실행하는 메소드
	public ArrayList<KboardCommentVO> kboardCommentList(SqlSession mapper, int idx) {
		return (ArrayList<KboardCommentVO>) mapper.selectList("kboardCommentList", idx);
	}

	//idx로 댓글삭제
	public void deletecomment(SqlSession mapper, int idx) {
		mapper.delete("deleteComment", idx);
	}
	//댓글한건을 idx로 읽어온다.
	public KboardCommentVO selectByidx_co(SqlSession mapper, int idx) {
		return (KboardCommentVO) mapper.selectOne("selectByidx_co", idx);
	}
	
//	UpdateService.java에서 mapper와 수정할 댓글이 저장된 객체를를 넘겨받고 댓글 테이블에서 댓글을 수정하는
//	xml 파일의 update SQL 명령을 실행하는 메소드
	public void updateComment(SqlSession mapper, KboardCommentVO vo) {
		mapper.update("updateComment", vo);
	}
	
//	SelectService.java에서 mapper와 메인글의 글번호를 넘겨받고 댓글의 개수를 얻어오는 xml 파일의 insert SQL 
//	명령을 실행하는 메소드
	public int commentCount(SqlSession mapper, int idx) {
		return (int) mapper.selectOne("commentCount", idx);
	}
}
