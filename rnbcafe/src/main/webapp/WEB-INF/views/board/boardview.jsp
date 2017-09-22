<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/common/baseheader.jsp"%>

<script type="text/javascript">
	$(function(){
		$("#memoDiv").hide();
		
		$("#memo").click(function(){
			if($("#memospan").hasClass("glyphicon glyphicon-chevron-down")){
				$("#memoDiv").fadeIn(300);
				$("#memospan").attr('class','glyphicon glyphicon-chevron-up');
			
			} else {
				$("#memoDiv").fadeOut(300);
				$("#memospan").attr('class','glyphicon glyphicon-chevron-down');
			}
		});
		
		$("#btn").click(function(){
			var formdata = new FormData($('#frm')[0]);
			
			$.ajax({
	 			type: "POST",
	 			url: "${root}/board/insertmemo",
	 			data: formdata,
	 			async:false,
	 			contentType: false,
	 	        processData: false,
	 			success:function(data){
	 				if(data.success == true) {
	 					commentLoad(data.object);
	 				}
	 			}
	 		});
		});
	});

	function updateBoard(bseq){
		location.href = "${root}/board/updateboard?bseq="+bseq;
	}
	
	function deleteBoard(bseq){
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href = "${root}/board/deleteboard?bseq="+bseq;
		}
	}
	
	function backBoard(){
		location.href = "${root}/board/boardlist";
	}
	
	function updateMemo() {
		alert(1);
	}
	function deleteMemo() {
		alert(2);
	}
	
	function commentLoad(dto){
		
// 		$("#content").text = "";
		
		$("#memotable").prepend(
				"<tr>"
				+"<td style='border-top: none; font-size: 8pt; font-weight: bold;'>"+dto.name +"</td>"
				+"<td style='border-top: none; font-size: 8pt; font-weight: bold; color: yellow;'>"
				+"New!"
				+"</td>"
				+"<td style='border-top: none; font-size: 8pt; font-weight: bold; text-align: right;'>"
				+"<a href='javascript:updateMemo("+dto.mseq+");'>수정</a> / <a href='javascript:deleteMemo("+dto.mseq+");'>삭제</a>"
				+"</td>"
				+"</tr>"
				+"<tr>"
				+"<td colspan='3'><div id='comment'>"+dto.content+"</div></td>"
				+"</tr>"
				+"<tr>"
				+"<td height='20px;'></td>"
				+"</tr>"
			);
	
	}

	
</script>

<div class="container" style="margin-top: 70px">
	<div class="col-sm-3 sidenav">
		<!-- 사이드 -->
		<%@ include file="/WEB-INF/views/common/baseside.jsp"%>
	</div>

	<div class="col-sm-9 main">
		<table class="table">
			<tr>
				<th colspan="3">${dto.title}</th>
			</tr>
			<tr>
				<td style="color: skyblue">${dto.name}</td>
				<td>조회 ${dto.hit}</td>
				<td><fmt:formatDate value="${dto.regdate}" pattern="yy.MM.dd hh:mm"/></td>
			</tr>
			<tr>
				<td colspan="3" style="padding-top: 70px; padding-bottom: 70px;">${dto.content}</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<button class="btn btn-warning btn-sm" onclick="updateBoard('${dto.bseq}');">
					<span class="glyphicon glyphicon-plus"></span> 수정</button>
					<button class="btn btn-danger btn-sm" onclick="deleteBoard('${dto.bseq}');">
					<span class="glyphicon glyphicon-minus"></span> 삭제</button>
					<button class="btn btn-default btn-sm" onclick="backBoard();">돌아가기</button>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
		<span id="memo" style="cursor: pointer;">
			<b>댓글 작성&nbsp;</b> <span id="memospan" class="glyphicon glyphicon-chevron-down"></span>
		</span><br><br>
		<form id="frm" name="frm" method="post">
			<input type="hidden" name="bseq" value="${dto.bseq}">
			<input type="hidden" name="id" value="${user.id}">
			<div id="memoDiv">
				<span style="color:purple; font-size: 8pt"><b>작성자 : ${user.name}</b></span><br>
				<textarea rows="5" cols="95" id="content" name="content" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다.
댓글 작성 시 타인에 대한 배려와  책임을 담아주세요." maxlength="500"></textarea>
				<input id="btn" class="btn btn-default btn" type="button" value="등록" style="vertical-align: top; margin-top: 72px; margin-left: 5px;">
			</div>
		</form><br>
		
		<div>
			<table class="table" id="memotable">
			<c:if test="${!empty mlist}">
				<c:forEach items="${mlist}" var="dto">
					<tr>
						<td style="border-top: none; font-size: 8pt; font-weight: bold;">${dto.name}</td>
						<td style="border-top: none; font-size: 8pt; font-weight: bold;">
						<fmt:formatDate value="${dto.regdate}" pattern="yy.MM.dd hh:mm"/>
						</td>
						<td style="border-top: none; font-size: 8pt; font-weight: bold; text-align: right;">
						<a href="javascript:updateMemo(${dto.mseq});">수정</a> / <a href="javascript:deleteMemo(${dto.mseq});">삭제</a>
						</td>
					</tr>
					<tr>
						<td colspan="3"><div id="comment">${dto.content}</div></td>
					</tr>
					<tr>
						<td height="20px;"></td>
					</tr>
				</c:forEach>
			</c:if>
			</table>
		</div>
	</div>
</div>

</body>
</html>