<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#modal_userdetail .modal-dialog{
	width: 70%;
}
.closeButton{
	width: 50px;
	height: 50px;
	font-size: 35px;
}
</style>
<div class="modal fade" id="modal_memberdetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 <div class="modal-dialog modal-lg">
   <div class="modal-content">
     <div class="modal-header">
		<button type="button" class="close closeButton" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h2 class="modal-title" id="myModalLabel">Detail Info</h2>
     </div>
    	<div class="modal-body">

<!-- 폼 시작 -->
<form name="member	detailform" method="post" action="#">
<div class="table-wrapper">
	★ 글 작성 수 : <span id="lvBoardCnt"/></span><br>
	★ 댓글 작성 수 : <span id="lvMemoCnt"></span><br><br>
	
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
			<tr class="trhover">
				<td id="modalid" value=""></td>
				<td id="modalname"></td>
				<td id="modalgender"></td>
				<td id="modalbirth"></td>
				<td id="modalphone"></td>
				<td id="modalrole" value=""></td>
				<td id="modalregdate"></td>
			</tr>
		</tbody>
	</table>
    
	<button type="button" id="levelupBtn" class="btn btn-info btn-block" data-toggle="modal" data-target="#modal_levelup">등업</button>
	<%@ include file="/WEB-INF/views/admin/modal_levelup.jsp" %>
</div>
</form>
<!-- 폼 끝 -->
     </div>
    </div>
  </div>
</div>
<script>
function modal_levelup_close() {
	$('#modal_levelup.lvcloseButton').click();
}

function getlvmemberinfo(id) {
    /* if(data.object.role >= 4) {
   		$('#levelupBtn').remove();
    } */
   $.ajax({
      url: "/rnbcafe/member/myinfo",
      type: "GET",
      data: {'id': id},
      success: function(data) {
         if (data.success == true) {
        	 $('#lvBoardCnt').empty();
        	 $('#lvMemoCnt').empty();
	         $('#lvBoardCnt').append(data.object.boardCnt);
	         $('#lvMemoCnt').append(data.object.memoCnt);
         }
      }
   });
}
</script>
