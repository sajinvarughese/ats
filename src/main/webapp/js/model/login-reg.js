/**
 * 
 */

// Model for storing client registration details
var ClientRegister = Backbone.Model.extend({

	defaults : {

		name : null,

		email : null,

		pwd : null,

	},
	
	// First execution starts here
	initialize : function() {

		console.log("initialize client");

	},
	
	// automatically take this url when we invoke save method for this model
	url : "./register"

});

// Model for Storing client login details
var ClientLogin = Backbone.Model.extend({

	defaults : {

		email : null,

		pwd : null,

	},

	initialize : function() {

		console.log("initialize client");

	},

	// goto login page when invoking save method
	url : "./login"

});

// creating a collection with register model
var ClientRegisterCollection = Backbone.Collection.extend({

	model : ClientRegister

});

// creating a collection with login model
var ClientLoginCollection = Backbone.Collection.extend({

	model : ClientLogin

});
