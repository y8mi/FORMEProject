package org.zerock.mapper;
	
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.ApplicationVO;
import org.zerock.domain.CsVO;
import org.zerock.domain.CsreplyVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PagingCriteria;
import org.zerock.domain.PostingVO;
	
public interface MgPostingMapper {
	
	//심사 신청 게시판 리스트
	/* public List<PostingVO> getManagerList(); */
	
	//심사 게시판 페이징 처리
	public List<PostingVO> getManagerList(PagingCriteria cri);
	
	//고객 문의 게시판 (페이징처리)
	public List<CsVO> getcs(PagingCriteria cri);
	
	//고객 문의 상세페이지
	public CsVO readCs(Long csbno);
		
	//강습 심사 상세페이지
	public PostingVO read(Long bno); 
	
	//메인 페이지 비디오 끌고오기
	public List<MemberVO> getVideo();
	
	public int update2(PostingVO posting2);
	
	public int con5(PostingVO posting3);
	
	/* public void update(PostingVO posting); */
	
	public int update(PostingVO posting);
	
	//비디오 업로드 
	public int video(MemberVO video);
	
	//강습 심사 토탈
	public int getTotalCount(PagingCriteria cri);
	
	//고객 문의 게시판 토탈
	public int getCsTotal(PagingCriteria cri); 
	
	//게시물 벌점 부여
	public int postpenalty(PostingVO vo);
	
	//랭킹
	public List<ApplicationVO> selectPopularPost();
	
	//강습 게시글 삭제
	public int postdelete(Long bno);
	
	//강습 게시글 삭제
	public int csdelete(Long csbno);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);

	// 맴버 인서트
	public void csreply(CsreplyVO reply);
	
	
	public int replymodify(CsreplyVO reply);
	
}
