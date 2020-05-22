$(document).ready(function() {
	
	//자세히 입력하기 버튼
	$(".content").hide();
	
	$(".heading").on("click", function(e) {
		$(".content").toggle(); // show -> hide , hide -> show
	
	});


	var actionForm = $("#actionForm");
	

	$(".paginate_button a").on("click", function(e) {
				
				e.preventDefault();

				console.log("click");

				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
	
	
	$(document).on("click", "#example-table-1 .ck_1" ,function() {
		$('#myModal').show();
		var str = ""
		var tdArr = new Array();    // 배열 선언	
		 // 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
		// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
		console.log("클릭한 Row의 모든 데이터 : "+tr.text());
	
		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		td.each(function(i){
			tdArr.push(td.eq(i).text());
		});
		
		console.log("배열에 담긴 값 : "+tdArr);
		
		// td.eq(index)를 통해 값을 가져올 수도 있다.
		/*var no = td.eq(2).text();
		console.log("no:" + no);*/
		// td.eq(index)를 통해 시퀀스 값을 가져올 수도 있다.
		var ad_seq = td.eq(1).text();
		console.log(ad_seq);
		console.log("시퀀스에 담긴 값 : "+ ad_seq + "입니다.");
		  

		  
			console.log('/addressbook/detail/'+ad_seq);
			
			$.ajax({
				type: 'get',
				url: '/addressbook/detail/'+ad_seq,
				dataType: 'json',
				contentType: "application/json; charset=utf-8",
				success: function(result, status, xhr){ 
					console.log(result);	
					console.log(result.ad_updatedate);	
					datailModal(result);
					
//					  if(callback){		
//						callback(result);
//					} 
				 	// var address = result;
					//console.log(address);
				
				},
				/*error: function(xhr,status,er){
					alert("실패");
				}*/
				
			}) ;
			

			function datailModal(result) {
			
				var str =	 "";
				str += "<form id=test>"
				str += "<label class=col-sm-2 control-label> Name </label>" + "<div class=col-sm-10><input type=text id=namedata  style=width:70% value='" + result.ad_name  + "'>"+"</input></div>";
				str += "<label class=col-sm-2 control-label> PhoneNumber </label>" + "<div class=col-sm-10><input type=text id=numberdata  style=width:70% value='" + result.ad_number  + "'>"+"</input></div><br>";
				str += "<label class=col-sm-2 control-label> Mail </label>" + "<div class=col-sm-10><input type=text id=emaildata  style=width:70% value='" + result.ad_email + "'>"+"</input></div><br>";
				str += "<label class=col-sm-2 control-label> Group </label>" + "<div class=col-sm-10><input type=text id=groupdata  style=width:70% value='" + result.ad_group  + "'>"+"</input></div><br>";
				str += "<label class=col-sm-2 control-label> Company </label>" + "<div class=col-sm-10><input type=text id=companydata  style=width:70% value='" + result.ad_company  + "'>"+"</input></div><br>";
				str += "<label class=col-sm-2 control-label> Department </label>" + "<div class=col-sm-10><input type=text id=departmentdata  style=width:70% value='" + result.ad_department  + "'>"+"</input></div><br>";
				str += "<label class=col-sm-2 control-label> Address </label>" + "<div class=col-sm-10><input type=text maxlength=100 id=addressdata style=width:70% value='" + result.ad_address + "'>"+"</input></div><br>";
				//str += "<label class=col-sm-2 control-label> Memo </label>" + "<div class=col-sm-10><input type=text maxlength=100 id=memodata style=width:70% value='" + result.ad_memo + "'>"+"</input></div><br>";
				str += "<label class=col-sm-2 control-label> Memo </label>" + "<div class=col-sm-10><textarea id=memodata style=width:70% value='" + result.ad_memo + "' rows=3>"+"</textarea></div><br>";
				str += "<label class=col-sm-2 control-label> 최근 수정일 </label>" + "<div class=col-sm-10><input type=text maxlength=100 id=updatedate style=width:70% value='" + result.ad_updatedate+ "'>"+"</input></div><br>";
				str += "</form>"
				
				$('#aa').append(str);
				
				
			}
			
			$("#modify_btn").click(function() {
				
				// 배열을 선언한다.
	           // var dataArr = new Array();
				  // 객체 생성
                var dataObj = new Object();
                // 객체에 input 값을 담는다.
   
               
				dataObj.m_id = "aaa";
                dataObj.ad_name = $("#namedata").val();
                dataObj.ad_number = $("#numberdata").val();
                dataObj.ad_email = $("#emaildata").val();
                dataObj.ad_group = $("#groupdata").val();
                dataObj.ad_company = $("#companydata").val();
                dataObj.ad_department = $("#departmentdata").val();
                dataObj.ad_address = $("#addressdata").val();
                dataObj.ad_memo = $("#memodata").val();
                
                console.log(dataObj);
           
                // json 형태의 문자열로 만든다.
               var jsonData = JSON.stringify(dataObj);
                console.log(jsonData);
                console.log(typeof(jsonData));
 
                console.log("/addressbook/update/"+ad_seq);
                
				$.ajax({
					type: 'post',
					url: '/addressbook/update/'+ad_seq,
					data:  jsonData,
					dataType: 'text',
					contentType: "application/json; charset=utf-8",
					success: function(result, status, xhr){ 
						location.href="";
						var ii = document.getElementById("jsonList");
						ii.innerHTML = ""; //비워준거!
						
//						showList();
						
					/*	alert(result);*/
						 if(callback){		
							/*callback(result);*/
						} 
					 	 var address = result;
						console.log(address);
					
					},
				error: function(xhr,status,er){
						alert(er);
					}
					
				}) ;
			
			
			
			});
			
			function datailModal(result) {

				var str =	 "";
				str += "<form id=test>"
				str += "<label class=col-sm-2 control-label> Name </label>" + "<div class=col-sm-10><input type=text id=namedata  style=width:70% value='" + result.ad_name  + "'>"+"</input></div>";
				str += "<label class=col-sm-2 control-label> PhoneNumber </label>" + "<div class=col-sm-10><input type=text id=numberdata  style=width:70% value='" + result.ad_number  + "'>"+"</input></div><br>";
				str += "<label class=col-sm-2 control-label> Mail </label>" + "<div class=col-sm-10><input type=text id=emaildata  style=width:70% value='" + result.ad_email + "'>"+"</input></div><br>";
				str += "<label class=col-sm-2 control-label> Group </label>" + "<div class=col-sm-10><input type=text id=groupdata  style=width:70% value='" + result.ad_group  + "'>"+"</input></div><br>";
				str += "<label class=col-sm-2 control-label> Company </label>" + "<div class=col-sm-10><input type=text id=companydata  style=width:70% value='" + result.ad_company  + "'>"+"</input></div><br>";
				str += "<label class=col-sm-2 control-label> Department </label>" + "<div class=col-sm-10><input type=text id=departmentdata  style=width:70% value='" + result.ad_department  + "'>"+"</input></div><br>";
				str += "<label class=col-sm-2 control-label> Address </label>" + "<div class=col-sm-10><input type=text maxlength=100 id=addressdata style=width:70% value='" + result.ad_address + "'>"+"</input></div><br>";
				str += "<label class=col-sm-2 control-label> Memo </label>" + "<div class=col-sm-10><input type=text maxlength=100 id=memodata style=width:70% value='" + result.ad_memo + "'>"+"</input></div><br>";
				str += "</form>"
				
				$('#aa').append(str);
				
				
			}
			
			$("#delete_btn").click(function() {
				
				
  
           
              
                console.log(ad_seq+"입니다.");
           
                // json 형태의 문자열로 만든다.
           
 
                
               
           
               // alert(jsonData);
               // var sendData = $('#test').serialize();
                //console.log(sendData);
                
                console.log("/addressbook/delete/"+ad_seq);
                
				$.ajax({
					type: 'delete',
					url: '/addressbook/delete/'+ad_seq,
				
					
					success: function(result, status, xhr){ 
						location.href="";
						var ii = document.getElementById("jsonList");
						ii.innerHTML = "";
						
						showList();
//						  if(callback){		
//							callback(result);
//						} 
					 	// var address = result;
						//console.log(address);
					
					},
				/*	error: function(xhr,status,er){
						alert("실패");
					}*/
					
				}) ;
			});
	
})

})

function close_pop(flag) {
    $('#myModal').hide();
    $( '#aa' ).empty();
    
}; 

function showList(){
	   
	
	var xhr;
	
	xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4) { //데이터를 전부 받은 상태, 완료되었다
			if(xhr.status == 200) { //서버로부터의 응답상태가 요청에 성공하였다는 의미
				makingList(xhr.response);
			}
		}
	}
	
	xhr.open("get", "/addressbook/listJson");
	xhr.send();
	
	
	
}

