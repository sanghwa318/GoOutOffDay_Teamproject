<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>

<style type="text/css">
.main_header>h1 {
	position: relative;
	text-align: center;
	transition: all 0.3s ease;
	transform: translateY(0);
}
</style>
</head>
<body>
	<!-- 푸터빼고 감싸주세요 -->
	<div class="wrapper">
		<!-- 상단영역 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- 본문영역 -->
		<div class="container">
		<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/adminPage/admin_index.jsp'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">관리자페이지 </span>
				</h1>
			</div>
			<!-- 제목영역 -->
			<h1 class="page-header">회원 코스 관리</h1>

			<!-- //제목영역 끝 -->
			<!-- 리스트영역-->
			<form id="course-form" class="form-horizontal">
				<table class='table'>
					<colgroup>
						<col width="30" />
						<col width="110" />
						<col />
						<col width="150" />
						<col width="150" />
						<col width="70" />
						<col width="120" />
						<col width="30" />
					</colgroup>
					<thead>
						<tr>
							<th class='text-center'><input type="checkbox"
								name="all_check" id="all_check" checked /></th>
							<th class='text-center'>-</th>
							<th class='text-center'>코스명</th>
							<th class='text-center'>작성자</th>
							<th class='text-center'>작성일시</th>
							<th class='text-center'>조회수</th>
							<th class='text-center'>좋아요</th>
						</tr>
					</thead>
					<tr class="course-item course-item-001">
						<td class='text-center' rowspan="1"><input type='checkbox'
							name='course_id[]' class="course_id" value="987" checked /></td>
						<td class='text-center' rowspan="1"><a href="#"> <img
								src="" width="50" />
						</a></td>
						<td class='text-center' rowspan="1"><a href="#">나만의 코스 1번</a>
						</td>
						<td class='text-center'>작성자</td>
						<td class='text-center'><span class='datetime'
							data-value="35800"> 2021-06-11 11:50:00</span></td>
						<td class='text-center'><span class='view' data-value="">100,300</span><span>회</span></td>
						<td class='text-center text-primary'><span class='like'
							data-value=""> 300</span> <span>개</span></td>
						<td class="text-center">
							<button class="btn-remove btn btn-danger btn-xs"
								data-course-id="987" data-course-name="나만의 코스 1번">
								<i class="fa fa-trash"></i>
							</button>
						</td>
					</tr>
				</table>
				<hr />
				<div class="text-center">
					<button type="submit" class="btn btn-primary">명예의 전당 등록</button>
					<button type="button" class="btn btn-warning" id="check-delete">선택항목
						삭제하기</button>
				</div>
			</form>
			<!-- //리스트영역 끝-->
		</div>
		<!-- //본문영역 끝 -->
	</div>
	<div></div>
	<!-- 하단영역 -->
	<%@ include file="../inc/Footer.jsp"%>
	<%@ include file="../inc/plugin.jsp"%>
	<script type="text/javascript">
$(function() {
    $(".btn-remove").click(function(e) {
        e.preventDefault();
        const current = $(this);
        const courseId = current.data('course-id');
        const courseName = current.data('course-name');
        
        swal({
            title: '확인',
            text: '정말 ' + courseName + '(을)를 삭제하시겠습니까?', 
            type: "question",
            showCancelButton: true
        }).then(function(result) {
            if (result.value) {
                $.delete(ROOT_URL + "", {
                    course_id: [courseId] // 배열로 묶어서 전송
                }, function(json) {
                    $('.course-item-' + courseId).remove();
                });
            }
        });
    });
    
    $("#all_check").change(function() {
        $(".course_id").prop('checked', $(this).is(':checked'));
    });
    
    $("#check-delete").click(function() {
        const courseId = [];
        const obj = $(".course_id:checked");
        
        if (obj.length < 1) {
            swal('알림', '선택된 항목이 없습니다.');
            return false;
        }
        
        swal({
            title: '확인',
            text: '정말 ' + obj.length + '개의 항목을 삭제하시겠습니까?', 
            type: "question",
            showCancelButton: true
        }).then(function(result) {
            if (result.value) {
                obj.each(function(i, v) {
                	courseId.push($(v).val());
                });
                
                $.delete(ROOT_URL + "", {
                	course_id: courseId
                }, function(json) {
                    swal({
                        title: '확인',
                        text: '삭제되었습니다.'
                    }).then(function(result) {
                        obj.each(function(i, v) {
                            $('.course-item-' + $(v).val()).remove();
                        });
                        $('html, body').animate({scrollTop : 0}, 400);
                    });
                });
            }
        });
    });
});
</script>
</body>
</html>