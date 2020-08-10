<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Add Staf User</title>

<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/admin/img/favicon.ico">

<!-- fonts -->
<link href="<%=request.getContextPath() %>/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- styles -->
<link href="<%=request.getContextPath() %>/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

<!-- -->
<link href="<%=request.getContextPath() %>/resources/admin/css/style.css" rel="stylesheet">

<!-- Responsive -->
<link href="<%=request.getContextPath() %>/resources/admin/css/responsive.css" rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- Custom styles for this page -->
<link href="<%=request.getContextPath() %>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">


<script src="https://cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>


<!--***datetimepicker****-->
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.1.221/styles/kendo.common-material.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/datetimepicker/css/kendo.material.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/datetimepicker/css/kendo.material.mobile.min.css" />
<script src="<%=request.getContextPath() %>/resources/admin/datetimepicker/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/admin/datetimepicker/js/kendo.all.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/admin/js/select2.full.min.js"></script>


<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/css/bootstrap-clockpicker.css" />
<script src="<%=request.getContextPath() %>/resources/admin/js/bootstrap-clockpicker.js"></script>

 <script src="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.26.0/slimselect.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.26.0/slimselect.min.css" rel="stylesheet"></link>

<link href="<%=request.getContextPath() %>/resources/admin/css/toastr.min.css" rel="stylesheet">
<script	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/conf.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/stafuser.js"></script>
<script src="<%=request.getContextPath() %>/resources/admin/js/jquery.Jcrop.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/css/jquery.Jcrop.css"	type="text/css" />

	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

	
	
