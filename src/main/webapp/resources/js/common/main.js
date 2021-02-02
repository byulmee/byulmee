/**
 * 
 */

'use strict!';
(() => {
	/***** by.다혜: 메인 추천 게시글 추가 스크립트 *****/
	async function getBoardData() {
		let response = await fetch('loadMainPopAct.do');
		let data = await response.json();
		
		await loadList(data);
	}

	function loadList(data) {
		const popAct = data.popularActList;
		const nedAct =data.nearEndDateActList;
		const popPro =data.popularProList;
		let ranNo;
		let randomList;
		let popActList = '';
		let neActList = '';
		let popProList = '';
		
		//인기 활동
		ranNo = getRandomNumber();
		randomList = getRandomList(ranNo, popAct);
		
		for(let i in randomList) {
			let list = '<li class="list-item item1">'
						+ 	'<input type="hidden" name="actNo" value="' + randomList[i].actNo + '"/>'
						+	'<div class="img-frame">'
	                  	+			'<img class="list-thumb" src="resources/auploadFiles/' + randomList[i].image.imgName + '" alt="' + randomList[i].actTitle  + '">'
	                  	+	'</div>'
	                  	+	'<span>' + randomList[i].member.memNickname + '</span>'
	                  	+	'<div class="list-cate">' + randomList[i].actTitle + '</div>'
	                  	+	'<span class="list-price"><i class="fas fa-receipt"></i>' + randomList[i].actPrice + '원</span>'
	                  	+	'<span class="list-social">⭐' + randomList[i].actRating + ' / ' + randomList[i].actReviewCnt + '개의 평가</span>'
	           		  	+'</li>';
			popActList += list;
		}
		$(".popAct").html(popActList);
		
		//마감일 임박 활동
		for(let i in nedAct) {
			
			let list = '<li class="list-item item1">'
						+ 	'<input type="hidden" name="actNo" value="' + nedAct[i].actNo + '"/>'
						+	'<div class="img-frame">'
	                  	+			'<img class="list-thumb" src="resources/auploadFiles/' + nedAct[i].image.imgName + '" alt="' + nedAct[i].actTitle  + '">'
	                  	+	'</div>'
	                  	+	'<span>' + nedAct[i].member.memNickname + '</span>'
	                  	+	'<div class="list-cate">' + nedAct[i].actTitle + '</div>'
	                  	+	'<span class="list-price"><i class="fas fa-receipt"></i>' + nedAct[i].actPrice + '원</span>'
	                  	+	'<span class="list-social">⭐' + nedAct[i].actRating + ' / ' + nedAct[i].actReviewCnt + '개의 평가</span>'
	           		  	+'</li>';
			neActList += list;
		}
		$(".nedAct").html(neActList);
		
		//플리마켓 인기 상품
		ranNo = getRandomNumber();
		randomList = getRandomList(ranNo, popPro);
		console.log(randomList);
		
		for(let i in randomList) {
			let list = '<li class="list-item item1">'
						+ 	'<input type="hidden" name="proNo" value="' + randomList[i].proNo + '"/>'
						+	'<div class="img-frame">'
	                  	+			'<img class="list-thumb" src="resources/auploadFiles/' + randomList[i].image.imgName + '" alt="' + popPro[i].proTitle  + '">'
	                  	+	'</div>'
	                  	+	'<span>' + randomList[i].member.memNickname + '</span>'
	                  	+	'<div class="list-cate">' + randomList[i].proTitle + '</div>'
	                  	+	'<span class="list-price"><i class="fas fa-receipt"></i>' + randomList[i].proPrice + '원</span>'
	                  	+	'<span class="list-social">⭐' + randomList[i].proRating + ' / ' + randomList[i].proReviewCnt + '개의 평가</span>'
	           		  	+'</li>';
			popProList += list;
		}
		$('.popPro').html(popProList);
	}
	getBoardData();
	
	//게시글 클릭 이벤트 정의
	const paUl = document.querySelector('#popularActList');
	const neUl = document.querySelector('#nearEndDateActList');
	const ppUl = document.querySelector('#popularProduct');
	
	
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
		
		function isSameNum(no) {
			return noArr.find((e) => (e === no));
		}
		return noArr;
	}
	
	//getRandomNum()으로 받아온 5개 인덱스를 사용하여 50개 중 5게 게시글 추
	function getRandomList(noArr, dataList) {
			
			let randomList = [];
			for(let i in noArr) {
				randomList[i] = dataList[noArr[i]];
			}
		return randomList;
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
	
	//이미지 배너 가져오기
})();
