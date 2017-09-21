<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/common/baseheader.jsp"%>
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
<div class="container" style="margin-top: 70px">
	<div class="col-sm-3 sidenav">
		<!-- 사이드 -->
		<%@ include file="/WEB-INF/views/common/baseside.jsp"%>
	</div>

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
                  <option value="${btlist.btype}"/>
                  ${btlist.name}
</c:forEach>

               </select> 
            </div>
         </div><br>
         <div class="row" style="margin:auto;">
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
		

	</div>
</div>

</body>
</html> 