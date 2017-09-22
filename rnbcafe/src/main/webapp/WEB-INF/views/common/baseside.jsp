<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<script type="text/javascript">
$(document).ready(function() {
	$("#boardmenu a.category_name").click(function(){
	   $(this).next("div.board_name").slideDown(500).siblings("div.board_name").slideUp("slow");
	});
	 
	$.ajax({
	url: "/rnbcafe/member/myinfo",
	type: "GET",
	data: {'id': $('#userId').val()},
	success: function(data) {
		if (data.success == true) {
			$('#boardCnt').append(data.object.boardCnt);
			$('#memoCnt').append(data.object.memoCnt);
      	}
	}
});
});
</script>
<style type="text/css">
body {
   margin: 10px auto;
}

.category_name {
   padding: 5px 10px;
   cursor: pointer;
   position: relative;
   margin: 2px;
   font-weight: bold;
   text-align: left;
   background-color: #FFB2D9;   #F361A6;
}

.board_name {
   display: none;
   text-align: left;
}

.board_name a{
   display: block;
   color: #2457BD;
   background: #F2F7FC;
   padding-left: 10px;
   text-decoration: none;
}

.board_name a:hover {
   color: #000000;
   text-decoration: underline;
}

.sidenav {
      /* background-color: #f1f1f1; */
      height: 100%;
}
    
</style>

<div class="panel panel-info">
	<input type="hidden" id="userId" value="${user.id }">
	<div class="panel-heading"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  ${user.name } 님 정보</div>
	<div class="panel-body">
    <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 등급 : ${user.role } <br>
    <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 작성 글 수 : <span id="boardCnt"></span><br>
    <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 작성 댓글 수 : <span id="memoCnt"></span><br>
    <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 가입일 : <br>
    <p class="navbar-text navbar-center"><a href="${root }/member/update" class="navbar-link">정보 수정</a></p>
  	</div>
</div>

<div class="list-group" id="boardmenu">
<c:set var="ccode" value="0"/>
	<c:forEach varStatus="i" var="boardListDto" items="${boardmenu}">
      <c:if test="${ccode != boardListDto.ccode}">
         <c:set var="ccode" value="${boardListDto.ccode}"/>
            <a href="#" class="category_name list-group-item active">
               <span class="glyphicon glyphicon-tags"> 
                  ${boardListDto.cname}
               </span>
            </a>
         <div class="board_name">
      </c:if>
      <c:if test="${boardListDto.btype == 0}">
         <a href="${root}/${boardListDto.control}/boardset?bcode=${boardListDto.bcode}&pg=1&key=&word=">
            <span class="glyphicon glyphicon-comment"> ${boardListDto.bname}</span>
         </a>
      </c:if>
      <c:if test="${boardListDto.btype == 1}">
         <a href="${root}/${boardListDto.control}/getoneboard?bcode=${boardListDto.bcode}&pg=1&key=&word=">
            <span class="glyphicon glyphicon-pencil"> ${boardListDto.bname}</span>
         </a>
      </c:if>
      <c:if test="${i.index < boardmenu.size() -1 }">
         <c:if test="${ccode != boardmenu.get(i.index + 1).ccode}">   
		</div>
         </c:if>
      </c:if>
	</c:forEach>
</div>
</div>

