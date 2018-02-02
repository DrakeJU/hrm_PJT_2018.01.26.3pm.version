<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>증명서발급</title>
</head>
<body>
	<!-- MAIN -->
	<div class="main">
		<!-- MAIN CONTENT -->
		<div class="main-content">
			<div class="container-fluid">
				<h3 class="page-title">증명서발급</h3><br>
				<!-- OVERVIEW -->
				<div class="row">
					<div class="col-md-10">
						<div class="panel panel-headline">
							<div class="panel-heading">
								<div class="col-md-3">
								<form id="">
										증명서구분
										<select name="">
											<option value="whole">전체</option>
											<option value="">재직증명서</option>
											<option value="">경력증명서</option>
											<option value="">퇴직증명서</option>
										</select>
								</div>
								<div class="col-md-4">
									신청일자
									<input type="text" name="startDate" size="8" placeholder="날짜선택">
									~&nbsp;<input type="text" name="endDate" size="8" placeholder="날짜선택">
								</div>
									<input type="submit" value="검색">
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 증명서 신청 내역 -->
				<div class="row">
					<div class="col-md-10">
						<div class="panel">
							<div class="panel-heading">
								<h4 class="panel-title" style="font-size:20px; padding-left:15px;">증명서 신청내역</h4>
							</div>
							<div class="row">
								<div class="col-md-12 text-right" style="padding-right:60px">
									<button type="button" class="btn btn-default" data-toggle="modal" data-target="#insertModal" onclick="insertData()">신청</button>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="panel-body">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>발행번호</th>
													<th>사원번호</th>
													<th>성명</th>
													<th>증명서종류</th>
													<th>용도</th>
													<th>발행일자</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="l" items="${list}">
												<tr>
													<td name="crtfIsno">${l.crtfIsno}</td>
													<td name="empEmno">${l.empEmno}</td>
													<td name="empName">${l.empName}</td>
													<td name="commName">${l.commName}</td>
													<td name="crtfUse">${l.crtfUse}</td>
													<td name="crtfDate">${l.crtfDate}</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
										<!-- <input type="button" value="전자결제" name=""> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Date Insert Modal -->
				<div id="insertModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  					<div class="modal-dialog">
    					<div class="modal-content">
     						<div class="modal-header">
								<h4 class="modal-title">증명서 신청</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-md-10" style="padding-top:20px;">
										<form id="insertForm">
										<table class="table table-hover">
											<tbody>
												<tr>
													<th>증명서구분</th>
													<td>
														<select>
															<option value="default">증명서종류</option>
															<option value="work">재직증명서</option>
															<option value="career">경력증명서</option>
															<option value="retirement">퇴직증명서</option>
														</select>
													</td>
												</tr>
												<tr>
													<th>사원번호</th>
													<td><input type="text" name="empEmno" value="" disabled></td>
												</tr>
												<tr>
													<th>성명</th>
													<td><input type="text" name="empName" value="" disabled></td>
												</tr>
												<tr>
													<th>부서명</th>
													<td><input type="text" name="deptName" value="" disabled></td>
												</tr>
												<tr>
													<th>직위/직급</th>
													<td><input type="text" name="rankName" value="" disabled></td>
												</tr>
												<tr>
													<th>용도</th>
													<td><input type="text" value=""name="use" size="20"></td>
												</tr>
												<tr>
													<th>신청일자</th>
													<td><input type="text" name="application"></td>
												</tr>
											</tbody>
										</form>
									</table>
										<div class="modal-footer">
											<button type="button" id="insertBtn" class="btn btn-default" data-dismiss="modal">신청</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>	
    					</div>
  					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>