
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyPage</title>
</head>
<body>
	<div align="center" class="container page">
		<br><br>
		<legend class="text-center header" style="color: #36A0FF; font-size: 27px; padding: 10px; font-family: 'Jua', sans-serif;">MyPage</legend>
		<div class="container">
		<div class="row">
			<div class="container">
				<div class="login-box well" style="font-family: 'Jua', sans-serif;">
					<form id="editPage" accept-charset="UTF-8" role="form" method="POST" action="/Mypage/mypageAction">
						<legend>${login.m_name }</legend>
						<div class="form-group">
							<label for="m_id">ID</label>
							<input type="text" class="btn btn-default btn-login-submit btn-block m-t-md" value="${login.m_id }" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="password">PASSWORD</label>
							<input name="m_password" id="loginPassword" value=''; placeholder="Password" type="password" class="form-control">
						</div>
						<div class="form-group">
							<label for="email">EMAIL</label>
							<input name="m_email" id="email" value='${login.m_email }';  type="text" class="form-control">
						</div>
						<div class="form-group">
							<input id="pageSubmit" type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" style="background: #333; color:white;" value="Done"/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	</div>

   <!-- Modal -->
<!--    <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      Modal content
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">비밀번호 확인</h4>
        </div>
        <div class="modal-body">
          <label for="password">PASSWORD</label>
		  <input  id="passCheck" value=''; placeholder="Password" type="password" class="form-control">
        </div>
        <div class="modal-footer">
          <button id="passCheckBtn" type="button" class="btn btn-default btn-login-submit btn-block m-t-md">Done</button>
        </div>
      </div>
      
    </div>
  </div> -->






	
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#myModal').modal({backdrop: 'static', keyboard: false});
		
/* 		$('#passCheckBtn').click(function() {
			
			var oldpass = "${login.m_password}";
			var newpass = $('#passCheck').val();
			
			if(oldpass == newpass){
				$('#myModal').modal('hide');
			}else{
				alert('비밀번호를 정확히 입력해 주세요.');
			}
			
			
		}); */
		
		
		
		$("#pageSubmit").click(function() {
			alert("내 정보를 수정하였습니다 재로그인해 주세요.")
		});
		
		
	});

</script>	
</body>
</html>