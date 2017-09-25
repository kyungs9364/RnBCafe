<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
function levelup(){
	var lvid = document.getElementById("modalid").childNodes[0].nodeValue;
	location.href = "${root}/memberadmin/levelup?lvid="+lvid;
}
</script>

<style>
#modal_levelup .modal-dialog{
	width: 30%;
}
.lvcloseButton{
	width: 50px;
	height: 50px;
	font-size: 35px;
}
</style>

 	<div class="modal fade" id="modal_levelup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	     <div class="modal-header">
			<button type="button" class="close lvcloseButton" data-dismiss="modal" aria-labe="Close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h2 class="modal-title" id="myModalLabel">Level up</h2>
	     </div>
	     <div class="modal-body">
<!-- 폼 시작 -->
	<center>등업 처리를 하시겠습니까?<br><br></center>
	
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-9">
			<button type="button" class="btn btn-primary" onclick="javascript:levelup();">네</button>
			<button type="button" class="btn btn-danger" onclick="modal_levelup_close()">아니오</button>
		</div>
	</div>
	<!-- 폼 끝 -->
      </div>
    </div>
  </div>
</div>