<style>
input[type=number] {
  -moz-appearance: textfield;
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
</style>

</head>

<body id="page-top" ng-app="prc" ng-controller="StafUser">
<form name="myForm">
										<input type="hidden" name="x" id="valuex" ng-model="valuex" />
										<input type="hidden" name="y" id="valuey" ng-model="valuey" />
										<input type="hidden" name="w" id="valuew" ng-model="valuew" />
										<input type="hidden" name="h" id="valueh" ng-model="valueh" />
									</form>
									
	<form name="myForm1">
										<input type="hidden" name="x1" id="valuex1" ng-model="valuex1" />
										<input type="hidden" name="y1" id="valuey1" ng-model="valuey1" />
										<input type="hidden" name="w1" id="valuew1" ng-model="valuew1" />
										<input type="hidden" name="h1" id="valueh1" ng-model="valueh1" />
									</form>								
	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Sidebar -->
			<!--/Left Navigation START-->
			<%@include file="left-nav.jsp" %>
			<!--/Left Navigation END-->
		<!-- End of Sidebar -->


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">



				<!-- Topbar -->
				
				<%@include file="header.jsp" %>
				
				<!-- End of Topbar -->




				<div class="container-fluid">

					<!-- Content Row -->
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

							<!-- Collapsable Card Example -->
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardExample" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExample" ng-click="formreset()">
									<h6 class="m-0 font-weight-bold text-light">Add User Details
									</h6>
								</a>
								<!-- Card Content - Collapse  class="collapse"-->
								<div class="collapse hide" id="collapseCardExample">
									<div class="card-body">

 <form class="" ng-submit="addStafUser()" id="addStafUser">
	    
	    <div id="London" class="tabcontent"> <br>
          <div class="box-header with-border card shadow mb-4 col-lg-12" style="padding-top:15px;background-color: #f8f9fc;">
			   <h3 class="box-title" style="color:#4A2818;"> Add User Register Details  </h3>
		  </div>
										
		<div class="form-group row"><!-- Row Start -->
     	
  			<div class="col-lg-4 " style="float:right">
				<label>  Staf No. <span class="errormsg">*</span></label> 
				<input class="form-control" placeholder=" Enrollment Number "  ng-model="stafuser.stafuser_number" 	 ng-change="setflag()" id="stafuser_number" type="text">
				<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
			</div>
		</div>
		
			
		 <div class="form-group row">  <!------------------------------------ Row Start -->
  				 <div class="col-lg-4" >
					<label>First Name <span class="errormsg">*</span></label> 
					<input class="form-control" placeholder=" Enter First Name  " 	 ng-change="setflag()" ng-model="stafuser.stafuser_firstname" id="stafuser_firstname" type="text">
					<p class="errormsg" ng-show="stafusermember_firstnameError == 1">{{stafusermember_firstnameMsg}}</p>
				 </div>
				<div class="col-lg-4"  >
					<label> Middle Name </label> 
					<input class="form-control" placeholder=" Enter Middle Name " 	 ng-change="setflag()" ng-model="stafuser.stafuser_middlename" id="stafuser_middlename" type="text">
					<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
				</div>
				<div class="col-lg-4 "  >
				   	<label>Last Name <span class="errormsg">*</span></label> 
					<input class="form-control" placeholder=" Enter Last Name " 	 ng-change="setflag()" ng-model="stafuser.stafuser_lastname" name="stafuser_lastname" id="stafuser_lastname" type="text">
					<p class="errormsg" ng-show="stafusermember_lastnameError == 1">{{stafusermember_lastnameMsg}}</p>
				</div>							
		</div>
																	
		<div class="box-header with-border card shadow mb-4 col-lg-12" style="padding-top:15px;background-color: #f8f9fc;">
				<h3 class="box-title" style="color:#4A2818;"> Address Details  </h3>
		</div>	
						
      <div class="form-group row"><!------------------------------------ Row Start -->
	  			<div class="col-lg-4 " >
				   	<label>Address Line 1 <span class="errormsg">*</span></label> 
					<input class="form-control" placeholder=" Enter Your Address  " ng-model="stafuser.address_line_1" id="address_line_1" type="text">
					<p class="errormsg" ng-show="stafuseraddress_line_1Error == 1">{{stafuseraddress_line_1Msg}}</p>
				</div>
				<div class="col-lg-4 "  >
			    	<label> Address Line 2</label> 
						<input class="form-control" placeholder="  Enter Your Address" ng-model="stafuser.address_line_2" id="address_line_2" type="text">
						<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
				</div>
			    <div class="col-lg-4  "  >
				  	<label>Address Line 3 </label> 
					<input class="form-control" placeholder=" Enter Your Address" ng-model="stafuser.address_line_3" id="address_line_3" type="text">
					<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
				</div>									
		</div>
			<div class="row"> <!------------------------------------ Row Start -->
				<div class="col-md-3" >
					 <div class="form-group">
						<label>Country <span class="errormsg">*</span></label> 
						<select class="form-control input-lg2" name="stafuser_country_id"  ng-init="stafuser.stafuser_country_id = 1" ng-change="setflag()"  id="stafuser_country_id" ng-model="stafuser.stafuser_country_id" >
								<option value="" > Select Country</option>
								<option value="1">India</option>
								<option value="2">Others</option>
								
					   		   <!--  <option ng-repeat="item in allCourses" value="{{item.courceId}}">{{item.courceTitle}}</option> -->
						</select>
						<p class="errormsg" ng-show="stafusermember_country_idError == 1">{{stafusermember_country_idMsg}}</p>
					</div>
					  </div>
					 <div class="col-md-3" >
							<div class="form-group">
								<label>State <span class="errormsg">*</span></label> 
								<select class="form-control input-lg2" ng-change="setflag()"  name="stafuser_state_id" id="stafuser_state_id" ng-model="stafuser.stafuser_state_id">
					  			  <option value="" > Select State</option>	
					  			  <option value="1">Gujarat</option>
					  			  <option value="2">Others</option>					
								</select>
								<p class="errormsg" ng-show="stafusermember_state_idError == 1">{{stafusermember_state_idMsg}}</p>
								
							</div>
					</div>
					<div class="col-md-3" >
							<div class="form-group">
									<label>City <span class="errormsg">*</span></label> 
										<input class="form-control" placeholder=" Enter Your City" ng-change="setflag()" ng-model="stafuser.stafuser_city" id="stafuser_city" type="text">
							</div>
							<p class="errormsg" ng-show="stafusermember_cityError == 1">{{stafusermember_cityMsg}}</p>
							
					</div>				
					<div class="col-lg-3 "  >
						    	<label>Pincode <span class="errormsg">*</span></label> 
								<input class="form-control" placeholder=" Enter Your Pincode" ng-model="stafuser.pincode" id="pincode" type="number" ng-change="setflag()" >
								<p class="errormsg" ng-show="stafuserpincodeError == 1">{{stafuserpincodeMsg}}</p>
					</div>		
		   </div>
						
	 <div class="box-header with-border card shadow mb-4 col-lg-12" style="padding-top:15px;background-color: #f8f9fc;">
			<h3 class="box-title" style="color:#4A2818;"> Login Details  </h3>
     </div>					
		   <div class="form-group row"> <!------------------------------------ Row Start -->
				<div class="col-lg-3 "  >
				   	<label> Phone Number</label> 
					<input class="form-control" placeholder=" Enter Your Phone Number" ng-model="stafuser.stafuser_phone" id="stafuser_phone" ng-change="setflag()"  type="number">
					<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
				</div>	
				<div class="col-lg-3 "  >
			    	<label> Mobile Number <span class="errormsg">*</span></label> 
						<input class="form-control" placeholder=" Enter Your Mobile Number" ng-model="stafuser.stafuser_mobile_no" id="stafuser_mobile_no" ng-change="setflag()"  type="number">
						<p class="errormsg" ng-show="stafusermember_mobile_noError == 1">{{stafusermember_mobile_noMsg}}</p>
				</div>		
				<div class="col-lg-3" >
				   	<label>Email  <span class="errormsg">*</span></label> 
						<input class="form-control" placeholder=" Enter Your Email  " ng-model="stafuser.stafuser_email" id="stafuser_email" ng-change="setflag()"  type="email">
						<p class="errormsg" ng-show="stafusermember_emailError == 1">{{stafusermember_emailMsg}}</p>
				</div>
				<div class="col-lg-3 "  >
				   	<label> Password <span class="errormsg">*</span></label> 
						<input class="form-control" placeholder="  Enter Your Password" ng-model="stafuser.stafuser_password" id="stafuser_password" ng-change="setflag()"  type="password">
						<p class="errormsg" ng-show="stafuserpasswordError == 1">{{stafuserpasswordMsg}}</p>
				</div>
			</div>	
									
		<div class="form-group row">  <!------------------------------------ Row Start -->
			
									  
										<div class="col-lg-5">
									    	<label>Location <span class="errormsg">*</span></label> 
											
											<select class="form-control select2" style="width:100%;" ng-change="setflag()" placeholder="Select" style="border:1px solid #d1d3e2;" name="location_name" id="location_name" multiple  ng-model="stafuser.location_name" >
													<option value="" selected> Select Location </option>
													<option ng-repeat="item2 in getAllLocation" value="{{item2.location_name}}">{{item2.location_name}}</option>
												
								                   	
													 
												</select>
											<p class="errormsg" ng-show="location_idError == 1">{{location_idMsg}}</p>
										</div>	
									
				<div class="col-lg-3">
									<div class="form-group">
										<label> Image <font style="color: red;">*</font></label>
										<input type="file" id="imageadd" name="imageadd" ng-model="stafuser.stafuser_image" class="form-control" style="height:40px"><br>
										<p style="font-size:15px; margin-top:-10px;">Upload minimum 400 * 400 size image </p>
									</div>
				</div>
	     </div>
					<div class="row text-center">
								<div class="col-md-12">
									<img src="" id="target" />
									
								</div>
							</div>
							
							
		<div class="row">		<!------------------------------------ Row Start -->							
				<div class="col-md-8 text-left">
					<strong ng-show="albumSubmitSuccess == 1" style="color: green;"><span class="fa fa-check-circle"></span> {{successMsg}}</strong>
					<strong ng-show="albumSubmitError == 1" style="color: red;"><span class="fa fa-times-circle"></span> {{errorMsg}}</strong>
				</div>										
				<div class="col-md-4 text-right">
					<button type="submit"  ng-disabled="spin == 1" class="btn btn-success tablinks"><i ng-show="spin == 1" class="fa fa-spin fa-spinner" aria-hidden="true"></i> Save </button>																						</div>
				
				</div>	
		</div>	
		</form>

									</div>
								</div>
							</div>

						</div>
					</div>
				</div>



				<div class="container-fluid">
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-lg-12 col-md-12  col-sm-12 col-xl-12">
							<!-- Collapsable Card Example -->
							<div class="card shadow mb-4">

								<!-- Card Header -->
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">All Users</h6>
								</div>




								<!-- Card Content -->
								<div class="card-body">

									<div class="row">

										<div class="col-sm-12 col-md-12">
											<div class="table-responsive">
												<table class="table table-bordered" id="dataTable"
													width="100%" cellspacing="0">

													<thead>
														<tr>
															<th style="width: 5%">#</th>
															<th style="width: 30%">Name </th>
															<th style="width: 25%">Email </th>
															
															<th style="width: 20%">Mobile</th>
															<!-- <th style="width: 20%">Type Name</th -->
															
														
															<th class="text-center">Del.</th>
														</tr>
													</thead>


												<tbody>

													<tr ng-repeat="item in getAllStafUserList">
															<td  style="width: 5%">{{$index+1 }}</td>
															<td data-toggle="modal" data-target="#staff" ng-click="getStafUser(item.stafuser_id)">{{item.stafuser_firstname}} {{item.stafuser_lastname}} </td>
														
															<td  data-toggle="modal" data-target="#staff" ng-click="getStafUser(item.stafuser_id)" >{{item.stafuser_email}}</td>
															
															<td data-toggle="modal" data-target="#staff" ng-click="getStafUser(item.stafuser_id)" >{{item.stafuser_mobile_no}}</td>
														<!-- 	<td data-toggle="modal" data-target="#staff"ng-click="getStafUser(item.stafuser_id)"><img src="{{stafuser.stafuser_barcode}}" > -->
															 </td>
														
														 	<td> <center>
														<a ng-click="deletestafuser(item.stafuser_id)" style="cursor: pointer;" class="btn btn-danger">
															<i class="fa fa-trash" style="color:white;" aria-hidden="true" data-toggle="tooltip" ></i>
														</a>	</center>
													</td>
														</tr>

													

													
													</tbody>

												</table>
											</div>
										</div>
									</div>

									<hr class="mt-0">

									<div class="row">

										<div class="col-sm-12 col-md-5">
											<div class="hint-text">Showing <b>{{startindex+1}}-{{getActivityList.length+startindex}}</b> out of <b>{{allcounts.activityCount}}</b> entries</div>
										</div>

										<div class="col-sm-12 col-md-7 text-right">
											<div class="dataTables_paginate paging_simple_numbers"
												id="dataTable_paginate">
												<ul class="pagination pull-right">
													<li class="paginate_button page-item previous disabled"
														id="dataTable_previous"><a href="#"
														aria-controls="dataTable" data-dt-idx="0" tabindex="0"
														class="page-link">Previous</a></li>
													<li class="paginate_button page-item active"><a
														href="#" aria-controls="dataTable" data-dt-idx="1"
														tabindex="0" class="page-link">{{currentPage+1}}</a></li>
													<li class="paginate_button page-item next"
														id="dataTable_next"><a href="#"
														aria-controls="dataTable" data-dt-idx="7" tabindex="0"
														class="page-link">Next</a></li>
												</ul>
											</div>
										</div>

									</div>


								</div>

							</div>

						</div>

					</div>
				</div>




			</div>
			<!-- End of Main Content -->

			<%@include file="delete_modal.jsp" %>
			<!--/#footer START-->
			<%@include file="footer.jsp" %>
			<!--/#footer END-->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

<!--/ ------------------------------------------------------------- Model PopUp-->
<div class="container" >
				<div class="modal fade" id="staff" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">Edit User Details</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							
							</div>
							<div class="modal-body">
								
					
					
					
					
 <form class="" ng-submit="updateStafUser(stafuser1.stafuser_id)" id="addStafUser">
	    
	    <div id="London" class="tabcontent"> <br>
          <div class="box-header with-border card shadow mb-4 col-lg-12" style="padding-top:15px;background-color: #f8f9fc;">
			   <h3 class="box-title" style="color:#4A2818;"> Add User Register Details  </h3>
		  </div>
										
		<div class="form-group row"><!-- Row Start -->
     	
  			<div class="col-lg-4 " style="float:right">
				<label>  Staf No. <span class="errormsg">*</span></label> 
				<input class="form-control" placeholder=" Enrollment Number "  ng-model="stafuser1.stafuser_number" 	 ng-change="setflag()" id="stafuser_number" type="text">
				<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
			</div>
		</div>
		
			
		 <div class="form-group row">  <!------------------------------------ Row Start -->
  				 <div class="col-lg-4" >
					<label>First Name <span class="errormsg">*</span></label> 
					<input class="form-control" placeholder=" Enter First Name  " 	 ng-change="setflag()" ng-model="stafuser1.stafuser_firstname" id="stafuser_firstname" type="text">
					<p class="errormsg" ng-show="stafusermember_firstnameError == 1">{{stafusermember_firstnameMsg}}</p>
				 </div>
				<div class="col-lg-4"  >
					<label> Middle Name </label> 
					<input class="form-control" placeholder=" Enter Middle Name " 	 ng-change="setflag()" ng-model="stafuser1.stafuser_middlename" id="stafuser_middlename" type="text">
					<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
				</div>
				<div class="col-lg-4 "  >
				   	<label>Last Name <span class="errormsg">*</span></label> 
					<input class="form-control" placeholder=" Enter Last Name " 	 ng-change="setflag()" ng-model="stafuser1.stafuser_lastname" name="stafuser_lastname" id="stafuser_lastname" type="text">
					<p class="errormsg" ng-show="stafusermember_lastnameError == 1">{{stafusermember_lastnameMsg}}</p>
				</div>							
		</div>
																	
		<div class="box-header with-border card shadow mb-4 col-lg-12" style="padding-top:15px;background-color: #f8f9fc;">
				<h3 class="box-title" style="color:#4A2818;"> Address Details  </h3>
		</div>	
						
      <div class="form-group row"><!------------------------------------ Row Start -->
	  			<div class="col-lg-4 " >
				   	<label>Address Line 1 <span class="errormsg">*</span></label> 
					<input class="form-control" placeholder=" Enter Your Address  " ng-model="stafuser1.address_line_1" id="address_line_1" type="text">
					<p class="errormsg" ng-show="stafuseraddress_line_1Error == 1">{{stafuseraddress_line_1Msg}}</p>
				</div>
				<div class="col-lg-4 "  >
			    	<label> Address Line 2</label> 
						<input class="form-control" placeholder="  Enter Your Address" ng-model="stafuser1.address_line_2" id="address_line_2" type="text">
						<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
				</div>
			    <div class="col-lg-4  "  >
				  	<label>Address Line 3 </label> 
					<input class="form-control" placeholder=" Enter Your Address" ng-model="stafuser1.address_line_3" id="address_line_3" type="text">
					<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
				</div>									
		</div>
			<div class="row"> <!------------------------------------ Row Start -->
				<div class="col-md-3" >
					 <div class="form-group">
						<label>Country <span class="errormsg">*</span></label> 
						<select class="form-control input-lg2" name="stafuser_country_id"  ng-init="stafuser1.stafuser_country_id = 1" ng-change="setflag()"  id="stafuser_country_id" ng-model="stafuser.stafuser_country_id" >
								<option value="" > Select Country</option>
								<option value="1">India</option>
								<option value="2">Others</option>
								
					   		   <!--  <option ng-repeat="item in allCourses" value="{{item.courceId}}">{{item.courceTitle}}</option> -->
						</select>
						<p class="errormsg" ng-show="stafusermember_country_idError == 1">{{stafusermember_country_idMsg}}</p>
					</div>
					  </div>
					 <div class="col-md-3" >
							<div class="form-group">
								<label>State <span class="errormsg">*</span></label> 
								<select class="form-control input-lg2" ng-change="setflag()"  name="stafuser_state_id" id="stafuser_state_id" ng-model="stafuser1.stafuser_state_id">
					  			  <option value="" > Select State</option>	
					  			  <option value="1">Gujarat</option>
					  			  <option value="2">Others</option>					
								</select>
								<p class="errormsg" ng-show="stafusermember_state_idError == 1">{{stafusermember_state_idMsg}}</p>
								
							</div>
					</div>
					<div class="col-md-3" >
							<div class="form-group">
									<label>City <span class="errormsg">*</span></label> 
										<input class="form-control" placeholder=" Enter Your City" ng-change="setflag()" ng-model="stafuser1.stafuser_city" id="stafuser_city" type="text">
							</div>
							<p class="errormsg" ng-show="stafusermember_cityError == 1">{{stafusermember_cityMsg}}</p>
							
					</div>				
					<div class="col-lg-3 "  >
						    	<label>Pincode <span class="errormsg">*</span></label> 
								<input class="form-control" placeholder=" Enter Your Pincode" ng-model="stafuser1.pincode" id="pincode" type="number" ng-change="setflag()" >
								<p class="errormsg" ng-show="stafuserpincodeError == 1">{{stafuserpincodeMsg}}</p>
					</div>		
		   </div>
						
	 <div class="box-header with-border card shadow mb-4 col-lg-12" style="padding-top:15px;background-color: #f8f9fc;">
			<h3 class="box-title" style="color:#4A2818;"> Login Details  </h3>
     </div>					
		   <div class="form-group row"> <!------------------------------------ Row Start -->
				<div class="col-lg-6 "  >
				   	<label> Phone Number</label> 
					<input class="form-control" placeholder=" Enter Your Phone Number" ng-model="stafuser1.stafuser_phone" id="stafuser_phone" ng-change="setflag()"  type="text">
					<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
				</div>	
				<div class="col-lg-6"  >
			    	<label> Mobile Number <span class="errormsg">*</span></label> 
						<input class="form-control" placeholder=" Enter Your Mobile Number" ng-model="stafuser1.stafuser_mobile_no" id="stafuser_mobile_no" ng-change="setflag()"  type="text">
						<p class="errormsg" ng-show="stafusermember_mobile_noError == 1">{{stafusermember_mobile_noMsg}}</p>
				</div>		
		
			</div>	
			
		<div class="form-group row"> <!------------------------------------ Row Start -->
			
					<div class="col-lg-6" >
				   	<label>Email  <span class="errormsg">*</span></label> 
						<input class="form-control" placeholder=" Enter Your Email  " ng-model="stafuser1.stafuser_email" id="stafuser_email" ng-change="setflag()"  type="email">
						<p class="errormsg" ng-show="stafusermember_emailError == 1">{{stafusermember_emailMsg}}</p>
				</div>
				<div class="col-lg-6 "  >
				   	<label> Password <span class="errormsg">*</span></label> 
						<input class="form-control" placeholder="  Enter Your Password" ng-model="stafuser1.stafuser_password" id="stafuser_password" ng-change="setflag()"  type="password">
						<p class="errormsg" ng-show="stafuserpasswordError == 1">{{stafuserpasswordMsg}}</p>
				</div>
			</div>	
				<div class="form-group row">
					<div class="col-lg-8">
									    	<label>Location <span class="errormsg">*</span></label> 
											
											<select style="width:100%;" ng-change="setflag()"  style="border:1px solid #d1d3e2;"  id="location_list"   ng-model="stafuser2.location_name" multiple>
												
													<option ng-repeat="item2 in getAllLocation"  value="{{item2.location_name}}">{{item2.location_name}}</option>
					 
												</select>
											<p class="errormsg" ng-show="location_idError == 1">{{location_idMsg}}</p>
										</div>		
		</div>
		<div class="form-group row">  <!------------------------------------ Row Start -->
			
									  
										
									
				<div class="col-lg-6">
									<div class="form-group">
										<label> Image <font style="color: red;">*</font></label>
										<input type="file" id="imageadd1" name="imageadd1" ng-model="stafuser1.image" class="form-control" style="height:40px"><br>
										<p style="font-size:15px; margin-top:-10px;">Upload minimum 300 * 300 size image </p>
									</div>
				</div>
				 <div class="col-lg-3" style="float:right" >	
									<br> 
										<img style="width:100%;float:right;"  id="imageadd1" name="imageadd1" src="{{stafuser1.stafuser_image}}" ng-model="stafuser1.stafuser_image" >				
							</div> 
							
	     </div>
					<div class="row text-center">
								<div class="col-md-12">
									<img src="" id="target1" />
									
								</div>
							</div>
							
							
		<div class="row">		<!------------------------------------ Row Start -->							
				<div class="col-md-8 text-left">
					<strong ng-show="albumSubmitSuccess == 1" style="color: green;"><span class="fa fa-check-circle"></span> {{successMsg}}</strong>
					<strong ng-show="albumSubmitError == 1" style="color: red;"><span class="fa fa-times-circle"></span> {{errorMsg}}</strong>
				</div>										
				<div class="col-md-4 text-right">
					<button type="submit"  ng-disabled="spin == 1" class="btn btn-success tablinks"><i ng-show="spin == 1" class="fa fa-spin fa-spinner" aria-hidden="true"></i> Save </button>																						</div>
				
				</div>	
		</div>	
		</form>
					
					
					
					
					

					</div>
						
								
								
								</div>
											
						</div>
					</div>
				</div>
		

<script>
			$('#myModalBilling').on('hidden', function()
					{
						document.location.reload();
					})
		</script>

<!-- Bootstrap  JavaScript-->
	<!--<script src="vendor/jquery/jquery.min.js"></script>-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core  JavaScript-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<%-- <script src="<%=request.getContextPath() %>/resources/admin/js/main.js"></script> --%>

	<!-- Custom scripts for all pages-->
	<script src="<%=request.getContextPath() %>/resources/admin/js/sb-admin-2.min.js"></script>
	
	
	<script src="<%=request.getContextPath() %>/resources/admin/js/toastr.min.js"></script>

	<!--inputmask-->
	<script src="<%=request.getContextPath() %>/resources/admin/js/bootstrap-inputmask.js"></script>

<script>
			$('#staff').on('hidden', function()
					{
						document.location.reload();
					})
		</script>
		<script>
$('.select2').select2();
</script>

		<script>
			jQuery(function($) {
				function readURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							if ($('#target').data('Jcrop')) {
							    $('#target').data('Jcrop').destroy();
							    $('#target').removeAttr('style');
							}
							
							var u = URL.createObjectURL(input.files[0]);
						    var img = new Image;
						    img.onload = function() {
						        if(img.width < 400 || img.height < 400)
						        {
						        	alert("Minimum image size should be 400px X 400px");
						        	$('#target').attr('src', "");
						        	document.getElementById("imageadd").value = null;
						        }
						        else
						        {
						        	$('#target').css("min-height", "208px");
								    $('#target').css("min-width", "337px");
									
									$('#target').attr('src', e.target.result);
									$('#target').Jcrop({
										aspectRatio : 1/ 1,
										boxWidth : 500,
										//boxHeight : 400,
										minSize : [100, 100],
										maxSize : [2000, 2000],
										setSelect : [ 100, 100, 400, 400 ],
										onChange : setCoordinates,
										onSelect : setCoordinates
									});
						        }
						    };
						        
						    img.src = u;
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
				$("#imageadd").change(function() {
					readURL(this);
				});
				$("#imageadd").click(function() {
					this.value = null;
				});
			});
			
			function setCoordinates(c) {
				document.myForm.x.value = Math.round(c.x);
				document.myForm.y.value = Math.round(c.y);
				document.myForm.w.value = Math.round(c.w);
				document.myForm.h.value = Math.round(c.h);
			};
			
			function checkCoordinates() {
				if (document.myForm.x.value == "" || document.myForm.y.value == "") {
					alert("Please select a crop region");
					return false;
				} else {
					return true;
				}
			};
		</script>		
				<!-- For Family -->
<script>
			jQuery(function($) {
				function readURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							if ($('#target1').data('Jcrop')) {
							    $('#target1').data('Jcrop').destroy();
							    $('#target1').removeAttr('style');
							}
							
							var u = URL.createObjectURL(input.files[0]);
						    var img = new Image;
						    img.onload = function() {
						        if(img.width < 300 || img.height < 300)
						        {
						        	alert("Minimum image size should be 300px X 300px");
						        	$('#target1').attr('src', "");
						        	document.getElementById("imageadd1").value = null;
						        }
						        else
						        {
						        	$('#target1').css("min-height", "208px");
								    $('#target1').css("min-width", "337px");
									
									$('#target1').attr('src', e.target.result);
									$('#target1').Jcrop({
										aspectRatio : 1/ 1,
										boxWidth : 500,
										//boxHeight : 400,
										minSize : [200, 200],
										maxSize : [2000, 2000],
										setSelect : [ 100, 100, 400, 400 ],
										onChange : setCoordinates1,
										onSelect : setCoordinates1
									});
						        }
						    };
						        
						    img.src = u;
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
				$("#imageadd1").change(function() {
					readURL(this);
				});
				$("#imageadd1").click(function() {
					this.value = null;
				});
			});
			
			function setCoordinates1(c) {
				document.myForm1.x1.value = Math.round(c.x);
				document.myForm1.y1.value = Math.round(c.y);
				document.myForm1.w1.value = Math.round(c.w);
				document.myForm1.h1.value = Math.round(c.h);
			};
			
			function checkCoordinates1() {
				if (document.myForm1.x1.value == "" || document.myForm1.y1.value == "") {
					alert("Please select a crop region");
					return false;
				} else {
					return true;
				}
			};
		</script>	
			
	
</body>

</html>