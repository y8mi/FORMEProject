package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ApplicationVO;
import org.zerock.domain.CsVO;
import org.zerock.domain.CsreplyVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PagingCriteria;
import org.zerock.domain.PostingVO;
import org.zerock.mapper.CsreplyMapper;
import org.zerock.mapper.MgPostingMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MgPostingServiceImpl implements MgPostingService {

	@Setter(onMethod_ = @Autowired)
	private MgPostingMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
			private CsreplyMapper replymapper;
	
	//고객 문의 게시판 (페이징 처리)
	@Override
	public List<CsVO> getcs(PagingCriteria cri){
		log.info("고객문의 게시판");
		
		return mapper.getcs(cri);
	}
	
	//고객 문의 검색 토탈
	
	 @Override 
	 public int getCsTotal(PagingCriteria cri) {
	 
	 return mapper.getCsTotal(cri); 
	 }
	 
	 //고객 문의 상세페이지
	 @Override
		public CsVO getCsDetail(Long csbno) {
			log.info("get....." + csbno);
			
			return mapper.readCs(csbno);
		}
	 
	//심사 게시판 (페이지 처리)
	@Override
	public List<PostingVO> getManagerList(PagingCriteria cri){
		log.info("강습 심사 게시판");
		 
		 return mapper.getManagerList(cri);
	}
	
	//심사 게시판 토탈
	 @Override
	   public int getTotal(PagingCriteria cri) {

	      log.info("get total count");
	      return mapper.getTotalCount(cri);
	   }

    //심사 게시판 상세페이지
	@Override
	public PostingVO get(Long bno) {
		log.info("get....." + bno);
		
		return mapper.read(bno);
	}

	//게시글 심사 허가
	@Override
	public boolean update(PostingVO posting) {
		log.info("update.." + posting);
		
		return mapper.update(posting) == 1;
	}
	
	//게시글 심사 반려
	@Override
	public boolean update2(PostingVO posting2) {
		log.info("update.." + posting2);
		
		return mapper.update2(posting2) == 1;
	}
	
	//게시글 심사 반려 코멘트
	@Override
	public boolean con5(PostingVO posting3) {
		log.info("update.." + posting3);
		
		return mapper.con5(posting3) == 1;
	}
	
	////게시글 벌점 부여
	@Override
	public boolean postpenalty(PostingVO vo) {
		log.info("update.." + vo);
		
		return mapper.postpenalty(vo) == 1;
	}
	
	// 메인 페이지 동영상 업로드
	@Override
	public boolean video(MemberVO video) {
		log.info("비디오 업데이트" + video);
		
		return mapper.video(video) == 1;
	}
	
	
	//메인 페이지 동영상 끌고오기
	@Override
	public List<MemberVO> getVideo(){
		log.info("비디오끌고오기.........");
		
		return mapper.getVideo();
	}

	//인기 게시물
	   public List<ApplicationVO> selectPopularPost(){
	   
	      return mapper.selectPopularPost();
	   }
	   
	//문의 게시글 삭제
	@Override
	   public boolean csdelete(Long csbno) {
	  
	   log.info("remove...." + csbno);
	  
	   return mapper.csdelete(csbno) == 1;
	  }
	
	//강습 게시글 삭제
		@Override
		   public boolean postdelete(Long bno) {
		  
		   log.info("remove...." + bno);
		  
		   return mapper.postdelete(bno) == 1;
		  }

	//댓글 조회
	
	 @Override public List<CsreplyVO> replyList(PagingCriteria cri){
	 
	 return replymapper.replyList(cri);
	 }
	
	@Override
	public void csreply(CsreplyVO reply) {
		mapper.csreply(reply);
	}

	@Override
	   public boolean replyremove(CsreplyVO reply) {
	  
	   log.info("remove...." + reply);
	  
	   return replymapper.replyremove(reply) == 1;
	  }


	/*
	 * @Override public int replymodify(CsreplyVO reply) {
	 * 
	 * return mapper.replymodify(reply);
	 * 
	 * }
	 */

	
	


	



	
}




