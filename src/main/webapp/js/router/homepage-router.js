/**
 * 
 */
var App = Backbone.Router.extend({

  routes: {
    "signout" : "user_signout"
  },

  user_signout: function() {
	    window.location = 'login.jsp';
	  }
});

app = new App();
Backbone.history.start();