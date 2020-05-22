package rt.koko.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class BoardFileCommand {
	private String bf_uuid;
	private String bf_name;
	private boolean bf_type;
	private String bf_uploadPath;
	private int b_seq;
	
	private boolean image;
	
	public BoardFileCommand() {}
	public BoardFileCommand(String bf_uuid, String bf_name, boolean bf_type, String bf_uploadPath) {
		super();
		this.bf_uuid = bf_uuid;
		this.bf_name = bf_name;
		this.bf_type = bf_type;
		this.bf_uploadPath = bf_uploadPath;
	}
}
