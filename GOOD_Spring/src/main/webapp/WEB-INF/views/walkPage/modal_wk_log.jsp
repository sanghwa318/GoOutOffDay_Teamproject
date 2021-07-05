<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

.modal-title{
text-align:center;
padding-top:10px;
}

.modal-footer{
text-align:center;
}

.input-group-addon >a{
text-decoration: none;

}

.modal-header > p{
font-size:20px;
}



</style>

</head>
<body>


<form id="search-form">
<div class="modal-header">
<h3><strong>걷기 기록</strong></h3>
<p>기록하고 싶은 해당 코스를 입력해주세요.</p>
</div>

<div class="modal-body">
<div class="input-group">
<input type="text" class="form-control" id="log-search" placeholder="코스를 입력해주세요." name="log-search" style="height:50px;">
<span class="input-group-addon" ><button type="submit" class="btn ">검색</button></span>
</div>
<div class="modal-body hide"></div>
</div>

<div class="modal-footer">
<button type="button" class="btn btn-warning" data-dismiss="modal" style="width:150px;">닫기</button>
<button type="submit" class="btn btn-primary" data-dismiss="modal" style="width:150px;">시작</button>

</div>
</form>



<!--  
<div class="modal-header">
<h4 class="modal-title"><strong>기록하고 싶은 해당 코스명을 입력해주세요.</strong></h4>
</div>

<div class="modal-body">
<div class="input-group">
<input type="text" class="form-control" placeholder="코스명을 입력해주세요." style="height:40px;">
<span class="input-group-addon"><a href="#" class="btn btn-xs" >검색</a></span>

</div>
</div>

<div class="modal-footer">

<button type="submit" class="btn btn-warning" data-dismiss="modal" style="width:150px;">닫기</button>
<button type="button" class="btn btn-primary" data-dismiss="modal" style="width:150px;">시작</button>

</div>
 -->
</body>


</html>