<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }" />

<script type="text/javascript">
$(document).ready(function() {
   $('#cPlusBtn').click(function() {
      $('#categoryform').attr('action', '${root}/admin/makecategory').submit();
   });
   
   $('#bPlusBtn').click(function() {
      $('#boardform').attr('action', '${root}/admin/makeboard').submit();      
   });
});
</script>

	<div class="col-sm-9 main">
		
		<div class="row jumbotron">
      
         <h2>
         <font color="red"><b>카테고리</b></font> 생성
         </h2><br>
         
         <form id="categoryform" name="categoryform" method="get" action="">
         
         <div class="row" style="margin:auto;">   
               <div class="col-sm-4">
                  <input class="form-control" type="text" name="name" id="name" placeholder="카테고리 이름">
               </div>
               <div class="col-sm-4">
                    <a href="#" class="btn btn-primary" id="cPlusBtn">
                      <span class="glyphicon glyphicon-tags"> 카테고리 추가</span>
                    </a>
               </div>
         </div><br>
         
         </form>
         
         <h2>
         <font color="red"><b>게시판</b></font> 생성
         </h2><br>
         
         <form id="boardform" name="boardform" method="get" action="">
         
         <div class="row" style="margin:auto;">
            <div class="col-sm-4">
               <select class="form-control" id="ccode" name="ccode">
<c:forEach var="clist" items="${clist}">
                  <option value="${clist.ccode}"/>
                  ${clist.name}
</c:forEach>
               </select> 
            </div>
            <div class="col-sm-4">
               <select class="form-control" id="btype" name="btype">
<c:forEach var="btlist" items="${btlist}">
<c:if test="${btlist.btype<2}">
                  <option value="${btlist.btype}"/>
                  ${btlist.name}
</c:if>
</c:forEach>
               </select> 
            </div>
         </div><br>
         <div class="row" style="margin:auto;">
            <div class="col-sm-4">
               <select class="form-control" id="role" name="role">
					<option value="1"/>새내기
					<option value="2"/>일반회원
					<option value="3"/>우수회원
					<option value="4"/>관리자
               </select>
            </div>
            <div class="col-sm-4">
               <input class="form-control" type="text" name="bname" id="bname" placeholder="게시판 이름">
            </div>
            <div class="col-sm-4">
               <a href="#" class="btn btn-info" id="bPlusBtn">
                   <span class="glyphicon glyphicon-th-list"> 게시판 추가</span>
                </a>
            </div>
         </div>
         </form>
      
      </div>
   </div>
		
