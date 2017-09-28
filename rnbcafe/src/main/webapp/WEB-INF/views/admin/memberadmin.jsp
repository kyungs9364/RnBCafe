<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }" />

	<div class="col-sm-9 main">
		
		<div class="row jumbotron">
      	<h2>회원 LIST</h2>
		</div>
		
		<table class="table table-hover">
			<thead>
			  <tr>
			    <th>아이디</th>
			    <th>이름</th>
			    <th>성별</th>
			    <th>생일</th>
			    <th>핸드폰번호</th>
			    <th>등급</th>
			    <th>가입일</th>
			  </tr>
			</thead>
			<tbody>
			<c:forEach var="mlist" items="${mlist}">
				<tr class="trhover" onclick="javascript:showModal('${mlist.id}');">
					<input type="hidden" id="id" value="${mlist.id}">
					<input type="hidden" id="role" value="${mlist.role}">
					<td id="id${mlist.id}">${mlist.id}</td>
					<td id="name${mlist.id}">${mlist.name}</td>
					<td id="gender${mlist.id}">${mlist.gender}</td>
					<td id="birth${mlist.id}">${mlist.birth}</td>
					<td id="phone${mlist.id}">${mlist.phone}</td>
					<td id="role${mlist.id}">${mlist.role==1?"새내기":""}
											 ${mlist.role==2?"일반회원":""}
											 ${mlist.role==3?"우수회원":""}
											 ${mlist.role==4?"관리자":""}</td>
					<td id="regdate${mlist.id}">${mlist.regdate}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
      
   </div>
<%@ include file="/WEB-INF/views/admin/modal_memberdetail.jsp" %>
<script type="text/javascript">
function showModal(id) {	
	getlvmemberinfo(id);
	$("#modalid").html($("#id"+id).text());  
	$("#modalname").html($("#name"+id).text());  
	$("#modalgender").html($("#gender"+id).text());  
	$("#modalbirth").html($("#birth"+id).text());  
	$("#modalphone").html($("#phone"+id).text());  
	$("#modalrole").html($("#role"+id).text());  
	$("#modalregdate").html($("#regdate"+id).text());  
	$('#modal_memberdetail').modal({show:true}); 
}
</script>
