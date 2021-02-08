<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/admin/admin_main.css">
</head>

<body>
 	<header class="navbar">
		<span class="navbar_logo">
			<a onclick="location.href='home.do'"><img src="resources/images/admin/byulmee.PNG" alt="별미 로고" width="200"></a>
		</span>
		
		<span class="navbar_name">관리자 페이지
		
		</span>
	</header>
	  	<div class="wrapper">
	       		<ul>
					<li> <a onclick="location.href='adminMain.ad'" class="b1">매출관리</a>
					<li> <a onclick="location.href='adminMember.ad'" class="b2">회원관리</a>
					<li> <a onclick="location.href='adminNotice.ad'" class="b3">게시글관리</a>
					<li> <a onclick="location.href='adminBanner.ad'" class="b4">배너관리</a>
				</ul>
	  	</div>
	  	
	  	<div class="outer">	
			<h2 align="center">오늘의 별미현황</h2>
			
			<div class="idlook">
			<table id="idlookup">
					<tr>
	     				<th align="center">새 회원 </th>
	          			<th align="center">누적 회원</th>
	          			<th align="center">활동 매출</th>
	           			<th align="center">상품 매출</th>
	          	 		<th align="center">총 매출</th>
	       			</tr>
	       			<tr>
	                  <td align="center">${mResult }</td>
	                  <td align="center">${tmResult }</td>
	                  <td align="center">${aoResult }</td>
	                  <td align="center">${poResult }</td>
	                  <td align="center">${oResult }</td>
	               </tr>
	       		</table>
	       	</div>
	       	<h2 align="center">월 매출 그래프</h2>
	       	<div class="op2" align="center">
			    <label>연도 선택</label>
	      		<select id="searchCondition2" name="searchCondition2">
	      			<option value="2021">2021</option>
	        		<option value="2020">2020</option>
	         		<option value="2019">2019</option>
	         		<option value="2018">2018</option>
	         		<option value="2017">2017</option>
	      		</select>
      		</div>
      		<div id="top_x_div" style="width: 500px; height: 300px;"></div>
 
<!--       		<br> -->
<!--       		<h2 align="center">기간 별 매출 내역</h2> -->
<!--       		<div class=money align="center"> -->
<!--       			<label>기간</label> -->
<!--       			<input text-align="center" placeholder="20.12.01"/>~<input text-align="center" placeholder="20.12.11"/> -->
<!--       			<button>조회</button> -->
<!--       		</div> -->
      		
<!-- 	       	<div class="idlist"> -->
<!-- 			<table id="idTable"> -->
<!-- 				<tr> -->
<!--            			<th align="center">날짜</th> -->
<!--            			<th align="center">활동 매출</th> -->
<!--            			<th align="center">상품 매출</th> -->
<!--            			<th align="center">일 매출 합계</th> -->
<!--            		</tr> -->

<!--            		<tr> -->
<!--                   <td align="center"></td> -->
<!--                   <td align="center"></td> -->
<!--                   <td align="center"></td> -->
<!--                   <td align="center"></td> -->
<!--                 </tr> -->

                
				
<!--            		<tr> -->
<!--                   <td align="center">20.12.02 수</td> -->
<!--                   <td align="center">500,000</td> -->
<!--                   <td align="center">300,000</td> -->
<!--                   <td align="center">800,000</td> -->
<!--                 </tr> -->
<!--            		<tr> -->
<!--                   <td align="center">20.12.03 목</td> -->
<!--                   <td align="center">500,000</td> -->
<!--                   <td align="center">300,000</td> -->
<!--                   <td align="center">800,000</td> -->
<!--                 </tr> -->
<!--            		<tr> -->
<!--                   <td align="center">20.12.04 금</td> -->
<!--                   <td align="center">500,000</td> -->
<!--                   <td align="center">300,000</td> -->
<!--                   <td align="center">800,000</td> -->
<!--                 </tr> -->
<!--            		<tr> -->
<!--                   <td align="center">20.12.05 토</td> -->
<!--                   <td align="center">500,000</td> -->
<!--                   <td align="center">300,000</td> -->
<!--                   <td align="center">800,000</td> -->
<!--                 </tr> -->
<!--            		<tr> -->
<!--                   <td align="center">20.12.06 일</td> -->
<!--                   <td align="center">500,000</td> -->
<!--                   <td align="center">300,000</td> -->
<!--                   <td align="center">800,000</td> -->
<!--                 </tr> -->
<!--            		<tr> -->
<!--                   <td align="center">20.12.07 월</td> -->
<!--                   <td align="center">500,000</td> -->
<!--                   <td align="center">300,000</td> -->
<!--                   <td align="center">800,000</td> -->
<!--                 </tr> -->
<!--            		<tr> -->
<!--                   <td align="center">20.12.08 화</td> -->
<!--                   <td align="center">500,000</td> -->
<!--                   <td align="center">300,000</td> -->
<!--                   <td align="center">800,000</td> -->
<!--                 </tr> -->
<!--            		<tr> -->
<!--                   <td align="center">20.12.09 수</td> -->
<!--                   <td align="center">500,000</td> -->
<!--                   <td align="center">300,000</td> -->
<!--                   <td align="center">800,000</td> -->
<!--                 </tr> -->
<!--            		<tr> -->
<!--                   <td align="center">20.12.10 목</td> -->
<!--                   <td align="center">500,000</td> -->
<!--                   <td align="center">300,000</td> -->
<!--                   <td align="center">800,000</td> -->
<!--                 </tr> -->
<!--            		<tr> -->
<!--                   <td align="center">20.12.11 금</td> -->
<!--                   <td align="center">500,000</td> -->
<!--                   <td align="center">300,000</td> -->
<!--                   <td align="center">800,000</td> -->
<!--                 </tr> -->

           	</table>
           	
         </div>
	  	</div>
	  	
</body>
<script>	
	function drawStuff(items) {
	  var data = new google.visualization.arrayToDataTable(items);
	
	  var options = {vAxis: { format: 'decimal' },
	    width: 800,
	    height: 500,
	    legend: { position: 'none' },
	    chart: {
	      title: 'byulmee',
	      subtitle: 'Month sales' },
	    axes: {
	      x: {
	        0: { side: 'top', label: '월별 매출'} // Top x-axis.
	      }
	    },
	    bar: { groupWidth: "90%" }
	  };
	
	  var chart = new google.charts.Bar(document.getElementById('top_x_div'));
	  // Convert the Classic options to Material options.
	  chart.draw(data, google.charts.Bar.convertOptions(options));
	};
	
	function makeChart() {
		const ajax = $.ajax;
		const year = $('#searchCondition2').val();
		ajax({
			url: '/api/admin/orders/monthly/sales?year=' + year,
			type: 'GET',
		}).then(function (response) {
			let items = [];
			items.push(['Move', 'Percentage']);

			response.map(function (item) {
				items.push([item.MONTH, item.SALES]);
			});
			
			drawStuff(items);
		})
	}
	
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(makeChart);
	
	$('#searchCondition2').unbind().bind('change', makeChart);
</script>
</html>