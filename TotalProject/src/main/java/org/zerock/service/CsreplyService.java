package org.zerock.service;

import java.util.List;

import org.zerock.domain.CsreplyDTO;
import org.zerock.domain.CsreplyVO;
import org.zerock.domain.PagingCriteria;



public interface CsreplyService {

	public int register(CsreplyVO vo);

	/* public CsreplyVO replyList(PagingCriteria cri, Long rno); */

	public int modify(CsreplyVO vo);

	public int remove(Long rno);


	//댓글 토탈
	public int getReplyTotal(PagingCriteria cri); 


}
