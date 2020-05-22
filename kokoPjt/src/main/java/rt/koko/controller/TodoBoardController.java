package rt.koko.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import rt.koko.domain.AnswerCommand;
import rt.koko.domain.BoardFileCommand;
import rt.koko.domain.Criteria;
import rt.koko.domain.PageCommand;
import rt.koko.domain.ProjectCommand;
import rt.koko.domain.SurveyCommand;
import rt.koko.domain.TodoBoardCommand;
import rt.koko.service.MemberService;
import rt.koko.service.TodoBoardService;

@Controller
@Log4j
@RequestMapping("/todoBoard/*")
@AllArgsConstructor
public class TodoBoardController {
	
	private TodoBoardService service;
	
	public String reportInfo(String p_no) {
		String result = "";
		String[] type = {"요청", "피드백", "진행중", "완료", "보류"};
		
		for (String t : type) {
			if (result != "") {
				result += ",";
			}
			result += "['" + t;
			result += "', " + service.boardTypeCount(t, p_no) + "]";
		}

		return result;
	}
	
	// 처음 실행되는 메소드 main3.jsp로 갑니다
	@RequestMapping(value = "/main3")
	public String main3(@RequestParam("p_no") String p_no, Model model) {
		System.out.println("main3 컨트롤러");
		ProjectCommand project = service.projectGet(p_no); // 프로젝트 읽기
		Criteria cri = new Criteria();
		int total = service.getTotal(p_no);
		cri.setP_no(p_no);
		
		List<TodoBoardCommand> todoBoardList = service.todoBoardListRead(cri); // boardList 읽기
		model.addAttribute("todoBoardList", todoBoardList);
		model.addAttribute("cri", cri);
		model.addAttribute("project", project);
		model.addAttribute("pageMaker", new PageCommand(cri, total));
		model.addAttribute("result", reportInfo(p_no));
		model.addAttribute("sort", 0);
		
		return "/todoBoard/list";
	}
	
	// 전체 리스트 조회
	@GetMapping("/list")
	public void list(Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("Board list...");
		String p_no = cri.getP_no();
		int total = service.getTotal(p_no);
		
		ProjectCommand project = service.projectGet(p_no);
		model.addAttribute("project", project);
		model.addAttribute("pageMaker", new PageCommand(cri, total));
		model.addAttribute("todoBoardList", service.todoBoardListRead(cri));
		model.addAttribute("result", reportInfo(cri.getP_no()));
	}
	
	@GetMapping("/sortList")
	public String sortList(Model model, @RequestParam("p_no") String p_no,
						@RequestParam("b_type") String b_type){
		log.info("Board Sort list...");
		int total = service.boardTypeCount(b_type, p_no);
		Criteria cri = new Criteria();
		cri.setP_no(p_no);
		
		//List<TodoBoardCommand> todoBoardList = service.todoBoardTypeSort(p_no, b_type);
		
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", new PageCommand(cri, total));
		model.addAttribute("result", reportInfo(p_no));
		model.addAttribute("todoBoardList", service.todoBoardTypeSort(cri, b_type));
		
		return "/todoBoard/list";
	}
	
	// 상세 페이지 조회
	@GetMapping({"/detail","/update"})
	public void detail(@ModelAttribute("cri") Criteria cri, @RequestParam("b_seq") int b_seq, Model model) {
		log.info("board detail...");
		model.addAttribute("board", service.todoBoardDetail(b_seq));
	}
	
	@ResponseBody
	@RequestMapping(value = "/authority", method = RequestMethod.POST)
	public String boardAuthority(@RequestParam("m_id") String m_id,
			@RequestParam("p_no")String p_no, Model model) throws Exception {
		log.info("authority...");
		//rttr.addFlashAttribute("result", service.authorityCheck(m_id, p_no));
		model.addAttribute("p_no", p_no);
		return service.authorityCheck(m_id, p_no);
	}
	
	// 게시글 추가
	@PostMapping("/insert")
	public String insert(TodoBoardCommand board, RedirectAttributes rttr) {
		log.info("board insert...");
		
		if (board.getFileList() != null) {
			board.getFileList().forEach(attach -> log.info(attach));
		}
		
		service.todoBoardInsertSelectKey(board);	
		rttr.addFlashAttribute("result", board.getB_seq());
		rttr.addAttribute("p_no", board.getP_no());
		
		return "redirect:/todoBoard/list";
	}
	
