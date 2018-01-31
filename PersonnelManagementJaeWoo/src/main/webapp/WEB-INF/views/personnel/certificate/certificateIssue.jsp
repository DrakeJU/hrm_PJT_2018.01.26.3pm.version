<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
								<form id="">
									<p>사업장
									<select name="">
										<option value="increpace">(주)인크레파스</option>
									</select>
									&nbsp;&nbsp;&nbsp;&nbsp;증명서구분
									<select name="">
										<option value="whole">전체</option>
										<option value="whole">재직증명서</option>
										<option value="whole">경력증명서</option>
										<option value="whole">퇴직증명서</option>
									</select>
									&nbsp;&nbsp;&nbsp;&nbsp;신청일자
									<input type="text" name="startDate" size="8">
									~&nbsp;<input type="text" name="endDate" size="8">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="submit" value="검색">
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- OVERVIEW -->
				<div class="row">
					<div class="col-md-10">
						<div class="panel panel-headline">
							<div class="panel-heading">
								<h4 class="panel-title" style="font-size:20px; padding-left:15px;">증명서 신청내역</h4>
								<div class="panel-body">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>신청번호</th>
												<th>증명서구분</th>
												<th>신청일자</th>
												<th>사원번호</th>
												<th>성명</th>
												<th>발행상태</th>
												<th>발행일자</th>
												<th>전자결재상태</th>
												<th>용도</th>						
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- OVERVIEW -->
				<div class="row">
					<div class="col-md-10">
						<div class="panel panel-headline">
							<div class="panel-heading">
								<h4 class="panel-title" style="font-size:20px; padding-left:15px;">증명서 신청</h4>
								<div class="panel-body">
									<table class="table table-hover">
										<form id="">
											<tbody>
												<tr>
													<th>신청번호</th>
													<td><input type="text" name=""></td>
													<th>증명서구분</th>
													<td>
														<select>
															<option value="">전체</option>
															<option value="">재직증명서</option>
															<option value="">경력증명서</option>
															<option value="">퇴직증명서</option>
														</select>
													</td>
													<th>신청일자</th>
													<td><input type="text" name=""></td>
												</tr>
												<tr>
													<th>사원번호</th>
													<td><input type="text" name=""></td>
													<th>성명</th>
													<td><input type="text" name=""></td>
													<th>발행일자</th>
													<td><input type="text" name=""></td>
												</tr>
												<tr>
													<th>사업장</th>
													<td><input type="text" name=""></td>
													<th>부서</th>
													<td><input type="text" name=""></td>
													<th>직책</th>
													<td><input type="text" name=""></td>
												</tr>
												<tr>
													<th>전자결재상태</th>
													<td><input type="text" name=""></td>
													<th>용도</th>
													<td><input type="text" name=""></td>
													<th>비고</th>
													<td><input type="text" name=""></td>
												</tr>
											</tbody>
										</form>
									</table>
									<input type="button" name="" value="삭제">
									<input type="button" name="" value="저장">
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