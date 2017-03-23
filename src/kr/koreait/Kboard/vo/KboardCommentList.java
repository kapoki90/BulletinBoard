package kr.koreait.Kboard.vo;

import java.util.ArrayList;

public class KboardCommentList {
	private ArrayList<KboardCommentVO> list;	// 댓글을 기억할 ArrayList

	public ArrayList<KboardCommentVO> getList() {
		return list;
	}
	public void setList(ArrayList<KboardCommentVO> list) {
		this.list = list;
	}
	
	@Override
	public String toString() {
		return "FreeboardCommentList [list=" + list + "]";
	}
	
}
