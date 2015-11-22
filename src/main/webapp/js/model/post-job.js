/**
 * http://usejsdoc.org/
 */

var jobModel = Backbone.Model.extend({
	
	defaults : {

		jobTitle : "",

		careerLevel : "",

		noOfVacancies : "",
		
		location : "",
		
		skills : "",
		
		positionType : "",
		
		description : "",
		
		functions : "",
		
		industries : "",
		
		requiredExperience : "",
		
		education : "",
		
		receiveFrom : "",
		
		languagesKnown : "",
		
		annualSalary : "",
		
		gender : "",
		
		jobExpiryDate : "",
		
		changeEmail : ""

	},
	
	// First execution starts here
	initialize : function() {

		console.log("initialize client");

	},
	
	// automatically take this url when we invoke save method for this model
	url : "./PostJob",

	
});

var JobPostCollection = Backbone.Collection.extend({
	model : jobModel,
	url : './fetchJobs'
	
});

var approveJobCollection = Backbone.Collection.extend({
	model : jobModel,
	url : './approveJobs'
});

var approvejobcollection = new approveJobCollection();

var jobpostcollection = new JobPostCollection();

var jobPostModel = new jobModel();

