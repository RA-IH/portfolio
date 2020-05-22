<%@include file="../includes/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
	
  <script src="https://192.168.0.41:8008/socket.io/socket.io.js"></script>
  <script type='text/javascript' src='https://cdn.scaledrone.com/scaledrone.min.js'></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <style>

    video {
      max-width: calc(48% - 90px);
      margin: 0 50px;
      box-sizing: border-box;
      border-radius: 2px;
      padding: 0;
      box-shadow: rgba(156, 172, 172, 0.2) 0px 2px 2px, rgba(156, 172, 172, 0.2) 0px 4px 4px, rgba(156, 172, 172, 0.2) 0px 8px 8px, rgba(156, 172, 172, 0.2) 0px 16px 16px, rgba(156, 172, 172, 0.2) 0px 32px 32px, rgba(156, 172, 172, 0.2) 0px 64px 64px;
    }
    .copy {
      margin-top: 30px;
      left: 50%;
      font-size: 16px;
      color: rgba(0, 0, 0, 0.5);
      text-align: center;
    }
  </style>
</head>
<body>
<div class="row-sm-7 page" style="padding-top: 50px" align="center">
  <br><br>
  <legend class="text-center header" style="color: #36A0FF; font-size: 27px; font-family: 'Jua', sans-serif;">Video Call</legend>	
  <video id="localVideo" autoplay muted style="margin-top: 50px;"></video>
  <video id="remoteVideo" autoplay></video>
  <div class="copy" style="font-family: 'Jua', sans-serif;">Send your URL to a friend to start a video call</div>
</div>
<script type="text/javascript" src="/resources/js/VideoIndex.js"></script>
</body>
</html>