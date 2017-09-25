<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/common/baseheader.jsp"%>
<div class="container" style="margin-top: 70px">
	<div class="col-sm-3 sidenav">
		<!-- 사이드 -->
		<%@ include file="/WEB-INF/views/common/baseside.jsp"%>
	</div>

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
					<td id="id${mlist.id}">${mlist.id}</td>
					<td id="name${mlist.id}">${mlist.name}</td>
					<td id="gender${mlist.id}">${mlist.gender}</td>
					<td id="birth${mlist.id}">${mlist.birth}</td>
					<td id="phone${mlist.id}">${mlist.phone}</td>
					<td id="role${mlist.id}">${mlist.role}</td>
					<td id="regdate${mlist.id}">${mlist.regdate}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
      
   </div>
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

</body>
</html> 