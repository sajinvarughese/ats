/**
 * 
 */

var ClientView = Backbone.View.extend({
				
				el : $(".wrapper"), /* selecting the root element */
				
				events : {
					'click #sign-out' : 'signout'
				},
				
				signout : function(){
					
					 var _thisView = this; // need to be able to refer to 'this' context in the callback
				     this.model.fetch().done(function () { // queue up this callback to run when fetch() completes
				       _thisView.render();
				     });
					
				},
				
				render: function () {
				    app.navigate("signout", true);
				   }
	
});

var clientview = new ClientView({model : usermodel});