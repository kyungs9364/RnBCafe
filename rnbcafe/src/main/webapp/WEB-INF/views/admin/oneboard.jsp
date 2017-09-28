<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }" />

<script type="text/javascript">
$(document).ready(function() {
	makeOneList();
   $('#oneWriteBtn').click(function() {
      var title = $.trim($('#title').val());
      console.log('aaaaaa');
      console.log(title);
      if(title != '') {
         $.ajax({
            type : 'POST', //get이냐 post냐
            url : '${root}/oneboard/write',//어디로 넘어갈껀지
            data : {'bcode' : '${bcode}', 'title' : title},//호출할 data
            success : function(data) {
            	if(data.success == true) {
	               $('#title').val('');
	               makeOneList();
	               
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
      if(title != '') {
         $.ajax({
            type : 'POST', //get이냐 post냐
            url : '${root}/oneboard/modify',//어디로 넘어갈껀지
            data : {'bseq' : bseq, 'title' : title, 'bcode' : '${bcode}'},//호출할 data
            success : function(data) {
            	if (data.success == true) {
	               makeOneList();
            	} else {
            		alert("오류");
            	}
            }//callback 설정 성공시? 에러시?(에러는 걍 안함)
         }); //ajax 쓰겟다.
      }
   });
   
   $(document).on('click', '.oneCancelBtn', function() { //click되는 시점에서의  document
      $('#modifyDiv'+$(this).attr('data-bseq')).css('display', 'none');
   });
   
   $(document).on('click', '.oneDeleteBtn', function() { //click되는 시점에서의  document
      var bseq = $(this).attr('data-bseq');
   	if(confirm("정말 삭제 하시겠습니까?")) {
      $.ajax({
         type : 'GET', //get이냐 post냐
         dataType : 'json',//넘어오는 datatype
         url : '${root}/oneboard/delete',//어디로 넘어갈껀지
         data : {'bseq' : bseq, 'bcode' : '${bcode}'},//호출할 data
         success : function(data) {
            //$('#mcontent').val('');
            makeOneList();
         }//callback 설정 성공시? 에러시?(에러는 걍 안함)
      }); //ajax 쓰겟다.
   	}
   });
   
});
function makeOneList() {
	$.ajax({
	   type : 'GET', //get이냐 post냐
	   dataType : 'json',//넘어오는 datatype
	   url : '${root}/oneboard/makeList',//어디로 넘어갈껀지
	   data : {'bcode' : '${bcode}'},//호출할 data
	   success : function(data) {
		   if (data.success== true) {
			   appendOneList(data.items);
		   }
	   }//callback 설정 성공시? 에러시?(에러는 걍 안함)
	}); //ajax 쓰겟다.
}

function dateToStr(date) {
	   return new Date(date).toISOString().slice(0,10);
}

function appendOneList(data) {
	console.log(data);
   var output = '';
   console.log(data[0]);
   console.log('${user.id}')
   var len = data.length;
   for(var i=0; i<len; i++) {
      output += '<tr>';
      output += '   <td>';
      output += '      <table>';
      output += '         <tr>';
      output += '            <td width="20%"><b>'+ data[i].id +'</b>&nbsp;&nbsp;</td>';
      output += '             <td width="20%">'+ dateToStr(data[i].regdate) + '</td>';
      output += '             <td width="340px"></td>';
      output += '            <td class="pull-right">';
      if('${user.id}' == data[i].id || '${user.role}' == 4) {
	      output += '                 <a href="#" class="oneModifyViewBtn" data-bseq="'+ data[i].bseq +'">수정</a>&nbsp;&nbsp;';
	      output += '                 <a href="#" class="oneDeleteBtn" data-bseq="'+ data[i].bseq +'">삭제</a>';
      }
      output += '             </td>';
      output += '         </tr>';
      output += '         <tr>';
      output += '            <td colspan="4" class="viewcontent">';
      output += '            <br>';
      output += ''+ data[i].title +'';
      output += '            </td>';
      output += '         </tr>';
      output += '      </table>';
      output += '   </td>';
      output += '</tr>';
      output += '<tr>';
      output += '   <td>';
      output += '   <div id="modifyDiv'+ data[i].bseq +'" style="display: none;">';
      output += '      <div class="row input-group-form">';
      output += '         <div class="row col-sm-1">&nbsp&nbsp&nbsp&nbsp&nbsp';
      output += '            <span class="glyphicon glyphicon-arrow-right"></span>';
      output += '         </div>';
      output += '         <div class="col-sm-9">';
      output += '            <textarea class="form-control" rows="3" name="title" id="title'+ data[i].bseq +'">';
      output += ''+ data[i].title +'</textarea>';
      output += '         </div>';
      output += '         <div class="col-sm-2">';
      output += '            <div>';
      output += '              <label></label>';
      output += '            </div>';   
      output += '            <button type="button" class="btn btn-warning btn-sm oneModifyBtn" data-bseq="'+ data[i].bseq +'">수정</button>';
      output += '            <button type="button" class="btn btn-danger btn-sm oneCancelBtn" data-bseq="'+ data[i].bseq +'">취소</button>';
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

	<div class="col-sm-9 main">
		
		<div class="alert alert-info">
		  <strong><h3>${bname}</h3></strong>
		</div>
		
		<div class="well well-lg">
			<form name="oneForm" id="oneForm" action="">
				<div class="row input-group-form">
					<div class="col-sm-10">
						<textarea class="form-control" rows="2" name="title" id="title"></textarea>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-primary btn-lg" id="oneWriteBtn">글쓰기</button>
					</div>
				</div>
			</form>
		</div>
		<table class="table">
			<tbody id="onebody"></tbody>
		</table>
		
	</div>
