<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/common/baseheader.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
   
   $('#oneWriteBtn').click(function() {
      var title = $.trim($('#title').val());
      
      if(title != '') {
         $.ajax({
            type : 'POST', //get이냐 post냐
            dataType : 'json',//넘어오는 datatype
            url : '${root}/oneboard/write',//어디로 넘어갈껀지
            data : {'bcode' : '${article.bcode}', 'title' : title},//호출할 data
            success : function(data) {
            	if(data.success == true) {
	               $('#title').val('');
	               makeOneList(data.object);
            	} else {
            		alert("실패");
            	}
            }//callback 설정 성공시? 에러시?(에러는 걍 안함)
         }); //ajax 쓰겟다.
      }
   });
   
   $(document).on('click', '.oneModifyViewBtn', function() { //click되는 시점에서의  document
      $('#modifyDiv'+$(this).attr('data-bseq')).css('display', '');
   });
   
   $(document).on('click', '.oneModifyBtn', function() { //click되는 시점에서의  document
      var bseq = $(this).attr('data-bseq');
      var title = $.trim($('#title' + bseq).val());
      if(content != '') {
         $.ajax({
            type : 'POST', //get이냐 post냐
            dataType : 'json',//넘어오는 datatype
            url : '${root}/oneboard/modify',//어디로 넘어갈껀지
            data : {'bseq' : bseq, 'title' : title, 'bcode' : '${article.bcode}'},//호출할 data
            success : function(data) {
               //$('#mcontent').val('');
               makeOneList(data);
            }//callback 설정 성공시? 에러시?(에러는 걍 안함)
         }); //ajax 쓰겟다.
      }
   });
   
   $(document).on('click', '.oneCancelBtn', function() { //click되는 시점에서의  document
      $('#modifyDiv'+$(this).attr('data-bseq')).css('display', 'none');
   });
   
   $(document).on('click', '.oneDeleteBtn', function() { //click되는 시점에서의  document
      var bseq = $(this).attr('data-bseq');
      $.ajax({
         type : 'GET', //get이냐 post냐
         dataType : 'json',//넘어오는 datatype
         url : '${root}/oneboard/delete',//어디로 넘어갈껀지
         data : {'bseq' : bseq, 'bcode' : '${article.bcode}'},//호출할 data
         success : function(data) {
            //$('#mcontent').val('');
            makeOemoList(data);
         }//callback 설정 성공시? 에러시?(에러는 걍 안함)
      }); //ajax 쓰겟다.
   });
   
});

$.ajax({
   type : 'GET', //get이냐 post냐
   dataType : 'json',//넘어오는 datatype
   url : '${root}/oneboard/list',//어디로 넘어갈껀지
   data : {'seq' : '${article.bcode}'},//호출할 data
   success : function(data) {
      makeOemoList(data);
   }//callback 설정 성공시? 에러시?(에러는 걍 안함)
}); //ajax 쓰겟다.

function makeOneList(data) {
   var output = '';
   var len = data.onelist.length;
   for(var i=0; i<len; i++) {
      output += '<tr>';
      output += '   <td>';
      output += '      <table>';
      output += '         <tr>';
      output += '            <td width="20%"><b>'+ data.onelist[i].id +'</b>&nbsp;&nbsp;</td>';
      output += '             <td width="20%">'+ data.onelist[i].regdate +'</td>';
      output += '             <td width="50%"></td>';
      output += '            <td class="pull-right">';
      if('${member.Id}' == data.onelist[i].Id) {
	      output += '                 <a href="#" class="oneModifyViewBtn" data-bseq="'+ data.onelist[i].bseq +'">수정</a>&nbsp;&nbsp;';
	      output += '                 <a href="#" class="oneDeleteBtn" data-bseq="'+ data.onelist[i].bseq +'">삭제</a>';
      }
      output += '             </td>';
      output += '         </tr>';
      output += '         <tr>';
      output += '            <td colspan="4" class="viewcontent">';
      output += '            <br>';
      output += ''+ data.onelist[i].title +'';
      output += '            </td>';
      output += '         </tr>';
      output += '      </table>';
      output += '   </td>';
      output += '</tr>';
      output += '<tr>';
      output += '   <td>';
      output += '   <div id="modifyDiv'+ data.onelist[i].bseq +'" style="display: none;">';
      output += '      <div class="row input-group-form">';
      output += '         <div class="row col-sm-1">&nbsp&nbsp&nbsp&nbsp&nbsp';
      output += '            <span class="glyphicon glyphicon-arrow-right"></span>';
      output += '         </div>';
      output += '         <div class="col-sm-9">';
      output += '            <textarea class="form-control" rows="3" name="title" id="title'+ data.onelist[i].bseq +'">';
      output += ''+ data.onelist[i].title +'</textarea>';
      output += '         </div>';
      output += '         <div class="col-sm-2">';
      output += '            <div>';
      output += '              <label></label>';
      output += '            </div>';   
      output += '            <button type="button" class="btn btn-warning btn-sm memoModifyBtn" data-mseq="'+ data.onelist[i].bseq +'">수정</button>';
      output += '            <button type="button" class="btn btn-danger btn-sm memoCancelBtn" data-mseq="'+ data.onelist[i].bseq +'">취소</button>';
      output += '         </div>';
      output += '      </div><br>';
      output += '   </div>';
      output += '   </td>';
      output += '</tr>';
   }
   $('#onebody').empty();
   $('#onebody').append(output);
}
</script>

<div class="container" style="margin-top: 70px">
	<div class="col-sm-3 sidenav">
		<!-- 사이드 -->
		<%@ include file="/WEB-INF/views/common/baseside.jsp"%>
	</div>

	<div class="col-sm-9 main">
		
		<div class="alert alert-info">
		  <strong><h3>등업게시판</h3></strong>
		</div>
		
		<div class="well well-lg">
			<form name="levelForm" id="levelForm" action="">
				<div class="row input-group-form">
					<div class="col-sm-10">
						<textarea class="form-control" rows="2" name="lcontent" id="lcontent"></textarea>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-primary btn-lg" id="oneWriteBtn">글쓰기</button>
					</div>
				</div>
			</form>
		</div>
		<table class="table table-striped">
			<tbody id="onebody">
				
			</tbody>
		</table>
		<div class="col-sm-10 col-sm-offset-2">여기에 메인 화면 넣기</div>
		
	</div>
</div>

</body>
</html> 