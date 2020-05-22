<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KOKO CHAT</title>
<meta name="viewport" content="width=device-width, initial-scale = 1" />
<script src="http://code.jquery.com/jquery-1.7.1.js"></script>
</head>
<body>
	<div class="row-sm-5 page" align="center">
		<br><br>
		<legend class="text-center header" style="color: #36A0FF; font-size: 27px; padding: 10px; font-family: 'Jua', sans-serif;">Chatting</legend>
		<div id="chatarea" class="container" style="width:100%">
			<div id="notice" class="alert alert-success" role="alert"
				style="color: black; text-align: center; font-family: 'Jua', sans-serif; color: white; font-size: 15px; font-weight: bold; margin-top: 10px; background: #333;">
				<span class="glyphicon glyphicon-bullhorn" style="color: white;"></span> 공 지 사 항
			</div>
			<div id=client_list style="font-family: 'Jua', sans-serif; text-align: left;">참여 인원 목록</div>
			<div id="onlineUser"
				style="border: 1px solid red; margin-bottom: 3px; overflow-y: auto; margin-top: 10px; text-align: left;">
			</div>
			<div id="content" class="containers" align="center"
				style="font-family: 'Jua', sans-serif; height:500px; border: 1px solid black; background-color: white; overflow-y: auto; margin-top: 10px;">
			</div>
		</div>

		<div id="main" class = "containers" style="margin-top: 25px;" align="right">
			<!-- <div class="form-group" style="margin-top: 10px">
				<input type="text" class="form-control" id="message" placeholder="Message" />
				<button id='button' type="button" class="btn btn-default"
					style="width: 100%">Send</button>	 -->
				
				<div class="containers">
	    			<div class="input-group">
	      				<input type="text" class="form-control" id="message" placeholder="Message" style="height: 50px;">
	      					<span class="input-group-btn">
								<button id='button' class="btn btn-default" type="button" style="height: 50px; color:white; background: #333; font-family: 'Jua', sans-serif;"><span class="glyphicon glyphicon-envelope" style="color: white;"></span> Send</button>
								<button type="button" class="btn btn-default" onclick="location.href='/Chat/videocall'" style="height: 50px; color:white; background: #333; font-family: 'Jua', sans-serif;"><span class="glyphicon glyphicon-facetime-video" style="color: white;"></span> Video Call</button>
	      					</span>
	      				</input>
	    				</div><!-- /input-group -->
	  				</div><!-- /.col-sm-6 -->
				</div><!-- /.row -->
		</div>
