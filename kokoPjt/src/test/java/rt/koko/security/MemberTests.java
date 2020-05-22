package rt.koko.security;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberTests {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	@Test
	  public void testInsertMember() {

	    String sql = "INSERT INTO member(m_id, m_password, m_name, m_email, m_position, m_image, m_companyNo) VALUES (?,?,?,?,?,?,?)";
	    
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      
	      try {
	        con = ds.getConnection();
	        pstmt = con.prepareStatement(sql);
	        
//	        pstmt.setString(1, "aaa");
//	        pstmt.setString(2, pwencoder.encode("a1234"));
//	        pstmt.setString(3, "김보옥");
//	        pstmt.setString(4, "leymo@naver.com");
//	        pstmt.setString(5, "주임");	        		
//	        pstmt.setString(6, "0");
//	        pstmt.setString(7, "CP003");
	        
//	        pstmt.setString(1, "bbb");
//	        pstmt.setString(2, pwencoder.encode("b1234"));
//	        pstmt.setString(3, "라일현");
//	        pstmt.setString(4, "return_13@naver.com");
//	        pstmt.setString(5, "대리");	        		
//	        pstmt.setString(6, "0");
//	        pstmt.setString(7, "CP001");
//	        
//	        pstmt.setString(1, "ccc");
//	        pstmt.setString(2, pwencoder.encode("c1234"));
//	        pstmt.setString(3, "박민준");
//	        pstmt.setString(4, "shsha44@gmail.com");
//	        pstmt.setString(5, "주임");	        		
//	        pstmt.setString(6, "0");
//	        pstmt.setString(7, "CP002");

	        
//	        pstmt.setString(1, "ddd");
//	        pstmt.setString(2, pwencoder.encode("d1234"));
//	        pstmt.setString(3, "이지은");
//	        pstmt.setString(4, "dlwldms079@gmail.com");
//	        pstmt.setString(5, "과장");	        		
//	        pstmt.setString(6, "0");
//	        pstmt.setString(7, "CP001");
	        
//	        
//	        pstmt.setString(1, "eee");
//	        pstmt.setString(2, pwencoder.encode("e1234"));
//	        pstmt.setString(3, "송아라");
//	        pstmt.setString(4, "2041420@naver.com");
//	        pstmt.setString(5, "부장");	        		
//	        pstmt.setString(6, "0");
//	        pstmt.setString(7, "CP003");
//	       
//	        pstmt.setString(1, "fff");
//	        pstmt.setString(2, pwencoder.encode("f1234"));
//	        pstmt.setString(3, "안희민");
//	        pstmt.setString(4, "gmlals031@naver.com");
//	        pstmt.setString(5, "사원");	        		
//	        pstmt.setString(6, "0");
//	        pstmt.setString(7, "CP002");
	        

	        pstmt.executeUpdate();
	        
	      }catch(Exception e) {
	        e.printStackTrace();
	      }finally {
	        if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
	        if(con != null) { try { con.close();  } catch(Exception e) {} }
	        
	      }
	  }

}
