package kr.koreait.Kboard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import kr.koreait.Kboard.vo.KboardCommentVO;
import kr.koreait.Kboard.vo.KboardVO;

//create an object of SingleObject
public class KboardDAO {
	//create an object of SingleObject
	private static KboardDAO instance = new KboardDAO();
	//make the constructor private so that this class cannot be
	//instantiated
	private KboardDAO() {
	}
	//Get the only object available
	public static KboardDAO getInstance() {
		return instance;
	}
	
	public void insert(SqlSession mapper,KboardVO vo){
		mapper.insert("insert",vo);
	}
	
	public int selectCount(SqlSession mapper) {
		return (int) mapper.selectOne("selectCount");
	}
	
	public ArrayList<KboardVO> allList(SqlSession mapper) {
		return (ArrayList<KboardVO>) mapper.selectList("allList");
	}
	
	//mapper,hash를 인자로 받고 테이블리스트 하나를 받는 메소드
	public ArrayList<KboardVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		return (ArrayList<KboardVO>) mapper.selectList("selectList",hmap);
	}
	public KboardVO selectByidx(SqlSession mapper,int idx) {
		return (KboardVO) mapper.selectOne("selectByidx",idx);
	}
	
	public void delete(SqlSession mapper,int idx) {
		mapper.delete("delete",idx);
	}
	
	public void update(SqlSession mapper,KboardVO vo) {
		mapper.update("update",vo);
	}
//	InsertService.jsp에서 mapper와 ref와 seq가 저장된 객체를 넘겨받고 조건에 만족하는 seq를 1씩 증가시키는
//	xml 파일의 update 명령을 실행하는 메소드
	public void putsubcatogory(SqlSession mapper, HashMap<String, Integer> hmap) {
		mapper.update("putsubcatogory", hmap);
	}
	
//	InsertService.java에서 mapper와 테이블에 저장할 서브 카테고리 데이터가 저장된 객체를 넘겨받고 xml 파일의
//	insert SQL 명령을 실행하는 메소드
	public void reply(SqlSession mapper, KboardVO vo) {
		mapper.insert("reply", vo);
	}
	public int increment(SqlSession mapper, int idx) {
//		insert, delete, update 메소드를 실행하면 정상적으로 SQL 명령문이 실행된 횟수가 리턴된다.
		return mapper.update("increment", idx);

	}
	public ArrayList<KboardVO> deleteSelect(SqlSession mapper, KboardVO vo) {
		return (ArrayList<KboardVO>) mapper.selectList("deleteSelect", vo);
	}
	
}