<script src="https://192.168.0.41:8008/socket.io/socket.io.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var socket = io('https://192.168.0.41:8008');
	var name;
	socket.on('connect', function() {
		name = "${login.m_name }";
		alert("환영합니다 " + name +"님!");
		socket.emit('newUser', name);

	});


	socket.on('client_list', function(data) {
		
		$('#onlineUser').empty();
		var output = '';
		var client_list = " " + data.length + "명";
		output += data;
		$('#onlineUser').append(output);
		$('#client_list').text("참여 인원 목록" + client_list);

	});
	
	socket.on('servermessage',function(data) {

		var objDiv = document.getElementById("content");
		var output = '';
		output += '<div class="alert alert-info" style="background-color: #333; color: white; border:1px solid green;"><strong>';
		output += data.name;
		output += '</strong> : ';
		output += data.message;
		output += '<span style="float:right; color:red;">';
		output += getTime();
		output += '</span>'
		output += '</div>';

		$('#content').append(output);

		objDiv.scrollTop = objDiv.scrollHeight;
		

	});

	socket.on('mymessage',function(data) {

		var objDiv = document.getElementById("content");
		var output = '';
		output += '<div class="alert alert-info mymessage" style="background-color: yellow; border:1px solid yellow;"><strong>';
		output += data.name;
		output += '</strong> : ';
		output += data.message;
		output += '<span style="float:right; color:red;">';
		output += getTime();
		output += '</span>'
		output += '</div>';

		$('#content').append(output);

		objDiv.scrollTop = objDiv.scrollHeight;
		

	});

	socket.on('othermessage',function(data) {

		var objDiv = document.getElementById("content");
		var output = '';
		output += '<div class="alert alert-info" style="background-color: white; border:1px solid black;"><strong>';
		output += data.name;
		output += '</strong> : ';
		output += data.message;
		output += '<span style="float:right; color:red;">';
		output += getTime();
		output += '</span>'
		output += '</div>';

		$('#content').append(output);

		objDiv.scrollTop = objDiv.scrollHeight;
		

	});

	
	socket.on('notice', function(data) {

		var strArray = data.split(':');
		var message = strArray[1].split('//');
		$('#notice').text(
				strArray[0] + '님의 공지 : ' + message[0]);
	});
		
	socket.on('preload', function(data) {
		var objDiv = document.getElementById("content");
		var output = '';
		output += '<div class="alert alert-info"><strong>';
		output += data.name;
		output += '</strong> : ';
		output += data.message;
		output += '</div>';
		if (data.imagesrc) {
			var img = document.createElement('img');
			img.src = data.imagesrc;
			img.width = 700;
			img.height = 350;
			img.className = 'img-rounded';
			img.style.border = "1px solid";
		}
		$('#content').append(img);
		$('#content').append(output);
		objDiv.scrollTop = objDiv.scrollHeight;
	});

	socket.on('file', function(data) {
				
		var objDiv = document.getElementById("content");			
		var img = document.createElement('img');				
		var output = '';				
		img.src = data.file;			
		img.width = 700;	
		img.height = 350;
		img.className = 'img-rounded';
		img.style.border = "1px solid";
		output += '<div class="alert alert-info"><strong>';
		output += data.username;
		output += '</strong> : ';
		output += ' 님이 사진을 보냈습니다.';
		output += '<span style="float:right; color:red;">';
		output += getTime();
		output += '</span>'
		output += '</div>';
		$('#content').append(img);
		$('#content').append(output);
		objDiv.scrollTop = objDiv.scrollHeight;
		
	});

	var log = ''
		
	$('#content').append(log);

	$('#button').click(function() {
		socket.emit('message', {
			name : name,
			message : $('#message').val()
		});
		$('#message').val('');
	});

	$('#message').keydown(function(e) {
		if (e.which == 13) {/* 13 == enter key@ascii */
			socket.emit('message', {
				name : name,
				message : $('#message').val()
			});
			$('#message').val('');
		}
	});

	var dropZone = document.getElementById('content');

	// Optional.   Show the copy icon when dragging over.  Seems to only work for chrome.
	dropZone.addEventListener('dragover', function(e) {
		e.stopPropagation();
		e.preventDefault();
		e.dataTransfer.dropEffect = 'copy';
	});

	// Get file data on drop
	dropZone.addEventListener('drop', function(e) {
		e.stopPropagation();
		e.preventDefault();
		var files = e.dataTransfer.files; // Array of all files

		for (var i = 0, file; file = files[i]; i++) {
			if (file.type.match(/image.*/)) {
				var reader = new FileReader();

				reader.onload = function(e2) {

					// finished reading file data.
					var file = {};
					file.file = e2.target.result;
					file.fileName = e2.name;
					socket.emit('base64 file', file);

				}

				reader.readAsDataURL(file); // start reading the file data.
			}
		}
	});
	
	function getTime() {
		var gettime = new Date();
		var ct = "//" + gettime.getHours() + "시 "
		+ gettime.getMinutes() + "분";
		return ct;
	}

	$('#content').on("click", ".mymessage",function() {
		var notice = $(this)	.text();

		alert('선택한 메세지를 공지사항으로 등록합니다.');

		socket.emit('notice select', notice);

	});
	
});

</script>
</body>
</html>