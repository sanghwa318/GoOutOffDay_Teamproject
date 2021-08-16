 function getContextPath() {
      var hostIndex = location.href.indexOf(location.host)
            + location.host.length;
      var contextPath = location.href.substring(hostIndex, location.href
            .indexOf('/', hostIndex + 1));
      return contextPath;
   }

$(function(){
		
    $("#crewname_unique_check").click(function(e) {
        const crewName = $("#crew_name").val();

        if (!crewName) {
            alert('크루이름을 입력하세요.');
      	
        }
		else{
			$.ajax({
				url:getContextPath() + '/commPage/comm_crew_est_ok/crewname_unique_check',
				type: 'post',
				dateType: 'json',
				data: {crew_name: crewName},
				success: function(data){
					alert('사용가능한 크루이름 입니다.');
					$("input[name=crewname_unique_check]")
                                    .val('y');
                              $("#crew_name").prop("disabled",true);
				},error:function(request,status,error){
					alert('이미 사용중인 크루이름 입니다.');
				}
			})
       
        }
    });
	
	
});




