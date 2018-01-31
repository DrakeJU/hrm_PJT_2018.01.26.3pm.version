<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>근속연수별휴가설정</title>
</head>

<script>

	/*
		DB 연결할 
		continous_work_year (테이블)
		(컬럼명들)
		COWY_SERIAL_NUMBER
		COWY_CONTINOUS_TYPE
		COWY_VAC_DAYS
		COWY_DEL_YN
	*/
	
	//표 행 생성 
	$(document).on("click", "button[name=addTr]", function(){
		var addStaffText =  '<tr name="vacationOption">'+
							'<td class="w3"><label class="fancy-checkbox-inline"><input type="checkbox" id="chk" ><span></span></label></td>' +
							'<td class="w10"><input type="text" class="form-control w_80" ></td>' +
							'<td class="w10"><input type="text" class="form-control w_80" ></td>' +
							'<td class="w37"><input type="text" class="form-control w_300"></td>' +
							'</tr>';
							
		$("#tbody tr:last").after(addStaffText);
	});
	//표 행 삭제
	$(document).on("click", "button[name=deleteTr]", function(){
		var $obj = $("input[name='chk']");
		var checkCount = $obj.size();
		
		for(var i = 0 ; i < checkCount ; i++){
			if($obj.eq(i).is(":checked")){
				$obj.eq(i).parent().parent().parent().remove();
			}
		}
	});
	//체크 박스 셀렉트 ALL
	function selectAll(){
		var $obj = $("input[name='selectAll_chk']");
		var $obj2 = $("input[name='chk']");
		var $obj3 = $("input[name='notDeleteChk']");
		
		if($obj.is(":checked")){
			$obj2.prop("checked", true);
			$obj3.prop("checked", true);
		}else{
			$obj2.prop("checked", false);
			$obj3.prop("checked", false);
		}
	}
	

	function insertForm(){
		$("#insertForm").submit();
	}

	function insertDDBB(formId) {
		var checkVount = $('input:checkbox[id="chk"]');
		var nameString = new Array('', 'conworkyear', 'vacofyear', 'note');//첫번째 ''는체크박스?

		//체크된것들만 네임 부여함.
		$('input:checkbox[id="chk"]').each(function() {
			if ($(this).prop('checked')) {
				var progTr = $(this).closest('tr');
				//var gorgTd = progTr.children().eq(1);

				for (var i = 0; i < 4; i++) { //child node 갯수가 총 4개: 체크박스,근속연수,휴가일수,비고
					//tr안에 몇번째 td인지 체크해주는것
					var progTd = progTr.children().eq(i);

					//1,2번 td에는 input type 이 text이기때문에 children() 한번해줌?
					if (i == 1 || i == 2 || i == 3) {
						var inputName = progTd.children();

						//네임 부여
						inputName.attr({
							name : nameString[i]
						});
					}//if
				}//for
			}//if checkbox
		});
		
		var json;
		var obj = new Object();
		var jsonObj = $("#" + formId).serializeArray();
		var jobj = {};
		var jArray = new Array();

		$(jsonObj).each(function(index, obj) {
			jobj[obj.name] = obj.value;
			//index 0에 divide : 휴가  1에 code : 00 이렇게 들어감. 그래서 json 한세트에 6개 들어가서 6개씩  짤라줌.
			//{"divide":"휴가","code":"00","title":"휴가(년차)","AnnualLeaveReflection":"false","UseOrFailure":"false","note":""} 6개 넣으면 이렇게 완성됨.
			if ((index + 1) % 3 == 0) {

				jArray.push(jobj);

				//한번하면 초기화해줘야됨. 그래야 맨밑에있는값들로만 안들어감.
				jobj = {};
			}

			console.log(index + ":" + obj.name + ":" + obj.value);
		});
		var dataObj = {"jArray":JSON.stringify(jArray)};
		paging.ajaxSubmit("/spring/conWorkVacSetDBInsert.ajax",dataObj,function(result){
			
		});
		console.log("-------------"+jArray);
		
	}
	
</script>

<body>
	<!-- MAIN -->
	<div class="main">
		<!-- MAIN CONTENT -->
		<div class="main-content">
			<div class="container-fluid">
				<h3 class="page-title">휴가항목설정</h3>
				<!-- OVERVIEW -->

				<div class="panel panel-headline">
					<div class="panel-body">
						<form class="form-inline" name="searchForm">
							<strong class="pdu_8 ftl">사업장</strong> <select
								name="attendanceDivision" class="w_120 mgl_8 mgu_8">
								<option value="vacation">인크레더블</option>
							</select> <span class="ftr">
								<button type="button" class="btn btn-primary" onClick="">검색</button>
							</span>
						</form>
					</div>
				</div>

				<!-- TABLE STRIPED -->
				<div class="panel panel-headline">
					<div class="boxArea text-center">
						<strong class="pdu_8 ftl">근속연수별휴가설정 </strong> <span class="ftr">
							<button type="button" name="addTr" class="btn btn-primary" onClick="">행추가</button>
							<button type="button" name="deleteTr" class="btn btn-primary" onClick="">행삭제</button>
						</span>
					</div>
					<div class="panel-body mgu_15">
						<form class="form-inline" name="f2" action="/spring/holidaySetDBInset.do" id="insertForm">

							<table class="table table-bordered" id="vacationOptionTable" style="">
								<!--  <thead> -->
								<colgroup>
									<col width="3%">
									<col width="10%">
									<col width="10%">
									<col width="20%">
									<col width="10%">
									<col width="10%">
									<col width="37%">
								</colgroup>
								<thead class="scrollHead">
									<tr>
										<th class="w3">
											<label class="fancy-checkbox-inline">
												<input type="checkbox" id="selectAll_chk" onClick="selectAll()"> <span></span>
											</label>
										</th>
										<th class="text-center w10"><i class="fa fa-asterisk-red" aria-hidden="true"></i>근속 연수</th>
										<th class="text-center w10"><i class="fa fa-asterisk-red" aria-hidden="true"></i>휴가 일수</th>
										<th class="text-center w37">비고</th>
									</tr>
								</thead>
								<tbody class="scrollBody" id="tbody">
									<tr id="headTr"></tr>
								</tbody>
							</table>
							<button type="button" name="saveButton" class="btn btn-primary ftr" onClick="insertDDBB('insertForm')">저장</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
