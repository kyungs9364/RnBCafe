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
		
		<table class="table table-striped">
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
				<tr>
				  <td>${mlist.id}</td>
				  <td>${mlist.name}</td>
				  <td>${mlist.gender}</td>
				  <td>${mlist.birth}</td>
				  <td>${mlist.phone}</td>
				  <td>${mlist.role}</td>
				  <td>${mlist.regdate}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
      
   </div>
		

	</div>
</div>

</body>
</html> 