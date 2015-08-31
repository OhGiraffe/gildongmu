package kr.co.gildongmu.model.board.dao;

import java.util.List;

import kr.co.gildongmu.model.board.bean.BoardBean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

// LocalDAO
public class BoardDAO {

	@Autowired
	private SqlSession session;

	public int insert(BoardBean boardbean) {
		return session.insert("board.insert", boardbean);
	}// select

	public int insertNotice(BoardBean boardbean) {
		return session.insert("board.insertNotice", boardbean);
	}// 관리자 공지사항 글쓰기

	public void adminModify(BoardBean boardbean) {

		session.update("board.adminmodify", boardbean);

	}// 관리자 공지사항 수정

	public BoardBean select(int num) {
		BoardBean bean = session.selectOne("board.select", num);
		return bean;
	}// select

	public void modify(BoardBean boardbean) {

		session.update("board.modify", boardbean);

	}// select

	public void count(BoardBean boardbean) {

		session.update("board.count", boardbean);

	}// select

	public void delete(int num) {

		session.delete("board.delete", num);

	}// select
	
	public List<BoardBean> rewriteSelect(List<Integer> list) {
		List<BoardBean> boardlist = session.selectList("board.rewriteSelect", list);
		return boardlist;
	}// select
}
