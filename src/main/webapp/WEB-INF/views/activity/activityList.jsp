<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>활동조회 페이지</title>
</head>
<style>
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


body{
   width: 100%;
   margin: 0 auto;
   font-family: 'GmarketSansMedium';
}
   }
nav ul li {
   display: inline;   
   border-right: 1px solid pink;
   padding: 0px 5px;
   
   float: right;
}
nav ul li a:hover {
   color: black;
}

h4{
   color: orange;
}

#image:hover{transform: perspective(300px) translateZ(100px);}

#price{color: black;}

ul { 
  list-style: none;
  margin: 0;
  padding: 0;
} 

header, footer, nav, section, article, hgroup, figure {
  display: block; 
}
legend {
  display: none;
}
a {
  color: #808080;
  text-decoration: none;
}
a:hover{
  color: #e51837;
}
p {
  margin: 0 0 1em;
}

a img {
  border: 0;
  outline: 0;
}

.inner {
  display: table-row;
  overflow: hidden;
}
.image {
  display: table-cell;
  vertical-align: middle;
  width: 100%;
  padding-right: 1em;
}
.image img {
  display: block;
  width: 100%;
  height: auto;
}
.li-text {
  display: table-cell;
  vertical-align: middle;
  width: 60%;
}
.li_name {
  margin: 0;
}
.li_sub {
  margin: 0;
  color: black;
}

@media all and (min-width: 40em) {
  .list {
    padding: 0.5em;
    max-width: 70em;
    margin: 0 auto;
    overflow: hidden;
  }
  .list li {
    padding: 0.5em;
    display: block;
    width: 50%;
    float: left;
    background: none;
    border: 0;
  }
  .inner {
    display: block;
  }
  .li-img, .li-text, .inner {
    display: block;
    width: auto;
    padding: 0;
  }
  .li-text {
    padding: 0.5em 0;
  }
}

@media all and (min-width: 60em) {
  .list li {
    width: 18.5%;
    height: 100%;
  }
}

</style>
<body>
<%-- 
   <%@ include file="../common/menubar.jsp" %>
--%>
         
<nav>
   <ul>
      <li><a href=""><strong>로그인</strong></a></li>
      <li><a href=""><strong>마이페이지</strong></a></li>
      <li><a href=""><strong>고객센터</strong></a></li>
      <li id=""><a href=""><strong>별미마켓</strong></a></li>
   </ul>
