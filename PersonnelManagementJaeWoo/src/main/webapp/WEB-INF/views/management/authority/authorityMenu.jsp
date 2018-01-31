<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!-- mnName  -->
<div class="panel-heading">
	<h3 class="panel-title" id="mnNo" name="${mnNo}">${data.mnName}<c:if test="${null eq data.mnName}">해당 메뉴 권한이 없습니다.</c:if></h3>
</div>
<!-- 메뉴 상세 정보 table 시작-->
<div class="panel-body">
	<table class="table table-bordered">
		<colgroup>
			<col width="25%">
			<col width="75%">
		</colgroup>
		<tbody>
			<tr>
				<th>권한 속성</th>
				<td>${data.aythoAttr}</td>
			</tr>
			<tr>
				<th>적용 시작 날짜</th>
				<td>${data.atrAplyStrt}</td>
			</tr>
			<tr>
				<th>적용 종료 날짜</th>
				<td>${data.atrAplyFini}</td>
			</tr>
			<tr>
				<th>수정 시작 날짜</th>
				<td>${data.atrUpdtStrt}</td>
			</tr>
			<tr>
				<th>수정 종료 날짜</th>
				<td>${data.atrUpdtFini}</td>
			</tr>
		</tbody>
	</table>
	<div class="text-right">
		<button type="boutton" name="updateBtn" class="btn btn-info">수정</button>
	</div>
</div>
    