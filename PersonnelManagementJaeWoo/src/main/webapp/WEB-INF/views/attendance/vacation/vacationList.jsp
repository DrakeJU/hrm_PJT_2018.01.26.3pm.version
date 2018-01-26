<!--
	휴가조회(사원) - 유성실,신지연
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴가조회(사원)</title>
<script>

	//테이블 내용 가운데 정렬
	$(document).ready(function() {
	    $('.table tr').children().addClass('text-center');
	});

	
/* 	
	//테이블 마우스오버시 (행을 지날 때), 색 바뀜
	$(document).ready(function(){
		$('#vacList tbody tr').mouseover(function(){ 
			$(this).css("backgroundColor","#f2f2f2"); 
		}); 
		$('#vacList tbody tr').mouseout(function(){ 
			$(this).css("backgroundColor","#fff"); 
		});
	});
*/
	
 
</script>
</head>
<body>
	<div class="main" style="min-height: 867px;">
		<div class="main-content">
			<div class="container-fluid">
			<h3 class="page-title">휴가조회(사원)</h3>
				<div class="panel">
					<div class="panel-body">
						<table class="table table-bordered">	
							<tr>
								<th>사원번호</th>
								<td>seongsil</td>
								<th>성명</th>
								<td>유성실</td>
								<th>연차기간</th>
								<td>2018.01.01 ~ 2018.12.31</td>
							</tr>
							<tr>
								<th>전체일수</th>
								<td>15</td>
								<th>사용일수</th>
								<td>6</td>
								<th>잔여일수</th>
								<td>9</td>
							</tr>
						</table>
					</div>
				</div>
				
				<div class="panel panel-headline"> 
					<div class="panel-heading"> 
						<h4 class="panel-title">휴가내역</h4>
<!-- 							<p class="subtitle">설명이 필요할 경우 추가 예정</p> -->
					</div>
					<div class="panel-body">
						<!-- list table 영역 -->
						<div class="list_wrapper">
							<table class="table table-bordered" id="vacList">
								<thead>
									<tr>
										<th>번호</th>
										<th>신청일</th>
										<th>휴가항목</th>
										<th>시작일</th>
										<th>종료일</th>
										<th>일수</th>
										<th>전자결재상태</th>
										<th>휴가사유</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>2018.01.01</td>
										<td>연차</td>
										<td>2018.01.02</td>
										<td>2018.01.02</td>
										<td>1</td>
										<td>승인완료</td>
										<td>쉬고싶어요</td>
									</tr>
									<tr>
										<td>2</td>
										<td>2018.01.08</td>
										<td>경조사휴가</td>
										<td>2018.01.08</td>
										<td>2018.01.10</td>
										<td>3</td>
										<td>승인완료</td>
										<td>조부모상</td>
									</tr>
									<tr bgcolor="#f0ad4e">
										<td>3</td>
										<td>2018.01.15</td>
										<td>휴가</td>
										<td>2018.01.18</td>
										<td>2018.01.19</td>
										<td>2</td>
										<td>승인대기</td>
										<td>개인사유</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- END list table 영역 -->
						    
						<!-- 버튼영역 -->
						<div class="text-center"> <!-- 필수 -->
							<button type="button" class="btn btn-info">인쇄하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-danger">엑셀다운</button>
						</div>
						<!-- END 버튼영역 -->
								
					</div>
				</div>
			</div>
		<!-- END MAIN CONTENT -->
		</div>
	</div>
	<!-- END MAIN -->

</body>
</html>