</nav>
   <h1><strong>Byulmee</strong></h1>
   <form class="Serach">
            <input class="form-control mr-sm-2" type="search" placeholder="텃밭 가꾸기"
               aria-label="Search" id="Serach">
            <button onClick="search()"
               class="btn btn-primary" type="button">검색</button>
   </form>   
   
   
   <div class=" "style="margin-left: 520px; font-size: 27px; font-weight: bold;">
   <span style="display: inline-block; text-align: center; color:orange;">별</span>난취<span style="color: orange;">미</span> 리스트
   </div>
   <br>
   
   <table>
               <tr>
                  <th style = "background-color:#eeeeee; text-align:center;" width="830px;"></th>
                  <th style = "background-color:#eeeeee; text-align:center;" width="530px;"></th>
                  <th style = "background-color: orange; text-align:center;" width="300px;"></th>               
                  <th style = "background-color:#eeeeee; text-align:center;" width="480px;"></th>
               </tr>         
   </table>
   
   <div id="searchArea" align="right">
      <select id="searchCondition" name="searchCondition">
         <option value="">인기순</option>
         <option value=""><a href="http://www.naver.com">최신순</a></option>
         <option value="">가격순</option>
         <option value="">리뷰순</option>
      </select>
   </div>
   <div id="pattern" class="pattern">
    <ul class="list img-list">
         <li>
            <a href="#" class="inner" onclick="location.href='activityDetail.ac?acId=3'">
                <div class="image" style="width:140px;">
                    <img src="./images/1.PNG" id="image"alt="텃밭"  />
                </div>
                <div class="li-text" onclick="goThumnail();">
                    <h5 class="li_name">정찬오</h5><br>
                   <p class="li_sub" onclick="li_sub();">[힐링] 나만의 텃밭 가꾸기</p>
                      <img src="./images/F_Price.PNG" id="" alt="star"/><strong id="price">50000원</strong><br>
                  <p><img src="./images/F_Star.PNG" id="" alt="star"/>4.8 1891개의 평가</p>
                </div>
            </a>
        </li>
     <li>
            <a href="#" class="inner">
                <div class="image" style="width:140px;">
                    <img src="./images/1.PNG"id="image"alt="텃밭" />
                </div>
                <div class="li-text">
                    <h5 class="li_name">팀장</h5>
                    <p class="li_sub" onclick="li_sub();">[힐링] 나만의 텃밭 가꾸기</p>
                     <img src="./images/F_Price.PNG" id="" alt="star"/><strong id="price">50000원</strong><br>
                    <img src="./images/F_Star.PNG" id="" alt="star"/>4.8 1891개의 평가
                </div>
            </a>
        </li>
     <li>
            <a href="#" class="inner">
                <div class="image" style="width:140px;">
                    <img src="./images/1.PNG"id="image"alt="텃밭" />
                </div>
                <div class="li-text">
                    <h5 class="li_name">반장</h5>
                   <p class="li_sub">[힐링] 나만의 텃밭 가꾸기</p>
                    <img src="./images/F_Price.PNG" id="" alt="star"/><strong id="price">50000원</strong><br>
                    <img src="./images/F_Star.PNG" id="" alt="star"/>4.8 1891개의 평가
                </div>
            </a>
        </li>
         <li>
            <a href="#" class="inner">
                <div class="image" style="width:140px;">
                    <img src="./images/1.PNG"id="image"alt="텃밭"  />
                </div>
                <div class="li-text">
                    <h5 class="li_name">스프링</h5>
                    <p class="li_sub">[힐링] 나만의 텃밭 가꾸기</p>
                    <img src="./images/F_Price.PNG" id="" alt="star"/><strong id="price">50000원</strong><br>
                    <img src="./images/F_Star.PNG" id="" alt="star"/>4.8 1891개의 평가
                </div>
            </a>
        </li>
         <li>
            <a href="#" class="inner">
                <div class="image" style="width:140px;">
                    <img src="./images/1.PNG"id="image"alt="텃밭" />
                </div>
                <div class="li-text">
                    <h5 class="li_name">하탁게</h5>
                    <p class="li_sub">[힐링] 나만의 텃밭 가꾸기</p>
                   <img src="./images/F_Price.PNG" id="" alt="star"/><strong id="price">50000원</strong><br>
                    <img src="./images/F_Star.PNG" id="" alt="star"/>4.8 1891개의 평가
                    
                </div>
            </a>
        </li>
    
        
    </ul>
    
     <ul class="list img-list">
         <li>
            <a href="#" class="inner">
                <div class="image">
                    <img src="./images/텃밭.PNG" id="image"alt="텃밭" />
                </div>
                <div class="li-text" onclick="goThumnail();">
                    <h5 class="li_name">정찬오</h5>
                   <p class="li_sub" onclick="li_sub();">[힐링] 나만의 텃밭 가꾸기</p>
                      <img src="./images/F_Price.PNG" id="" alt="star"/><strong id="price">50000원</strong><br>
                    <img src="./images/F_Star.PNG" id="" alt="star"/>4.8 1891개의 평가
                </div>
            </a>
        </li>
     <li>
            <a href="#" class="inner">
                <div class="image">
                    <img src="./images/귤나무.PNG"id="image"alt="텃밭" />
                </div>
                <div class="li-text">
                    <h5 class="li_name">팀장</h5>
                    <p class="li_sub" onclick="li_sub();">[힐링] 나만의 텃밭 가꾸기</p>
                     <img src="./images/F_Price.PNG" id="" alt="star"/><strong id="price">50000원</strong><br>
                    <img src="./images/F_Star.PNG" id="" alt="star"/>4.8 1891개의 평가
                </div>
            </a>
        </li>
     <li>
            <a href="#" class="inner">
                <div class="image">
                    <img src="./images/딸기.PNG"id="image"alt="텃밭" />
                </div>
                <div class="li-text">
                    <h5 class="li_name">반장</h5>
                   <p class="li_sub">[힐링] 나만의 텃밭 가꾸기</p>
                    <img src="./images/F_Price.PNG" id="" alt="star"/><strong id="price">50000원</strong><br>
                    <img src="./images/F_Star.PNG" id="" alt="star"/>4.8 1891개의 평가
                </div>
            </a>
        </li>
         <li>
            <a href="#" class="inner">
                <div class="image">
                    <img src="./images/포도.PNG"id="image"alt="텃밭" />
                </div>
                <div class="li-text">
                    <h5 class="li_name">스프링</h5>
                    <p class="li_sub">[힐링] 나만의 텃밭 가꾸기</p>
                    <img src="./images/F_Price.PNG" id="" alt="star"/><strong id="price">50000원</strong><br>
                    <img src="./images/F_Star.PNG" id="" alt="star"/>4.8 1891개의 평가
                </div>
            </a>
        </li>
         <li>
            <a href="#" class="inner">
                <div class="image">
                    <img src="./images/텃밭.PNG"id="image"alt="텃밭" />
                </div>
                <div class="li-text">
                    <h5 class="li_name">하탁게</h5>
                    <p class="li_sub">[힐링] 나만의 텃밭 가꾸기</p>
                   <img src="./images/F_Price.PNG" id="" alt="star"/><strong id="price">50000원</strong><br>
                    <img src="./images/F_Star.PNG" id="" alt="star"/>4.8 1891개의 평가
                    
                </div>
            </a>
        </li>
    
        
    </ul>
</div>

      <footer id="" class="" align="center">
         <button class="" id="" onclick=""><</button>
         <button class="" id="" onclick="">1</button>
         <button class="" id="" onclick="">2</button>
         <button class="" id="" onclick="">3</button>
         <button class="" id="" onclick="">...</button>
         <button class="" id="" onclick="">38</button>
         <button class="" id="" onclick="">></button>
      </footer>

<script>
   function goThumnail() {
      location.href='<%= request.getContextPath()%>/Thumnail.me';
   }
</script>

</body>

</html>