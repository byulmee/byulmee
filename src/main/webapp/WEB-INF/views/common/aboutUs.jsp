<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="keywords" content="Byulmee, 취미, 활동, 매칭, 플리마켓">
	<meta name="description" content="세상의 별난 취미 다 모여라! 취미 매칭 플랫폼 별미">
	<meta name="author" content="javaBom">
	<meta name="application-name" content="별미">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>별미_About us</title>
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="resources/css/common/aboutUs.css">
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/typeit@7.0.4/dist/typeit.min.js"></script>
</head>
<body>

	<c:import url="gnb.jsp"/>
	
    <div class="wrapper">
        <div class="cover"></div>
        <video class="video-frame" muted autoplay loop data-aos="fade-in" data-aos-duration="1500">
            <source src="resources/images/aboutUs/video1.mp4" type="video/mp4">
            <strong>Your're browser dose not support the video tag</strong>
        </video>

        <div class="title typewriter type_text" >
        </div>
        <div class="title">
            <h1></h1>
        </div>

        <div class="content-wrapper">
            <div class="content-box" data-aos="fade-right"  data-aos-easing="ease-in-out" data-aos-duration="1000">
                <div class="content-img">
                    <img class="img-item" src="resources/images/aboutUs/about1.jpg">
                </div>
                <div class="content-text">
                    <span>새로운 취미 탐색</span>
                    <p>
                       	똑같은 일상에 지친 당신에게 새로운 취미 활동을 제안합니다.<br>
                       	뭔가 새로운 활동을 즐기고 싶은데 막상 떠오르는 것이 없다면?<br>
                        별미에서 찾아보세요!<br>
                        액티비티, 리빙, 건강/미용, 힐링, 푸드, 커리어<br>6가지 분야의 활동을 살펴볼 수 있어요.<br>
                    </p>
                </div>
            </div>
        </div>

        <div class="content-wrapper">
            <div class="content-box" data-aos="fade-left"  data-aos-easing="ease-in-out" data-aos-duration="1000">
                <div class="content-text">
                    <span>취미 활동 기획</span>
                    <p>
                        별미는 전문가, MD가 기획한 프로그램뿐만 아니라<br> 일반인이 직접 기획한 참신한 취미도 발굴하고 있습니다.<br>혼자만 즐기기 아쉬운 취미를 가지고 있나요?<br>함께 취미를 즐길 사람을 찾고 있다면<br>지금 바로 별미에 스타 신청하고 새로운 활동을 기획해보세요!
                    </p>
                </div>
                <div class="content-img">
                    <img src="resources/images/aboutUs/about2.jpg">
                </div>
            </div>
        </div>

        <div class="content-wrapper">
            <div class="content-box" data-aos="fade-right"  data-aos-easing="ease-in-out" data-aos-duration="1000">
                <div class="content-img">
                    <img src="resources/images/aboutUs/about3.jpg">
                </div>
                <div class="content-text">
                    <span>취미로 수익 창출</span>
                    <p>
                        취미 활동으로 가벼워지는 지갑이 걱정인가요?<br>
                        별미는 취미 활동으로 수익을 창출할 수 있어요.<br>
                        직접 만든 취미나 작품을 판매하여 수익을 얻을 수 있어요.<br>
                       	스타 신청하고 돈 되는 취미로 발전 시켜보세요!
                    </p>
                </div>
            </div>
        </div>

        <div class="content-wrapper last">
            <div class="content-text" class="content-box" data-aos="slide-up" data-aos-easing="ease-in-out" data-aos-duration="1100">
                    <p>취미로 일상에 변화를 주고싶다면,</p>
                    <h2>지금 바로 별미하세요!</h2>
            </div>
            <div class="content-btn" data-aos-delay="500"  data-aos="zoom-out" data-aos-easing="ease-in-out" data-aos-duration="900">
                <span class="btn-before">취미 검색은</span>
                <img class="btn-after bmLogo" src="resources/images/common/logo.png" alt="별미 바로가기">&nbsp;&nbsp;&nbsp;
				<span class="btn-before">프리마켓 검색은</span>
				<img class="btn-after mkLogo" src="resources/images/common/marketlogo.png" alt="별미 마켓 바로가기">
            </div>
        </div>
    </div>
	
	<c:import url="footer.jsp"/>
	
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
        new TypeIt(".type_text", {
            speed: 130,
            loop: true,
            loopDelay: 3000,
            waitUntilVisible: true
        }).type("당신의 뻔한 일상?").pause(1200).move(-5).delete(-1).type('<span style="color:#FF6833">FUN</span>').move(5).delete(1).type("!").pause(1800).delete(12).type('별난 취미 <span style="color:#FF6833">별미</span>에서<br>새로운 취미를 만들어보세요!').pause(4000).go();
        
        AOS.init();
        
        $(".hover").mouseleave(
     		  function () {
     		    $(this).removeClass("hover");
     		  }
        );
        
        $('.bmLogo').click(() => {
        	location.href='home.do';
        });
        
        $('.mkLogo').click(() => {
        	location.href='pList.pd';
        });
    </script>
</body>
</html>