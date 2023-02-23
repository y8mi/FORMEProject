package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.UploadVO;

public interface UploadMapper {

	public void insert(UploadVO vo);

	public void delete(String uuid);

	public List<UploadVO> findByBno(Long bno);

}
