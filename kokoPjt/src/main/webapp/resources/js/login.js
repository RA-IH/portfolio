console.log("Login Module........");

var loginService = (function(){
	
	function loginRead(login, callback, error) {
		console.log("login read...");
		/*var m_id = login.m_id;
		var m_password = login.m_password;
		
		$.getJSON("/login/loginAction/" + m_id + "/" + m_password+ ".json",
			        function(data) {
			    	
			          if (callback) {
			            callback(data); // 댓글 목록만 가져오는 경우 
			            //callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는 경우 
			          }
			        }).fail(function(xhr, status, err) {
			        	alert("로그인 실패");
			    });*/
		
		$.ajax({
			type : 'post',
			url : '/login/loginAction',
			data : JSON.stringify(login),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				//console.log(result);
				if (callback) {
						alert("로그인 성공");
						window.location.href = "/login/main2";
				}
			},
			error : function(xhr, status, er) {
				alert("로그인 실패");
					if (error) {
						error(er);
					}
			}
		})
	}
	
	return {
		loginRead : loginRead
	};
	
})();