<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">

	function inputButton(){
		var year = $("#RosterYear option:selected").val();
		var month = $("#RosterMonth option:selected").text();
		
		if(month < 10){
			month = "0" + month;
		}
		
		var result = year + "-" + month + "-" + "01";

		$("#yearMonth").attr('value', result);
		
		$("#settingForm").submit();
	}
</script>

<body>

<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<h3 class="page-title">근무표 생성</h3>
			
			<div class="panel panel-headline">
				<div class="panel-body">
					<form class="form-inline" id="settingForm" action="/spring/holidayRoster" method="post">
						<strong class="pdu_8 ftl">근무표 생성 연도와 달, 일을 선택하세요</strong>
						<select id="RosterYear" class="w_120 mgl_8 mgu_8">
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
						</select>년
						<select id="RosterMonth" class="w_120 mgl_8 mgu_8">
							<option value="january">1</option>
							<option value="february">2</option>
							<option value="march">3</option>
							<option value="april">4</option>
							<option value="may">5</option>
							<option value="june">6</option>
							<option value="july">7</option>
							<option value="august">8</option>
							<option value="september">9</option>
							<option value="october">10</option>
							<option value="november">11</option>
							<option value="december">12</option>
						</select>월
						<br>
						<strong class="pdu_8 ftl">근무자수</strong>
						:<input type="text" name="numberOfPeople">명
						<br>
						
						<input type="hidden" id="yearMonth" name="yearMonth">
						<input type="button" name="settingButton" class="btn btn-primary ftr" id="settingButton" value="저장" onClick="inputButton()">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>