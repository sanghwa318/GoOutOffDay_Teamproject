/**
 * 
 */
$(function() {
	var courseNameSelect = document.getElementById("course_name");
//여기 부분 잘못됨. 계속 첫번째 셀렉트값만 받아오고있음
	var course_name = courseNameSelect.options[courseNameSelect.selectedIndex].value;

	$('#course_name').change(function(e) {
		e.preventDefault();

		$.ajax({
			url: getContextPath() + '/commPage/comm_myCourseGetLoc.do',
			type: 'post',
			data: { course_name },
			success: function(data) {
				console.log(data.courseName[0].lon)
				for (var i = 0; i<data.courseName.length; i++) {
					console.log(data.courseName[i].lon)


				}
			}
		});
	});
});