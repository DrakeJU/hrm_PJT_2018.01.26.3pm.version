<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="resources/common/js/jquery-3.2.1.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="resources/common/js/paging.js"></script> -->

<script>


var checklength = ${count};

var checkcount = 0;

	$(document).ready(function() {
		//최상단 체크박스 클릭
		$("#checkall").click(function() {
			//클릭되었으면
		if ($("#checkall").prop("checked") ==true) {//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	
				for (var i = 0; i < checklength; i++) {
					
					//var code = $('[name=empcode'+i+']').attr('id');
					/* $("input[name=sali"+i+"]").remove();
					   $("input[name=tami"+i+"]").remove();
					   $("input[name=fdei"+i+"]").remove();
					   $("input[name=cmci"+i+"]").remove(); */
					   if ($("#chk" + i).prop("checked") == false) {
							$("#chk" + i).prop("checked",true);
							
							$('td[name=saltext'+ i +']').text("");
							$('td[name=tamtext'+ i +']').text("");
							$('td[name=fdetext'+ i +']').text("");
							$('td[name=cmctext'+ i +']').text("");
							$("td[name=saltext"+ i+ "]").append('<input type="text" name=sali'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=saltext'+i+']').attr('id')+'>');
							
						
							$("td[name=tamtext"+ i+ "]").append('<input type="text" name=tami'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=tamtext'+i+']').attr('id')+'>');
							
				
							$("td[name=fdetext"+ i+ "]").append('<input type="text" name=fdei'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=fdetext'+i+']').attr('id')+'>');
							
						
							$("td[name=cmctext"+ i+ "]").append('<input type="text" name=cmci'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=cmctext'+i+']').attr('id')+'>');
							
							
							$("td[name=empcode"+ i+ "]").append('<input type="hidden" name=code'+i+'  value='+$('[name=empcode'+i+']').attr('id')+' >');
							//$('td[name=saltext'+ i +']').text("");
					   }
				}
				
				}else {
				$("input[type=checkbox]").prop("checked", false);
				
				for (var i = 0; i < checklength; i++) {
				
							$('td[name=saltext'+ i +']').text($('[name=saltext'+i+']').attr('id'));
							$('td[name=tamtext'+ i +']').text($('[name=tamtext'+i+']').attr('id'));
							$('td[name=fdetext'+ i +']').text($('[name=fdetext'+i+']').attr('id'));
							$('td[name=cmctext'+ i +']').text($('[name=cmctext'+i+']').attr('id'));
							
							$("input[name=sali"+ i + "]").remove();

							$("input[name=tami"+ i + "]").remove();
							
							$("input[name=fdei"+ i + "]").remove();

							$("input[name=cmci"+ i + "]").remove();
							
							$("input[name=code"+ i + "]").remove();
				}
	
			}
		});
	});
	
	function check(i) {

		if ($("#chk" + i).prop("checked") == true) {
			//alert(list);
			$('td[name=saltext'+ i +']').text("");
			$('td[name=tamtext'+ i +']').text("");
			$('td[name=fdetext'+ i +']').text("");
			$('td[name=fdetext'+ i +']').text("");
			$('td[name=cmctext'+ i +']').text("");
			$("td[name=saltext" + i + "]").append('<input type="text" name=sali'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=saltext'+i+']').attr('id')+'>');
			
		
			$("td[name=tamtext" + i + "]").append('<input type="text" name=tami'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=tamtext'+i+']').attr('id')+'>');
			
			
			$("td[name=fdetext" + i + "]").append('<input type="text" name=fdei'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=fdetext'+i+']').attr('id')+'>');
			
			$('td[name=cmtext'+ i +']').text("");
			$("td[name=cmctext" + i + "]").append('<input type="text" name=cmci'+ i+ ' style="width=100%; text-align:right;" size="10" value='+$('[name=cmctext'+i+']').attr('id')+'>');
			
			$("td[name=empcode"+ i+ "]").append('<input type="hidden" name=code'+i+'  value='+$('[name=empcode'+i+']').attr('id')+' >');
		} else {
			
			$('td[name=saltext'+ i +']').text($('[name=saltext'+i+']').attr('id'));
			$("input[name=sali" + i + "]").remove();
			
			$('td[name=tamtext'+ i +']').text($('[name=tamtext'+i+']').attr('id'));
			$("input[name=tami" + i + "]").remove();
			
			$('td[name=fdetext'+ i +']').text($('[name=fdetext'+i+']').attr('id'));
			$("input[name=fdei" + i + "]").remove();
			
			$('td[name=cmctext'+ i +']').text($('[name=cmctext'+i+']').attr('id'));
			$("input[name=cmci" + i + "]").remove();
			
			$("input[name=code" + i + "]").remove();
		
		}

	}
 	function update_sal_emp(){
	
		var frm = document.f1;
		
		for(var i=0; i<checklength; i++) {
			
			if($("input[id=chk"+i+"]").prop("checked") == false){
				checkcount++;
			}
			
			if($("input[name=sali"+i+"]").val() == "") {
					
				 alert("급여에 공백이 있습니다. 입력해주세요.");
				 checkcount = 0;
				 break;
			}
			if(checkcount == checklength ) {
				
				alert("아무것도 체크하지 않았습니다.!");
				checkcount = 0;
				return;
			}
			if(checklength-1==i) {
				frm.action ="/spring/update_sal_empcode";
				frm.submit();
				
			}
		}
	} 


</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main">
	<div class="main-content">

		<div class="container-fluid">
			<h3 class="page-title">직원급여정보</h3>

			<div class="col-lg-12">
				<div class="panel">
					<div class="panel-heading">

						<form id="frm" name="f1">
							<div class="panel-body">
								<table class="table table-bordered table-hover">
									<thead>
										<th class="text-center"><input type="checkbox" id="checkall" /></th>
										<th>사번</th>
										<th>사원이름</th>
										<th>급여</th>
										<th>교통비</th>
										<th>식대</th>
										<th>차량유지비</th>
										<th>지각</th>
								
									</thead>
									
									<c:forEach var="tb" items="${list}" varStatus="status">
										<tr>
											<td width="5" align="center"><input type="checkbox" id="chk${status.index}" onclick="check('${status.index}')"></td>
											<td width="50" name="empcode${status.index}" id="${tb.EMP_EMNO}">${tb.EMP_EMNO}</td>
											<td width="100" >${tb.EMP_NAME}</td>
											<td width="100" name="saltext${status.index}" id="${tb.SEMP_SAL}" align="center">${tb.SEMP_SAL}</td>
											<td width="100" name="tamtext${status.index}" id="${tb.SEMP_TAMT}" align="center">${tb.SEMP_TAMT}</td>
											<td width="100" name="fdetext${status.index}" id="${tb.SEMP_FDEX}" align="center">${tb.SEMP_FDEX}</td>
											<td width="100" name="cmctext${status.index}" id="${tb.SEMP_CMC}" align="center">${tb.SEMP_CMC}</td>
											<td width="100"></td>
										</tr>	
									</c:forEach>
								</table>
								<input type="button" class="btn btn-info" value="수정" onclick="update_sal_emp();">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>