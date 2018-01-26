<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="/spring/resources/common/js/pagingNav.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script>
	
	/* ================================ 메인 공통코드 관련 11 ========================================== */		
		
			// 메인 공통코드 insert시 중복체크  //
			$("form[id='insertForm'] input[name='commCodeCheck']").on("click", function(){	
				
				var url = "/spring/commCodeCheck.do";
				var commCode = $("#insertForm input[name='commCode']").val();
				var data = {"commCode":commCode};
				
				if(commCode == ""){
					alert("코드를 입력해주세요.");
					return false;
				}//if
				
				commCodeCheckAjaxSubmit(url, data);
				
			});
			
			function commCodeCheckAjaxSubmit(url, data){
				
				paging.ajaxSubmit(url, data, function(result){
					$("form[id='insertForm'] span[name='checkValue']").text(result.commCode);
				});
					
			}//ajaxSubmit
			// 메인 공통코드 insert시 중복체크  //
			
			
			// 메인 공통코드 등록 //
			$("#insertBtn").on("click",function(){
				
				var thisModal = $("#insertModal form[id='insertForm']");
				
				if(thisModal.find("span[name='checkValue']").text() == ""){
					alert("코드를 확인해주세요.");
					return false;
				}else if(thisModal.find("span[name='checkValue']").text()
						== "이미 사용 중인 코드입니다."){
					alert("사용할 수 없는 코드입니다. 다시 확인해 주세요.");
					return false;
				}//if
				
				if(thisModal.find("input[name='commCode']").val() == ""){
					alert("코드를 입력해주세요.");
					return false;
				}else if(thisModal.find("input[name='commName']").val() == ""){
					alert("코드명을 입력해주세요.");
					return false;
				}else if(thisModal.find("input[name='commCodeInfo']").val() == ""){
					alert("코드정보를 입력해주세요.");
					return false;
				}else if(thisModal.find("input[name='commRegMn']").val() == ""){
					alert("등록자명을 입력해주세요.");
					return false;
				}
					
				
				var url = "/spring/commonInsert.do";
				var frm = $("#insertModal").find("form").attr("id");
				
				if(confirm("등록 하시겠습니까?") == true){
					
					commInsertAjaxFormSubmit(url,frm);
				
				}else{
					return false;
				}//if
				
			});
			
			function commInsertAjaxFormSubmit(url,frm){
			
				paging.ajaxFormSubmit(url,frm,function(result){
					
					if(result == 1){
						alert("정상적으로 등록되었습니다.");
						location.href = "/spring/commonList.do";
					}else{
						alert("등록에 실패하였습니다. 다시 시도해주세요.");
						location.href = "/spring/commonList.do";
					}//if
				});
			}
			// 메인 공통코드 등록 //
			
			
			
			// 메인 공통코드 검색조건 목록 //
			$("#searchPanel .panel-body").find("#searchBtn").on("click", function(){
			
				var commonSelect = $("#searchPanel").find("select[name='commonSelect'] option:selected").val();
				var commonSearch = $("#searchPanel").find("input[name='commonSearch']").val();
				
				var url = "/spring/commonSearchList.do";
				var data = {"commonSelect":commonSelect,"commonSearch":commonSearch};

				if(commonSelect == ('default')){
					alert("검색조건을 선택해주세요.");
					return false;
				}else if(commonSearch == ("")){
					alert("검색내용을 입력해주세요.");
					return false;
				}else{
					commSearchListAjaxSubmit(url,data);
				}//if
				
			});
				
			function commSearchListAjaxSubmit(url,data){
				
				paging.ajaxSubmit(url,data,function(result){
					
					$("#commList").find("tbody > tr").remove();	//기존 목록 삭제
					
					$.each(result,function(index,value){
					
						$("#commList").find("tbody").append(
								"<tr name='commCodeInfo' onClick='commInfoListFunc($(this))' data-toggle='modal' style='cursor:pointer'>" + 
									"<td name='commCode'>" + result[index].commCode + "</td>" +
									"<td name='commName'>" + result[index].commName + "</td>" +
									"<td name='commCodeInfo'>" + result[index].commCodeInfo + "</td>" +
									"<td name='commRegMn'>" + result[index].commRegMn + "</td>" +
									"<td name='commCodeCrt'>" + result[index].commCodeCrt + "</td>" +
									"<td name='commCodeUpdt'>" + result[index].commCodeUpdt + "</td>" +
									"<td name='commDelYn'>" + result[index].commDelYn + "</td>" +
									"<td name='commUpdt' onclick='event.cancelBubble = true'>" + 
										"<button type='button' class='btn btn-default' name='updateBtn'>수정</button>" +
										"<button type='button' class='btn btn-default' name='deleteBtn'>삭제</button>" +
									"</td>" +
								"</tr>"	

						);
						
					});//each
					
					//동적 생성한 태그에도 이벤트를 걸어주기 위해 해당 이벤트함수 호출
					$("div[id='commList'] table button[name='updateBtn']").on("click",function(){
						commUpdateFunc($(this));
					});
					
					$("#commList table button[name='deleteBtn']").on("click",function(){
						commDeleteFunc($(this));
					});
					
				});//paging.ajaxSubmit
				
			}//commSearchListAjaxSubmit
			// 메인 공통코드 검색조건 목록 //
			

			
			// 메인 공통코드 수정 //
			$("div[id='commList'] table button[name='updateBtn']").on("click",function(){
				commUpdateFunc($(this));		
			});
			
			function commUpdateFunc(obj){

				var commCode = obj.closest("tr").children("td[name='commCode']").text();
				var commName = obj.closest("tr").children("td[name='commName']").text();
				var commCodeInfo = obj.closest("tr").children("td[name='commCodeInfo']").text();
				var commRegMn = obj.closest("tr").children("td[name='commRegMn']").text();
				
				$("#updateModal form[id='updateForm']").find("tr").find("td").children("input[name='commCode']").val(commCode);
				$("#updateModal form[id='updateForm']").find("tr").find("td").children("input[name='commName']").val(commName);
				$("#updateModal form[id='updateForm']").find("tr").find("td").children("input[name='commCodeInfo']").val(commCodeInfo);
				$("#updateModal form[id='updateForm']").find("tr").find("td").children("input[name='commRegMn']").val(commRegMn);
				
				$("#updateModal").modal('show');
				
			}//commUpdateFunc
			
			$("#updateModal .modal-footer button[name='submitBtn']").on("click",function(){
				
				var thisModal = $("#updateModal #updateForm").children("table");
				
				if(thisModal.find("input[name='commName']").val() == ""){
					alert("코드명을 입력해주세요.");
					return false;
				}else if(thisModal.find("input[name='commCodeInfo']").val() == ""){
					alert("코드정보를 입력해주세요.");
					return false;
				}else if(thisModal.find("input[name='commRegMn']").val() == ""){
					alert("등록자명을 입력해주세요.");
					return false;
				}//if
				
				var url = "/spring/commonUpdate.do";
				var frm = $("#updateModal").find("form").attr("id");
				
				if(confirm("정말로 수정하시겠습니까?") == true){
					commUpdateAjaxFormSubmit(url,frm);
				}else{
					return false;
				}//if
				
			});
			
			function commUpdateAjaxFormSubmit(url,frm){
				
				paging.ajaxFormSubmit(url,frm,function(result){
					
					if(result == 1){
						alert("정상적으로 수정되었습니다.");
						location.href = "/spring/commonList.do";
					}else{
						alert("수정에 실패하였습니다. 다시 시도해주세요.");
						location.href = "/spring/commonList.do";
					}//if
				});
				
			}//commUpdateAjaxSubmit
			// 메인 공통코드 수정 //

			
			
			// 메인 공통코드 삭제 //
			$("div[id='commList'] table button[name='deleteBtn']").on("click",function(){
				commDeleteFunc($(this));
			});
			
			function commDeleteFunc(deleteBtn){
			
				var commCode = deleteBtn.closest("tr").children("td[name='commCode']").text();
				
				if(confirm("정말로 삭제 하시겠습니까?") == true){
					
					var url = "/spring/commonDeleteCheck.do";
					var data = {"commCode":commCode};
					
					commDeleteAjaxSubmit(url,data);
					
				}else{
					return false;
				}//if
			
			}//commDeleteFunc
			
			function commDeleteAjaxSubmit(url, data){
				
				paging.ajaxSubmit(url,data,function(result){

					if(result.listSize == 0 || result.listSize == "0"){
						location.href = "/spring/commonDelete.do?commCode="+data.commCode;
					}else{
						alert("해당 코드는 삭제할 수 없습니다.");
						return false;
					}
					
				});
			}
			// 메인 공통코드 삭제 //
			
			
