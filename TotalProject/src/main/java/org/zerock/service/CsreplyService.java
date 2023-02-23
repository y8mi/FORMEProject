package org.zerock.service;

import java.util.List;

import org.zerock.domain.CsreplyVO;
import org.zerock.domain.PagingCriteria;



public interface CsreplyService {

	public int register(CsreplyVO vo);

	public CsreplyVO get(Long rno);

	public int modify(CsreplyVO vo);

	public int remove(Long rno);

	public List<CsreplyVO> getList(PagingCriteria cri, Long csbno);

}
