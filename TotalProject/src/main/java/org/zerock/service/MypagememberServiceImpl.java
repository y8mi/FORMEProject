package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ApplicationVO;
import org.zerock.domain.CartVO;
import org.zerock.domain.CsVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PagingCriteria;
import org.zerock.domain.PostingVO;
import org.zerock.mapper.MypagememberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MypagememberServiceImpl implements MypagememberService {
	
	@Setter(onMethod_ = @Autowired)
	private MypagememberMapper MypagememberMapper;

	@Override
	public boolean memberupdate(MemberVO id) {

		log.info("update......" + id);
		
		return MypagememberMapper.memberupdate(id) == 1;
	}
	
	@Override
	public boolean passwordupdate(MemberVO id) {

		log.info("update......" + id);
		
		return MypagememberMapper.passwordupdate(id) == 1;
	}

	@Override
	public boolean memberdelete(MemberVO id) {
		
		log.info("delete......" + id);
		
		return MypagememberMapper.memberdelete(id) == 1;
	}
	
	@Override
	public List<PostingVO> sellermypage(MemberVO id) {
		
		log.info("getList....");
		
		return MypagememberMapper.sellermypage(id);
	}
	
	@Override
	public List<PostingVO> sellerpostingcheck(MemberVO id) {
		
		log.info("sellerpostingcheck....");
		
		return MypagememberMapper.sellerpostingcheck(id);
	}
	
	@Override
	public List<PostingVO> buyermypage(ApplicationVO id) {
		
		log.info("getList....");
		
		return MypagememberMapper.buyermypage(id);
	}
	
	@Override
	public List<PostingVO> wishlist(CartVO id) {
		
		log.info("getList....");
		
		return MypagememberMapper.wishlist(id);
	}
	
	@Override
	public boolean memberright0(String id) {

		log.info("update......" + id);
		
		return MypagememberMapper.memberright0(id) == 1;
	}
	
	@Override
	public boolean memberright1(String id) {

		log.info("update......" + id);
		
		return MypagememberMapper.memberright1(id) == 1;
	}
	
	@Override
	public List<PostingVO> sellerbuyercheck(PostingVO id) {
		
		log.info("getList....");
		
		return MypagememberMapper.sellerbuyercheck(id);
	}
	
	@Override
	public boolean buyergrant(ApplicationVO id) {

		log.info("update......" + id);
		
		return MypagememberMapper.buyergrant(id) == 1;
	}
	
	@Override
	public boolean buyercancel(ApplicationVO id) {
		
		log.info("delete......" + id);
		
		return MypagememberMapper.buyercancel(id) == 1;
	}
	
	
	@Override
	public MemberVO loginid(String id) throws Exception{
	
		 return MypagememberMapper.loginid(id); 
	}
	
	@Override
	public List<ApplicationVO> getApplication(String id){
		
		log.info("getApplication....");
		
		return MypagememberMapper.getApplication(id);
		
	}
	
	//------------------------------문의 사항-------------------------------------------
	
	
	 
			//고객문의 게시판 (페이지 처리)
			@Override
			public List<CsVO> getcsList(PagingCriteria cri){
				log.info("고객문의게시판");
				 
				 return MypagememberMapper.getcsList(cri);
			}
			
			//고객문의 게시판(id 파라메터)
			@Override
			public List<CsVO> getcs(String id){
				log.info("강습 심사 게시판");
				 
				 return MypagememberMapper.getcs(id);
			}
			
			//고객문의 게시판 토탈
	/*
	 * @Override public boolean getCsTotal(PagingCriteria cri) {
	 * 
	 * log.info("get total count"); return MypagememberMapper.getCsTotal(cri); }
	 */
			 
			
		    //고객문의 상세페이지
			@Override
			public CsVO csdetail(Long bno) {
				log.info("get....." + bno);
				
				return MypagememberMapper.csdetail(bno);
			}
			 
			//고객 문의 등록
			public void csregister(CsVO board) {
				
				MypagememberMapper.csregister(board);
			}

			@Override
			public int getCsTotal(PagingCriteria cri) {
				// TODO Auto-generated method stub
				return 0;
			}
			
			
	

}
