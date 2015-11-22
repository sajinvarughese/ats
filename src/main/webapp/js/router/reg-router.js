/**
 * 
 */
var App = Backbone.Router.extend({

  routes: {
    "login" : "login_page",
  },

  login_page: function() {
    window.location = 'login.jsp';
  }
  
});

app = new App();
Backbone.history.start();