<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>월간 근태 생성/마감</title>
<script>

	//테이블 내용 가운데정렬
	$(document).ready(function() { 
	    $('.table tr').children().addClass('text-center');
	    console.log('hg');
	});
	
	//달력
	$(function () {
	    $('#monthDate').datetimepicker({
	    	viewMode: 'months',
	    	format: 'YYYY-MM'
	    });
	});


</script>
</head>
<body>
	<div class="main">
		<div class="main-content">
			<div class="container-fluid">
				<h3 class="page-title">월간 근태 생성/마감</h3>
				
				<div class="panel">
					<div class="panel-body">
						<form class="form-inline" action="/spring/readMnthngAttdCrtCls">
							<i class="fa fa-asterisk-red" aria-hidden="true" ></i>근무년월
							<!-- 달력 -->
							<div class="input-group date" id="monthDate">
							  	<input type="text" class="form-control" id="modeApplicationDate" name="workYyMm"/>
							    <span class="input-group-addon">
								    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
							    </span>
						  	</div>
						  	<!-- 검색버튼 -->
						  	<input type="submit" class="btn btn-primary" style="float:right; name="search" value="검색">
						</form>
					</div>
				</div>
					
				<div class="panel panel-headline">
					<div class="panel-heading">
						<h3 class="panel-title">월근태 사원정보</h3>
							<!-- <p class="subtitle">설명이 필요할 경우 추가 예정</p> -->
					</div>
					<div class="panel-body">
						<div class="list_wrapper">
							<table class="table tablesorter table-bordered" id="">
								<thead>
									<tr>
										<th>사원번호</th>
										<th>성명</th>
										<th>직급</th>
										<th>부서</th>
										<th>호봉</th>					
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${resultList}">
										<tr>
											<td>${item.empEmno}</td>
											<td>${item.empName}</td>
											<td>${item.rankCode}</td>
											<td>${item.depCode}</td>
											<td>${item.empAnl}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- paging 영역 -->
							<div align="center">
								<ul class="pagination">
									<li>
										<a title="이전페이지" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
									</li>
									<li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
								    <li><a href="#">4</a></li>
								    <li><a href="#">5</a></li>
								    <li>
										<a href="#" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							</div>
							<!-- END list table 영역 -->
						</div>
					</div>
				</div>
				
				<div class="panel panel-headline">
					<div class="panel-heading">
						<h3 class="panel-title">월근태 일수</h3>
							<!-- <p class="subtitle">설명이 필요할 경우 추가 예정</p> -->
					</div>
					<div class="panel-body">
						<div class="list_wrapper">
							<table class="table tablesorter table-bordered" id="">
								<tr>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>총근무일수</td>
									<td>
										<input type="text" class="form-control" id="" placeholder="총근무일수">
									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>평일근무일수</td>
									<td>
										<input type="text" class="form-control" id="" placeholder="평일근무일수">
									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>휴일근무일수</td>
									<td>
										<input type="text" class="form-control" id="" placeholder="휴일근무일수">
									</td>
								</tr>
								<tr>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>휴가사용일수</td>
									<td>
										<input type="text" class="form-control" id="" placeholder="휴가사용일수">
									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>기타휴가일수</td>
									<td>
										<input type="text" class="form-control" id="" placeholder="기타휴가일수">
									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>결근일수</td>
									<td>
										<input type="text" class="form-control" id="" placeholder="결근일수">
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				
				<div class="panel panel-headline">
					<div class="panel-heading">
						<h3 class="panel-title">월근태 시간(시분)</h3>
							<!-- <p class="subtitle">설명이 필요할 경우 추가 예정</p> -->
					</div>
					<div class="panel-body">
						<div class="list_wrapper">
							<table class="table tablesorter table-bordered" id="">
								<tr>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>평일연장</td>
									<td>
										<input type="text" class="form-control" id="" placeholder="평일연장">
									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>평일야간</td>
									<td>
										<input type="text" class="form-control" id="" placeholder="평일야간">
									</td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>휴일근로</td>
									<td>
										<input type="text" class="form-control" id="" placeholder="휴일근로">
									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>휴일연장</td>
									<td>
										<input type="text" class="form-control" id="" placeholder="휴일연장">
									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>휴일야간</td>
									<td>
										<input type="text" class="form-control" id="" placeholder="휴일야간">
									</td>
								</tr>
								<tr>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>지각</td>
									<td>
										<input type="text" class="form-control" id="" placeholder="지각">
									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>조퇴</td>
									<td>
										<input type="text" class="form-control" id="" placeholder="조퇴">
									</td>
									<td colspan="2"></td>
								</tr>
							</table>
						</div>
						<!-- END list table 영역 -->
						
						<!-- 버튼영역 -->
						<div class="text-right"> 
							<button type="button" class="btn btn-danger">마감하기</button>
						</div>
						<!-- END 버튼영역 -->
					</div>
				</div>
				
				
			</div>
		</div>
	</div>
</body>
</html>