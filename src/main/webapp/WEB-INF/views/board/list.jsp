<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/profile-img.css" rel="stylesheet" />
</head>
<body>
	<div>
		<div>
			<div><h3>전체 명함</h3></div>
			<div>
			<!--<form method="get" action="">
			<div class="search">
				<span>
					<select name="search">
						<option value="0">선택</option>
						<option value="1" ${pager.search == 1 ? 'selected' : ''}>Test</option>
					</select>
				</span>
				<span>
					<input type="text" name="keyword" placeholder="검색어를 입력해 주세요" value="${pager.keyword}">
				</span>
				<span>
					<input type="submit" value="검색" class="button">
				</span>
				</div>
			</form>-->
		</div>		
			<div>
				<table border="1">
					<thead>
						<tr>
						<!-- 기본정보 -->
							<th>아이디</th>
							<th>이력서 번호</th>
							<th>얼굴 이미지</th>
							<th>성별</th>
							<th>이름</th>
							<th>연락처</th>
							<th>주소</th>
							<th>생년월일</th>
						<!-- 기본정보 -->
						
						<!-- 학력 -->
							<th>학교명</th>
							<th>학과 및 전공</th>
							<th>학력구분</th>
						<!-- 학력 -->
						
						<!-- 병역사항 -->
							<th>병역구분</th>
							<th>면제사유</th>
						<!-- 병역사항 -->
						
						<!-- 경력사항 -->
							<th>회사명</th>
							<th>담당업무</th>
							<th>직종/직업</th>
							<th>경력</th>
						<!-- 경력사항 -->
						
						<!-- 자격/면허 -->
							<th>자격증명</th>
							<th>취득일</th>
							<th>발행처</th>
						<!-- 자격/면허 -->
						
						<!-- 기술능력 -->
							<th>얼굴 이미지</th>
						<!-- 기술능력 -->
						
						<!-- 희망사항 -->
							<th>희망지역</th>
							<th>희망지역(시/군/구)</th>
							<th>희망연봉</th>
							<th>상태</th>
						<!-- 희망사항 -->
						
						<!-- 기타 -->
							<th>한줄소개</th>
							<th>연락가능 시간</th>
							<th>이력서검증 여부</th>
						<!-- 기타 -->
												
							<th>최종수정일</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${listAll.size() < 1}">
						<tr>
							<td colspan="33">등록 된 명함 없습니다</td>
						</tr>
					</c:if>
					<c:forEach var="item" items="${listAll}">
						<tr>
						<!-- 기본정보 -->
							<td>${item.customerId}</td>
							<td>${item.profileSeq}</td>
							<td><img src="/CatchMeUpload/${item.profileImg}" class="profile-img" alt="프로필이미지"></td>
							<td>${item.customerGender}</td>
							<td>${item.customerName}</td>
							<td>${item.customerPhone}</td>
							<td>${item.customerAddress}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.customerBirthday}" /></td>
						<!-- 기본정보 -->
						
						<!-- 학력 -->
							<td>${item.profileSchool}</td>
							<td>${item.profileSchoolSkill}</td>
							<td>${item.profileSchoolState}</td>
						<!-- 학력 -->
						
						<!-- 병역사항 -->
							<td>${item.profileArmy}</td>
							<td>${item.profileArmyWriting}</td>
						<!-- 병역사항 -->
						
						<!-- 경력사항 -->
							<td>${item.careerCompany}</td>
							<td>${item.careerWork}</td>
							<td>${item.jobLarge} / ${item.jobSmall}</td>
							<td>${item.careerDate}</td>
						<!-- 경력사항 -->
						
						<!-- 자격/면허 -->
							<td>${item.certificateName}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.certificateDate}" /></td>
							<td>${item.certificateWriting}</td>
						<!-- 자격/면허 -->
						
						<!-- 기술능력 -->
							<td>${item.skillContent}</td>
						<!-- 기술능력 -->
						
						<!-- 희망사항 -->
							<td>${item.area1}</td>
							<td>${item.area2}</td>
							<td>${item.profileMoney}</td>
							<td>${item.profileState}</td>
						<!-- 희망사항 -->
						
						<!-- 기타 -->
							<td>${item.profileWriting}</td>
							<td>${item.profileTime}</td>
							<td>${item.profileCheck}</td>
						<!-- 기타 -->	
						
						<!-- 최종 수정일 -->
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.profileDate}" /></td>
						<!-- 최종 수정일 -->
						
						<!-- 관리 -->
							<td><a href="${item.profileSeq}/update">이력서 변경</a> | 
							<a href="${item.customerId}/delete">이력서 삭제</a></td>	
						<!-- 관리 -->						
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div>
			<!-- 페이지네이션 -->	
			<div>
				<ul>
					<li><a href="?page=1&${pager.query}">
					<img src="/resources/img/page_pprev.png"></a></li>
					<li><a href="?page=${pager.prev}&${pager.query}">
					<img src="/resources/img/page_prev.png"></a></li>
				<c:forEach var="page" items="${pager.list}">
					<li id="pager-list" class="${page == pager.page ? 'active' : ''}"><a href="?page=${page}">${page}</a></li>
				</c:forEach>
					<li><a href="?page=${pager.next}&${pager.query}">
					<img src="/resources/img/page_next.png"></a></li>
					<li><a href="?page=${pager.last}&${pager.query}">
					<img src="/resources/img/page_nnext.png"></a></li>
				</ul>
			</div>
			<!-- 페이지네이션 -->
		</div>
			<div>
				<a href="/">메인으로</a>
			</div>		
		</div>
	<c:if test="${sessionScope.customer.customerId == 'admin' }">
		<div>
		<div>
				<button><a href="dummy">더미등록</a></button>
		
				<button><a href="init">초기화</a></button>
								
			</div>
			</div>
	</c:if>
	</div>
</body>
</html>