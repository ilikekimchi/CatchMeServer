	// 1 == '1' => value(값)이 같으면 true, |  1 === '1' => type과 value 가 같아야 하므로 false
	// confirmId 에서 사용한 코드들 = 에이젝, 즉 에이젝을 사용함
	function confirmId(){
		// 에이젝을 사용하기 위한 객체생성
		const form = document.signupForm;
		
		const xhr = new XMLHttpRequest();
		
		// AJAX(페이지 전체가 아니라 필요한 부분만을 갱신할 수 있도록 서버에 요청하는것) 비동기적 **
		// 비동기방식(true),에이젝의 제대로된 성능을 내려면 비동기 방식 채용
		xhr.open("GET", "confirmId?customerId=" + form.customerId.value, true);  
		
		xhr.onreadystatechange = function() {
			// DONE(처리가 됨)인 상태가 된다면..
			if(xhr.readyState == XMLHttpRequest.DONE) {
				
				// AJAX 요청이 정상적으로 처리되었는지 아닌지만을 검사하기 위해 응답 코드가 200 인지 확인
				// 200(성공): 서버가 요청을 제대로 처리했다는 뜻이다. 
				if(xhr.status == 200) {
					if(xhr.responseText == 'OK') { 
						alert("사용할수 있는 아이디 입니다");
						form.id_confirm.value = form.customerId.value;
						
					} else {
						alert('다른 사용자가 이미 사용하고 있는 아이디 입니다');
					}
				}
			}	
		};
		
		xhr.send();
		
	}
	
	// 벨리데이션(검증)하는 코드들
	function submit() {
		const form = document.signupForm;
		
		if(form.customerId.value != form.id_confirm.value) {
			alert('아이디 중복확인을 하세요');
			return;
		}
		
		if(form.customerId.value == "") {
			alert('아이디를 입력 해 주세요');
			form.customerId.focus();
			return;
		}
		
		if(form.customerPw.value == "") {
			alert('비밀번호를 입력 해 주세요');
			form.customerPw.focus();
			return;
		}
		if(form.passwd_confirm.value == "") {
			alert('비밀번호 재확인을 입력 해 주세요');
			form.passwd_confirm.focus();
			return;
		}
		
		if(form.customerPw.value != form.passwd_confirm.value) {
			alert('비밀번호가 일치하지 않습니다');
			form.passwd_confirm.value = "";
			form.passwd_confirm.focus();
			return;
		}
		if(form.customerName.value == "") {
			alert('이름을 입력 해 주세요');
			form.customerName.focus();
			return;
		}
		if(form.customerNnm.value == "") {
			alert('닉네임을 입력 해 주세요');
			form.customerNnm.focus();
			return;
		}
		form.submit();
	}