
var ApproveJobs = Backbone.View.extend({
    
	el : $('.wrapper'),
	
	initialize : function(){
        this.fetchjobs();
      },
		
		fetchjobs : function(){

			approvejobcollection.fetch({
				
				success : function(status, response){
					console.log('success');
					var results = "";
					for(var i = 0 ; i < response.length ; i++){
						results = results + '<tr>' +
								'<td>'+response[i].jobTitle+'</td>' +
								'<td>'+response[i].jobLocation+'</td>' +
								'<td>'+response[i].jobExpiry+'</td>' +
								'<td>'+response[i].jobPostedBy+'</td>'; 
						
						
						
						results = results   +'<td><button class= "btn btn-block btn-primary btn-xs view-job" data-toggle="modal" data-target="#myModal" data-jobid="'+response[i].jobId+'">View Job</button>'
											+'<button class= "btn btn-block btn-success btn-xs approve-job" data-toggle="modal" data-target="#myModal2" data-jobid="'+response[i].jobId+'">Approve</button>'
											+'<button class= "btn btn-block btn-danger btn-xs deny-job" data-toggle="modal" data-target="#myModal1" data-jobid="'+response[i].jobId+'">Deny</button></td></tr>';
						
					}
					$('#jobs-table').html('<tr><th>Job Title</th>'
							+'<th>Job Location</th>'
							+'<th>Job Expiry</th>'
							+'<th>Job Posted By</th>'
							+'<th>Operations</th></tr>'
							+results);
					
				},
				
				error : function(status, response){
					console.log('error');
				}
				});

		},
	
		events : {
			'click .deny-job' : 'denyjob',
			'click .view-job' : 'viewjob',
			'click #denybtn' : 'confirmdeny',
			'click #deny-all-btn' : 'denyall',
			'click .approve-job' : 'approvejob',
			'click #approve-btn' : 'confirmapprove',
			'click #approve-all-btn' : 'approveall'
			
		},
      
		denyjob : function(ev){
			var jobId = $(ev.currentTarget).data('jobid');
			$("#denybtn").attr("data-jobid",""+jobId+"");
			$("#deny-all-btn").attr("data-jobid", ""+jobId+"");
			
		},
		
		approvejob : function(ev){
			var jobId = $(ev.currentTarget).data('jobid');
			$("#approve-btn").attr("data-jobid",""+jobId+"");
			$("#approve-all-btn").attr("data-jobid", ""+jobId+"");
		},
		
		confirmapprove : function(ev){
			var jobId = $(ev.currentTarget).data('jobid');
			confirmjob.fetch({
				data : {'jobid' : jobId},
				
				success : function(status, response){
					
					if(response.status == "success"){
						postapp.navigate("showjobs", true);
					}
					
				},
				
				error : function(status, response){
					console.log('error');
				}
			});

		},
		
		approveall : function(ev){
			var jobId = $(ev.currentTarget).data('jobid');
			confirmjob.fetch({
				data : {'jobid' : jobId, 
						'status' : 'All'},
				
				success : function(status, response){
					
					if(response.status == "success"){
						postapp.navigate("showjobs", true);
					}
					
				},
				
				error : function(status, response){
					console.log('error');
				}
			});

		},
		
		viewjob : function(ev){
			var jobId = $(ev.currentTarget).data('jobid');
			jobdetails.fetch({
				data : {'jobid' : jobId},
				
				success : function(status, response){
					$('#modal-jobtitle').html(response.jobTitle);
					$('#modal-location').html(response.jobLocation);
					$('#modal-exp').html(response.reqExperience);
					$('#modal-vacancies').html(response.noOfVacancies);
					$('#modal-jobdescription').html(response.jobDescription);
					$('#modal-education').html(response.jobEducation);
					$('#modal-skills').html(response.jobSkills);
					
				},
				
				error : function(status, response){
					
				}
				
			});
			
		},
		
		confirmdeny : function(ev){
			var jobId = $(ev.currentTarget).data('jobid');

			denyjob.fetch({
				data : {'jobid' : jobId},
				
				success : function(status, response){
					
					if(response.status == "success"){
						postapp.navigate("showjobs", true);
					}
					
				},
				
				error : function(status, response){
					console.log('error');
				}
			});
			
		},
		
		denyall : function(ev){
			var jobId = $(ev.currentTarget).data('jobid');
			denyjob.fetch({
				data : {'jobid' : jobId, 
						'status' : 'All'},
				
				success : function(status, response){
					
					if(response.status == "success"){
						postapp.navigate("showjobs", true);
					}
					
				},
				
				error : function(status, response){
					console.log('error');
				}
			});

		}
      
		});

var approveJobs = new ApproveJobs();