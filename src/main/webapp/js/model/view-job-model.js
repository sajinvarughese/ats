/**
 * http://usejsdoc.org/
 */
var jobDelete = Backbone.Model.extend({ url: './deleteJob' });

var jobDetails = Backbone.Model.extend({ url: './jobDetails' }); // Admin and Employer using this model

var denyJob = Backbone.Model.extend({ url : './denyJob' }); // Admin using this model.

var confirmJob = Backbone.Model.extend({ url : './confirmJob' }); // Admin using this model.


var deletejob = new jobDelete();

var jobdetails = new jobDetails();

var denyjob = new denyJob();

var confirmjob = new confirmJob();
