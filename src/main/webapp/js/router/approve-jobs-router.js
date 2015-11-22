/**
 * http://usejsdoc.org/
 */
var postApp = Backbone.Router.extend({

  routes: {
    "showjobs" : "view_jobs"
  },

  view_jobs: function() {
	    window.location = 'approvepost.jsp';
	  }
});

postapp = new postApp();
Backbone.history.start();