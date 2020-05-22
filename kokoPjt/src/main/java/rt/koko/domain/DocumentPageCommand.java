package rt.koko.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class DocumentPageCommand {
	private int startPage, endPage; // 페이지 맨처음, 맨마지막
	private boolean prev, next; // 이전, 다음
	private int total;
	private DocumentPageVO docPage; // 페이지 번호와 한페이지당 보여줄 게시글 갯수
	
	public DocumentPageCommand(DocumentPageVO docPage, int total) {
		this.docPage = docPage;
		this.total = total;
		
		// 화면에 페이지 번호가 10개씩 보임
		this.endPage = (int)(Math.ceil(docPage.getPageNum() / 10.0)) * 10; 
		this.startPage = this.endPage - 9;
		int realEnd = (int)(Math.ceil((total * 1.0) / docPage.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
}
