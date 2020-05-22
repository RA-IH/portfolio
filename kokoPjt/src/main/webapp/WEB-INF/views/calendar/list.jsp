<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='/resources/packages/core/main.css' rel='stylesheet' />
<link href='/resources/packages/daygrid/main.css' rel='stylesheet' />
<!-- 드래그앤드랍  -->
<link href='/resources/packages/timegrid/main.min.css' rel='stylesheet' />

<script src='/resources/packages/core/main.js'></script>
<script src='/resources/packages/daygrid/main.js'></script>
<script src='/resources/packages/core/locales/ko.js'></script>
<script src="/resources/packages/interaction/main.min.js"></script>
<script src="/resources/packages/timegrid/main.min.js"></script>
</head>
<script>
    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
    
      var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: [ 'dayGrid' ]
      });
    
      calendar.render();
    });
</script>
<body>
 
<div id='calendar'></div>
 
</body>
</html>
