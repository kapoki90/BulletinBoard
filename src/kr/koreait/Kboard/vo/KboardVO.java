package kr.koreait.Kboard.vo;

import java.sql.Date;

// 답변형 게시판의 게시글과 답변글에 사용할 Value Object
public class KboardVO {
	private int idx;			// 입력되는 순서대로 부여되는 일련번호
	private int ref;			// 게시글의 글번호
	private int lev;			// 답변의 레벨
	private int seq;			// 답변글의 일련번호
	private String name;		// 작성자
	private String password;	// 비밀번호
	
	private String title;		// 글 제목
	private String content;		// 글 내용
	private Date wdate;		// 작성일
	private int hit;			// 조회수
	private String ip;			// 작성자 IP
	private int commentCount;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	@Override
	public String toString() {
		return "KboardVO [idx=" + idx + ", ref=" + ref + ", lev=" + lev + ", seq=" + seq + ", name=" + name
				+ ", password=" + password + ", title=" + title + ", content=" + content + ", wdate=" + wdate + ", hit="
				+ hit + ", ip=" + ip + ", commentCount=" + commentCount + "]";
	}
	
	
}
