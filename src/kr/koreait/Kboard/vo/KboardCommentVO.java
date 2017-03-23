package kr.koreait.Kboard.vo;

import java.util.Date;

public class KboardCommentVO {
	private int idx;				// 댓글 글번호
	private int ref;				// 메인글의 글번호, 어떤 글의 댓글인가
	private String name;			// 작성자
	private String password;		// 댓글 저장 비밀번호
	private String content;			// 내용
	private Date writeDate;			// 작성일
	private String ip;				// IP 주소
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	@Override
	public String toString() {
		return "KboardCommentVO [idx=" + idx + ", ref=" + ref + ", name=" + name + ", password=" + password
				+ ", content=" + content + ", writeDate=" + writeDate + ", ip=" + ip + "]";
	}

	
	
}
