/**
 * 
 */

'use strict!';

(() => {
	let banUrl ='';
	/***** by.다혜: 메인 추천 게시글 추가 스크립트 *****/
	async function getMainContent() {
		let response = await fetch('loadMainContent.do');
		let data = await response.json();
		
		if(response.status === 200) {
			return data;
		} else {
			throw new HttpError(response);
		}
	}
	
	getMainContent().then((data) => {
		//인기 활동
		let popActList = loadList(data.popularActList);
		document.querySelector('#popularActList').innerHTML += popActList;
		
		//마감일 임박 활동
		let neActList = loadList(data.nearEndDateActList);
		document.querySelector('#nearEndDateActList').innerHTML += popActList;
		
		//인기 상품
		let popProList = loadList(data.popularProList);
		document.querySelector('#popularProduct').innerHTML += popProList;
	
		//배너
		let imgDataList = data.bannerList;
		let bannerSection = document.querySelector('#ban');
		let banImg = document.querySelector('.ban-img');
	
		if(imgDataList.length > 0) {
			bannerSection.display = '';
			let randomBanner = getBanImg(imgDataList);
			
			banImg.src = 'resources/piUploadFiles/' + randomBanner.banOrigin;	
			banImg.alt = randomBanner.banAlt;
			banUrl = randomBanner.banUrl;
		} else {
			bannerSection.style.display = 'none';
		}
	});
	
	//화면에 노출할 데이터를 뽑는 메소드
	function loadList(listSet) {
		let randomList;
		let resultView = '';
		let listTag = '';
		
		randomList = getRandomList(listSet);
		
		for(let i = 0; i<randomList.length; i++) {
			if(randomList[i] != null) {
				let actCategory = randomList[i].actCategory;
				switch(actCategory) {
					case 0: actCategory = '액티비티'; break;
					case 1: actCategory = '리빙'; break;
					case 2: actCategory = '건강/미용'; break;
					case 3: actCategory = '힐링'; break;
					case 4: actCategory = '푸드'; break;
					case 5: actCategory = '커리어'; break;
				}
				
				listTag = '<li class="list-item">'
							+ 	'<input type="hidden" name="actNo" value="' + randomList[i].actNo + '"/>'
							+	'<div class="img-frame">'
		                  	+			'<img class="list-thumb" src="resources/auploadFiles/' + randomList[i].image.imgName + '" alt="' + randomList[i].actTitle  + '">'
		                  	+	'</div>'
		                  	+	'<span>' + randomList[i].member.memNickname + '</span>'
		                  	+	'<div class="list-cate">[' + actCategory + '] ' + randomList[i].actTitle + '</div>'
		                  	+	'<span class="list-price"><i class="fas fa-receipt"></i>' + addComma(randomList[i].actPrice) + '원</span>'
		                  	+	'<span class="list-social">⭐ <b>' + randomList[i].actRating + '</b>  ' + addComma(randomList[i].actReviewCnt) + '개의 평가</span>'
		           		  	+'</li>';
				resultView += listTag;
			}
		}
		return resultView;
	}

	//getRandomNum()으로 받아온 5개 인덱스를 사용하여 50개 중 5개 게시글 추출,
	//단 게시글이 50개 미만일 경우 순서대로 top5만 randomlist에 담음
	function getRandomList(dataList) {
			let randomList = [];
			
			if(dataList.length < 50) {
				for(let i = 0; i < 5; i++) {
					if(dataList[i] != null) {
						randomList[i] = dataList[i];
					} else {
						break;
					}
				}
			} else {
				let noArr = getRandomNumber();
				for(let i = 0; i < noArr.length; i++)
					randomList[i] = dataList[noArr[i]];
			}
			return randomList;
	}
	
	//5개의 중복되지 않는 랜덤 함수를 추출하는 함수
	function getRandomNumber() {
		
		let noArr = [];
		
		for(let i = 0; i < 5; i++) {
			let ranNo = Math.floor(Math.random() * 50 + 1);
			if(!isSameNum(ranNo)) {
				noArr[i] = ranNo;
			} else {
				i--;
			}
		}
		
		//중복된 숫자인지 확인하는 함수
		function isSameNum(no) {
			return noArr.find((e) => (e === no));
		}
		return noArr;
	}
	
	//메인 활동/상품 콘텐츠 리스트 클릭 이벤트 정의
	$('#popularActList').on('click','li', function(event){
		event.preventDefault();
		let boardNo = event.currentTarget.childNodes[0].value;
		location.href='http://localhost:9380/activityDetail.ac?acId=' + boardNo;
	});
	
	$('#nearEndDateActList').on('click','li', function(event){
	    event.preventDefault();
		let boardNo = event.currentTarget.childNodes[0].value;
		location.href='http://localhost:9380/activityDetail.ac?acId=' + boardNo;
	});
	
	$('#popularProduct').on('click','li', function(event){
	    event.preventDefault();
		let boardNo = event.currentTarget.childNodes[0].value;
		location.href='http://localhost:9380/productDetail.pd?pdId=' + boardNo;
	});
	
	document.querySelector('#ban').addEventListener('click', () => {
		location.href = banUrl;
	});
	
	//콤마 추가하는 메소드
	function addComma(num) {
  		var regexp = /\B(?=(\d{3})+(?!\d))/g;
  	return num.toString().replace(regexp, ',');
	}

	//배너 추가 메소드
	function getBanImg(imgDataList) {
		
		let ranNo =  Math.floor(Math.random() * imgDataList.length);
		return imgDataList[ranNo];
	}
	
	
	//제출 전 검색어 검증
	/***** by.다혜: 검색 관련 스크립트 *****/
	document.querySelector('#searchBar').addEventListener('keypress', e => {
		let keyword =  document.querySelector('#searchBar').value;
		let trimedKeyword = keyword.replace(/^\s+|\s+$/gm,'').replace(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi, '');
		
		if(e.key === 'Enter' && trimedKeyword != '' && trimedKeyword != null && isEmptyKeyword(trimedKeyword) == false) {
			location.href = 'searchAct.do?keyword=' + keyword;
		}
	});
	
	document.querySelector('.fa-search').addEventListener('click', () => {
		let keyword =  document.querySelector('#searchBar').value;
		let trimedKeyword = keyword.replace(/^\s+|\s+$/gm,'').replace(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi, '');
		
		if(trimedKeyword != '' && trimedKeyword != null && isEmptyKeyword(trimedKeyword) == false) {
			location.href = 'searchAct.do?keyword=' + keyword;
		}
	});
	
	//공백만 입력했는지 검증하는 함수
	function isEmptyKeyword(word) {
		if(word.trim() === '') {
			return true;
		}
		return false
	}
})();