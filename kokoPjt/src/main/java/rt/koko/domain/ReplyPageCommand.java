package rt.koko.domain;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageCommand{
	private int replyCnt;
	private List<TodoReplyCommand> list;
}
