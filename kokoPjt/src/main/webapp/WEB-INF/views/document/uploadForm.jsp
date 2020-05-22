<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	.uploadResult {
		width: 100%;
		background-color: white;
		/* border-width: 1px;
		border-style: solid; */
	}
	
	.uploadResult ul {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		
	}
	
	.uploadResult ul li {
		list-style: none;
		padding: 10px;	
	}
	
	.uploadResult ul li img {
		width: 100px;
	}
</style>
<body>

<!-- ajax X -->
<!-- <form action="uploadFormAction" method="post" enctype="multipart/form-data">
	<input type='file' name='uploadFile' multiple>
<button>Submit</button> 
</form>-->

	<div class='uploadDiv'>
		<input type='file' name='uploadFile' multiple>
	</div>
	
	<div class='uploadResult'>
		<ul>

		</ul>
	</div>
	
	<button id='uploadBtn'>업로드</button>
	
	<!-- jQuery 라이브러리-->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

	<!-- jQuery -->
	<script>
	var regex = new RegExp("(.*?)\.(exe|sh|alz)$");
	var maxSize = 5242880; //5MB
	
	function checkExtension(fileName, fileSize) {

		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}

		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}

		var cloneObj = $(".uploadDiv").clone();
	
		$("#uploadBtn").on("click", function(e){
		var formData = new FormData();	
		var inputFile = $("input[name='uploadFile']");		
		var files = inputFile[0].files;	
		console.log(files);
		 
		//add filedate to formdata
		for(var i = 0; i < files.length; i++){
			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			formData.append("uploadFile", files[i]);	
		}
			

		$.ajax({
			url: '/document/uploadFormAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result){
				console.log(result);
				showUploadedFile(result);
				$(".uploadDiv").html(cloneObj.html());
				
			}
		}); //$.ajax
		
		
			
		});
		
		// 파일 이름 출력
		
		var uploadResult = $(".uploadResult ul");		
		function showUploadedFile(uploadResultArr) {
			var str = "";	
				$(uploadResultArr).each(function(i, obj) {
					
			
				str += "<li>" + obj.doc_fileName + "</li>";		
					
				});
				
				uploadResult.append(str);
				
		} ;


		
		
	</script>
</body>
</html>