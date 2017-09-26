<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
$(document).ready(function() {
	$("#boardmenu a.category_name").click(function(){
	   $(this).next("div.board_name").slideDown(500).siblings("div.board_name").slideUp("slow");
	});
	getMyinfo();
	
});

function getMyinfo() {
	$.ajax({
		url: "/rnbcafe/member/myinfo",
		type: "GET",
		data: {'id': $('#userId').val()},
		success: function(data) {
			if (data.success == true) {
				$('#userName').append(data.object.name+" 님 정보");
				$('#userRole').append("등급 : "+roleName(data.object.role));
				$('#boardCnt').append(data.object.boardCnt);
				$('#memoCnt').append(data.object.memoCnt);
	      	}
		}
	});
}

function roleName(role) {
	var name;
	if (role == 1) {
		name = '새내기';
	} else if (role == 2) {
		name = '일반';
	} else if (role == 3) {
		name = '우수';
	} else if (role == 4) {
		name = '관리자';
	}
	return name;
}
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
	<div class="panel-heading"><span class="glyphicon glyphicon-user" aria-hidden="true">&nbsp;</span><span id="userName"></span></div>
	<div class="panel-body">
    <span class="glyphicon glyphicon-star" aria-hidden="true"></span> <span id="userRole"></span><br>
    <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 작성 글 수 : <span id="boardCnt"></span><br>
    <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 작성 댓글 수 : <span id="memoCnt"></span><br>
    <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 가입일 : ${fn:substring(user.regdate,0,10) }<br>
    <p class="navbar-text navbar-center"><a href="${root }/member/update?id=${user.id}" class="navbar-link">정보 수정</a></p>
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
         <a href="${root}/board/boardset?bcode=${boardListDto.bcode}&bname=${boardListDto.bname}&pg=1&key=&word=">
            <span class="glyphicon glyphicon-comment"> ${boardListDto.bname}</span>
         </a>
      </c:if>
      <c:if test="${boardListDto.btype == 1}">
         <a href="${root}/oneboard/getoneboard?bcode=${boardListDto.bcode}&bname=${boardListDto.bname}&pg=1&key=&word=">
            <span class="glyphicon glyphicon-pencil"> ${boardListDto.bname}</span>
         </a>
      </c:if>
      <c:if test="${boardListDto.btype == 2}">
         <a href="${root}/imgboard/boardset?bcode=${boardListDto.bcode}&bname=${boardListDto.bname}&pg=1&key=&word=">
            <span class="glyphicon glyphicon-picture"> ${boardListDto.bname}</span>
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

