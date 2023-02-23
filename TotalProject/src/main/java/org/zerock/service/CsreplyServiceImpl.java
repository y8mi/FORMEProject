package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.CsreplyVO;
import org.zerock.domain.PagingCriteria;
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
	
	@Setter(onMethod_ = @Autowired)
	private MypagememberMapper Mapper;

	@Setter(onMethod_ = @Autowired)
	private MgPostingMapper mgPostingMapper;

	
	@Transactional
	@Override
	public int register(CsreplyVO vo) {
		
		
		
		log.info("register......" + vo);
		mgPostingMapper.updateReplyCnt(vo.getBno(), 1);
		
		return mapper.insert(vo);
	}

	@Override
	public CsreplyVO get(Long rno) {

		log.info("get......" + rno);
		
		return mapper.read(rno);
	}

	@Override
	public int modify(CsreplyVO vo) {
		log.info("modify......" + vo);

	    return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		log.info("remove...." + rno);
		CsreplyVO vo = mapper.read(rno);
		
		mgPostingMapper.updateReplyCnt(vo.getBno(), -1);
		
	    return mapper.delete(rno);
	}

	@Override
	public List<CsreplyVO> getList(PagingCriteria cri, Long csbno) {
		log.info("get Reply List of a Board " + csbno);

	    return mapper.getListWithPaging(cri, csbno);
	}

	
}