	// 게시글 수정
	@PostMapping("/update")
	public String update(@ModelAttribute("cri") Criteria cri,
			TodoBoardCommand board, RedirectAttributes rttr){
		log.info("Board update...");
		
		if(service.todoBoardUpdate(board)){
			rttr.addFlashAttribute("result", "수정완료");
		}
		rttr.addAttribute("p_no", board.getP_no());
		rttr.addAttribute("b_seq", board.getB_seq());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/todoBoard/detail";
	}
	
	// 게시글 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam("b_seq") int b_seq, 
			@RequestParam("p_no") String p_no, RedirectAttributes rttr) {
		log.info("board delete..." + b_seq);
		List<BoardFileCommand> fileList = service.getFileList(b_seq);
		
		if(service.todoBoardDelete(b_seq)) {
			deleteFiles(fileList);
			rttr.addFlashAttribute("result", b_seq+"번글 삭제완료");
			rttr.addAttribute("p_no", p_no);
		}
		return "redirect:/todoBoard/list";
	}
	
	
	//////////////// 파일 첨부 ////////////////
	
	// 오늘 날짜 폴더 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	// 이미지 타입 체크
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	@PostMapping(value = "/upload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardFileCommand>> uploadFormPost(MultipartFile[] uploadFile, Model model) {
//		String uploadFolder = "C:\\upload";
//		
//		for (MultipartFile multipartFile : uploadFile) {
//
//			log.info("-------------------------------------");
//			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
//			log.info("Upload File Size: " + multipartFile.getSize());
//
//			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
//
//			try {
//				multipartFile.transferTo(saveFile);
//			} catch (Exception e) {
//				log.error(e.getMessage());
//			} // end catch
//		} // end for
		
		List<BoardFileCommand> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";

		String uploadFolderPath = getFolder();
		// make folder --------
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd folder

		for (MultipartFile multipartFile : uploadFile) {

			BoardFileCommand fileCommand = new BoardFileCommand();

			String uploadFileName = multipartFile.getOriginalFilename();

			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			fileCommand.setBf_name(uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				fileCommand.setBf_uuid(uuid.toString());
				fileCommand.setBf_uploadPath(uploadFolderPath);

				// check image type file
				if (checkImageType(saveFile)) {

					fileCommand.setImage(true);

					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

					thumbnail.close();
				}

				// add to List
				list.add(fileCommand);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} // end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String bf_name) {

		log.info("bf_name: " + bf_name);

		File file = new File("c:\\upload\\" + bf_name);

		log.info("file: " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String bf_name) {

		Resource resource = new FileSystemResource("c:\\upload\\" + bf_name);

		if (resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		String resourceName = resource.getFilename();

		// remove UUID
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);

		HttpHeaders headers = new HttpHeaders();
		try {

			boolean checkIE = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

			String downloadName = null;

			if (checkIE) {
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF8").replaceAll("\\+", " ");
			} else {
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}

			headers.add("Content-Disposition", "attachment; filename=" + downloadName);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String bf_name, String bf_type) {

		log.info("deleteFile: " + bf_name);

		File file;

		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(bf_name, "UTF-8"));

			file.delete();

			if (bf_type.equals("image")) {

				String largeFileName = file.getAbsolutePath().replace("s_", "");

				log.info("largeFileName: " + largeFileName);

				file = new File(largeFileName);

				file.delete();
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);

	}
	
	private void deleteFiles(List<BoardFileCommand> fileList) {
	    
	    if(fileList == null || fileList.size() == 0) {
	      return;
	    }
	    
	    log.info("delete files...................");
	    log.info(fileList);
	    
	    fileList.forEach(attach -> {
	      try {        
	        Path file  = Paths.get("C:\\upload\\"+attach.getBf_uploadPath()+"\\" + attach.getBf_uuid()+"_"+ attach.getBf_name());
	        
	        Files.deleteIfExists(file);
	        
	        if(Files.probeContentType(file).startsWith("image")) {
	        
	          Path thumbNail = Paths.get("C:\\upload\\"+attach.getBf_uploadPath()+"\\s_" + attach.getBf_uuid()+"_"+ attach.getBf_name());
	          
	          Files.delete(thumbNail);
	        }
	
	      }catch(Exception e) {
	        log.error("delete file error" + e.getMessage());
	      }//end catch
	    });//end foreachd
	  }
	
	@GetMapping(value = "/getFileList",
		    produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardFileCommand>> getFileList(int b_seq) {

	log.info("getFileList " + b_seq);

	return new ResponseEntity<>(service.getFileList(b_seq), HttpStatus.OK);

	}
	/*@RequestMapping("/boardInsert")
	public String insert(){
		
		return "redirect:/todoBoard/main3";
	}*/
}
