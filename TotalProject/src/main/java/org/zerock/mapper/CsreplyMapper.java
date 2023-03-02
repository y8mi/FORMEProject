package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.CsreplyVO;
import org.zerock.domain.PagingCriteria;

public interface CsreplyMapper {
	
	public int insert(CsreplyVO vo);
	
	public CsreplyVO read(Long rno); //특정 댓글 읽기
	
	public int delete (Long rno);
	
	public int update(CsreplyVO reply);
	
	//Mybatis의 SQL 문장에 다수의 파라미터를 전달할 때는 전달되는 변수들에 꼭 @Param 어노테이션을 붙여줘야한다.
	public List<CsreplyVO> getListWithPaging(@Param("cri") PagingCriteria cri, @Param("csbno") Long csbno);

	public List<CsreplyVO> replyList(PagingCriteria cri);
	
	//댓글 토탈
	public int getReplyTotal(PagingCriteria cri); 
	
	public int replyremove(CsreplyVO reply);

}
