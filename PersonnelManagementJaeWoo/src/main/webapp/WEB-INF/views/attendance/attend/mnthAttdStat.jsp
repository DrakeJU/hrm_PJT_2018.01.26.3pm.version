<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>월 근태 현황</title>
<script>

$(function () {
	$('#workingYearMonth').datetimepicker({ //근무년월 달력
		viewMode: 'month',
		format: 'YYYY-MM'
	});
});



</script>
</head>
<body>
	<div class="main" style="min-height: 867px;">
		<div class="main-content">
			<div class="container-fluid">
			<h3 class="page-title">월 근태 현황</h3>
				<div class="panel">
					<div class="panel-body">
						<form class="form-inline" name="">	
							<table class="table table-bordered">
							<tr align="center">
								<td>근무년월</td>
								<td>
									<!-- 달력 : 근무년월 -->										
									<div class="input-group date" id="workingYearMonth">
										<input type="text" class="form-control" id="workingYearMonth"/>
											<span class="input-group-addon">
												<span class="fa fa-calendar" />
											</span>
									</div>
								</td>
								<td>부서</td>  
								<td align="center">
									<select>
									<option value="">전체</option>
									<option value="">인크레파스</option>
									<option value="">인사부</option>
									<option value="">영업부</option>
									<option value="">성실부</option>
									</select>
								</td>
								<td>사원번호</td>
								<td>
									<input type="text" class="form-control" id="">
									<span class="fa fa-search"></span> <span class="cssclass"></span>
									<input type="button" class="btn btn-danger btn-xs" style="float:right;"name="search" value="검색">
								</td>
							</tr>
							</table>
						</form>
					</div>
					<div class="panel-body">
						<h4>◈ 근태현황<h4>
						<table border="1" class="table table-bordered">
						<tr align="center">
							<td>사원번호</td>
							<td>성명</td>
							<td>부서</td>
							<td>직급</td>
						</tr>
						<tr align="center">
							<td> 　　　　 </td>
							<td> 　　　　 </td>
							<td> 　　　　 </td>
							<td> 　　　　 </td>
						</tr>
						</table>
						<table border="1" class="table table-bordered">
							<tr align="center">
								<td> 1</td>
								<td> 2</td>
								<td> 3</td>
								<td> 4</td>
								<td> 5</td>
								<td> 6</td>
								<td> 7</td>
								<td> 8</td>
								<td> 9</td>
								<td> 10</td>
								<td> 11</td>
								<td> 12</td>
								<td> 13</td>
								<td> 14</td>
								<td> 15</td>
								<td> 16</td>
								<td>비고</td>
							</tr>
							<tr align="center">
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>	
								<td rowspan="4"></td>	
							</tr>
							<tr align="center">
								<td>17</td>
								<td>18</td>
								<td>19</td>
								<td>20</td>
								<td>21</td>
								<td>22</td>
								<td>23</td>
								<td>24</td>
								<td>25</td>
								<td>26</td>
								<td>27</td>
								<td>28</td>
								<td>29</td>
								<td>30</td>
								<td>31</td>
								<td rowspan="2"></td>
							</tr>
							<tr align="center">
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
								<td> 　　　　 </td>
							</tr>
						</table>
					</div>
				</div><!-- "panel" -->
			</div>
		</div>
	</div>
</body>
</html>

