package rt.koko.domain;

import lombok.Data;

@Data
public class DocumentFileCommand {
	/*private String fileName; // 원본 파일 이름
	private String uploadPath; // 업로드 경로
	private String uuid;
	private boolean image; // 이미지 여부 - t/f
*/	
	private String docf_uuid;
	  private String docf_uploadPath; // 업로드 경로
	  private String doc_fileName; // 원본 파일 이름
	  private boolean doc_fileType; // 이미지 여부 - t/f
	  
	  private Long doc_seq;
}