function makingList(addressList) {
	var i = JSON.parse(addressList);
	var jsonList = document.getElementById("jsonList");
	
	for(var k of i) {
		var ck_1 = document.createElement("tr");
		ck_1.setAttribute("class", "ck_1");
		
		var name_td = document.createElement('td');
		name_td.innerHTML = k.ad_name;
		ck_1.append(name_td);
		
		name_td = document.createElement('td');
		name_td.innerHTML = k.ad_seq;
		ck_1.append(name_td);
		name_td = document.createElement('td');
		name_td.innerHTML = k.ad_number;
		ck_1.append(name_td);
		name_td = document.createElement('td');
		name_td.innerHTML = k.ad_email;
		ck_1.append(name_td);
		name_td = document.createElement('td');
		name_td.innerHTML = k.ad_group;
		ck_1.append(name_td);
		name_td = document.createElement('td');
		name_td.innerHTML = k.ad_company;
		ck_1.append(name_td);
		name_td = document.createElement('td');
		name_td.innerHTML = k.ad_department;
		ck_1.append(name_td);
		name_td = document.createElement('td');
		name_td.innerHTML = k.ad_address;
		ck_1.append(name_td);
		name_td = document.createElement('td');
		name_td.innerHTML = k.ad_updatedate;
		ck_1.append(name_td);
		
		jsonList.append(ck_1);
	}
	
}

