<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="/spring/resources/common/js/pagingNav.js"></script>
   	<script src="/spring/resources/common/management/js/menuTree.js"></script>
	<script>
		
	var searching =false;
	var searchCnd;
	var searchWd;
		
		$(document).ready(function(){
			empListPrint();
			searchEvent();
		});
		
		var searchEvent = function(){
			$("button[name='searchBtn']").on('click',function(){
				
				if(!$("[name='searchCnd']>option").index($("[name='searchCnd']>option:selected"))){
					alert("option을 선택해주세요"); 
				}else if($("[name='searchWd']").val()==""){
					alert("검색내용이 없습니다");
				}else{
					searching = true;
					searchStart();
				}//유효성 검사 후 리스트 출력 함수 호출if else
				
			});//onclick
		}//searchEvent
		
		var searchStart =function(choicePage){
			
			if(searching){
				searchCnd  = $("[name='searchCnd'] option:selected").val();
				searchWd = $("input[name='searchWd']").val();
			}
			
			console.log(searchCnd,searchWd,choicePage);
			empListPrint(searchCnd,searchWd,choicePage);
		}
	
		var empListPrint = function(searchCnd,searchWd,choicePage){
			
			if(choicePage==undefined){
				choicePage = 1;
			}
			
			if(searchCnd==undefined){
				searchCnd = "";
			}
			
			if(searchWd==undefined){
				searchWd = "";
			}
			
			var url = "empList.ajax";
			var data = {"choicePage":choicePage, searchCnd:searchCnd, searchWd:searchWd };
			var str="";
			var thisList;
			
			paging.ajaxSubmit(url,data,function(result){
				
				thisList = result.empList;
				
				if(thisList!=null){
					$.each(thisList,function(index){
						
						str += "<tr style='cursor:pointer'>";
						str += "<td>"+thisList[index].deptName+"</td>";
						str += "<td>"+thisList[index].rankName+"</td>";
						str += "<td name='empEmno'>"+thisList[index].empEmno+"</td>"
						str += "<td>"+thisList[index].empName+"</td>";
						str += "<td>"+thisList[index].empRegDate+"</td></tr>"
					});
					$("tbody").children().remove();
					$("tbody").append(str);
					
					detailEvent();
					
					var obj = {"totalNoticeNum":result.totalNoticeNum,"choicePage":choicePage}
					$("nav[name='pagingNav']").pagingNav(obj,"pageClick");
				}//if
				
			});//each
			
		};//empListPrint

		var pageClick = function(target){
			searching = false;
			searchStart(target.attr("name"));
		}//pageClick
		
		//사원 권한 등록 
		
		var detailEvent = function(){
			
			$("tbody td").on("click",function(){
			
				var empEmno = $(this).parent("tr").children("td[name='empEmno']").text();
				$("input[name='empEmno']").val(empEmno);
				$("form[name='hiddenForm']").submit();
			});
		}
		
		
		
		
		
	</script>
