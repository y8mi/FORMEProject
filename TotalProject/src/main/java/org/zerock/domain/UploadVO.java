package org.zerock.domain;

import lombok.Data;

@Data
public class UploadVO {

	private Long bno;
	
	private String uuid;
	private String uploadPath;
	private String fileName;
}
