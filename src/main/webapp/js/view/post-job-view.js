/**
 * http://usejsdoc.org/
 */
var postJobView = Backbone.View.extend({
				
				el : $(".wrapper"), /* selecting the root element */
				
				events : {
					'click #submit' : 'postjob',
					'change #from-exp-sel' : 'loadMaxExp',
					'change #min-ann-sal' : 'loadMaxSalary',
					'change #ug-edu' : 'loadugCourse',
					'change #pg-edu' : 'loadpgCourse',
					'change #doc-edu' : 'loaddocCourse'
				},
				
				
				
				initialize : function(){
					
							  var value = "";
					    	  for(var i = 25 ; i >= 0 ; i--){
					    	  	if(i == 1 || i == 0){
					    	  		value = '<option value ="'+i+'">'+i+' year</option>';
					    	  	}else{
					    	  	 	value = '<option value ="'+i+'">'+i+' years</option>';
					    	  	}
					    	  	$("#year-option").after(value);
					    	  }
					    	  
					    	  var salValue = "";
					    	  for(var i = 10000000 ; i >= 50000 ; ){
					    	  		salValue = '<option value ="'+i+'">'+i.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'</option>';
					    	  	if(i == 10000000){
					    	  		i = i - 5000000;
					    	  	}else if(i <= 5000000 && i > 4000000){
					    	  		i = i - 500000;
					    	  	}else if(i <= 4000000 && i > 1900000){
					    	  		i = i - 300000;
					    	  	}else if(i <= 1900000 && i > 1000000){
					    	  		i = i - 100000;
					    	  	}else if(i <= 1000000){
					    	  		i = i - 50000;
					    	  	}
					    	  	$('#max-option').after(salValue);
					    	  }
					    	  
					    	  $("#any-gender").prop("checked", true);
					      },

				loadugCourse : function(){
							 var expYear = $("#ug-edu").val();
				    		    if(expYear == "UG Degree Names"){
				    		    	$('#ug-course').show();
				    		    }else{
				    		    	$('#ug-course').hide();
				    		    }
							},
				
				loadpgCourse : function(){
							 var expYear = $("#pg-edu").val();
				    		    if(expYear == "PG Degree Names"){
				    		    	$('#pg-course').show();
				    		    }else{
				    		    	$('#pg-course').hide();
				    		    }
							},
							
				loaddocCourse : function(){
							   var expYear = $("#doc-edu").val();
				    		    if(expYear == "Doctorate"){
				    		    	$('#doc-course').show();
				    		    }else{
				    		    	$('#doc-course').hide();
				    		    }
							},			
					      
				loadMaxSalary : function(){
								var count = 0;
								$('.added-maxsal').remove();
								var minSal = $('#min-ann-sal').val();
								var intminSal = parseInt(minSal);
								for (var i = intminSal; i <= 10000000;) {
									if (count > 6) {
										count = 0;
										break;
									}
									count++;
									salValue = '<option class="added-maxsal" value ="' + i + '">'
											+ i.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
											+ '</option>';
									if (i >= 5000000) {
										i = i + 5000000;
									} else if (i <= 5000000 && i > 4000000) {
										i = i + 500000;
									} else if (i <= 4000000 && i > 1900000) {
										i = i + 300000;
									} else if (i <= 1900000 && i > 1000000) {
										i = i + 100000;
									} else if (i <= 1000000) {
										i = i + 50000;
									}
									$('#min-option').before(salValue);
								}
						     		 
							},
				
				loadMaxExp : function(){
					    		 $('.added-options').remove();
								var fromYear = $('#from-exp-sel').val();
								var year = parseInt(fromYear.replace("year").replace("years").trim());
								if (year + 7 > 25) {
									var value = "";
									for (var i = 25; i >= year + 1; i--) {
										if (i == 1 || i == 0) {
											value = '<option class="added-options" value ="' + i + '">'
													+ i + ' year</option>';
										} else {
											value = '<option class="added-options" value ="' + i + '">'
													+ i + ' years</option>';
										}
										$("#to-year-option").after(value);
									}
						
								} else {
									var value = "";
									for (var i = year + 7; i >= year + 1; i--) {
										if (i == 1 || i == 0) {
											value = '<option class="added-options" value ="' + i + '">'
													+ i + ' year</option>';
										} else {
											value = '<option class="added-options" value ="' + i + '">'
													+ i + ' years</option>';
										}
										$("#to-year-option").after(value);
									}
						
								}
						    		
							},
				
				postjob : function(){
					
					 var jobTitle = $('#jobtitle').val();
					 var careerLevel = $('#career-level').val();
					 var noOfVacancies = $('#vacancies').val();
					 var jobLocation = $('#location').val();
					 var desiredSkills = $('#skills').val();
					 var positionType = $('#position-type').val();
					 var description = CKEDITOR.instances.description.getData();
					 var functionsValue = $('#function-sel').val();
					 var industry = $('#industry-sel').val();
					 var experienceFrom = $('#from-exp-sel').val();
					 var experienceTo = $('#to-exp-sel').val();
					 var ugEducation = $('#ug-edu').val();
					 var ugCourse = $('#ug-name').val();
					 var pgEducation = $('#pg-edu').val();
					 var pgCourse = $('#pg-name').val();
					 var docEducation = $('#doc-edu').val();
					 var docCourse = $('#doc-name').val();
					 var receiveFrom = $('#receive-from').val();
					 var languages = $('#languages').val();
					 var minAnnualSalary = $('#min-ann-sal').val();
					 var maxAnnualSalary = $('#max-ann-sal').val();
					 var gender = $('input[name=gender]:checked', '#postform').val();
					 var email = $('#change-email').val();
					 var expiryDate = $('#expiry-date').val();
					

					 if(jobTitle != "" && careerLevel != "0" && noOfVacancies != "" && jobLocation != "" && desiredSkills != "" && positionType != "0" && description != "" && functionsValue != null && industry != null){

					 	if(ugEducation == "UG Degree Names"){
							ugEducation = ugCourse;
						}

						if(pgEducation == "PG Degree Names"){
							pgEducation = pgCourse;
						}
						
						if(docEducation == "Doctorate"){
							docEducation = docCourse;
						}

						var education = "UG Qualifications : "+ugEducation+"\n"
										+ "PG Qualifications : "+pgEducation+"\n"
										+ "Doctorate : "+docEducation+"";
								
						var experience = experienceFrom+"-"+experienceTo;
						var annualSalary = minAnnualSalary+"-"+maxAnnualSalary;
					 
						 jobPostModel.set('jobTitle', jobTitle);
						 jobPostModel.set('careerLevel', careerLevel);
						 jobPostModel.set('noOfVacancies', noOfVacancies);
						 jobPostModel.set('location', jobLocation);
						 jobPostModel.set('skills', desiredSkills);
						 jobPostModel.set('positionType', positionType);
						 jobPostModel.set('description', description);
						 jobPostModel.set('functions', functionsValue);
						 jobPostModel.set('industries', industry);
						 jobPostModel.set('requiredExperience', experience);
						 jobPostModel.set('education', education);
						 jobPostModel.set('receiveFrom', receiveFrom);
						 jobPostModel.set('languagesKnown', languages);
						 jobPostModel.set('annualSalary', annualSalary);
						 jobPostModel.set('gender', gender);
						 jobPostModel.set('jobExpiryDate', expiryDate);
						 jobPostModel.set('changeEmail', email);
						 this.render(jobPostModel);
						 
					 }else{
						 $("#jobpost-alert").html('<div class="callout callout-danger">'
                   					 +'<p>Please fill the required fields!</p>'
                 					 +'</div>');
					 }
					 
				},
				
				render: function (model) {
				    
					model.save({},{
						success : function(model, response){

							if(response.status == "success"){
							postapp.navigate('showjobs', true);
							}
						},
						
						error : function(model, response){
							
						}
					});
					
					
				   }
	
});

var postJob = new postJobView();