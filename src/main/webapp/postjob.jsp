<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>HirrrATS | Post a Job</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <style type="text/css">
    .required.control-label:after {
	  content:"*";
	  color:red;
	}
    </style>
    <link rel="stylesheet" href="css/skin-blue.min.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="bootstrap/css/select2.min.css">
    <link rel="stylesheet" href="bootstrap/css/daterangepicker-bs3.css">
    <link rel="stylesheet" href="css/AdminLTE.min.css">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <!--
  BODY TAG OPTIONS:
  =================
  Apply one or more of the following classes to get the
  desired effect
  |---------------------------------------------------------|
  | SKINS         | skin-blue                               |
  |               | skin-black                              |
  |               | skin-purple                             |
  |               | skin-yellow                             |
  |               | skin-red                                |
  |               | skin-green                              |
  |---------------------------------------------------------|
  |LAYOUT OPTIONS | fixed                                   |
  |               | layout-boxed                            |
  |               | layout-top-nav                          |
  |               | sidebar-collapse                        |
  |               | sidebar-mini                            |
  |---------------------------------------------------------|
  -->
  
  <%
  	if(session.getAttribute("email") == null){
  		response.sendRedirect("login.jsp");
  	}
  %>
  <body class="hold-transition skin-blue sidebar-mini wysihtml5-supported sidebar-collapse">
    <div class="wrapper">

      <!-- Main Header -->
      <header class="main-header">

        <!-- Logo -->
        <a href="home.jsp" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>A</b>LT</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Hirrr</b>ATS</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              <li class="dropdown messages-menu">
                <!-- Menu toggle button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o"></i>
                  <span class="label label-success">4</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 4 messages</li>
                  <li>
                    <!-- inner menu: contains the messages -->
                    <ul class="menu">
                      <li><!-- start message -->
                        <a href="#">
                          <div class="pull-left">
                            <!-- User Image -->
                        <!-- <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">-->
                          </div>
                          <!-- Message title and timestamp -->
                          <h4>
                            Support Team
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                          </h4>
                          <!-- The message -->
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li><!-- end message -->
                    </ul><!-- /.menu -->
                  </li>
                  <li class="footer"><a href="#">See All Messages</a></li>
                </ul>
              </li><!-- /.messages-menu -->

              <!-- Notifications Menu -->
              <li class="dropdown notifications-menu">
                <!-- Menu toggle button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <span class="label label-warning">10</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 10 notifications</li>
                  <li>
                    <!-- Inner Menu: contains the notifications -->
                    <ul class="menu">
                      <li><!-- start notification -->
                        <a href="#">
                          <i class="fa fa-users text-aqua"></i> 5 new members joined today
                        </a>
                      </li><!-- end notification -->
                    </ul>
                  </li>
                  <li class="footer"><a href="#">View all</a></li>
                </ul>
              </li>
              <!-- Tasks Menu -->
              <li class="dropdown tasks-menu">
                <!-- Menu Toggle Button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-flag-o"></i>
                  <span class="label label-danger">9</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 9 tasks</li>
                  <li>
                    <!-- Inner menu: contains the tasks -->
                    <ul class="menu">
                      <li><!-- Task item -->
                        <a href="#">
                          <!-- Task title and progress text -->
                          <h3>
                            Design some buttons
                            <small class="pull-right">20%</small>
                          </h3>
                          <!-- The progress bar -->
                          <div class="progress xs">
                            <!-- Change the css width attribute to simulate progress -->
                            <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">20% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li><!-- end task item -->
                    </ul>
                  </li>
                  <li class="footer">
                    <a href="#">View all tasks</a>
                  </li>
                </ul>
              </li>
              <!-- User Account Menu -->
              <li class="dropdown user user-menu">
                <!-- Menu Toggle Button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <!-- The user image in the navbar-->
             <!--       <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">-->
                  <!-- hidden-xs hides the username on small devices so only the image appears. -->
                  <span class="hidden-xs"><%= session.getAttribute("fullName") %></span>
                </a>
                <ul class="dropdown-menu">
                  <!-- The user image in the menu -->
                  <li class="user-header">
                    <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                    <p>
                      <%= session.getAttribute("fullName") %>
                      <small>Member since Nov. 2012</small>
                    </p>
                  </li>
                  <!-- Menu Body -->
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="#" id="sign-out" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

          <!-- Sidebar user panel (optional) -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="images/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div> 
            <div class="pull-left info">
              <p><%= session.getAttribute("fullName") %></p>
              <!-- Status -->
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>

          <!-- search form (Optional) -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->

          <!-- Sidebar Menu -->
          <ul class="sidebar-menu">
            <li class="header">HEADER</li>
            <!-- Optionally, you can add icons to the links -->
            <li class="treeview active"><a href="#"><i class="fa fa-link"></i><span>Post Job</span><i class="fa fa-angle-left pull-right"></i> </a>
  					<ul class="treeview-menu menu-open" style="display: block;">
                		<li><a href="postjob.jsp">Post a Job</a></li>
                		<li><a href="viewpostedjobs.jsp">View Posted Jobs</a></li>
             	 	</ul>
  			</li>
            <li><a href="#"><i class="fa fa-link"></i> <span>Another Link</span></a></li>
            <li class="treeview">
              <a href="#"><i class="fa fa-link"></i> <span>Multilevel</span> <i class="fa fa-angle-left pull-right"></i></a>
            </li>
          </ul><!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            POST JOB
            <small>Search for an employee</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
            <li class="active">Here</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
		
			<div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Please fill the job details</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <form action="" id="postform" name="postform" method="post" class="form-horizontal">
                  <div class="box-body">
                    <div class="form-group">
                      <label for="job title" class="required col-sm-2 control-label">Job Title</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" name="jobtitle" id="jobtitle" placeholder="Job Title">
                      </div>
                       <label for="career level" class="required col-sm-2 control-label">Career Level</label>
                      	<div class="col-sm-4">
                        <select class="form-control" id="career-level" name="career-level">
                        <option value="0">Select</option>
                        <option value="Entry Level">Entry Level</option>
                        <option value="Middle">Middle</option>
                        <option value="Senior">Senior</option>
                        <option value="Top">Top</option>
                      </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="vacancies" class="required col-sm-2 control-label">No of Vacancies</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="vacancies" name="vacancies" placeholder="Vacancies">
                      </div>
                       <label for="location" class="required col-sm-2 control-label">Location</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="location" name="location" placeholder="location">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="skills" class="required col-sm-2 control-label">Skills</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" name="skills" id="skills" placeholder="Skills">
                      </div>
                       <label for="Position type" class="required col-sm-2 control-label">Position Type</label>
                      	<div class="col-sm-4">
                        <select class="form-control" id="position-type" name="position-type">
                        <option>Select</option>
                        <option>Full Time</option>
                        <option>Part Time</option>
                        <option>Intern</option>
                        <option>Contract</option>
                      </select>
                      </div>
                    </div>
                    <div class="form-group">
                    	<div class="col-md-12">
                    	<label for="description" class="required col-sm-2 control-label">Description</label>
                    	<div class="col-sm-10">
							<textarea style="visibility: hidden; display: none;"
								id="description" name="description" rows="5" cols="80">
                   	 		</textarea>

                		</div>
            			</div>
                    </div>
                  <div class="form-group">
                      <label for="functions" class="required col-sm-2 control-label">Functions</label>
                   	<div class="col-sm-4">
                    <select id="function-sel" name="function-sel" style="width: 100%;" data-placeholder="Select 3 functions" multiple="" class="form-control select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                      <option value="Accounting">Accounting</option>
						<option value="Administration">Administration</option>
						<option value="Design/Creative">Design/Creative</option>
						<option value="Architecture">Architecture</option>
						<option value="Business Development">Business Development</option>
						<option value="Consulting">Consulting</option>
						<option value="Customer Service">Customer Service</option>
						<option value="Chef">Chef</option>
						<option value="Hospitality">Hospitality</option>
						<option value="Training">Training</option>
						<option value="Engineering">Engineering</option>
						<option value="Finance">Finance</option>
						<option value="Legal">Legal</option>
						<option value="Human Resources">Human Resources</option>
						<option value="Management">Management</option>
						<option value="Marketing">Marketing</option>
						<option value="Doctor">Doctor</option>
						<option value="Nursing">Nursing</option>
						<option value="Operations">Operations</option>
                    </select>
                    </div>
                    <label for="industry" class="required col-sm-2 control-label">Industry</label>
                   	<div class="col-sm-4">
                    <select id="industry-sel" name="industry-sel" style="width: 100%;" data-placeholder="Select 2 industries" multiple="" class="form-control select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                      <option value="Accounting">Accounting</option>
						<option value="Administration">Administration</option>
						<option value="Design/Creative">Design/Creative</option>
						<option value="Architecture">Architecture</option>
						<option value="Business Development">Business Development</option>
						<option value="Consulting">Consulting</option>
						<option value="Customer Service">Customer Service</option>
						<option value="Chef">Chef</option>
						<option value="Hospitality">Hospitality</option>
						<option value="Training">Training</option>
						<option value="Engineering">Engineering</option>
						<option value="Finance">Finance</option>
						<option value="Legal">Legal</option>
						<option value="Human Resources">Human Resources</option>
						<option value="Management">Management</option>
						<option value="Marketing">Marketing</option>
						<option value="Doctor">Doctor</option>
						<option value="Nursing">Nursing</option>
						<option value="Operations">Operations</option>
                    </select>
                    </div>
                  </div><!-- /.form-group -->
                   	<div class="form-group">
							  <label class="sel1 required control-label col-sm-2">Required Experience</label>
				  							<div class="col-md-2">
				  							<select id="from-exp-sel" name="from-exp-sel" class="form-control">				  							
											    <option id = "year-option" value ="0">--Minimum--</option>
											</select>
											</div>
				  							<div class="col-md-2">
				  							<select id="to-exp-sel" name="to-exp-sel" class="form-control">
											    <option id = "to-year-option" value ="0">--Maximum--</option>
											</select>
											</div>
							</div>
                  
                  </div><!-- /.box-body -->
	                <div class="box-header with-border">
	                  <h3 class="box-title" >Fill these details also to get the right candidate</h3>
	                </div>
         			<div class="box-body">
                  
                  			<div class="form-group">
								<label class="col-sm-2 control-label">Education</label>
								
								<div class="col-sm-10">
									<div class="col-sm-12">
									<label class="col-sm-4 control-label">Specify UG Qualifications</label>
									<div class="col-sm-4">
									<select id="ug-edu" name="ug-edu" class="form-control input-field">
											    <option id = "to-year-option" value ="0">select</option>
											    <option id = "to-year-option" value ="UG Degree Names">UG Degree Names</option>
											    <option id = "to-year-option" value ="Graduation not required">Graduation not required</option>
											    <option id = "to-year-option" value ="Any Graduate">Any Graduate</option>

											</select>
									</div>		
									<div class="col-sm-4" id="ug-course" style="display: none;">
									<input class="form-control input-field" name="ug-name" id="ug-name" type="text"
										value="">
									</div>
									</div>
									<div class="col-sm-12">
									<label class="col-sm-4 control-label">Specify PG Qualifications</label>
									<div class="col-sm-4">
									<select id="pg-edu" name="pg-edu" class="form-control input-field">
											    <option id = "to-year-option" value ="0">select</option>
											    <option id = "to-year-option" value ="PG Degree Names">PG Degree Names</option>
											    <option id = "to-year-option" value ="Post-Graduation not required">Post-Graduation not required</option>
											    <option id = "to-year-option" value ="Any Post Graduate">Any Post Graduate</option>
											
											</select>
									</div>		
									<div class="col-sm-4" id="pg-course" style="display: none;">
									<input class="form-control input-field" name="pg-name" id="pg-name" type="text"
										value="">
									</div>	
									</div>
									<div class="col-sm-12">
									<label class="col-sm-4 control-label">Specify Doctorate / Ph.D</label>
									<div class="col-sm-4">
									<select id="doc-edu" name="doc-edu" class="form-control input-field">
											    <option id = "to-year-option" value ="0">select</option>
											    <option id = "to-year-option" value ="Doctorate">Doctorate</option>
											    <option id = "to-year-option" value ="Doctorate not required">Doctorate not required</option>
											    <option id = "to-year-option" value ="Any Doctorate">Any Doctorate</option>
											
											</select>
									</div>				
									<div class="col-sm-4" id="doc-course" style="display: none;">
									<input class="form-control input-field" name="doc-name" id="doc-name" type="text"
										value="">
									</div>	
									</div>
								</div>
							</div>
                  			<div class="form-group">
                  			<label for="Receive from" class="col-sm-2 control-label">Receive application from</label>
                      			<div class="col-sm-4">
			                        <select class="form-control" id="receive-from" name="receive-from">
			                        <option value="">Select</option>
			                        <option value="From anywhere">From anywhere</option>
			                        <option value="Within the country">Within the country</option>
			                        <option value="Within the state">Within the state</option>
			                        <option value="Within the city">Within the city</option>
			                      </select>
                      			</div>
								
								<label class="col-sm-2 control-label">Languages Known</label>
							<div class="col-sm-4">
							<select id="languages" name="languages" style="width: 100%;" data-placeholder="Select languages" multiple="" class="form-control select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">
			                        <option value="English">English</option>
									<option value="Hindi">Hindi</option>
									<option value="Malayalam">Malayalam</option>
									<option value="Tamil">Tamil</option>
											
							</select>
							</div>
							</div>
							<div class="form-group">
								
							  	<label class="sel1 control-label col-sm-2">Annual Salary</label>
				  							<div class="col-md-2">
				  							<select id="min-ann-sal" name="min-ann-sal" class="form-control">				  							
											    <option id = "max-option" value ="0">--Minimum--</option>
											</select>
											</div>
				  							<div class="col-md-2">
				  							<select id="max-ann-sal" name="max-ann-sal" class="form-control">
											    <option id = "min-option" value ="0">--Maximum--</option>
											</select>
											</div>
								<label class="col-sm-2 control-label">Gender</label>
								<div style="padding-left: 60px;" class="radio col-sm-4">
								  <label><input type="radio" value="Male" name="gender" class="input-field">Male</label>
								  <label><input type="radio" value="Female" name="gender" class="input-field">Female</label>
								  <label><input id="any-gender" type="radio" value="Any" name="gender" class="input-field">Any</label>
								</div>				
							</div>
							<div class="form-group">
                  			<label for="Change Email" class="col-sm-2 control-label">Change Email</label>
                      			<div class="col-sm-4">
			                       <input type="email" placeholder="Email" id="change-email" class="form-control">
                      			</div>
								
								<label class="col-sm-2 control-label">Job Expiry Date</label>
							<div class="col-sm-4">
							<div class="input-group">
                      			<div class="input-group-addon">
                       				 <i class="fa fa-calendar"></i>
                      			</div>
                      			<input type="text" id="expiry-date" class="form-control pull-right active">
                   			 </div>
							</div>
							</div>
							<div id="jobpost-alert" class="row">
									
							</div>
							
                  </div><!-- /.box-body -->
                  <div class="box-footer">
                    <button id="cancel" type="button" class="btn btn-default">Cancel</button>
                    <button id= "submit" type="button" class="btn btn-info pull-right" >Post Job</button>
                  </div><!-- /.box-footer -->
                </form>
              <!-- general form elements disabled -->
              </div>
		
		
          <!-- Your Page Content Here -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <!-- Main Footer -->
      <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
          Anything you want
        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2015 <a href="#">Company</a>.</strong> All rights reserved.
      </footer>

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
          <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
          <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
          <!-- Home tab content -->
          <div class="tab-pane active" id="control-sidebar-home-tab">
            <h3 class="control-sidebar-heading">Recent Activity</h3>
            <ul class="control-sidebar-menu">
              <li>
                <a href="javascript::;">
                  <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                    <p>Will be 23 on April 24th</p>
                  </div>
                </a>
              </li>
            </ul><!-- /.control-sidebar-menu -->

            <h3 class="control-sidebar-heading">Tasks Progress</h3>
            <ul class="control-sidebar-menu">
              <li>
                <a href="javascript::;">
                  <h4 class="control-sidebar-subheading">
                    Custom Template Design
                    <span class="label label-danger pull-right">70%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                  </div>
                </a>
              </li>
            </ul><!-- /.control-sidebar-menu -->

          </div><!-- /.tab-pane -->
          <!-- Stats tab content -->
          <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div><!-- /.tab-pane -->
          <!-- Settings tab content -->
          <div class="tab-pane" id="control-sidebar-settings-tab">
            <form method="post">
              <h3 class="control-sidebar-heading">General Settings</h3>
              <div class="form-group">
	                <label class="control-sidebar-subheading">
	                  Report panel usage
	                  <input type="checkbox" class="pull-right" checked>
	                </label>
                <p>
                  Some information about this general settings option
                </p>
              </div><!-- /.form-group -->
            </form>
          </div><!-- /.tab-pane -->
        </div>
      </aside><!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
    </div><!-- ./wrapper -->

    <!-- REQUIRED JS SCRIPTS -->

    <script src="js/jquery.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/bootstrap3-wysihtml5.all.min.js"></script>
    
    <!-- iCheck -->
    <script src="js/icheck.min.js"></script>
    <script src="js/underscore.js"></script>
    <script src="js/backbone.js"></script>
    <script src="js/app.min.js"></script>

    <script src="https://cdn.ckeditor.com/4.4.3/standard/ckeditor.js"></script>
    <script src="bootstrap/js/select2.min.js"></script>
    <script src="bootstrap/js/jquery.inputmask.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
    <script src="bootstrap/js/daterangepicker.js"></script>
    <!-- Models -->
    <script src="js/model/usermodel.js"></script>
    <script src="js/model/post-job.js"></script>
    
    <!-- Views -->
    <script src="js/view/home-page-view.js"></script>
    <script src="js/view/post-job-view.js"></script>
    
    <!-- Routers -->
    <script src="js/router/homepage-router.js"></script>
    <script src="js/router/post-job-router.js"></script>
    
      <script>
      $(function () {
        // Replace the &lt;textarea id="editor1"&gt; with a CKEditor
        // instance, using default configuration.
        CKEDITOR.replace('description');
        //bootstrap WYSIHTML5 - text editor
        
        $(".select2").select2();
        $(".textarea").wysihtml5();
        //Datemask dd/mm/yyyy
        $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"}); 
		$('#expiry-date').daterangepicker();
		 //iCheck for checkbox and radio inputs
		$('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
		checkboxClass: 'icheckbox_minimal-blue',
		radioClass: 'iradio_minimal-blue'
		}); 

      });
    </script> 

    <!-- Optionally, you can add Slimscroll and FastClick plugins.
         Both of these plugins are recommended to enhance the
         user experience. Slimscroll is required when using the
         fixed layout. -->
  </body>
</html>
