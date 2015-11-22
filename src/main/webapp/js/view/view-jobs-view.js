
var ViewJob = Backbone.View.extend({
    
	el : $('.wrapper'),
	
	initialize : function(){
        this.fetchjobs();
      },
		
		fetchjobs : function(){

			jobpostcollection.fetch({
				
				success : function(status, response){
					console.log('success');
					var results = "";
					for(var i = 0 ; i < response.length ; i++){
						results = results + '<tr>' +
								'<td>'+response[i].jobTitle+'</td>' +
								'<td>'+response[i].jobLocation+'</td>' +
								'<td>'+response[i].jobExpiry+'</td>'; 
						
						if(response[i].jobStatus == "Pending"){
							results = results +'<td><span class="label label-warning">'+response[i].jobStatus+'</span></td>';
						}else if(response[i].jobStatus == "Approved"){
							results = results +'<td><span class="label label-success">'+response[i].jobStatus+'</span></td>';
						}else if(response[i].jobStatus == "Denied"){
							results = results +'<td><span class="label label-danger">'+response[i].jobStatus+'</span></td>';
						}
						
						results = results   +'<td><button class= "btn btn-block btn-primary btn-xs view-job" data-toggle="modal" data-target="#myModal" data-jobid="'+response[i].jobId+'">View Job</button>'
											+'<button class= "btn btn-block btn-danger btn-xs delete-job" data-toggle="modal" data-target="#myModal1" data-jobid="'+response[i].jobId+'">Delete</button></td></tr>';
						
					}
					$('#jobs-table').html('<tr><th>Job Title</th>'
							+'<th>Job Location</th>'
							+'<th>Job Expiry</th>'
							+'<th>Job Status</th>'
							+'<th>Operations</th></tr>'
							+results);
					
				},
				
				error : function(status, response){

					console.log('error');
				}
				});

		},
	
		events : {
			'click .delete-job' : 'deletejob',
			'click .view-job' : 'viewjob',
			'click #delbttn' : 'confirmdelete'
		},
      
		deletejob : function(ev){
			var jobId = $(ev.currentTarget).data('jobid');
			$("#delbttn").attr("data-jobid",""+jobId+"");
			
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
		
		confirmdelete : function(ev){
			var jobId = $(ev.currentTarget).data('jobid');

			deletejob.fetch({
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
			
		}
		
		
      
		});

var viewjobs = new ViewJob();