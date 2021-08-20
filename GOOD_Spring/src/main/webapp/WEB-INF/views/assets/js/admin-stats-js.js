/**
 * 관리자 통계 페이지에서 사용되는 자바스크립트 파일
 */

		
		$(function(){
			/** 로그인 현황 **/
			$.ajax({
				url:getContextPath()+'/adminPage/admin_stats_login',
				method:'get',
				data:{},
				dataType:'json',
				success:function(data){
					var loginDateHour = [];
					var loginCnt = [];
					var loginOutput=data.loginOutput
					
						for(var i=0;i<loginOutput.length; i++){
							if(data.loginOutput[i].log_hour!=null){
								loginDateHour.push(data.loginOutput[i].log_hour)
							}else{
								loginDateHour.push(data.loginOutput[i].log_date)
							}
							loginCnt.push(data.loginOutput[i].log_cnt)
						}
					
					const ctx1 = document.getElementById('loginChart').getContext('2d');
					const loginChart = new Chart(ctx1, {
						type : 'line',
						data : {
							labels : loginDateHour,
							datasets : [ {
								axis : 'x',
								label : '접속인원',
								data : loginCnt,
								backgroundColor : [ 
									'rgba(54, 162, 235, 0.2)' ],
							borderColor : [
									'rgba(54, 162, 235, 1)' ],
							borderWidth : 1
							} ]
						},
						options : {
							indexAxis : 'x',
						}
					});
					
					$("#loginCnt").html("Total : "+data.loginCnt)
				}
			})
			$('#login-interval').on('change', function(){
				$('#loginChart').remove();
				$('#canvas-container1>.canvas').append('<canvas id="loginChart" width="10" height="3"><canvas>')
				var interval=$('#login-interval option:selected').val()
				$.ajax({
				url:getContextPath()+'/adminPage/admin_stats_login',
				method:'get',
				data:{interval},
				dataType:'json',
				success:function(data){
					var loginDateHour = [];
					var loginCnt = [];
					var loginOutput=data.loginOutput
					console.log(loginOutput)
					
						for(var i=0;i<loginOutput.length; i++){
							if(data.loginOutput[i].log_date!=null){
								loginDateHour.push(data.loginOutput[i].log_date)
							}else{
								loginDateHour.push(data.loginOutput[i].log_hour)
							}
							loginCnt.push(data.loginOutput[i].log_cnt)
						}
					const ctx1 = document.getElementById('loginChart').getContext('2d');
					const loginChart = new Chart(ctx1, {
						type : 'line',
						data : {
							labels : loginDateHour,
							datasets : [ {
								axis : 'x',
								label : '접속인원',
								data : loginCnt,
								backgroundColor : [ 
									'rgba(54, 162, 235, 0.3)' ],
							borderColor : [
									'rgba(54, 162, 235, 1)' ],
							borderWidth : 1
							} ]
						},
						options : {
							indexAxis : 'x',
						}
					});
					$("#loginCnt").html("Total : "+data.loginCnt)
				}
			})
			})
			/**로그인 현황 끝 **/
		
			/** 회원가입 현황 **/		
			$.ajax({
				url:getContextPath()+'/adminPage/admin_stats_join',
				method:'get',
				data:{},
				dataType:'json',
				success:function(data){
					var joinDateHour = [];
					var joinCnt = [];
					var joinOutput=data.joinOutput
					
						for(var i=0;i<joinOutput.length; i++){
							if(data.joinOutput[i].log_hour!=null){
								joinDateHour.push(data.joinOutput[i].log_hour)
							}else{
								joinDateHour.push(data.joinOutput[i].log_date)
							}
							joinCnt.push(data.joinOutput[i].log_cnt)
						}
					
					const ctx1 = document.getElementById('joinChart').getContext('2d');
					const joinChart = new Chart(ctx1, {
						type : 'line',
						data : {
							labels : joinDateHour,
							datasets : [ {
								axis : 'x',
								label : '접속인원',
								data : joinCnt,
								backgroundColor : [ 
									'rgba(255, 99, 132, 0.3)' ],
									borderColor : [
										'rgba(255, 99, 132, 1)' ],
							borderWidth : 1
							} ]
						},
						options : {
							indexAxis : 'x',
						}
					});
					
					$("#joinCnt").html("Total : "+data.joinCnt)
				}
			})
			//기간설정
			$('#join-interval').on('change', function(){
				$('#joinChart').remove();
				$('#canvas-container2>.canvas').append('<canvas id="joinChart" width="10" height="3"><canvas>')
				var interval=$('#join-interval option:selected').val()
				$.ajax({
				url:getContextPath()+'/adminPage/admin_stats_join',
				method:'get',
				data:{interval},
				dataType:'json',
				success:function(data){
					var joinDateHour = [];
					var joinCnt = [];
					var joinOutput=data.joinOutput
					console.log(joinOutput)
					
						for(var i=0;i<joinOutput.length; i++){
							if(data.joinOutput[i].log_date!=null){
								joinDateHour.push(data.joinOutput[i].log_date)
							}else{
								joinDateHour.push(data.joinOutput[i].log_hour)
							}
							joinCnt.push(data.joinOutput[i].log_cnt)
						}
					const ctx1 = document.getElementById('joinChart').getContext('2d');
					const joinChart = new Chart(ctx1, {
						type : 'line',
						data : {
							labels : joinDateHour,
							datasets : [ {
								axis : 'x',
								label : '신규 회원 수',
								data : joinCnt,
								backgroundColor : [ 
									'rgba(255, 99, 132, 0.3)' ],
									borderColor : [
										'rgba(255, 99, 132, 1)' ],
							borderWidth : 1
							} ]
						},
						options : {
							indexAxis : 'x',
						}
					});
					$("#joinCnt").html("Total : "+data.joinCnt)
				}
			})
			})

		/** 회원가입 현황 끝 **/

		/** 인기검색어 **/
		$.ajax({
			url:getContextPath()+'/adminPage/admin_stats_kw',
			method:'get',
			data:{},
			dataType:'json',
			success:function(data){
						console.log(data)
						var keyword = [];
						var keywordCnt = [];
						for(var i=0; i<data.output_Top10_keyword.length; i++){
							keyword.push(data.output_Top10_keyword[i].search_keyword)
							keywordCnt.push(data.output_Top10_keyword[i].log_cnt);
						}
						const ctx3 = document.getElementById('keywordChart').getContext('2d');
						const keywordChart = new Chart(ctx3, {
							type : 'pie',
							data : {
								labels : keyword,
								datasets : [ {
									axis : 'x',
									label : '인기검색어',
									data : keywordCnt,
									backgroundColor : [ 
										'rgba(246, 229, 141, 0.5)',
										'rgba(255, 190, 118, 0.5)',
										'rgba(255, 121, 121, 0.5)',
										'rgba(186, 220, 88, 0.5)',
										'rgba(56, 173, 169, 0.5)',
										'rgba(126, 214, 223, 0.5)',
										'rgba(224, 86, 253, 0.5)',
										'rgba(104, 109, 224, 0.5)',
										'rgba(48, 51, 107, 0.5)',
										'rgba(149, 175, 192, 0.5)'
										],
										borderColor : [
											'rgba(246, 229, 141,1.0)',
											'rgba(255, 190, 118,1.0)',
											'rgba(255, 121, 121,1.0)',
											'rgba(186, 220, 88,1.0)',
											'rgba(56, 173, 169, 1.0)',
											'rgba(126, 214, 223,1.0)',
											'rgba(224, 86, 253,1.0)',
											'rgba(104, 109, 224,1.0)',
											'rgba(48, 51, 107,1.0)',
											'rgba(149, 175, 192,1.0)' ],
										borderWidth : 1
										} ]
									},
									options : {
										indexAxis : 'x',
										maintainAspectRatio: false,
									}
								});
						if(data.output_Top_keyword==null){
							$("#TOP_Keyword").html("검색 기록이 없습니다.")
							$("#keywordCnt").html("Total : 0번")
						}else{
							$("#TOP_Keyword").html("TOP Keyword: "+data.output_Top_keyword.search_keyword)
							$("#keywordCnt").html("Total : "+data.output_Top_keyword.log_cnt+"번")
						}
			}
		})
		//기간설정
		$('#keyword-interval').on('change', function(){
			$('#keywordChart').remove();
			$('#canvas-container3>.canvas').append('<canvas id="keywordChart" width="10" height="3"><canvas>')
			var interval=$('#keyword-interval option:selected').val()
			$.ajax({
				url:getContextPath()+'/adminPage/admin_stats_kw',
				method:'get',
				data:{interval},
				dataType:'json',
				success:function(data){
							console.log(data)
							var keyword = [];
							var keywordCnt = [];
							for(var i=0; i<data.output_Top10_keyword.length; i++){
								keyword.push(data.output_Top10_keyword[i].search_keyword)
								keywordCnt.push(data.output_Top10_keyword[i].log_cnt);
							}
							const ctx3 = document.getElementById('keywordChart').getContext('2d');
							const keywordChart = new Chart(ctx3, {
								type : 'pie',
								data : {
									labels : keyword,
									datasets : [ {
										axis : 'x',
										label : '인기검색어',
										data : keywordCnt,
										backgroundColor : [ 
											'rgba(246, 229, 141, 0.5)',
											'rgba(255, 190, 118, 0.5)',
											'rgba(255, 121, 121, 0.5)',
											'rgba(186, 220, 88, 0.5)',
											'rgba(56, 173, 169, 0.5)',
											'rgba(126, 214, 223, 0.5)',
											'rgba(224, 86, 253, 0.5)',
											'rgba(104, 109, 224, 0.5)',
											'rgba(48, 51, 107, 0.5)',
											'rgba(149, 175, 192, 0.5)'
											],
											borderColor : [
												'rgba(246, 229, 141,1.0)',
												'rgba(255, 190, 118,1.0)',
												'rgba(255, 121, 121,1.0)',
												'rgba(186, 220, 88,1.0)',
												'rgba(56, 173, 169, 1.0)',
												'rgba(126, 214, 223,1.0)',
												'rgba(224, 86, 253,1.0)',
												'rgba(104, 109, 224,1.0)',
												'rgba(48, 51, 107,1.0)',
												'rgba(149, 175, 192,1.0)' ],
											borderWidth : 1
											} ]
										},
										options : {
											indexAxis : 'x',
											maintainAspectRatio: false,
										}
									});
							if(data.output_Top_keyword==null){
								$("#TOP_Keyword").html("검색 기록이 없습니다.")
								$("#keywordCnt").html("Total : 0번")
							}else{
								$("#TOP_Keyword").html("TOP Keyword: "+data.output_Top_keyword.search_keyword)
								$("#keywordCnt").html("Total : "+data.output_Top_keyword.log_cnt+"번")
							}
				}
			})
		})
		/** 인기검색어 끝 **/
		
		/** 당일 찜추가를 한 시간별 인원과 그중 외부사이트로 이동한사람의 시간별인원 **/
		$.ajax({
			url:getContextPath()+'/adminPage/admin_stats_BMEL',
			method:'get',
			data:{},
			dataType:'json',
			success:function(data){
				var AddHour = [];
				var AddCnt = [];
				var ExLInkHour = [];
				var ExLinkCnt = [];
				
				for(var i=0; i<data.output_Hour_Count_bookmark.length; i++){
					if(data.output_Hour_Count_bookmark[i].log_date!=null){
						AddHour.push(data.output_Hour_Count_bookmark[i].log_date);
					}else{
						AddHour.push(data.output_Hour_Count_bookmark[i].log_hour);						
					}
					AddCnt.push(data.output_Hour_Count_bookmark[i].log_cnt);
				}
				for(var i=0; i<data.output_Hour_Count_ExLink.length; i++){
					if(data.output_Hour_Count_ExLink[i].log_date!=null){
						ExLInkHour.push(data.output_Hour_Count_ExLink[i].log_date);
					}else{
						ExLInkHour.push(data.output_Hour_Count_ExLink[i].log_hour);						
					}
					ExLinkCnt.push(data.output_Hour_Count_ExLink[i].log_cnt);
				}
				
				
				const ctx4 = document.getElementById('bmChart').getContext('2d');
				const bmChart = new Chart(ctx4,{
					data : {
						labels : AddHour,
						datasets : [ {
								axis : 'x',
								type : 'bar',
								label : '찜추가 인원',
								data : AddCnt,
								backgroundColor : [ 
									'rgba(255, 99, 132, 0.5)' ],
							borderColor : [
								'rgba(255, 99, 132, 1)' ],
							borderWidth : 1
							
						}]
					},
					options : {
						indexAxis : 'x',
						maintainAspectRatio: false,
					}
				});
				const ctx44 = document.getElementById('elChart').getContext('2d');
				const elChart = new Chart(ctx44,{
					data : {
						labels : ExLInkHour,
						datasets : [ {
								axis : 'x',
								type : 'bar',
								label : '바로가기이용 인원',
								data : ExLinkCnt,
								backgroundColor : [ 
									'rgba(54, 162, 235, 0.5)' ],
									borderColor : [ 
									'rgba(54, 162, 235, 1)' ],
							borderWidth : 1
							
						}]
					},
					options : {
						indexAxis : 'x',
						maintainAspectRatio: false,
						scales: {
						    xAxes: [{ stacked: true }],
						    yAxes: [{ stacked: true }]
						  }
					}
				});
				$("#bmCnt").html("BookMark Total : "+data.output_count_bookmark)
				$("#elCnt").html("ExLink Total : "+data.output_count_ExLink)
			}
			});
		//기간 설정
		$('#bmel-interval').on('change', function(){
			$('#bmChart').remove();
			$('#elChart').remove();
			$('#canvas-container4 #bmChart_canvas').append('<canvas id="bmChart" width="10" height="3"><canvas>')
			$('#canvas-container4 #elChart_canvas').append('<canvas id="elChart" width="10" height="3"><canvas>')
			var interval=$('#bmel-interval option:selected').val()
			$.ajax({
			url:getContextPath()+'/adminPage/admin_stats_BMEL',
			method:'get',
			data:{interval},
			dataType:'json',
			success:function(data){
				var AddHour = [];
				var AddCnt = [];
				var ExLInkHour = [];
				var ExLinkCnt = [];
				
				for(var i=0; i<data.output_Hour_Count_bookmark.length; i++){
					if(data.output_Hour_Count_bookmark[i].log_date!=null){
						AddHour.push(data.output_Hour_Count_bookmark[i].log_date);
					}else{
					AddHour.push(data.output_Hour_Count_bookmark[i].log_hour);						
					}
					AddCnt.push(data.output_Hour_Count_bookmark[i].log_cnt);
				}
				for(var i=0; i<data.output_Hour_Count_ExLink.length; i++){
					if(data.output_Hour_Count_ExLink[i].log_date!=null){
						ExLInkHour.push(data.output_Hour_Count_ExLink[i].log_date);
					}else{
						ExLInkHour.push(data.output_Hour_Count_ExLink[i].log_hour);						
					}
					ExLinkCnt.push(data.output_Hour_Count_ExLink[i].log_cnt);
				}
				
				const ctx4 = document.getElementById('bmChart').getContext('2d');
				const bmChart = new Chart(ctx4,{
					data : {
						labels : AddHour,
						datasets : [ {
								axis : 'x',
								type : 'bar',
								label : '찜추가 인원',
								data : AddCnt,
								backgroundColor : [ 
									'rgba(255, 99, 132, 0.5)' ],
							borderColor : [
								'rgba(255, 99, 132, 1)' ],
							borderWidth : 1
							
						}]
					},
					options : {
						indexAxis : 'x',
						maintainAspectRatio: false,
					}
				});
				const ctx44 = document.getElementById('elChart').getContext('2d');
				const elChart = new Chart(ctx44,{
					data : {
						labels : ExLInkHour,
						datasets : [ {
								axis : 'x',
								type : 'bar',
								label : '바로가기이용 인원',
								data : ExLinkCnt,
								backgroundColor : [ 
									'rgba(54, 162, 235, 0.5)' ],
									borderColor : [ 
									'rgba(54, 162, 235, 1)' ],
							borderWidth : 1
							
						}]
					},
					options : {
						indexAxis : 'x',
						maintainAspectRatio: false,
						scales: {
						    xAxes: [{ stacked: true }],
						    yAxes: [{ stacked: true }]
						  }
					}
				});
				$("#bmCnt").html("BookMark Total : "+data.output_count_bookmark)
				$("#elCnt").html("ExLink Total : "+data.output_count_ExLink)
			}
			});
		})
		/** 당일 찜추가를 한 시간별 인원과 그중 외부사이트로 이동한사람의 시간별인원 끝 **/
		
		/** 걷기기록을 이용한 시간별 인원과 그중 나만의코스를 생성한 사람의 시간별인원 **/
		$.ajax({
			url:getContextPath()+'/adminPage/admin_stats_WRMM',
			method:'get',
			data:{},
			dataType:'json',
			success:function(data){
				var RecordHour = [];
				var RecordCnt = [];
				var MakeMapHour = [];
				var MakeMapCnt = [];
				
				for(var i=0; i<data.output_Hour_Count_WalkRecord.length; i++){
					if(data.output_Hour_Count_WalkRecord[i].log_date!=null){
						RecordHour.push(data.output_Hour_Count_WalkRecord[i].log_date);
					}else{
						RecordHour.push(data.output_Hour_Count_WalkRecord[i].log_hour);					
					}
					RecordCnt.push(data.output_Hour_Count_WalkRecord[i].log_cnt);
				}
				for(var i=0; i<data.output_Hour_Count_MakMap.length; i++){
					if(data.output_Hour_Count_MakMap[i].log_date!=null){
						MakeMapHour.push(data.output_Hour_Count_MakMap[i].log_date);
					}else{
						MakeMapHour.push(data.output_Hour_Count_MakMap[i].log_hour);						
					}
					MakeMapCnt.push(data.output_Hour_Count_MakMap[i].log_cnt);
				}
				const ctx5 = document.getElementById('wrChart').getContext('2d');
				const wrChart = new Chart(ctx5,{
					data : {
						labels : RecordHour,
						datasets : [ {
								axis : 'x',
								type : 'bar',
								label : '걷기기록이용 인원',
								data : RecordCnt,
								backgroundColor : [ 
									'rgba(255, 99, 132, 0.5)' ],
							borderColor : [
								'rgba(255, 99, 132, 1)' ],
							borderWidth : 1
							
						}]
					},
					options : {
						indexAxis : 'x',
						maintainAspectRatio: false,
					}
				});
				const ctx55 = document.getElementById('mmChart').getContext('2d');
				const mmChart = new Chart(ctx55,{
					data : {
						labels : MakeMapHour,
						datasets : [ {
								axis : 'x',
								type : 'bar',
								label : '나만의코스생성 인원',
								data : MakeMapCnt,
								backgroundColor : [ 
									'rgba(54, 162, 235, 0.5)' ],
									borderColor : [ 
									'rgba(54, 162, 235, 1)' ],
							borderWidth : 1
						}]
					},
					options : {
						indexAxis : 'x',
						maintainAspectRatio: false,
						scales: {
						    xAxes: [{ stacked: true }],
						    yAxes: [{ stacked: true }]
						  }
					}
				});
				$("#wrCnt").html("WalkRecord Total : "+data.output_count_WalkRecord)
				$("#mmCnt").html("MakMap Total : "+data.output_count_MakMap)
			}
		})
		//기간설정
		$('#wrmm-interval').on('change', function(){
			$('#wrChart').remove();
			$('#mmChart').remove();
			$('#canvas-container5 #wrChart_canvas').append('<canvas id="wrChart" width="10" height="3"><canvas>')
			$('#canvas-container5 #mmChart_canvas').append('<canvas id="mmChart" width="10" height="3"><canvas>')
			var interval=$('#wrmm-interval option:selected').val()
			
				$.ajax({
					url:getContextPath()+'/adminPage/admin_stats_WRMM',
					method:'get',
					data:{interval},
					dataType:'json',
					success:function(data){
						var RecordHour = [];
						var RecordCnt = [];
						var MakeMapHour = [];
						var MakeMapCnt = [];
						
						for(var i=0; i<data.output_Hour_Count_WalkRecord.length; i++){
							if(data.output_Hour_Count_WalkRecord[i].log_date!=null){
								RecordHour.push(data.output_Hour_Count_WalkRecord[i].log_date);
							}else{
								RecordHour.push(data.output_Hour_Count_WalkRecord[i].log_hour);					
							}
							RecordCnt.push(data.output_Hour_Count_WalkRecord[i].log_cnt);
						}
						for(var i=0; i<data.output_Hour_Count_MakMap.length; i++){
							if(data.output_Hour_Count_MakMap[i].log_date!=null){
								MakeMapHour.push(data.output_Hour_Count_MakMap[i].log_date);
							}else{
								MakeMapHour.push(data.output_Hour_Count_MakMap[i].log_hour);						
							}
							MakeMapCnt.push(data.output_Hour_Count_MakMap[i].log_cnt);
						}
						const ctx5 = document.getElementById('wrChart').getContext('2d');
						const wrChart = new Chart(ctx5,{
							data : {
								labels : RecordHour,
								datasets : [ {
										axis : 'x',
										type : 'bar',
										label : '걷기기록이용 인원',
										data : RecordCnt,
										backgroundColor : [ 
											'rgba(255, 99, 132, 0.5)' ],
									borderColor : [
										'rgba(255, 99, 132, 1)' ],
									borderWidth : 1
								}]
							},
							options : {
								indexAxis : 'x',
								maintainAspectRatio: false,
							}
						});
						const ctx55 = document.getElementById('mmChart').getContext('2d');
						const mmChart = new Chart(ctx55,{
							data : {
								labels : MakeMapHour,
								datasets : [ {
										axis : 'x',
										type : 'bar',
										label : '나만의코스생성 인원',
										data : MakeMapCnt,
										backgroundColor : [ 
											'rgba(54, 162, 235, 0.5)' ],
											borderColor : [ 
											'rgba(54, 162, 235, 1)' ],
									borderWidth : 1
								}]
							},
							options : {
								indexAxis : 'x',
								maintainAspectRatio: false,
								scales: {
								    xAxes: [{ stacked: true }],
								    yAxes: [{ stacked: true }]
								  }
							}
						});
					}
				})
		})
		/** 걷기기록을 이용한 시간별 인원과 그중 나만의코스를 생성한 사람의 시간별인원  끝 **/
		
		
		/** 생성된 된 크루현황 통계와 생성된 크루의 종류 현황 **/
		$.ajax({
			url:getContextPath()+'/adminPage/admin_stats_crew',
			method:'get',
			data:{},
			dataType:'json',
			success:function(data){
				var CrewHour = [];
				var CrewCnt = [];
				var CrewCategory = [];
				var CrewCategoryCnt = [];
				
				for(var i=0; i<data.output_Hour_Count_MakeCrew.length; i++){
					if(data.output_Hour_Count_MakeCrew[i].log_date!=null){
						CrewHour.push(data.output_Hour_Count_MakeCrew[i].log_date);
					}else{
						CrewHour.push(data.output_Hour_Count_MakeCrew[i].log_hour);					
					}
					CrewCnt.push(data.output_Hour_Count_MakeCrew[i].log_cnt);
				}
				
				for(var i=0; i<data.output_CrewCategory.length; i++){
					CrewCategory.push(data.output_CrewCategory[i].crew_category);
					CrewCategoryCnt.push(data.output_CrewCategory[i].log_cnt);
				}
				
				const ctx6 = document.getElementById('crChart').getContext('2d');
				const crChart = new Chart(ctx6,{
					data : {
						labels : CrewHour,
						datasets : [ {
								axis : 'x',
								type : 'bar',
								label : '걷기기록이용 인원',
								data : CrewCnt,
								backgroundColor : [ 
									'rgba(255, 99, 132, 0.5)' ],
							borderColor : [
								'rgba(255, 99, 132, 1)' ],
							borderWidth : 1
							
						}]
					},
					options : {
						indexAxis : 'x',
						maintainAspectRatio: false,
					}
				});
				const ctx66 = document.getElementById('caChart').getContext('2d');
				const caChart = new Chart(ctx66,{
					type : 'pie',
					data : {
						labels : CrewCategory,
						datasets : [ {
							axis : 'x',
							label : '크루종류',
							data : CrewCategoryCnt,
							backgroundColor : [ 
								'rgba(246, 229, 141, 0.5)',
								'rgba(255, 190, 118, 0.5)',
								'rgba(255, 121, 121, 0.5)',
								'rgba(186, 220, 88, 0.5)',
								'rgba(56, 173, 169, 0.5)'
								],
						borderColor : [
							'rgba(246, 229, 141, 1)',
							'rgba(255, 190, 118, 1)',
							'rgba(255, 121, 121, 1)',
							'rgba(186, 220, 88, 1)',
							'rgba(56, 173, 169, 1)'],
						borderWidth : 1
						} ]
					},
					options : {
						indexAxis : 'x',
						maintainAspectRatio: false,
					}
				});
				$("#crewCnt").html("Create Total : "+data.output_count_MakeCrew)			
			}
		})
		//기간설정
		$('#crew-interval').on('change', function(){
			$('#crChart').remove();
			$('#caChart').remove();
			$('#canvas-container6 #crChart_canvas').append('<canvas id="crChart" width="10" height="3"><canvas>')
			$('#canvas-container6 #caChart_canvas').append('<canvas id="caChart" width="10" height="3"><canvas>')
			var interval=$('#crew-interval option:selected').val();
			
			$.ajax({
				url:getContextPath()+'/adminPage/admin_stats_crew',
				method:'get',
				data:{interval},
				dataType:'json',
				success:function(data){
					var CrewHour = [];
					var CrewCnt = [];
					var CrewCategory = [];
					var CrewCategoryCnt = [];
					
					for(var i=0; i<data.output_Hour_Count_MakeCrew.length; i++){
						if(data.output_Hour_Count_MakeCrew[i].log_date!=null){
							CrewHour.push(data.output_Hour_Count_MakeCrew[i].log_date);
						}else{
							CrewHour.push(data.output_Hour_Count_MakeCrew[i].log_hour);					
						}
						CrewCnt.push(data.output_Hour_Count_MakeCrew[i].log_cnt);
					}
					
					for(var i=0; i<data.output_CrewCategory.length; i++){
						CrewCategory.push(data.output_CrewCategory[i].crew_category);
						CrewCategoryCnt.push(data.output_CrewCategory[i].log_cnt);
					}
					
					const ctx6 = document.getElementById('crChart').getContext('2d');
					const crChart = new Chart(ctx6,{
						data : {
							labels : CrewHour,
							datasets : [ {
									axis : 'x',
									type : 'bar',
									label : '걷기기록이용 인원',
									data : CrewCnt,
									backgroundColor : [ 
										'rgba(255, 99, 132, 0.5)' ],
								borderColor : [
									'rgba(255, 99, 132, 1)' ],
								borderWidth : 1
								
							}]
						},
						options : {
							indexAxis : 'x',
							maintainAspectRatio: false,
						}
					});
					const ctx66 = document.getElementById('caChart').getContext('2d');
					const caChart = new Chart(ctx66,{
						type : 'pie',
						data : {
							labels : CrewCategory,
							datasets : [ {
								axis : 'x',
								label : '크루종류',
								data : CrewCategoryCnt,
								backgroundColor : [ 
									'rgba(246, 229, 141, 0.5)',
									'rgba(255, 190, 118, 0.5)',
									'rgba(255, 121, 121, 0.5)',
									'rgba(186, 220, 88, 0.5)',
									'rgba(56, 173, 169, 0.5)'
									],
							borderColor : [
								'rgba(246, 229, 141, 1)',
								'rgba(255, 190, 118, 1)',
								'rgba(255, 121, 121, 1)',
								'rgba(186, 220, 88, 1)',
								'rgba(56, 173, 169, 1)'],
							borderWidth : 1
							} ]
						},
						options : {
							indexAxis : 'x',
							maintainAspectRatio: false,
						}
					});			
				}
			})
		})
	})
		/** 생성된 된 크루현황 통계와 생성된 크루의 종류 현황 끝 **/