/**
 * 
 */
// Creating the View
var ClientView = Backbone.View.extend({

				el : $("#divClient"), /* selecting the root element */
	
				initialize : function() {

				console.log("initializing View...");

				var that = this;

				this.listeClients = new ClientRegisterCollection();

				this.listClients = new ClientLoginCollection();

				this.listeClients.bind("add", function(model) {  // binding one new function 'add()' to the register collection object

					that.addClientToList(model);

				});

				this.listClients.bind("add", function(model) { // binding one new function 'add()' to the login collection object

					that.addLoginToList(model);

				});

			},

			// All events we can write here (add events on elements which is inside the root element)
			events : {

				'click #cmdAddClient' : 'cmdAddClient_Click',

				'click #login' : 'login',

				'click #email' : 'removeErrorString',

				'click #password' : 'removeErrorString'

			},

			cmdAddClient_Click : function() {
				if ($("#username").val() == "" || $("#emailid").val() == ""
						|| $("#password").val() == ""
						|| $("#confirm-pass").val() == "") {

					$('#listeClient').html('<em style="color : red;">Please fill all the fields</font>');

				} else if ($("#password").val() != $("#confirm-pass").val()) {
					$('#listeClient').html('<em style="color : red;">password and confirm password doesnot matches</em>');

				} else {

					var tmpClient = new ClientRegister({

						name : $("#username").val(),

						email : $("#emailid").val(),

						pwd : $("#password").val(),

					});

					this.listeClients.add(tmpClient);
				}
			},

			login : function() {
				if ($("#email").val() == "" || $("#password").val() == "") {

				$('#listeClient').html('<em style="color : red;">Please fill all the fields</em>');

			}else{

				var tmplogin = new ClientLogin({

					email : $("#email").val(),

					pwd : $("#password").val(),

				});

				this.listClients.add(tmplogin);
				}
			},

			addClientToList : function(model) {

				model.save({}, {
					success : function(model, response) {
						console.log('SUCCESS:');
						if(response.status == "success"){
							app.navigate('login', true);
						}else{
							//Not Success. stay at the current page only.
							$('#listeClient').html('<em style="color : red;">'+response.status+'</em>');

						}
					},
					error : function(model, response) {
						console.log('FAIL:');
						console.log(response);
					}
				});

			},

			addLoginToList : function(model) {

				model.save({}, {
					success : function(model, response) {
						console.log('SUCCESS:');
						if(response.status == "success"){
							app.navigate('home', true);
							}else if(response.status == "admin"){
								app.navigate('adminhome', true);
							}else{
								//Not Success. stay at the current page only.
								$('#listeClient').html('<em style="color : red;">username password doesnot match</em>');

							}
					},
					error : function(model, response) {
						console.log('FAIL:');
						console.log(response);
					}
				});

			},

			removeErrorString : function() {

				$("#listeClient").html("");
			}

		});



var clientView = new ClientView();

