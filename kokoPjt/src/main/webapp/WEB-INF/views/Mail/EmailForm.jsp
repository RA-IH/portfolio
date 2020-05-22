<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
     "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Spring MVC - Email</title>
<style type="text/css">

.header {
    color: #36A0FF;
    font-size: 27px;
    font-family: 'Jua', sans-serif;
}

.bigicon {
    font-size: 35px;
    color: #36A0FF;
}

</style>
</head>
<body>

<div class="col-sm-14 page">
	<br><br>
	<div class="container">
    	<div class="row">
        	<div class="col-md-12">
	        	    <form action="sendEmail.do" method="post" enctype="multipart/form-data" class="form-horizontal">
                	    
                    	    <legend class="text-center header">Sending Email</legend>
							<div>
                        	<div class="form-group">
                            	<span class="col-md-1 col-md-offset-2 text-center"><i><img src="${pageContext.request.contextPath}/resources/mail.png" width="35" height="30"></i></span>
                            	<div class="col-md-8">
                                	<input id="email" name="mailTo" type="text" placeholder="Email Address" class="form-control">
                            	</div>
                        	</div>

                        	<div class="form-group">
                            	<span class="col-md-1 col-md-offset-2 text-center"><i><img src="${pageContext.request.contextPath}/resources/subject.png" width="40" height="40"></i></span>
                            	<div class="col-md-8">
                                	<input id="phone" name="subject" type="text" placeholder="Subject" class="form-control">
                            	</div>
                        	</div>
                        
                        	<div class="form-group">
                            	<span class="col-md-1 col-md-offset-2 text-center"><i><img src="${pageContext.request.contextPath}/resources/file.png" width="35" height="30"></i></span>
                            	<div class="col-md-8">
                            		<input type="file" name="attachFile" maxlength="100" size="48" class="boxTF" class="form-control">
                            	</div>
                        	</div>

                        	<div class="form-group">
                            	<span class="col-md-1 col-md-offset-2 text-center"><i><img src="${pageContext.request.contextPath}/resources/message.png" width="30" height="30"></i></span>
                            	<div class="col-md-8">
                                	<textarea class="form-control" id="message" name="message" placeholder="Enter your massage for us here. We will get back to you within 2 business days." rows="15"></textarea>
                            	</div>
                        	</div>
                        	<div class="form-group">
                            	<div class="col-md-12 text-center">
                                	<input type="submit" class="btn btn-primary btn-lg" style="color: white; background: #333; font-family: 'Jua', sans-serif;" value="Submit">
                                	<input type="reset" class="btn btn-primary btn-lg" style="color: white; background: #333; font-family: 'Jua', sans-serif;" value="Reset">
	                            </div>
	                        </div>
	                </form>
	        </div>
	    </div>
	</div>	
</body>
</html>