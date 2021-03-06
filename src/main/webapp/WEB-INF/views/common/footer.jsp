<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>footer</title>
    <link rel="stylesheet" href="resources/css/common/footer.css">
</head>
<body>
    <footer id="fot">
        <div class="link">
            <span id="goToAbout">About Us</span>
            <span id="goToCustomerService">고객문의</span>
            <a href="#">맨위로</a>
        </div>
        <div class="info">
            <p>
                서울시 강남구 역삼동 테헤란로14길6 남도빌딩 3F<br />TEL.1544-9970 | 책임자: J.Son
            </p>
        </div>
        <div class="rights">
            <a href="home.do"><img src="resources/images/common/logo.png" alt="별미body"></a> copyright Ⓒ 2020 JavaBom All Right Reserved
        </div>
    </footer>
    <script>
    	document.getElementById('goToAbout').addEventListener('click', () => {
    		location.href = "aboutUs.do";
    	});
    	
    	document.getElementById('goToCustomerService').addEventListener('click', () => {
    		location.href = "ccView.bo";
    	});
    </script>
</body>
</html>