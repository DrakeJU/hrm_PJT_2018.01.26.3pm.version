<!-- 
출장 정산 : 제영호  / 이용선
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>출장정산</title>
<script>

$(function () {
	$('#requestYearMonthStart').datetimepicker({ //신청년월 시작 달력
		viewMode: 'days',
		format: 'YYYY-MM-DD'
	});
	
	$('#requestYearMonthEnd').datetimepicker({ //신청년월 끝 달력
		viewMode: 'days',
		format: 'YYYY-MM-DD'
	});

	$('#settlementDate').datetimepicker({ //정산일자 달력
		viewMode: 'days',
		format: 'YYYY-MM-DD'
	});
});//function

</script>
</head>
<body>
	<div class="main" style="min-height: 867px;">
		<div class="main-content">
			<div class="container-fluid">
			<h3 class="page-title">출장정산</h3>
				<div class="panel">
					<div class="panel-body">
						<form class="form-inline" name="">
							<table class="table table-bordered">
								<tr align="center">
									<td>신청년월</td>
									<td>
										<!-- 달력 : 신청년월 시작 -->										
										<div class="input-group date" id="requestYearMonthStart">
											<input type="text" class="form-control" id="requestYearMonthStart"/>
												<span class="input-group-addon">
													<span class="fa fa-calendar" />
												</span>
										</div>  
										~  
										<!-- 달력 : 신청년월 끝 -->										
										<div class="input-group date" id="requestYearMonthEnd">
											<input type="text" class="form-control" id="requestYearMonthEnd"/>
												<span class="input-group-addon">
													<span class="fa fa-calendar" />
												</span>
										</div>
									</td>
									<td>전표생성여부</td>
									<td><input type="text" class="form-control">
										<span class="fa fa-search"></span> <span class="cssclass"></span>
									</td>
									<td>사원번호</td>
									<td>
										<input type="text" class="form-control">
										<span class="fa fa-search"></span> <span class="cssclass"></span>
											<form action="">
												<input type="button" class="btn btn-danger" style="float:right;"name="search" value="검색">
											</form>
									</td>
								</tr>
							</table>
						</form>		
					</div>
				</div>
				<p>
				<div class="row">
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-body">
								<h4>◈ 출장신청내역</h4>
								<form class="form-inline" name="">
									<table class="table table-bordered">
										<tr align="center">
											<td>신청번호</td>
											<td>신청일자</td>
											<td>신청자</td>
											<td>출장목적</td>
											<td>예상출장비</td>
											<td>가지급액</td>
										</tr>
										<tr align="center">
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
										</tr>
										<tr align="center">
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
										</tr>
										<tr align="center">
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
										</tr>
										<tr align="center">
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
										</tr>
										<tr align="center">
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
											<td> 　　　　 </td>
										</tr>
									</table>
								</form>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="panel">
						<div class="panel-body">
							<form action="">
								<input type="button" class="btn btn-danger btn-xs" style="float:right;"name="delete" value="삭제">
								<input type="button" class="btn btn-danger btn-xs" style="float:right;"name="update" value="저장">
							</form>							
							<h4>◈ 출장정산</h4>
							<table class="table table-bordered">
								<tr align="center">
									<td>정산번호</td>
									<td>자동입력</td>
									<td>정산일자</td>
									<td>
										<!-- 달력 : 정산일자	 -->									
										<div class="input-group date" id="settlementDate">
											<input class="form-control input-sm" placeholder="좀 되라!!!" type="text">
												<span class="input-group-addon">
													<span class="fa fa-calendar" />
												</span>
										</div>
									</td>
								</tr>
								<tr align="center">
									<td>전자결재상태</td>
									<td></td>
									<td>전표번호</td>
									<td></td>
								</tr>
								<tr align="center"> 
									<td>전표상태</td>
									<td></td>
									<td>전표반려일자</td>
									<td></td>
								</tr>
								<tr align="center"> 
									<td>전표반려자</td>
									<td></td>
									<td>전표반려사유</td>
									<td></td>
								</tr>
								<tr align="center"> 
									<td>프로젝트</td>
									<td align="left" colspan="3">
									<select>
									<option value="">해당없음</option>
									</select>
									</td>
								</tr>
								<tr align="center" > 
									<td>정산내용</td>
									<td colspan="3"></td>
								</tr>
							</table>
						</div>	
					</div>	
				</div>
			</div>
				<p>
				<div class="panel">
					<div class="panel-body">		
						<form action="">
							<input type="button" class="btn btn-danger btn-xs" style="float:right;"name="delete" onClick="addRow('');" value="행삭제">
							<input type="button" class="btn btn-danger btn-xs" style="float:right;"name="delete" onClick="delRow('');" value="행추가">
						</form>
						<h4>◈ 출장정산내역</h4>
						<table id="businessAdj" class="table table-bordered" >
							<tr align="center"> 
								<td>No</td>
								<td>계정과목</td>
								<td>계정과목명</td>
								<td>금액</td>
								<td>비고</td>
							</tr>
							<tr align="center">
								<td colspan="5"  height="100px">데이터가 없습니다.</td>
							</tr>
							<tr align="center">
								<td></td>
								<td></td>
								<td>합계</td>
								<td>0</td>
								<td></td>
							</tr>
						</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>