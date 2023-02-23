package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ApplicationVO;
import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PostingVO;
import org.zerock.domain.UploadVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReviewMapper;
import org.zerock.mapper.UploadMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private UploadMapper uploadMapper;

	@Setter(onMethod_ = @Autowired)
	private ReviewMapper reviewMapper;

	@Transactional
	@Override
	// boardVO가 register될 때, List<UploadVO>도 같이 !
	public void register(PostingVO posting) {

		log.info("register..." + posting);

		mapper.insertSelectKey(posting);

		if (posting.getUploadList() == null || posting.getUploadList().size() <= 0) {
			return;
		}

		posting.getUploadList().forEach(upload -> {

			upload.setBno(posting.getBno());
			uploadMapper.insert(upload);
		});
	}

	@Override
	public PostingVO get(Long bno) {
		log.info("get....." + bno);

		return mapper.read(bno);
	}

	@Override
	public boolean modify(PostingVO posting) {
		log.info("modify...." + posting);

		// 수정 되면 1이 반환되니까 그걸로 true/false 처리
		return mapper.update(posting) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove...." + bno);

		// 수정 되면 1이 반환되니까 그걸로 true/false 처리
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<PostingVO> getList() {

		log.info("getList....");

		return mapper.getList();
	}

	// 카테고리 별 페이징 처리
	@Override
	public List<PostingVO> getList(Criteria cri) {

		return mapper.getListWithPaging(cri);
	}

	// 토탈 검색 페이징 처리
	@Override
	public List<PostingVO> getListTotal(Criteria cri) {

		return mapper.getListTotal(cri);
	}

	// 카테고리별 데이터 개수 처리
	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count");

		return mapper.getTotalCount(cri);
	}

	// 토탈 검색 데이터 개수 처리
	@Override
	public int getTotalCountAll(Criteria cri) {

		log.info("get total count");

		return mapper.getTotalCountAll(cri);
	}

	// 게시글 조회 시, 첨부파일 같이 조회
	@Override
	public List<UploadVO> getUploadList(Long bno) {

		log.info("파일 받아오기 by bno : " + bno);

		return uploadMapper.findByBno(bno);

	}

//===================수강신청&위시 관련======================================

	@Override
	public void applyinsert(ApplicationVO application) {

		log.info("수강 신청 insert ");

		mapper.applyinsert(application);

		return;
	}

	// 위시담기
	@Override
	public void wishinsert(CartVO cart) {

		log.info("위시 insert");

		mapper.wishinsert(cart);
		return;
	}

	// 위시제거
	@Override
	public void wishremove(CartVO cart) {

		log.info("위시 remove");

		mapper.wishremove(cart);

		return;
	}

	// 카트 조회해서 첨에 하트 체크+ 위시 눌렀을때 js동작
	@Override
	public List<CartVO> cartget(Long bno) {

		log.info("위시 조회");

		return mapper.cartget(bno);

	}

//===================리뷰관련======================================

	// 리뷰 권한
	@Override
	public List<PostingVO> reviewRight(Long bno) {
		log.info("reviewRight:" + bno);

		return reviewMapper.reviewRight(bno);
	}

	// 리뷰평점
//	public ReviewVO reviewAvg(Long bno) {
//		
//		return reviewMapper.reviewAvg(bno);
//	}

	// 인기 게시물
	public List<ApplicationVO> selectPopularPost() {

		return mapper.selectPopularPost();
	}

	// 리뷰 카운트(메인-인기 게시물)
//	public int popularReviewCnt(Long bno){
//		
//		return reviewMapper.getCountByBno(bno);
//	}

}