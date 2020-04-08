<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
<script>

var player;
//var url='WFqkyuU49aE';

try {
	
	
    player = new YT.Player('playerLayer1', {
        height: '520',
        width: '1016',
        videoId:'WFqkyuU49aE',
        playerVars: {
            'autoplay': 1,      // 자동실행여부
            'controls': 1,      // 재생컨트롤 노출여부
            'autohide': 0,      // 재생컨트롤이 자동으로 사라질지의 여부
            'rel': 0,           // 동영상 재생완료 후 유사동영상 노출여부
            'wmode': 'transparent'
        },
        events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
        }
    });
} catch (e) {
	
}

//유튜브 플레이어가 다 만들어지면 호출됨
function onPlayerReady(event) {
    // 자동으로 플레이하는 코드
    //alert("준비됨");
    event.target.playVideo(); 
}

// 동영상의 재생이 완료되었을 때 호출됨
function onPlayerStateChange(event) {
    if (event.data === 0) {
        // 종료 후 작업을 여기에 코딩
        $("#playerLayer1").detach(); 
    }
} 
</script>
</head>
<body>
<div id="playerLayer1" class="ivideo"></div>
</body>
</html>