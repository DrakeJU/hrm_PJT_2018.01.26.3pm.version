<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="panel-heading">
	<h3 class="panel-title">${menuAttrData.mnName}</h3>
</div>
<!-- 메뉴 상세 정보 table 시작-->
<div class="panel-body"> 
	<form action="">
		<table class="table table-bordered" style="width:100%;">
			<colgroup>
				<col width="16%"/>
				<col width="21%"/>
				<col width="21%"/>
				<col width="21%"/>
				<col width="21%"/>
			</colgroup>
			<thead>
				<tr>
					<th class="text-center">권한 유형</th>
					<th class="text-center">적용 시작일</th>
					<th class="text-center">적용 종료일</th>
					<th class="text-center">수정가능 시작일</th>
					<th class="text-center">수정가능 종료일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="item" items="${menuAttrData.menuAttrList}">
				<tr>
					<td>
						<input type="checkbox" name="${item}"/>
						<span>
							<c:choose>
								<c:when test="${item=='view'}">
									조회
								</c:when>
								<c:when test="${item=='insert'}">
									등록
								</c:when>
								<c:when test="${item=='update'}">
									수정
								</c:when>
								<c:when test="${item=='delete'}">
									삭제
								</c:when>
							</c:choose>
						</span>
					</td>
					<td>
						<div class="input-group date datepicker">
							<input type="text" class="form-control" name="atrAplyStrt" value="${authoMenuData.atrAplyStrt}">
							<span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
							</span>
						</div>
					</td>
					<td>
						<div class="input-group date datepicker">
							<input type="text" class="form-control" name="atrAplyFini" value="${authoMenuData.atrAplyFini}">
							<span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
							</span>
						</div>
					</td>
					<td>
						<div class="input-group date datepicker">
							<input type="text" class="form-control" name="atrUpdtStrt" value="${authoMenuData.atrUpdtStrt}">
							<span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
							</span>
						</div>
					</td>
					<td>
						<div class="input-group date datepicker">
							<input type="text" class="form-control"  name="atrUpdtFini" value="${authoMenuData.atrUpdtFini}">
							<span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
							</span>
						</div>
						
					</td>	
				</tr>		
			</c:forEach>
			</tbody>
		</table>	
	</form>    
</div>
