
var postApp = Backbone.Router.extend({

  routes: {
    "showjobs" : "view_jobs"
  },

  view_jobs: function() {
	    window.location = 'viewpostedjobs.jsp';
	  }
});

postapp = new postApp();
Backbone.history.start();