package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.CsreplyDTO;
import org.zerock.domain.CsreplyVO;
import org.zerock.domain.PagingCriteria;
import org.zerock.domain.PagingDTO;
import org.zerock.mapper.CsreplyMapper;
import org.zerock.mapper.MgPostingMapper;
import org.zerock.mapper.MypagememberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
public class CsreplyServiceImpl implements CsreplyService {

	//private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private CsreplyMapper mapper;

	@Override
	public int register(CsreplyVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modify(CsreplyVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//고객 문의 검색 토탈
	
		 @Override 
		 public int getReplyTotal(PagingCriteria cri) {
		 
		 return mapper.getReplyTotal(cri); 
		 }
	


}
