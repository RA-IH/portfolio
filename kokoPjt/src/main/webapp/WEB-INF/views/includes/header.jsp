<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Baloo+Bhai|Jua|Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
  <link rel=”stylesheet” href=”http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css“> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    
    body{
     background-color:#F6F6F6;
    }
    
    /* 사이드바 */
      .sidenav {
      background-color: #120A2A;
      color: #6C8ED2;
      position: fixed;
      width: 250px;
      height: 100%;
      margin-left: 0px;
      margin-top: 0px;
    } 
    
    .sidenav li{
       top:100px;
       color: #FFFFFF;
    }
    
    /* 본문 */
    .page {
     margin-top:50px;
     margin-left: 250px;
    }
    

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Baloo+Bhai|Jua|Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
  <link rel=”stylesheet” href=”http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css“> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    
    body{
     background-color:#F6F6F6;
    }
    
    /* 사이드바 */
      .sidenav {
      background-color: #120A2A;
      color: #6C8ED2;
      position: fixed;
      width: 250px;
      height: 100%;
      margin-left: 0px;
      margin-top: 0px;
    } 
    
    .sidenav li{
       top:100px;
       color: #FFFFFF;
    }
    
    /* 본문 */
    .page {
     margin-top:50px;
     margin-left: 350px;
     margin-right: 150px;
     
    }
    

    
    #header{
     background-color: #FFFFFF;
     border-style: none;
     
    }
</style>

</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div id="header" class="container-fluid">
    <div class="navbar-header">
      <a href="/login/main2" height="5" width="10">
      <img src="${pageContext.request.contextPath}/resources/koko.png" width="140" height="60"></a>
   </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#">${login.m_name }</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">My Page<span class="caret"></span></a>
        <ul class="dropdown-menu navbar-right">
          <li><a href="/Mypage/mypage"><span class="glyphicon glyphicon-user"></span> Edit Profile</a></li>
          <li id="login"><a href="/"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
          <li id="logout"><a href="/login/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        </ul>
      </li>
    </ul>
  </div>
</nav>

   <div class="sidenav">
        <div class="container-fluid">
                <nav class="col-sm-9">
                        <ul class="nav nav-pills nav-stacked" style="position: fixed;">
                            <li>Menu</li>
                            <li>
                                <a  href="/Chat/kokoChat"><span class="glyphicon glyphicon-comment" ></span>  Chatting</a>
                            </li>
                            <li>
                                <a href="/document/list"><span class="glyphicon glyphicon-download-alt"></span>  Document</a>
                            </li>
                            <li>
                                <a href="/addressbook/list"><span class="glyphicon glyphicon-book"></span>  AddressBook</a>
                            </li>
                            <li>
                                <a href="/Mail/EmailForm" ><span class="glyphicon glyphicon-envelope"></span>  Email</a>
                            </li>
                            <li>
                                <a href="/Survey/Slist"><span class="glyphicon glyphicon-ok"></span>  Survey</a>
                            </li>
                            <li>
                                <a href="/calendar/Calendarindex" ><span class="glyphicon glyphicon-calendar"></span>  Calendar</a>
                            </li>
                        </ul>
                   </nav>
               </div>
            </div>

<script type="text/javascript">
   var loginSession = "${login.m_name}";
      if (loginSession) {
            $('#login').css("display", "none");
      }else{
            $('#logout').css("display", "none");
            location.href = "/";
      }   
</script>
</body>

</html>