package org.zerock.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CsreplyDTO {

	private int replyTOtalcnt; //댓글 총개수
	private List<CsreplyVO> list;
}
