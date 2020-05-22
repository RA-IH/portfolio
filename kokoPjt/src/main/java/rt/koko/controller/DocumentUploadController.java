package rt.koko.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import rt.koko.domain.DocumentFileCommand;

@Controller
@Log4j
@RequestMapping("/document/*")
public class DocumentUploadController {
	@GetMapping("/uploadForm")
		public void documentUploadForm() {
			log.info("upload form");
		}
	
	private String documentGetFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	private boolean documentCheckImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@PostMapping(value = "/uploadFormAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
		public ResponseEntity<List<DocumentFileCommand>> documentUploadFormPost(MultipartFile[] uploadFile, Model model) {
			List<DocumentFileCommand> list = new ArrayList<>();
			String uploadFolder = "C:\\documentUpload";
			
			String uploadFolderPath = documentGetFolder();
	
			// make folder --------
			File uploadPath = new File(uploadFolder, uploadFolderPath);

			if (uploadPath.exists() == false) {
				uploadPath.mkdirs();
			} // make yyyy/MM/dd folder
			
			for (MultipartFile multipartFile : uploadFile) {	
				DocumentFileCommand fileCMD = new DocumentFileCommand();
				String uploadFileName = multipartFile.getOriginalFilename();
				
				// IE has file path
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
				log.info("only file name: " + uploadFileName);
				fileCMD.setDoc_fileName(uploadFileName);
				 
				UUID uuid = UUID.randomUUID();
				uploadFileName = uuid.toString() + "_" + uploadFileName;
					
				try {
					File saveFile = new File(uploadPath, uploadFileName);
					multipartFile.transferTo(saveFile);
					fileCMD.setDocf_uuid(uuid.toString());
					fileCMD.setDocf_uploadPath(uploadFolderPath);
					
					//check image type file
					if (documentCheckImageType(saveFile)) {
						fileCMD.setDoc_fileType(true);
						
						FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" +uploadFileName));
						Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
						thumbnail.close();
					}
					
					System.out.println(fileCMD.toString());
					list.add(fileCMD);
					
				} catch (Exception e) {
					log.error(e.getMessage());
				} // end catch
		} // end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	} // documentUploadFormPost()
}
