/**
 * 
 */
var App = Backbone.Router.extend({

  routes: {
    "home" : "home_page",
    "adminhome" : "admin_page"
  },

  home_page: function() {
	    window.location = 'home.jsp';
	  },
	  
  admin_page: function() {
	  	window.location = 'adminhome.jsp';
  	}	  
  
});

	

app = new App();
Backbone.history.start();