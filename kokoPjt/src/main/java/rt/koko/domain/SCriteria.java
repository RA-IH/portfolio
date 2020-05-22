package rt.koko.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class SCriteria {
	private String searchType = "";
	private String keyword = "";

//	public String searchList() {
//		UriComponents uriComponents = UriComponentsBuilder.newInstance()
//				.queryParam("searchType", this.getSearchType())
//				.queryParam("keyword", this.getKeyword()).build();
//
//		return uriComponents.toUriString();
//	
//		
//	}
//	
//	private String encoding(String keyword) {
//		if(keyword == null || keyword.trim().length() == 0) { 
//			return "";
//		}
//		 
//		try {
//			return URLEncoder.encode(keyword, "UTF-8");
//		} catch(UnsupportedEncodingException e) { 
//			return ""; 
//		}
//	}
}