/* ================================ 하위 공통코드 관련(공통코드 상세보기) ========================================== */

			
			// 공통코드 상세보기에서 공통코드 insert시 중복체크 START //
			$("form[id='infoInsertForm'] input[name='commCodeCheck']").on("click", function(){	
				
				var url = "/spring/commCodeCheck.do";
				var commCode = $("#infoInsertForm input[name='commCode']").val();
				var data = {"commCode":commCode};
				
				if(commCode == ""){
					alert("코드를 입력해주세요.");
					return false;
				}//if
				
				commCodeInfoCheckAjaxSubmit(url, data);
				
			});
			
			function commCodeInfoCheckAjaxSubmit(url, data){
				
				paging.ajaxSubmit(url, data, function(result){
					$("#infoInsertForm span[name='checkValue']").text(result.commCode);
				});
					
			}//ajaxSubmit
			// 공통코드 상세보기에서 공통코드 insert시 중복체크 START //
			
			
			
			// 공통코드 상세보기에서 코드 등록 //
			$("#infoInsertBtn").on("click", function(){
				
				var thisModal = $("#infoInsertModal").find("#infoInsertForm");
				
				if(thisModal.find("input[name='commCode']").val() == ""){
					alert("코드를 입력해주세요.");
					return false;
				}else if(thisModal.find("input[name='commName']").val() == ""){
					alert("코드명을 입력해주세요.");
					return false;
				}else if(thisModal.find("input[name='commCodeInfo']").val() == ""){
					alert("코드정보를 입력해주세요.");
					return false;
				}else if(thisModal.find("input[name='commRegMn']").val() == ""){
					alert("등록자명을 입력해주세요.");
					return false;
				}//if
				
				var url = "/spring/commonInfoInsert.do";
				var frm = $("#infoInsertModal").find("form").attr("id");
				
				if(confirm("등록 하시겠습니까?") == true){
					
					if($("#infoInsertModal #infoInsertForm").find("span[name='checkValue']") == ""){
						alert("코드를 확인해주세요.");
						return false;
					}//if
					
					commInfoInsertAjaxFormSubmit(url,frm);
				
				}else{
					return false;
				}
				
			});
			
			function commInfoInsertAjaxFormSubmit(url,frm){
				
				paging.ajaxFormSubmit(url,frm,function(result){
					
					if(result == 1){
						alert("정상적으로 등록되었습니다.");
						location.href = "/spring/commonList.do";
					}else{
						alert("등록에 실패하였습니다. 다시 시도해주세요.");
						location.href = "/spring/commonList.do";
					}//if
					
				});
			}
			// 공통코드 상세보기에서 코드 등록 //
			
			
			
			// 공통코드 상세보기 목록 //
			function commInfoListFunc(thisTr){
				
				var url = "/spring/commonInfoList.do";
				var path = thisTr;
				var commCode = $(thisTr).find("td[name='commCode']").text();
				var data = {"commPrntCode":commCode};
				
				
				// 해당 부모코드의 하위코드 생성할 때 필요한 작업 //
				var commPrntCode = $(thisTr).find("td[name='commCode']").text();
				var commPrntName = $(thisTr).find("td[name='commName']").text();
				
				if($("#infoInsertModal form[id='infoInsertForm']").find($("input[type='hidden']"))){
					
					$("#infoInsertModal form[id='infoInsertForm']").find($("input[type='hidden']")).each(function(){
						$(this).remove();
					});
					
				}//if
				
				$("#infoInsertModal form[id='infoInsertForm']").prepend("<input type='hidden' name='commPrntName' value='" + commPrntName + "'>");
				$("#infoInsertModal form[id='infoInsertForm']").prepend("<input type='hidden' name='commPrntCode' value='" + commPrntCode + "'>");
				// 해당 부모코드의 하위코드 생성할 때 필요한 작업  //
				
				commInfoListAjaxSubmit(url,data,commPrntCode,commPrntName);
				
			}//commCodeInfoFunc
			
			function commInfoListAjaxSubmit(url,data,prntCode,prntName){
				
				var commPrntCode = prntCode;
				var commPrntName = prntName;
				
				$("#infoModal div[id='commPrntCodeLine']").html("<strong>"+commPrntCode+" - "+commPrntName+"</strong>");
				
				paging.ajaxSubmit(url, data, function(result){
					
					if(result.length == 0 || result == null){	//상세보기 목록 값이 없으면
						
						if($("div[id='infoModal'] tbody").find("tr")){	//기존에 생성 되어있던 목록 삭제
							
							$("div[id='infoModal'] tbody").find("tr").each(function(){
								$(this).remove();
							});
							
						}//if
						
						$("#infoModal").modal('show');	//상세보기 모달띄움
					
					}else{	//상세보기 목록 값이 있으면
						
						if($("div[id='infoModal'] tbody").find("tr")){	//기존에 생성되있었던 목록 삭제
							
							$("div[id='infoModal'] tbody").find("tr").each(function(){
								$(this).remove();
							});
							
						}//if
						
						$.each(result, function(idx,value){	//해당 부모코드의 하위코드 목록 개수만큼 동적 생성
						
							if(result[idx].commCodeUpdt == null){
								result[idx].commCodeUpdt = "--------------";
							}//if
							
							$("div[id='infoModal'] tbody").append(
									"<tr onclick='commInfoListFunc($(this))' data-toggle='modal' style='cursor:pointer'>" +
										"<td name='commCode'>" + result[idx].commCode + "</td>" +
										"<td name='commName'>" + result[idx].commName + "</td>" +
										"<td name='commCodeInfo'>" + result[idx].commCodeInfo + "</td>" + 
										"<td name='commRegMn'>" + result[idx].commRegMn + "</td>" +
										"<td name='commCodeCrt'>" + result[idx].commCodeCrt + "</td>" +
										"<td name='commCodeUpdt'>" + result[idx].commCodeUpdt + "</td>" +
										"<td name='commInfoBtn'>" + 
											"<button type='button' name='infoUpdateBtn' class='btn btn-default' onClick='commInfoUpdateFunc($(this))'>수정</button>" +
											"<button type='button' name='infoDeleteBtn' class='btn btn-default' onClick='commInfoDeleteFunc($(this))'>삭제</button></td>" + 
										"</td>" + 
									"</tr>"
								);
							
						});//each

						$("#infoModal").modal('show');
						
					}//if
					
				});
				
			}//commCodeInfoAjaxSubmit
			//공통코드 상세보기 목록//
			
			
			
			// 공통코드 상세보기에서 코드 수정 //
			function commInfoUpdateFunc(infoUpdateBtn){
				
				var commCode = infoUpdateBtn.closest("tr").find("td[name='commCode']").text();
				var commName = infoUpdateBtn.closest("tr").find("td[name='commName']").text();
				var commCodeInfo = infoUpdateBtn.closest("tr").find("td[name='commCodeInfo']").text();
				var commRegMn = infoUpdateBtn.closest("tr").find("td[name='commRegMn']").text();
				
				$("#infoUpdateModal form[id='infoUpdateForm']").find("input[name='commCode']").val(commCode);
				$("#infoUpdateModal form[id='infoUpdateForm']").find("input[name='commName']").val(commName);
				$("#infoUpdateModal form[id='infoUpdateForm']").find("input[name='commCodeInfo']").val(commCodeInfo);
				$("#infoUpdateModal form[id='infoUpdateForm']").find("input[name='commRegMn']").val(commRegMn);
				
				$("#infoUpdateModal").modal('show');
				
			}//commInfoUpdateFunc
			
			$("#infoUpdateModal div[class='modal-footer'] button[name='submitBtn']").on("click",function(){
				
				var thisModal = $("#infoUpdateModal").find("#infoUpdateForm");
				
				if(thisModal.find("input[name='commName']").val() == ""){
					alert("코드명을 입력해주세요.");
					return false;
				}else if(thisModal.find("input[name='commCodeInfo']").val() == ""){
					alert("코드정보를 입력해주세요.");
					return false;
				}else if(thisModal.find("input[name='commRegMn']").val() == ""){
					alert("등록자명 입력해주세요.");
					return false;
				}//if
				
				var url = "/spring/commonUpdate.do";
				var frm = $("#infoUpdateModal").find("form").attr("id");
				
				if(confirm("정말로 수정하시겠습니까?") == true){
					commInfoUpdateAjaxFormSubmit(url,frm);
				}else{
					return false;
				}
				
			});
			
			function commInfoUpdateAjaxFormSubmit(url,frm){
				
				paging.ajaxFormSubmit(url,frm,function(result){
					
					if(result == 1){
						alert("정상적으로 수정되었습니다.");
						location.href = "/spring/commonList.do";
					}else{
						alert("수정에 실패하였습니다. 다시 시도해주세요.");
						location.href = "/spring/commonList.do";
					}//if
					
				});
				
			}
			// 공통코드 상세보기에서 코드 수정 //
			
			
			
			// 공통코드 상세보기에서 코드 삭제 //
			function commInfoDeleteFunc(obj){
				
				var url = "/spring/commonDelete.do";
				var commCode = obj.parents("tr").find("td[name='commCode']").html();
				var data = {"commCode":commCode};
				
				if(confirm("정말로 삭제하시겠습니까?") == true){
					commInfoDeleteAjaxSubmit(url,data);
				}else{
					return false;
				}//if
			}//commInfoDeleteFunc
			
			function commInfoDeleteAjaxSubmit(url,data){
				
				paging.ajaxSubmit(url,data,function(result){
					
					if(result == 1){
						alert("정상적으로 삭제되었습니다.");
						location.href = "/spring/commonList.do";
					}else{
						alert("삭제에 실패하였습니다.");
						location.href = "/spring/commonList.do";
					}//if
					
				});
			}
			// 공통코드 상세보기에서 코드 삭제 //
			
/* ==================================== 페이징 ============================================ */

	

		var url = "/spring/commonPaging.do";
		var data = {};
		
		paging.ajaxSubmit(url,"",function(result){
			
			var selectPageNum = result.selectPageNum;
			var allPostNum = result.allPostNum;
			
			pagingFunc(selectPageNum,allPostNum);
			
		});
		
		function pagingFunc(selectPageNum,allPostNum){
			
			var data = {"totalNoticeNum":allPostNum,
						"choicePage":selectPageNum,
						"viewNoticeMaxNum":10,
						"viewPageMaxNum":10};
			
			$("#commList nav[name='pagingNav']").pagingNav(data,function(target){
				
				location.href = "/spring/commonList.do?selectPageNum="+target.attr("name");
				
			});
			
		}//paging
		

			
			
			
	</script>
		

	

</head>
<body>

</body>
</html>