<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<script src="/spring/resources/common/management/js/menuTree.js"></script>
<script>

	var events  = function(){
		$("button[name='classBtn']").on("click",classUpdate);
	};
	
	var classUpdate = function(){
		var selOp = $("#classSelect>option:selected");
		var selOpIdx = selOp.index($("#classSelect>option"));
	
	
	
		if(selOpIdx!=0){
			var data = {"empEmno": $("input[name='empEmno']").val()}
			if(selOp.val()=="admin"){
				data.empClass = 'Y';
				paging.ajaxSubmit("empClassUpdate.ajax",data,"classUpdateEnd",true);
			}else{
				data.empClass = 'N';
				paging.ajaxSubmit("empClassUpdate.ajax",data,"classUpdateEnd",true);
			}
	
		}else{
			alert("등급을 선택해주세요.");
		}
	
	};
	
	var classUpdateEnd = function(result){
		console.log("result"+result)
		if(result==1){
			alert("성공하였습니다.");
			window.location.href = "authorityMain.do";
		}else{
			alert("실패하였습니다.");
		}
	};
	
	paging.ajaxSubmit("menuList.ajax","",function(result){
	
		 $("#tree").ssTree(result.data);
		 $("#tree li").on('click',function(e){
			 var thisObj = $(this);
			//현재 대상외 class 삭제
	         $("#tree li.current").removeClass("current");
	         //대상 class 추가
	         thisObj.addClass("current");
	         //메뉴 오픈
	         thisObj.openMenu(e);
	         //메뉴 권한 상세 테이블 호출
	         if(thisObj.find("ul").length==0){
	        	authorityMenu(thisObj.attr("id"));
	         }//if
		 });
	
	},true);
	
	var authorityMenu = function(mnNo){
	
		var dataObj = {"empEmno": $("input[name='empEmno']").val(),"mnNo":mnNo}
		 $.ajax({
		        type:"GET",
		        url:"authorityMenu.do",
		        data: dataObj,
		        dataType:"html",
		        success:function(html){
		           authoMenuTable(html);
		           $("button[name='updateBtn']").on("click",function(){
		        	  authorityForm(); 
		           });
		        }
		        ,error:function(){
		            console.log("error");
		        }
		    });//ajax
	}//authorityMenu
	
	var authoMenuTable = function(html){
		$("div[name='detail']").html(html);
		 $(".datepicker").datetimepicker({ 
	         format : 'YYYY-MM-DD'
	      });   
	};//authoMenuTable
	
	events(); //이벤트 등록 함수 호출
	
	var authorityForm = function(){
		var dataObj = {"empEmno":$("input[name='empEmno']").val(),"mnNo":$("#mnNo").attr("name")}
		paging.ajaxSubmit("authorityForm.do",dataObj,"authoMenuTable",true,"html");
	};//authorityForm
	


</script>