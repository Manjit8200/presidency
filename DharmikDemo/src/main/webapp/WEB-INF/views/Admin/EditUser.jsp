<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Add New User</title>

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





<!--***datetimepicker****-->
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.1.221/styles/kendo.common-material.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/datetimepicker/css/kendo.material.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/datetimepicker/css/kendo.material.mobile.min.css" />
<script src="<%=request.getContextPath() %>/resources/admin/datetimepicker/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/admin/datetimepicker/js/kendo.all.min.js"></script>


<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/css/bootstrap-clockpicker.css" />
<script src="<%=request.getContextPath() %>/resources/admin/js/bootstrap-clockpicker.js"></script>

<link href="<%=request.getContextPath() %>/resources/admin/css/toastr.min.css" rel="stylesheet">

<script	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/conf.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/EditUser.js"></script>

<script src="<%=request.getContextPath() %>/resources/admin/js/jquery.Jcrop.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/css/jquery.Jcrop.css"	type="text/css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.26.0/slimselect.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.26.0/slimselect.min.css" rel="stylesheet"></link>
<style>
body {font-family: Arial;}

/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #004677;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  color:white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
  color:black;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}


input[type=number] {
  -moz-appearance: textfield;
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

.ss-main .ss-multi-selected{
height: 35px !important;
}
</style>
<script>
function myFunction() {
  var x = document.getElementById("London");
  if (x.style.display === "none") {
    x.style.display = "block";

	document.getElementById('UserDetails').classList.add("active");
  } else {
	 /*  document.getElementById('collapseCardExample').style.display = "none"; */
    x.style.display = "none";
   document.getElementById('UserDetails').classList.remove("active");
    document.getElementById('FamilyDetails').classList.remove("active");
    document.getElementById('PersonalDetails').classList.remove("active");
    document.getElementById('NomineeDetails').classList.remove("active"); 
  }
}
</script>
<!-- <script>
function myFunction1() {
  var x = document.getElementById("collapseCardExample");
  if (x.style.display === "none") {
    x.style.display = "block";

	document.getElementById('UserDetails').classList.add("active");
  } else {
	 /*  document.getElementById('collapseCardExample').style.display = "none"; */
    x.style.display = "none";

}
</script> -->
<script>

function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}


function openClass(oldcity,newcity,cityName) {
  var j,k;
  j=document.getElementById(newcity).classList.add("active");
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  
  k=document.getElementById(oldcity).classList.remove("active");
  
  document.getElementById(cityName).style.display = "block";
 
}

</script>
</head>

<body id="page-top" ng-app="prc" ng-controller="EditUserCtrl" ng-init="getUpdateMember(<%=request.getParameter("member_id") %>) " onload="openCity(event, 'London')">
	
	
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
	<form name="myForm3">
										<input type="hidden" name="x3" id="valuex3" ng-model="valuex3" />
										<input type="hidden"  name="y3" id="valuey3" ng-model="valuey3" />
										<input type="hidden" name="w3" id="valuew3" ng-model="valuew3" />
										<input type="hidden" name="h3" id="valueh3" ng-model="valueh3" />
									</form>
	<!-- Page Wrapper -->
	
	
	
	<div id="wrapper">
			<%@include file="left-nav.jsp" %>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
		<!-- Main Content -->
			<div id="content">
			<%@include file="header.jsp" %>
          <!-- End of Topbar -->
			<div class="container-fluid">
				<div class="row">
				  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="tab">
						  <button  id="UserDetails" class="tablinks" onclick="openCity(event, 'London')">User Details</button>
						  <button id="FamilyDetails"  class="tablinks" onclick="openCity(event, 'Paris')">Family Details</button>
					  <button id="PersonalDetails" class="tablinks" onclick="openCity(event, 'Tokyo')">Personal Information</button> 
						   <button id="NomineeDetails" class="tablinks" onclick="openCity(event, 'India')">  Nominee Details </button>
						   <!--  <button id="PaymentDetails" class="tablinks" onclick="openCity(event, 'Bharat')">  Payment Details </button> -->
							<div> <a onclick="myFunction()"> <i class="fa fa-angle-down" id="down" style="color:white;float: right;margin-right:25px;margin-top:15px;  font-size: 20px" aria-hidden="true"></i></a></div>
					</div>

<!-- Collapsable Card Example -->
	<div class="card shadow mb-4">
		<!-- Card Header - Accordion -->
           <!-- Card Content - Collapse  class="collapse"-->
	<div class="collaspe" id="collapseCardExample" >
	   <div class="" >
<!--===================================================== User Register Details ======================================================= -->            
	  <form class="" ng-submit="editMasterMemberRegister(member_id)">
	    
	  <div id="London" class="tabcontent"> <br>
          <div class="box-header with-border card shadow mb-4 col-lg-12" style="padding-top:15px;background-color: #f8f9fc;">
			   <h3 class="box-title" style="color:#4A2818;"> Add User Register Details  </h3>
		  </div>
										
		<div class="form-group row"><!-- Row Start -->
     		<div class="col-md-4" >
				<div class="form-group">
					<label>Membership Plan <span class="errormsg">*</span></label> 
					<select class="form-control input-lg2" name="plan_id" id="plan_id" ng-model="masterMemberRegister.plan_id" 	 ng-change="setflag()|| typeschange() ">
							 <option value=""> Select Plan </option>
						<!--	  <option value="1"> Gold </option>-->
							    <option ng-repeat="item in getAllMemberNameList" value="{{item.plan_id}}">{{item.plan_name}}</option> 
					</select>
					<p class="errormsg" ng-show="masterMemberRegisterplan_idError == 1">{{masterMemberRegisterplan_idMsg}}</p>
				</div>
			</div>
  			<div class="col-lg-4 " style="float:right">
				<label>  Membership No. <span class="errormsg">*</span></label> 
				<input class="form-control" placeholder=" Enrollment Number " readonly ng-model="masterMemberRegister.membership_number" 	 ng-change="setflag()" id="membership_number" type="text">
				<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
			</div>
		</div>
		<div class="row form-group"> <!-------------------------------------- Row Start -->
			<div class="col-lg-4">
									    	<label>Tenure  <span class="errormsg">*</span></label> 
											<select class="form-control" style="width:100%;"ng-change="setflag() || calculatevalidity()" name="tenure_year" id="tenure_year"  ng-model="masterMemberRegister.tenure_year">
													<option value="" selected> Select Redemption Validity </option>
													<option value="1"> 1 Year</option>
													<option value="2"> 2 Year</option>
													<option value="3"> 3 Year</option>
													<option value="4"> 4 Year</option>
													<option value="5"> 5 Year</option>
													<option value="6"> 6 Year</option>
													<option value="7"> 7 Year</option>
													<option value="8"> 8 Year</option>
													<option value="9"> 9 Year</option>
													<option value="10"> 10 Year</option>
													<option value="11"> 11 Year</option>
													<option value="12"> 12 Year</option>
													<option value="13"> 13 Year</option>
													<option value="14"> 14 Year</option>
													<option value="15"> 15 Year</option>
													<option value="16"> 16 Year</option>
													<option value="17"> 17 Year</option>
													<option value="18"> 18 Year</option>
													<option value="19"> 19 Year</option>
													<option value="20"> 20 Year</option>
													 
												</select>
											<p class="errormsg" ng-show="masterMembertenure_year == 1">{{masterMembertenure_yearMsg}}</p>
										</div>
								
			<div id="example" class="col-lg-4 demo-section k-content" >
				<label> Start Date <span class="errormsg">*</span></label>
				<input class="KendoDate" id="fromdatetimepicker" title="StartDate" 	 ng-change="setflag()" ng-model="masterMemberRegister.start_date" style="width: 100%;" />
				<p class="errormsg" ng-show="masterMemberRegisterStartdateError == 1">{{masterMemberRegisterStart_dateMsg}}</p>
			</div>
			<div id="example" class="col-lg-4 demo-section k-content" >
				<label> Membership Expiry Date <span class="errormsg">*</span></label>
				<input class="KendoDate " id="fromdatetimepicker1" title="EndDate" 	 ng-change="setflag()" ng-model="masterMemberRegister.end_date" style="width: 100%;" />
				<p class="errormsg" ng-show="masterMemberRegisterEnddateError == 1">{{masterMemberRegisterMsg}}</p>
			</div>										
		</div>
			
		 <div class="form-group row">  <!------------------------------------ Row Start -->
  				 <div class="col-lg-4" >
					<label>First Name <span class="errormsg">*</span></label> 
					<input class="form-control" placeholder=" Enter First Name  " 	 ng-change="setflag()" ng-model="masterMemberRegister.member_firstname" id="firstname" type="text">
					<p class="errormsg" ng-show="masterMemberRegistermember_firstnameError == 1">{{masterMemberRegistermember_firstnameMsg}}</p>
				 </div>
				<div class="col-lg-4"  >
					<label> Middle Name </label> 
					<input class="form-control" placeholder=" Enter Middle Name " 	 ng-change="setflag()" ng-model="masterMemberRegister.member_middlename" id="member_middlename" type="text">
					<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
				</div>
				<div class="col-lg-4 "  >
				   	<label>Last Name <span class="errormsg">*</span></label> 
					<input class="form-control" placeholder=" Enter Last Name " 	 ng-change="setflag()" ng-model="masterMemberRegister.member_lastname" name="member_lastname" id="member_lastname" type="text">
					<p class="errormsg" ng-show="masterMemberRegistermember_lastnameError == 1">{{masterMemberRegistermember_lastnameMsg}}</p>
				</div>							
		</div>
																	
		<div class="box-header with-border card shadow mb-4 col-lg-12" style="padding-top:15px;background-color: #f8f9fc;">
				<h3 class="box-title" style="color:#4A2818;"> Address Details  </h3>
		</div>	
						
      <div class="form-group row"><!------------------------------------ Row Start -->
	  			<div class="col-lg-4 " >
				   	<label>Address Line 1 <span class="errormsg">*</span></label> 
					<input class="form-control" placeholder=" Enter Your Address  " ng-model="masterMemberRegister.address_line_1" id="address_line_1" type="text">
					<p class="errormsg" ng-show="masterMemberRegisteraddress_line_1Error == 1">{{masterMemberRegisteraddress_line_1Msg}}</p>
				</div>
				<div class="col-lg-4 "  >
			    	<label> Address Line 2</label> 
						<input class="form-control" placeholder="  Enter Your Address" ng-model="masterMemberRegister.address_line_2" id="address_line_2" type="text">
						<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
				</div>
			    <div class="col-lg-4  "  >
				  	<label>Address Line 3 </label> 
					<input class="form-control" placeholder=" Enter Your Address" ng-model="masterMemberRegister.address_line_3" id="address_line_3" type="text">
					<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
				</div>									
		</div>
			<div class="row"> <!------------------------------------ Row Start -->
				<div class="col-md-3" >
					 <div class="form-group">
						<label>Country <span class="errormsg">*</span></label> 
						<select class="form-control input-lg2" name="member_country_id"  ng-init="masterMemberRegister.member_country_id = 1" ng-change="setflag()"  id="member_country_id" ng-model="masterMemberRegister.member_country_id" >
								<option value="" > Select Country</option>
								<option value="1">India</option>
								<option value="2">USA</option>
								
					   		   <!--  <option ng-repeat="item in allCourses" value="{{item.courceId}}">{{item.courceTitle}}</option> -->
						</select>
						<p class="errormsg" ng-show="masterMemberRegistermember_country_idError == 1">{{masterMemberRegistermember_country_idMsg}}</p>
					</div>
					  </div>
					 <div class="col-md-3" >
							<div class="form-group">
								<label>State <span class="errormsg">*</span></label> 
								<select class="form-control input-lg2" ng-change="setflag()"  name="member_state_id" id="member_state_id" ng-model="masterMemberRegister.member_state_id">
					  			  <option value="" > Select State</option>	
					  			  <option value="1">Gujarat</option>
					  			  <option value="2">Dehli</option>					
								</select>
								<p class="errormsg" ng-show="masterMemberRegistermember_state_idError == 1">{{masterMemberRegistermember_state_idMsg}}</p>
								
							</div>
					</div>
					<div class="col-md-3" >
							<div class="form-group">
									<label>City <span class="errormsg">*</span></label> 
										<input class="form-control" placeholder=" Enter Your Pincode" ng-change="setflag()" ng-model="masterMemberRegister.member_city" id="member_city" type="text">
							</div>
							<p class="errormsg" ng-show="masterMemberRegistermember_cityError == 1">{{masterMemberRegistermember_cityMsg}}</p>
							
					</div>				
					<div class="col-lg-3 "  >
						    	<label>Pincode <span class="errormsg">*</span></label> 
								<input class="form-control" placeholder=" Enter Your Pincode" ng-model="masterMemberRegister.pincode" id="pincode" type="number" ng-change="setflag()" >
								<p class="errormsg" ng-show="masterMemberRegisterpincodeError == 1">{{masterMemberRegisterpincodeMsg}}</p>
					</div>		
		   </div>
						
	 <div class="box-header with-border card shadow mb-4 col-lg-12" style="padding-top:15px;background-color: #f8f9fc;">
			<h3 class="box-title" style="color:#4A2818;"> Login Details  </h3>
     </div>					
		   <div class="form-group row"> <!------------------------------------ Row Start -->
				<div class="col-lg-3 "  >
				   	<label> Phone Number</label> 
					<input class="form-control" placeholder=" Enter Your Phone Number" ng-model="masterMemberRegister.member_phone" id="member_phone" ng-change="setflag()"  type="text">
					<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
				</div>	
				<div class="col-lg-3 "  >
			    	<label> Mobile Number <span class="errormsg">*</span></label> 
						<input class="form-control" placeholder=" Enter Your Mobile Number" ng-model="masterMemberRegister.member_mobile_no" id="member_mobile_no" ng-change="setflag()"  type="text">
						<p class="errormsg" ng-show="masterMemberRegistermember_mobile_noError == 1">{{masterMemberRegistermember_mobile_noMsg}}</p>
				</div>		
				<div class="col-lg-3" >
				   	<label>Email  <span class="errormsg">*</span></label> 
						<input class="form-control" placeholder=" Enter Your Email  " ng-model="masterMemberRegister.member_email" id="member_email" ng-change="setflag()"  type="email">
						<p class="errormsg" ng-show="masterMemberRegistermember_emailError == 1">{{masterMemberRegistermember_emailMsg}}</p>
				</div>
				<div class="col-lg-3 "  >
				   	<label> Password <span class="errormsg">*</span></label> 
						<input class="form-control" placeholder="  Enter Your Password" ng-model="masterMemberRegister.member_password" id="member_password" ng-change="setflag()"  type="password">
						<p class="errormsg" ng-show="masterMemberRegisterpasswordError == 1">{{masterMemberRegisterpasswordMsg}}</p>
				</div>
			</div>	
									
			<div class="form-group row">  <!------------------------------------ Row Start -->
			
				<div class="col-lg-3">
									<div class="form-group">
										<label> Image <font style="color: red;">*</font></label>
										<input type="file" id="imageadd" name="imageadd" ng-model="masterMemberRegister.image" class="form-control" style="height:40px"><br>
										<p style="font-size:15px; margin-top:-10px;">Upload minimum 300 * 300 size image </p>
									</div>
									
									
				</div>
				
				
				<div class="col-lg-3" >
								
									<br>
										<img style="width:100%;" id="imageadd" name="imageadd" src="{{masterMemberRegister.member_image}}" ng-model="masterMemberRegister.member_image" >				
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
					<button type="submit" ng-click="typeschange11()"ng-disabled="spin == 1" class="btn btn-success tablinks"><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Update</button>																						</div>
				 <!-- onclick="openClass('UserDetails','FamilyDetails', 'Paris')" -->
				</div>	
		</div>	
		</form>
<!-- ============================================= Family Details===================================== -->							
				
		<form class="" ng-submit="addMasterMemberFamilyRegister()" ng-init="getUpdateFamilyMember(<%=request.getParameter("member_id") %>)" >		
				<div id="Paris" class="tabcontent">
						<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
							<h3 class="box-title" style="color:#4A2818;"> Family Details</h3>
						</div>							
	
									 
									
								
							
						<div class="row">									
													
													<div class="col-md-8 text-left">	</div>
													<div class="col-md-4 text-right">
													<div class="form-group">
														<a ng-click="AddFamilyMemberRegister()"  data-toggle="modal" data-target="#myModal"class="btn btn-primary" style="color:white;"><span class="fa fa-plus" style="font-size: 14px;"></span>&nbsp;Add Family Member</a>
													</div>
													
													<!-- <button style="border-radius: 0px 4px 4px 0px;" ng-click="AddFamilyMemberRegister()" title="Add new Batch" data-toggle="modal" data-target="#myModal"  class="btn btn-primary" type="button">
										<i class="fa fa-plus"></i> -->
								<!-- 	</button> -->
										</div>
										
										
												</div>								
														<div class="box-body"> 			
									
								<div class="form-group row">		
									<div class="table-responsive table-bordered">
											<table class="table">
												<thead>
												<tr>	
												<th>#</th>																
													<th>Name</th>
													<th>Family Membership No</th>
													<th>Email</th>
													<th>Delete</th>
												</tr>
												</thead>
														<tbody > 
	
														<tr ng-repeat="items in familymember">
															<td data-toggle="modal" data-target="#myModal11" ng-click='getFamilyMemberById(items.members_family_id)' style="width: 5%">{{$index + 1}}</td>
															<td data-toggle="modal" data-target="#myModal11" ng-click='getFamilyMemberById(items.members_family_id)' style="width: 25%">{{items.member_family_first_name}} {{items.member_family_middle_name}}</td>
															
															<td data-toggle="modal" data-target="#myModal11" ng-click='getFamilyMemberById(items.members_family_id)' style="width: 25%">{{items.member_family_email}}</td>
															<td data-toggle="modal" data-target="#myModal11" ng-click='getFamilyMemberById(items.members_family_id)' style="width: 30%">{{items.family_membership_no}}</td>
														
														<td>
														<a ng-click="deleteFamilyMember(items.members_family_id)" style="cursor: pointer;" class="btn btn-danger">
															<i class="fa fa-trash" style="color:white;" aria-hidden="true" data-toggle="tooltip" title="Delete"></i>
														</a>	
													</td>
														</tr>

													
													</tbody>
									
										</table>
									</div>
																
							</div>
								<div class="row">									
													
													<div class="col-md-10 text-left">
														<button onclick="openClass('FamilyDetails','UserDetails', 'London')" class="btn btn-success tablinks "><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Previous</button>
													</div>
													<div class="col-md-2 text-right">
														<button type="submit" ng-disabled="spin == 1" class="btn btn-success tablinks"><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Save & Next</button>
													
													</div>
													
												</div>								
									</div>								
			</div>		
			</form>		
				<!-- ================================ Personal Information ================================================ -->				
			<form  ng-submit="editPersonalInfo(member_id)" ng-init="getMemberPersonalInfo(<%=request.getParameter("member_id") %>) " >
			
			
			<div id="Tokyo" class="tabcontent">
		
						<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;" ng-change="getAllClub()">
							<h3 class="box-title" style="color:#4A2818;"> Personal Information</h3>
						</div>	
												
						<div class="box-body"> 	
						<div class="form-group row">
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<label> Status <span class="errormsg">*</span></label> 
											<select class="form-control" ng-model="memberInfo.member_profession" id="member_profession" >
												<option value="" selected>Select Status</option>
												<option value="1">Business</option>
													<option value="2">Profesional</option>
													<option value="3">Employed</option>
												<option value="4">Others</option>
											</select>
										
										</div>
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<label> Other Club Membership <span class="errormsg">*</span></label> 
											<select class="form-control" ng-model="memberInfo.member_other_Club_membership"  id="member_other_Club_membership" >
												<option value="" selected> Other Club Membership </option>
												<option value="1">Yes</option>
												<option value="2">No</option>
												
											</select>
										</div>
						
					<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
						<label>Name Of Club</label> 
							<div class="form-group input-group ">
								<select class="" style="width:85%; height: 35px; 	"  ng-model="memberInfo.member_club_name"  id="member_club_name" multiple>
									<option value="" selected>Select Your Club</option>
							<option style=" height: 35px;" ng-repeat="item in getAllMasterClub" value="{{item.club_name}}">{{item.club_name}}</option>
								</select> <span class="input-group-btn">
									<button style="border-radius: 0px 4px 4px 0px;" title="Add new Batch" data-toggle="modal" data-target="#myModal97"  class="btn btn-primary" type="button">
										<i class="fa fa-plus"></i>
									</button>
								</span>

							</div>
							
						</div>
							
								
						</div>
						<div class="form-group row">
						
										<div id="example" class="col-lg-3 demo-section k-content" style="align:right">
											<label> Marriage Anniversary <span class="errormsg">*</span></label>
											<input  class="KendoDate" id="fromdatetimepicker19" title="fromdatetimepicker" ng-model="memberInfo.member_marriage_anniversary" style="width: 100%;" />
											<p class="errormsg" ng-show="startDateError == 1">{{startDateMsg}}</p>
										</div>
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<label> House Owned <span class="errormsg">*</span></label> 
												<select class="form-control" ng-model="memberInfo.member_house_owend " id="member_house_owend" >
													<option value="" selected>Select House Owned</option>
													<option value="1">Owned</option>
													<option value="2">Leased</option>
													<option value="3">Company</option>
													
												</select>
							</div>
						</div>
					<!-- 
						<div class="form-group row">

  									    <div class="col-lg-4 " >
									    	<label> Name of Member<span class="errormsg">*</span></label> 
										<select class="form-control" ng-model="members_family_id " id="members_family_id" ng-change="getFamilyRelation()" >
												 <option ng-repeat="item in getAllMemberRelationNameList" value="{{item.members_family_id}}">{{item.member_family_first_name}}</option>	
													<option value="" selected> Select Name</option>
													<option value="1" >  Name 1</option>
													
												</select>
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<label> Relation <span class="errormsg">*</span></label> 
											<select class="form-control" ng-model="member_family_type_of_relation" id="member_family_type_of_relation">
											<option value="" selected>Select Relationship</option>
												<option value="1">Self</option>
													<option value="2">Father</option>
												<option ng-repeat="item in getCurrency" value="{{item.currencyId}}">{{item.currencyCode}}</option>
											</select>
										
										</div>
									
										<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
											<label> Choice<span class="errormsg">*</span> </label> 
											<select class="form-control" ng-model="member_family_choices" id="member_family_choices">
												<option value="" selected>Select choices</option>
												<option value="1">Choice1</option>
												<option value="2">Choice 2</option>	
												<option value="3">Choice 3</option>
												<option value="4">Choice 4</option>	
												<option value="5">Choice 5</option>
												<option value="6">Choice 6</option>					
											</select>							
										</div>
									
										
										<div class="col-md-1">
													<div class="form-group"><br>
														<a ng-click="addRowPersonalInfo()" class="btn btn-primary" style="color:white;"><span class="fa fa-plus" style="font-size: 14px;"></span>&nbsp;Add</a>
													</div>
										</div>
																	
									</div>
										<div class="form-group row">		
									<div class="table-responsive table-bordered">
											<table class="table">
												<thead>
												<tr>																	
													<th>Name</th>
													<th>Name of Club</th>
													<th>Status</th>
													<th>Delete</th>
												</tr>
												</thead>
												<tbody>	
													<tr ng-repeat="item in MemberPersonalInformation">
															<td style="width: 5%">{{$index + 1}}</td>
															<td style="width: 25%">{{item.members_family_id}} </td>
															
															<td style="width: 25%">{{item.member_family_type_of_relation}}</td>
															<td style="width: 30%">{{item.member_family_choices}}</td>
														
														<td>
														<a ng-click="removeAlbumImageRow(item.imageTitle)" style="cursor: pointer;" class="btn btn-danger">
															<i class="fa fa-trash" style="color:white;" aria-hidden="true" data-toggle="tooltip" title="Delete"></i>
														</a>	
													</td>
														</tr>
</tbody>

										</table>
									</div>
																
							</div> --> <br> <br>
									<div class="row">									
										<div class="col-md-10 text-left">
														<button onclick="openClass('PersonalDetails','FamilyDetails', 'Paris')" class="btn btn-success tablinks "><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Previous</button>
													</div>
													<div class="col-md-2 text-right">
														<button ng-click="addalbum()" type="submit" ng-disabled="spin == 1" class="btn btn-success"><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Save & Next</button>
													</div>
											</div>		 			
			</div>						
</div>
</form>


<!-- ------------------------------------------------Nominee Details------------------------------------------------------------ -->
		
						
						
						<form class="" ng-submit="" ng-init="getmemberNomineeDetails(<%=request.getParameter("member_id") %>)" >		
			<div id="India" class="tabcontent">
										<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
												<h3 class="box-title" style="color:#4A2818;"> Nominee Details </h3>
											</div>						
	
									 
									
								
							
						<div class="row">									
													
													<div class="col-md-8 text-left">	</div>
													<div class="col-md-4 text-right">
													<div class="form-group">
														<a ng-click=""  data-toggle="modal" data-target="#myModalNomineeAdd"class="btn btn-primary" style="color:white;"><span class="fa fa-plus" style="font-size: 14px;"></span>&nbsp;Add Nominee Member</a>
													</div>
													
							
										</div>
										
										
												</div>								
														<div class="box-body"> 			
									
								<div class="form-group row">		
									<div class="table-responsive table-bordered">
											<table class="table">
												<thead>
												<tr>	
												<th>#</th>																
													<th>Name</th>
													<th>Mobile No</th>
													<th>Email</th>
													<th>Delete</th>
												</tr>
												</thead>
											<tbody > 
	
														<tr ng-repeat="item5 in getAllNomineeMember">
															<td data-toggle="modal" data-target="#myModalNomineeUpdate" ng-click='getmemberNomineeDetailsById(item5.nominee_id)' style="width: 5%">{{$index + 1}}</td>
															<td data-toggle="modal" data-target="#myModalNomineeUpdate" ng-click='getmemberNomineeDetailsById(item5.nominee_id)' style="width: 25%">{{item5.nominee_firstname}} {{items.nominee_lastname}}</td>
															
															<td data-toggle="modal" data-target="#myModalNomineeUpdate" ng-click='getmemberNomineeDetailsById(item5.nominee_id)' style="width: 25%">{{item5.nominee_mobile_no}}</td>
															<td data-toggle="modal" data-target="#myModalNomineeUpdate" ng-click='getmemberNomineeDetailsById(item5.nominee_id)' style="width: 30%">{{item5.nominee_email}}</td>
														
														<td>
														<a ng-click="deleteNominee(item5.nominee_id)" style="cursor: pointer;" class="btn btn-danger">
															<i class="fa fa-trash" style="color:white;" aria-hidden="true" data-toggle="tooltip" title="Delete"></i>
														</a>	
													</td>
														</tr>

													
													</tbody>
									
									
										</table>
									</div>
																
							</div>
								<div class="row">									
													
													<div class="col-md-10 text-left">
														<button onclick="openClass('FamilyDetails','UserDetails', 'London')" class="btn btn-success tablinks "><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Previous</button>
													</div>
													<div class="col-md-2 text-right">
														<button type="submit" ng-disabled="spin == 1" class="btn btn-success tablinks"><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Save & Next</button>
													
													</div>
													
												</div>								
									</div>								
			</div>		
			</form>		
			
			
<!-- ====================================================== Payment Details -======================================= -->

	
		<%-- 				
						
		<form class="" ng-submit="" ng-init="getmemberPaymentDetails(<%=request.getParameter("member_id") %>) || getMemberTax(<%=request.getParameter("member_id") %>)" >
<div id="Bharat" class="tabcontent">


	 
											<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
												<h3 class="box-title" style="color:#4A2818;"> Payment For Membership </h3>
											</div>
														
								
							
						<div class="row">									
													
													<div class="col-md-8 text-left">	</div>
													<div class="col-md-4 text-right">
													<div class="form-group">
														<a  ng-click="getRegisterMemberAmount()" data-toggle="modal" data-target="#myModalPayment"class="btn btn-primary" style="color:white;" ><span class="fa fa-plus" style="font-size: 14px;"></span>&nbsp;Add Member Payment</a>
													</div>
						
										</div>
										
										
												</div>								
														<div class="box-body"> 			
									
								<div class="form-group row">		
									<div class="table-responsive table-bordered">
											<table class="table">
												<thead>
												<tr>	
												<th>#</th>																
													<th>Membership Amount</th>
													<th>Discount</th>
													<th>Date</th>
												
													<th>Delete</th>
												</tr>
												</thead>
											<tbody > 
	
														<tr ng-repeat="itemm in memberPayment11">
															<td data-toggle="modal" data-target="#myModalPaymentUpdate" ng-click='getmemberPaymentById(itemm.member_payment_id)' style="width: 5%">{{$index + 1}}</td>
															<td data-toggle="modal" data-target="#myModalPaymentUpdate" ng-click='getmemberPaymentById(itemm.member_payment_id)' style="width: 30%">{{itemm.member_plan_amount}} </td>
															<td data-toggle="modal" data-target="#myModalPaymentUpdate" ng-click='getmemberPaymentById(itemm.member_payment_id)' style="width: 20%">{{itemm.member_discount}} </td>
															
															<td data-toggle="modal" data-target="#myModalPaymentUpdate" ng-click='getmemberPaymentById(itemm.member_payment_id)' style="width: 35%">{{itemm.createdDate |date : "dd.MM.y"  }}</td>
															
														<td>
														<a ng-click="deletePayment(itemm.member_payment_id)" style="cursor: pointer;" class="btn btn-danger">
															<i class="fa fa-trash" style="color:white;" aria-hidden="true" data-toggle="tooltip" title="Delete"></i>
														</a>	
													</td>
														</tr>

													
													</tbody>
									
									
										</table>
									</div>
																
							</div>
								<div class="row">									
													
													<div class="col-md-10 text-left">
														<button onclick="openClass('FamilyDetails','UserDetails', 'London')" class="btn btn-success tablinks "><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Previous</button>
													</div>
													<div class="col-md-2 text-right">
														<button type="submit" ng-disabled="spin == 1" class="btn btn-success tablinks"><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Save & Next</button>
													
													</div>
													
												</div>								
									</div>								
			</div>		
			</form>		
			
			
	 --%>
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

	<!-- ---------------------------------------------Create Group Modal >Member Payment Details-->
			<div class="container">
				<div class="modal fade" id="myModalPaymentUpdate" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
							<h4 class="modal-title">Member Payment Details</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								
							</div>
							<div class="modal-body">
								
										
		<form class="" ng-submit="editPaymentDetails(member_id)" >		
				
							 
									 	
									
									<div class="row form-group">
								
									<div class="col-lg-3"  >
									    	<label> Member Ship Amount<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Member Ship Amount" ng-model="memberPayment.member_plan_amount" ng-change="TaxRow()"  id="member_plan_amount" type="number">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
									
						
									<div class="col-lg-3"  >
									    	<label> Discount(if any) </label> 
											<input class="form-control" placeholder="Discount Amount" ng-model="memberPayment.member_discount" ng-change="TaxRow()" id="member_discount" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>	
										
									
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<label> Currency <span class="errormsg">*</span></label> 
											<select class="form-control" ng-model="memberPayment.member_currency" id="member_currency">
												<option value=""selected> Select Currency</option>
												<option value="1">INR</option>
												<option value="2">USD</option>
											</select>
										
										</div>
								
								</div>
							 <div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
									<h3 class="box-title" style="color:#4A2818;"> Tax Information </h3>
							</div>	
							
							<div class="form-group row">

  									    <div class="col-lg-3 " >
									    	<label>Tax Type <span class="errormsg">*</span></label> 
											<select class="form-control input-lg2" name="tax_type" id="tax_type" ng-model="tax_type" ng-change="getMembers()">
													<option value="" selected> Select GST Type</option>
												 <option ng-repeat="item2 in getAllMasterTax" value="{{item2.tax_type_id}}">{{item2.tax_type_name}}</option>
			
												</select>
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										
										<div class="col-lg-3"  >
									    	<label>Tax Value<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter GST Value*" ng-model="tax_value" id="tax_value" type="number">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										
										
											<div class="col-md-2">
													<div class="form-group"><br>
														<a ng-click="memberPayemnttax(member_id)" class="btn btn-primary" style="color:white;"><span class="fa fa-plus" style="font-size: 14px;"></span>&nbsp;Add</a>
													</div>
											</div>	
										
							</div>
							
							<div class="row">

										<div class="col-sm-12 col-md-12">
											<div class="table-responsive">
												<table class="table table-bordered" id="dataTable"
													width="100%" cellspacing="0">

													<thead>
														<tr>
															<th style="width: 5%">#</th>
															<th style="width: 35%">Tax Name </th>
															
															<th style="width: 35%">Tax Value</th>
														
															
														
															<th class="text-center">Del.</th>
														</tr>
													</thead>


													<tbody>
															<tr ng-repeat="item in memberTax">
															<td> {{$index+1}} </td>	
																<td> {{item.tax_type_name}} </td>		
																<td> {{item.tax_value}} </td>																																												
																<td> <center>
														<a ng-click="deleteProductTax(item.member_tax_id)" style="cursor: pointer;" class="btn btn-danger">
															<i class="fa fa-trash" style="color:white;" aria-hidden="true" data-toggle="tooltip" ></i>
														</a>	</center>
													</td>
														    </tr>																				
													</tbody>

												</table>
											</div>
										</div>
									</div>
							<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
												<h3 class="box-title" style="color:#4A2818;"> Total Membership Amount </h3>
							</div>
						
									<div class="row">									
														<div class="col-lg-3"  >
									    	<label>Total Member Ship Amount<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Total Member Ship Amount" ng-model="memberPayment.member_total_amount" id="member_total_amount" type="number">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>	
									<br>
											</div>	

							
								<div class="form-group row">			
								 <div class="col-lg-12 mt-10">											
							  				<button type="submit" ng-disable="spin == 1" class="btn btn-primary btn-lg btn-block"><i ng-show="spin == 1" class="fa fa-spin fa-spinner" aria-hidden="true"></i> Submit</button>
										</div>	
									</div>		
																
											
		
			</form>	

				</div>
			</div>
		</div>
	</div>
	</div>

	<!-- ---------------------------------------------Create Group Modal >Member Payment Details-->
			<div class="container">
				<div class="modal fade" id="myModalPayment" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
							<h4 class="modal-title">Member Payment Details</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								
							</div>
							<div class="modal-body">
								
										
		<form class="" ng-submit="memberPayemntadd()">		
				
							 
									 	
									
									<div class="row form-group">
								
									<div class="col-lg-3"  >
									    	<label> Member Ship Amount<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Member Ship Amount" ng-model="memberPayment.member_plan_amount" id="member_plan_amount1" type="number">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
									
						
									<div class="col-lg-3"  >
									    	<label> Discount(if any) </label> 
											<input class="form-control" placeholder="Discount Amount" ng-model="memberPayment.member_discount" ng-change="TaxRow1()" id="member_discount1" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>	
										
									
										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<label> Currency <span class="errormsg">*</span></label> 
											<select class="form-control" ng-model="memberPayment.member_currency" id="member_currency">
												<option value=""selected> Select Currency</option>
												<option value="1">INR</option>
												<option value="2">USD</option>
											</select>
										
										</div>
								
								</div>
							 <div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
									<h3 class="box-title" style="color:#4A2818;"> Tax Information </h3>
							</div>	
							
							<div class="form-group row">

  									    <div class="col-lg-3 " >
									    	<label>Tax Type <span class="errormsg">*</span></label> 
											<select class="form-control input-lg2" name="tax_type" id="tax_type" ng-model="tax_type" ng-change="getMembers()">
													<option value="" selected> Select GST Type</option>
												 <option ng-repeat="item2 in getAllMasterTax" value="{{item2.tax_type_id}}">{{item2.tax_type_name}}</option>
			
												</select>
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										
										<div class="col-lg-3"  >
									    	<label>Tax Value<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter GST Value*" ng-model="tax_value" id="tax_value" type="number">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										
										
											<div class="col-md-2">
													<div class="form-group"><br>
														<a ng-click="getTax1()  || TaxRow1()" class="btn btn-primary" style="color:white;"><span class="fa fa-plus" style="font-size: 14px;"></span>&nbsp;Add</a>
													</div>
											</div>	
										
							</div>
							
							<div class="row">

										<div class="col-sm-12 col-md-12">
											<div class="table-responsive">
												<table class="table table-bordered" id="dataTable"
													width="100%" cellspacing="0">

													<thead>
														<tr>
															<th style="width: 5%">#</th>
															<th style="width: 35%">Tax Name </th>
															
															<th style="width: 35%">Tax Value</th>
														
															
														
															<th class="text-center">Del.</th>
														</tr>
													</thead>


													
													<tbody>
															<tr ng-repeat="item in Taxtype1">
															<td> {{$index+1}} </td>	
																<td> {{item.tax_type_name}} </td>		
																<td> {{item.tax_value}} </td>																																												
																<td>
														<a ng-click="removeRow(item.tax_type) || TaxRow()" style="cursor: pointer;" class="btn btn-danger">
															<i class="fa fa-trash" style="color:white;" aria-hidden="true" data-toggle="tooltip" title="Delete"></i>
														</a>	
													</td>
														    </tr>																				
													</tbody>
												</table>
											</div>
										</div>
									</div>
							<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
												<h3 class="box-title" style="color:#4A2818;"> Total Membership Amount </h3>
							</div>
						
									<div class="row">									
														<div class="col-lg-3"  >
									    	<label>Total Member Ship Amount<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Total Member Ship Amount" ng-model="memberPayment.member_total_amount" id="member_total_amount1" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>	
									<br>
											</div>	

							
								<div class="form-group row">			
								 <div class="col-lg-12 mt-10">											
							  				<button type="submit" ng-disable="spin == 1" class="btn btn-primary btn-lg btn-block"><i ng-show="spin == 1" class="fa fa-spin fa-spinner" aria-hidden="true"></i> Submit</button>
										</div>	
									</div>		
																
											
		
			</form>	

				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- --------------------------------------------------------Create Group Modal Family Member-->
			<div class="container">
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
							<h4 class="modal-title">Family Member</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								
							</div>
							<div class="modal-body">
								
										
		<form class="" ng-submit="AddNewFamilyMemberRegister()">		
				
							 <div class="form-group row">
							<div class="col-lg-4 " style="float:right">
								<label> Family Membership No. <span class="errormsg">*</span></label> 
								<input class="form-control" placeholder=" Family Membership Number " readonly ng-model="family_membership_no" 	 ng-change="setflag()" id="family_membership_no" type="text">
								<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
							</div>
							</div>
									 <div class="form-group row">
						   				 <div class="col-lg-4 " >
									    	<label>First Name <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter First Name  " name="member_family_first_name" ng-model="member_family_first_name" ng-change="setflag1()" id="member_family_first_name" type="text">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_first_nameError == 1">{{masterMemberRegistemember_family_first_nameMsg}}</p>
										</div>
										<div class="col-lg-4 c "  >
									    	<label> Middle Name </label> 
											<input class="form-control" placeholder=" Enter Middle Name " ng-model="member_family_middle_name" ng-change="setflag1()" id="member_family_middle_name" type="text">
											<!-- <p class="errormsg" ng-show="masterMemberRegistermember_family_middle_nameError == 1">{{masterMemberRegistermember_family_middle_nameMsg}}</p> -->
										</div>
										<div class="col-lg-4 "  >
									    	<label>Last Name <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Last Name " name="member_family_last_name" ng-model="member_family_last_name" ng-change="setflag1()" id="member_family_last_name" type="text">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_last_nameError == 1">{{masterMemberRegistermember_family_last_nameMsg}}</p>
										</div>
										
										
									</div>	
									<div class="form-group row">
  									    <div class="col-lg-4 " >
									    	<label>Address Line 1 <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Address  " ng-model="member_family_address1" ng-change="setflag1()" id="member_family_address1" type="text">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_address1Error == 1">{{masterMemberRegistermember_family_address1Msg}}</p>
										</div>
										<div class="col-lg-4 "  >
									    	<label> Address Line 2</label> 
											<input class="form-control" placeholder="  Enter Your Address" ng-model="member_family_address2" ng-change="setflag1()" id="courseTitle" type="text">
											
										</div>
										<div class="col-lg-4  "  >
									    	<label>Address Line 3 </label> 
											<input class="form-control" placeholder=" Enter Your Address" ng-model="member_family_address3" ng-change="setflag1()" id="courseTitle" type="text">
											
										</div>
										
										
							</div>
								<div class="row">
										<div class="col-md-4" >
											<div class="form-group">
											<label>Country <span class="errormsg">*</span></label> 
												<select class="form-control input-lg2"   ng-init="member_family_coutry_id = 1" name="member_family_coutry_id" id="member_family_coutry_id" ng-model="member_family_coutry_id" ng-change="setflag1()">
													<option value=""> Select Country</option>
													<option value="1"> India</option>
													<!-- <option ng-repeat="item in allCourses" value="{{item.courceId}}">{{item.courceTitle}}</option> -->
												</select>
												<p class="errormsg" ng-show="masterMemberRegistermember_family_coutry_idError == 1">{{masterMemberRegistermember_family_coutry_idMsg}}</p>
											</div>
										</div>
										
										<div class="col-md-4" >
											<div class="form-group">
											<label>State <span class="errormsg">*</span></label> 
												<select class="form-control input-lg2" name="member_family_state_id" id="member_family_state_id" ng-model="member_family_state_id" ng-change="setflag1()">
													<option value=""> Select State</option>
													<option value="1"> Gujarat</option>
												</select>
												<p class="errormsg" ng-show="masterMemberRegistermember_family_state_idError == 1">{{masterMemberRegistermember_family_state_idMsg}}</p>
											</div>
										</div>
										<div class="col-md-4" >
											<div class="form-group">
											<label>City <span class="errormsg">*</span></label> 
												<input class="form-control" placeholder=" Enter Your City" ng-model="member_family_city" id="member_family_city" type="text" ng-change="setflag1()">
											</div>
											<p class="errormsg" ng-show="masterMemberRegistermember_family_cityError == 1">{{masterMemberRegistermember_family_cityMsg}}</p>
										</div>
										
								
								
			</div>
							<div class="form-group row">

  									 <div class="col-lg-4 "  >
									    	<label>Pincode <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Pincode" ng-model="member_family_pincode" id="member_family_pincode" type="number" ng-change="setflag1()">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_pincodeError == 1">{{masterMemberRegistermember_family_pincodeMsg}}</p>
										</div>
										<div class="col-lg-4 col-md-2 col-sm-6 col-xs-12">
											<label> Relation <span class="errormsg">*</span></label> 
											<select class="form-control" ng-model="member_family_type_of_relation" id="member_family_type_of_relation" ng-change="setflag1()">
												<option value="" selected>Select Relation</option>
													<option value="1">Husband</option>
													<option value="2">Wife</option>
													<option value="3">Brother</option>
													<option value="4">Sister</option>
													<option value="5">Father</option>
													<option value="6">Mother</option>
													
												<!-- <option ng-repeat="item in getCurrency" value="{{item.currencyId}}">{{item.currencyCode}}</option> -->
											</select>
										<p class="errormsg" ng-show="masterMemberRegistermember_family_type_of_relationError == 1">{{masterMemberRegistermember_family_type_of_relationMsg}}</p>
										</div>
										
										<div class="col-lg-4 col-md-2 col-sm-6 col-xs-12">
											<label> Gender<span class="errormsg">*</span> </label> 
											<select class="form-control" ng-model="member_family_gender" id="member_family_gender" ng-change="setflag1()">
												<option value=""> Select Gender</option>
												<option value="1">Male</option>
													<option value="2">Female</option>					
											</select>							
										</div>
										
										
									
									</div>
						
									<div class="form-group row">
									<div id="example" class="col-lg-4 demo-section k-content">
											<label>  Date of Birth <span class="errormsg">*</span></label>
											<input class="KendoDate" id="fromdatetimepicker3" title="fromdatetimepicker"3 ng-model="member_family_date_of_birth" style="width: 100%;"  ng-change="setflag1()">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_date_of_birthError == 1">{{masterMemberRegistermember_family_date_of_birthMsg}}</p>
										</div>
									<div class="col-lg-4 col-md-2 col-sm-6 col-xs-12">
											<label> Blood Group<span class="errormsg">*</span> </label> 
											<select class="form-control" ng-model="member_family_blood_group" id="member_family_blood_group" ng-change="setflag1()">
												<option value="">Blood Group</option>
												<option value="1">A+</option>
												<option value="2">A-</option>	
												<option value="3">B+</option>
												<option value="4">B-</option>
												<option value="5">AB+</option>
												<option value="6">AB-</option>
												<option value="7">O+</option>
												<option value="8">O-</option>			
											</select>	
									<p class="errormsg" ng-show="masterMemberRegistermember_family_blood_groupError == 1">{{masterMemberRegistermember_family_blood_groupMsg}}</p>											
										</div>
										<div class="col-lg-4 "  >
									    	<label> Phone Number </label> 
											<input class="form-control" placeholder=" Enter Your Phone Number" ng-model="member_family_phone" id=" member_family_phone" type="text">
											<!-- <p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p> -->
										</div>
										
  									    
									
										
										
									</div>
									<div class="form-group row">
									<div class="col-lg-4 "  >
									    	<label> Mobile Number <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Mobile Number" ng-model="member_family_mobile_no" id=" member_family_mobile_no" type="number" ng-change="setflag1()">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_mobile_noError == 1">{{masterMemberRegistermember_family_mobile_noMsg}}</p>
										</div>
									<div class="col-lg-4" >
									    	<label>Email  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Email  " ng-model="member_family_email" id="member_family_email" type="email" ng-change="setflag1()">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_emailError == 1">{{masterMemberRegistermember_family_emailMsg}}</p>
										</div>
										<div class="col-lg-4 "  >
									    	<label> Password <span class="errormsg">*</span></label> 
											<input class="form-control " placeholder="  Enter Your Password" ng-model="member_family_password" id="courseTitle" type="password" ng-change="setflag1()">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_passwordError == 1">{{masterMemberRegistermember_family_passwordMsg}}</p>
										</div>
									</div>
										<div class="form-group row">
				
										
							<div class="col-lg-6">
									<div class="form-group">
										<label> Image <font style="color: red;">*</font></label>
										<input type="file" id="imageadd1" name="imageadd1"ng-model="masterMemberRegister.member_family_image" class="form-control" style="height:40px"><br>
										<p style="font-size:15px; margin-top:-10px;">Upload minimum 300 * 300 size image </p>
									</div>
				</div>

																			
									</div>
							<div class="row text-center">
								<div class="col-md-12" id="addfamily">
									<img src="" id="target1" />
									
								</div>
							</div>			
								<div class="form-group row">			
								 <div class="col-lg-12 mt-10">											
							  				<button type="submit" ng-disable="spin == 1" class="btn btn-primary btn-lg btn-block"><i ng-show="spin == 1" class="fa fa-spin fa-spinner" aria-hidden="true"></i> Submit</button>
										</div>	
									</div>		
																
											
		
			</form>	

				</div>
			</div>
		</div>
	</div>
	</div>
	
	
	<!------------------------------------------------------- Update Family Member  -->
	
	<!-- Create Group Modal-->
			<div class="container">
				<div class="modal fade" id="myModal11" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
							<h4 class="modal-title">Update Family Member</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								
							</div>
							<div class="modal-body">
								
										
		<form class="" >		
				
							 <div class="form-group row">
							<div class="col-lg-4 " style="float:right">
								<label> Family Membership No. <span class="errormsg">*</span></label> 
								<input class="form-control" placeholder=" Family Membership Number " readonly ng-model="familymemberdata.family_membership_no" 	 ng-change="setflag()" id="family_membership_no" type="text">
								<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
							</div>
							</div>
									 <div class="form-group row">
						   				 <div class="col-lg-4 " >
									    	<label>First Name <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter First Name  " name="member_family_first_name" ng-model="familymemberdata.member_family_first_name" ng-change="setflag1()" id="member_family_first_name" type="text">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_first_nameError == 1">{{masterMemberRegistemember_family_first_nameMsg}}</p>
										</div>
										<div class="col-lg-4 c "  >
									    	<label> Middle Name </label> 
											<input class="form-control" placeholder=" Enter Middle Name " name="member_family_middle_name" ng-model="familymemberdata.member_family_middle_name" ng-change="setflag1()" id="member_family_middle_name" type="text">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_middle_nameError == 1">{{masterMemberRegistermember_family_middle_nameMsg}}</p>
										</div>
										<div class="col-lg-4 "  >
									    	<label>Last Name <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Last Name " name="member_family_last_name" ng-model="familymemberdata.member_family_last_name" ng-change="setflag1()" id="member_family_last_name" type="text">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_last_nameError == 1">{{masterMemberRegistermember_family_last_nameMsg}}</p>
										</div>
										
										
									</div>	
									<div class="form-group row">
  									    <div class="col-lg-4 " >
									    	<label>Address Line 1 <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Address  " ng-model="familymemberdata.member_family_address1" ng-change="setflag1()" id="member_family_address1" type="text">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_address1Error == 1">{{masterMemberRegistermember_family_address1Msg}}</p>
										</div>
										<div class="col-lg-4 "  >
									    	<label> Address Line 2</label> 
											<input class="form-control" placeholder="  Enter Your Address" ng-model="familymemberdata.member_family_address2" ng-change="setflag1()" id="courseTitle" type="text">
											
										</div>
										<div class="col-lg-4  "  >
									    	<label>Address Line 3 </label> 
											<input class="form-control" placeholder=" Enter Your Address" ng-model="familymemberdata.member_family_address3" ng-change="setflag1()" id="courseTitle" type="text">
											
										</div>
										
										
							</div>
								<div class="row">
										<div class="col-md-4" >
											<div class="form-group">
											<label>Country <span class="errormsg">*</span></label> 
												<select class="form-control input-lg2"   ng-init="member_family_coutry_id = 1" name="member_family_coutry_id" id="member_family_coutry_id" ng-model="familymemberdata.member_family_coutry_id" ng-change="setflag1()">
													<option value=""> Select Country</option>
													<option value="1"> India</option>
													<!-- <option ng-repeat="item in allCourses" value="{{item.courceId}}">{{item.courceTitle}}</option> -->
												</select>
												<p class="errormsg" ng-show="masterMemberRegistermember_family_coutry_idError == 1">{{masterMemberRegistermember_family_coutry_idMsg}}</p>
											</div>
										</div>
										
										<div class="col-md-4" >
											<div class="form-group">
											<label>State <span class="errormsg">*</span></label> 
												<select class="form-control input-lg2" name="member_family_state_id" id="member_family_state_id" ng-model="familymemberdata.member_family_state_id" ng-change="setflag1()">
													<option value=""> Select State</option>
													<option value="1"> Gujarat</option>
												</select>
												<p class="errormsg" ng-show="masterMemberRegistermember_family_state_idError == 1">{{masterMemberRegistermember_family_state_idMsg}}</p>
											</div>
										</div>
										<div class="col-md-4" >
											<div class="form-group">
											<label>City <span class="errormsg">*</span></label> 
												<input class="form-control" placeholder=" Enter Your City" ng-model="familymemberdata.member_family_city" id="member_family_city" type="text" ng-change="setflag1()">
											</div>
											<p class="errormsg" ng-show="masterMemberRegistermember_family_cityError == 1">{{masterMemberRegistermember_family_cityMsg}}</p>
										</div>
										
								
								
			</div>
							<div class="form-group row">

  									 <div class="col-lg-4 "  >
									    	<label>Pincode <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Pincode" ng-model="familymemberdata.member_family_pincode" id="member_family_pincode" type="number" ng-change="setflag1()">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_pincodeError == 1">{{masterMemberRegistermember_family_pincodeMsg}}</p>
										</div>
										<div class="col-lg-4 col-md-2 col-sm-6 col-xs-12">
											<label> Relation <span class="errormsg">*</span></label> 
											<select class="form-control" ng-model="familymemberdata.member_family_type_of_relation" id="member_family_type_of_relation" ng-change="setflag1()">
												<option value="" selected>Select Relation</option>
													<option value="1">Husband</option>
													<option value="2">Wife</option>
													<option value="3">Brother</option>
													<option value="4">Sister</option>
													<option value="5">Father</option>
													<option value="6">Mother</option>
													
												<!-- <option ng-repeat="item in getCurrency" value="{{item.currencyId}}">{{item.currencyCode}}</option> -->
											</select>
										<p class="errormsg" ng-show="masterMemberRegistermember_family_type_of_relationError == 1">{{masterMemberRegistermember_family_type_of_relationMsg}}</p>
										</div>
										
										<div class="col-lg-4 col-md-2 col-sm-6 col-xs-12">
											<label> Gender<span class="errormsg">*</span> </label> 
											<select class="form-control" ng-model="familymemberdata.member_family_gender" id="member_family_gender" ng-change="setflag1()">
												<option value=""> Select Gender</option>
												<option value="1">Male</option>
													<option value="2">Female</option>					
											</select>							
										</div>
										
										
									
									</div>
						
									<div class="form-group row">
									<div id="example" class="col-lg-4 demo-section k-content">
											<label>  Date of Birth <span class="errormsg">*</span></label>
											<input class="KendoDate" id="fromdatetimepicker9" title="fromdatetimepicker"3 ng-model="familymemberdata.member_family_date_of_birth" style="width: 100%;"  ng-change="setflag1()">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_date_of_birthError == 1">{{masterMemberRegistermember_family_date_of_birthMsg}}</p>
										</div>
									<div class="col-lg-4 col-md-2 col-sm-6 col-xs-12">
											<label> Blood Group<span class="errormsg">*</span> </label> 
											<select class="form-control" ng-model="familymemberdata.member_family_blood_group" id="member_family_blood_group" ng-change="setflag1()">
												<option value="">Blood Group</option>
												<option value="1">A+</option>
												<option value="2">A-</option>	
												<option value="3">B+</option>
												<option value="4">B-</option>
												<option value="5">AB+</option>
												<option value="6">AB-</option>
												<option value="7">O+</option>
												<option value="8">O-</option>				
											</select>	
									<p class="errormsg" ng-show="masterMemberRegistermember_family_blood_groupError == 1">{{masterMemberRegistermember_family_blood_groupMsg}}</p>											
										</div>
										<div class="col-lg-4 "  >
									    	<label> Phone Number </label> 
											<input class="form-control" placeholder=" Enter Your Phone Number" ng-model="familymemberdata.member_family_phone" id=" member_family_phone" type="text">
											<!-- <p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p> -->
										</div>
										
  									    
									
										
										
									</div>
									<div class="form-group row">
									<div class="col-lg-4 "  >
									    	<label> Mobile Number <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Mobile Number" ng-model="familymemberdata.member_family_mobile_no" id=" member_family_mobile_no" type="text" ng-change="setflag1()">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_mobile_noError == 1">{{masterMemberRegistermember_family_mobile_noMsg}}</p>
										</div>
									<div class="col-lg-4" >
									    	<label>Email  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Email  " ng-model="familymemberdata.member_family_email" id="member_family_email" type="email" ng-change="setflag1()">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_emailError == 1">{{masterMemberRegistermember_family_emailMsg}}</p>
										</div>
										<div class="col-lg-4 "  >
									    	<label> Password <span class="errormsg">*</span></label> 
											<input class="form-control " placeholder="  Enter Your Password" ng-model="familymemberdata.member_family_password" id="courseTitle" type="password" ng-change="setflag1()">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_passwordError == 1">{{masterMemberRegistermember_family_passwordMsg}}</p>
										</div>
									</div>
										<div class="form-group row">
		
										
								<div class="col-lg-6">
									<div class="form-group">
										<label> Image <font style="color: red;">*</font></label>
										<input type="file" id="imageadd3" name="imageadd3" ng-model="familymemberdata.image" class="form-control" style="height:40px"><br>
										<p style="font-size:15px; margin-top:-10px;">Upload minimum 300 * 300 size image </p>
									</div>
				</div>
						 <div class="col-lg-3" style="float:right" >
								
									<br> 
										<img style="width:100%;float:right;"  id="imageadd3" name="imageadd3" src="{{familymemberdata.member_family_image}}" ng-model="familymember.member_family_image" >				
							</div> 
							
			
										
</div>
									
						<div class="row text-right">
								<div class="col-md-12" id="updatefamily" >
									<img src="" id="target3" />
									
								</div>
							</div>	
							
								<div class="form-group row">			
								 <div class="col-lg-12 mt-10">											
							  				<button type="submit" ng-click="editFamilyMemberRegister(members_family_id)" ng-disable="spin == 1" class="btn btn-primary btn-lg btn-block"><i ng-show="spin == 1" class="fa fa-spin fa-spinner" aria-hidden="true"></i> Update</button>
										</div>	
								</div>							
											
		
			</form>	

				</div>
			</div>
		</div>
	</div>
	</div>
	
	<!------------------------------------------------------ Add Nominee Member  -->
	
	<!-- Create Group Modal-->
			<div class="container">
				<div class="modal fade" id="myModalNomineeAdd" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
							<h4 class="modal-title">Nominee Details</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								
							</div>
							<div class="modal-body">
								
										
		<form >									
								<div class="box-body"> 						
  								 <div class="form-group row ">


  									    <div class="col-lg-4 " >
									    	<label>First Name <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter First Name  " ng-model="memberNomineeDetails.nominee_firstname" id="nominee_firstname" type="text">
											<p class="errormsg" ng-show="masterMemberRegisternominee_firstnameError == 1">{{masterMemberRegisternominee_firstnameMsg}}</p>
										</div>
										<div class="col-lg-4 c "  >
									    	<label> Middle Name <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Middle Name " ng-model="memberNomineeDetails.nominee_middlename" id="nominee_middlename" type="text">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_last_nameError == 1">{{masterMemberRegistermember_family_last_nameMsg}}</p>
										</div>
										<div class="col-lg-4 "  >
									    	<label>Last Name <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Last Name " ng-model="memberNomineeDetails.nominee_lastname" id="nominee_lastname" type="text">
											<p class="errormsg" ng-show="masterMemberRegisternominee_lastnameError == 1">{{masterMemberRegisternominee_lastnameMsg}}</p>
										</div>
										
										
									</div>
									<div class="form-group row">

  									    <div class="col-lg-4 " >
									    	<label>Address Line 1 <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Address  " ng-model="memberNomineeDetails.nominee_address1" id="nominee_address1" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										<div class="col-lg-4 "  >
									    	<label> Address Line 2</label> 
											<input class="form-control" placeholder="  Enter Your Address" ng-model="memberNomineeDetails.nominee_address2" id="nominee_address2" type="text">
											
										</div>
										<div class="col-lg-4  "  >
									    	<label>Address Line 3 </label> 
											<input class="form-control" placeholder=" Enter Your Address" ng-model="memberNomineeDetails.nominee_address3" id="nominee_address3" type="text">
											
										</div>
									
									</div>
										<div class="row">
										<div class="col-md-3" >
											<div class="form-group">
											<label>Country <span class="errormsg">*</span></label> 
												<select class="form-control input-lg2"   ng-init="memberNomineeDetails.nominee_coutry_id = 1" name="eventDrop" id="nominee_coutry_id" ng-model="memberNomineeDetails.nominee_coutry_id" ng-change="getMembers()">
													<option value=""> Select Country</option>
											<option value="1"> India </option>
												<!-- <option ng-repeat="item in allCourses" value="{{item.courceId}}">{{item.courceTitle}}</option> -->
												</select>
												<p class="errormsg" ng-show="masterMemberRegisternominee_coutry_idError == 1">{{masterMemberRegisternominee_coutry_idMsg}}</p>
											</div>
										</div>
										
										<div class="col-md-3" >
											<div class="form-group">
											<label>State <span class="errormsg">*</span></label> 
												<select class="form-control input-lg2" name="eventDrop" id="nominee_state_id" ng-model="memberNomineeDetails.nominee_state_id" ng-change="getMembers()">
													<option value=""> Select State</option>
													<option value="1"> Gujarat </option>
												</select>
												<p class="errormsg" ng-show="masterMemberRegisternominee_state_idError == 1">{{masterMemberRegisternominee_state_idMsg}}</p>
											</div>
										</div>
										<div class="col-md-3" >
											<div class="form-group">
											<label>City <span class="errormsg">*</span></label> 
												<input class="form-control" placeholder=" Enter Your City" ng-model="memberNomineeDetails.nominee_city" id="nominee_city" type="text">
											</div>
											<p class="errormsg" ng-show="masterMemberRegisternominee_cityError == 1">{{masterMemberRegisternominee_cityMsg}}</p>
										</div>
										
								
								<div class="col-lg-3 "  >
									    	<label>Pincode <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Pincode" ng-model="memberNomineeDetails.nominee_pincode" id="nominee_pincode" type="text">
											<p class="errormsg" ng-show="masterMemberRegisternominee_pincodeError == 1">{{masterMemberRegisternominee_pincodeMsg}}</p>
										</div>
					
						</div>
						
									<div class="form-group row">
									   <div class="col-lg-3" >
									    	<label>Phone Number </label> 
											<input class="form-control" placeholder=" Enter Your Phone Number" ng-model="memberNomineeDetails.nominee_phone" id="nominee_phone" type="text">
											
										</div>

  									    <div class="col-lg-3" >
									    	<label>Mobile self <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Mobile Number  " ng-model="memberNomineeDetails.nominee_mobile_no" id="nominee_mobile_no" type="text">
											<p class="errormsg" ng-show="masterMemberRegisternominee_mobile_noError == 1">{{masterMemberRegisternominee_mobile_noMsg }}</p>
										</div>
										<div class="col-lg-3 "  >
									    	<label> Email  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="  Enter Your Email" ng-model="memberNomineeDetails.nominee_email" id="nominee_email" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										  
									</div>
									
										<div class="form-group row">			
								 <div class="col-lg-12 mt-10">											
							  				<button type="submit" ng-click="addNomineeDetails(member_id)" ng-disable="spin == 1" class="btn btn-primary btn-lg btn-block"><i ng-show="spin == 1" class="fa fa-spin fa-spinner" aria-hidden="true"></i> Submit</button>
										</div>	
									</div>		
		</div>								
		
	

</div>		
</form>

				</div>
			</div>
		</div>
	
	</div>
	
	<!------------------------------------------------------ Update Nominee Member  -->
	
	<!-- Create Group Modal-->
			<div class="container">
				<div class="modal fade" id="myModalNomineeUpdate" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
							<h4 class="modal-title">Nominee Details</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								
							</div>
							<div class="modal-body">
								
										
		<form ng-submit="editmemberNomineeDetails(nominee_id)">									
								<div class="box-body"> 						
  								 <div class="form-group row ">


  									    <div class="col-lg-4 " >
									    	<label>First Name <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter First Name  " ng-model="memberNomineeDetails.nominee_firstname" id="nominee_firstname" type="text">
											<p class="errormsg" ng-show="masterMemberRegisternominee_firstnameError == 1">{{masterMemberRegisternominee_firstnameMsg}}</p>
										</div>
										<div class="col-lg-4 c "  >
									    	<label> Middle Name <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Middle Name " ng-model="memberNomineeDetails.nominee_middlename" id="nominee_middlename" type="text">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_last_nameError == 1">{{masterMemberRegistermember_family_last_nameMsg}}</p>
										</div>
										<div class="col-lg-4 "  >
									    	<label>Last Name <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Last Name " ng-model="memberNomineeDetails.nominee_lastname" id="nominee_lastname" type="text">
											<p class="errormsg" ng-show="masterMemberRegisternominee_lastnameError == 1">{{masterMemberRegisternominee_lastnameMsg}}</p>
										</div>
										
										
									</div>
									<div class="form-group row">

  									    <div class="col-lg-4 " >
									    	<label>Address Line 1 <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Address  " ng-model="memberNomineeDetails.nominee_address1" id="nominee_address1" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										<div class="col-lg-4 "  >
									    	<label> Address Line 2</label> 
											<input class="form-control" placeholder="  Enter Your Address" ng-model="memberNomineeDetails.nominee_address2" id="nominee_address2" type="text">
											
										</div>
										<div class="col-lg-4  "  >
									    	<label>Address Line 3 </label> 
											<input class="form-control" placeholder=" Enter Your Address" ng-model="memberNomineeDetails.nominee_address3" id="nominee_address3" type="text">
											
										</div>
									
									</div>
										<div class="row">
										<div class="col-md-3" >
											<div class="form-group">
											<label>Country <span class="errormsg">*</span></label> 
												<select class="form-control input-lg2"   ng-init="memberNomineeDetails.nominee_coutry_id = 1" name="eventDrop" id="nominee_coutry_id" ng-model="memberNomineeDetails.nominee_coutry_id" ng-change="getMembers()">
													<option value=""> Select Country</option>
											<option value="1"> India </option>
												<!-- <option ng-repeat="item in allCourses" value="{{item.courceId}}">{{item.courceTitle}}</option> -->
												</select>
												<p class="errormsg" ng-show="masterMemberRegisternominee_coutry_idError == 1">{{masterMemberRegisternominee_coutry_idMsg}}</p>
											</div>
										</div>
										
										<div class="col-md-3" >
											<div class="form-group">
											<label>State <span class="errormsg">*</span></label> 
												<select class="form-control input-lg2" name="eventDrop" id="nominee_state_id" ng-model="memberNomineeDetails.nominee_state_id" ng-change="getMembers()">
													<option value=""> Select State</option>
													<option value="1"> Gujarat </option>
												</select>
												<p class="errormsg" ng-show="masterMemberRegisternominee_state_idError == 1">{{masterMemberRegisternominee_state_idMsg}}</p>
											</div>
										</div>
										<div class="col-md-3" >
											<div class="form-group">
											<label>City <span class="errormsg">*</span></label> 
												<input class="form-control" placeholder=" Enter Your City" ng-model="memberNomineeDetails.nominee_city" id="nominee_city" type="text">
											</div>
											<p class="errormsg" ng-show="masterMemberRegisternominee_cityError == 1">{{masterMemberRegisternominee_cityMsg}}</p>
										</div>
										
								
								<div class="col-lg-3 "  >
									    	<label>Pincode <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Pincode" ng-model="memberNomineeDetails.nominee_pincode" id="nominee_pincode" type="text">
											<p class="errormsg" ng-show="masterMemberRegisternominee_pincodeError == 1">{{masterMemberRegisternominee_pincodeMsg}}</p>
										</div>
					
						</div>
						
									<div class="form-group row">
									   <div class="col-lg-3" >
									    	<label>Phone Number </label> 
											<input class="form-control" placeholder=" Enter Your Phone Number" ng-model="memberNomineeDetails.nominee_phone" id="nominee_phone" type="text">
											
										</div>

  									    <div class="col-lg-3" >
									    	<label>Mobile self <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Mobile Number  " ng-model="memberNomineeDetails.nominee_mobile_no" id="nominee_mobile_no" type="text">
											<p class="errormsg" ng-show="masterMemberRegisternominee_mobile_noError == 1">{{masterMemberRegisternominee_mobile_noMsg }}</p>
										</div>
										<div class="col-lg-3 "  >
									    	<label> Email  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="  Enter Your Email" ng-model="memberNomineeDetails.nominee_email" id="nominee_email" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										  
									</div>
									
										<div class="form-group row">			
								 <div class="col-lg-12 mt-10">											
							  				<button type="submit" ng-click="editFamilyMemberRegister(members_family_id)" ng-disable="spin == 1" class="btn btn-primary btn-lg btn-block"><i ng-show="spin == 1" class="fa fa-spin fa-spinner" aria-hidden="true"></i> Update</button>
										</div>	
									</div>		
		</div>								
		
	

</div>		
</form>

				</div>
			</div>
		</div>
	
	</div>
	

	<!------------------------------------------------------------- name of club   Create Group Modal-->
			<div class="container">
			<form ng-submit="addClubName()"> 
				<div class="modal fade" id="myModal97" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
							
							<h4 class="modal-title">Name Of Clubs</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								
							</div>
							
							<div class="modal-body">
								<div class="row">
								
											<div class="col-lg-12">
											  <label >Club Name <span class="star" >*</span></label>
											  <input type="text" class="form-control" name="club_name"  ng-model="masterClubName.club_name" placeholder="Enter Club Name" autocomplete="nope" required>								  
											</div>
							</div>
							<br>
							<hr>
								
								<div class="row">									
												
											<div class="col-lg-12 ">
														<button  class="btn btn-success tablinks "><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Save </button>
													</div>
								</div>	
		 </form>
				</div>
			</div>
		</div>
	</div>
	</div>
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

	<link
		href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css"
		rel="stylesheet" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
		<script>
			$('#myModal').on('hidden', function()
					{
				document.location.reload();
					})
		</script>
		
		<script>
			$('#myModal11').on('hidden', function()
					{
						document.location.reload();
					})
		</script>
		<script>
			$('#myModalPayment').on('hidden', function()
					{
						document.location.reload();
					})
		</script>
				<script>
			$('#myModalPaymentUpdate').on('hidden', function()
					{
						document.location.reload();
					})
		</script>
			<script>
			$('#myModal97').on('hidden', function()
					{
						document.location.reload();
					})
		</script>
		
	<script>
$('.select2').select2();



</script>

<Script>
$('.select2').select2({
	  selectOnClose: true
	});
</Script>

<script>
$(".KendoDate").bind("focus", function(){
	$(this).data("kendoDatePicker").open(); 
});

$(document).ready(function () {
	// create DateTimePicker from input HTML element
	$("#fromdatetimepicker").kendoDatePicker({
		format: "yyyy/MM/dd",
		
		dateInput: true
	});
	});


	$(document).ready(function () {
	// create DateTimePicker from input HTML element
	$("#fromdatetimepicker1").kendoDatePicker({
		format: "yyyy/MM/dd",
		
		dateInput: true
	});
	});
	$(document).ready(function () {
		// create DateTimePicker from input HTML element
		$("#fromdatetimepicker2").kendoDatePicker({
			format: "dd/MM/yyyy",
			
			dateInput: true
		});
		});
	$(document).ready(function () {
		// create DateTimePicker from input HTML element
		$("#fromdatetimepicker3").kendoDatePicker({
			format: "dd/MM/yyyy",
			
			dateInput: true
		});
		});
	$(document).ready(function () {
		// create DateTimePicker from input HTML element
		$("#fromdatetimepicker5").kendoDatePicker({
			format: "dd/MM/yyyy",
			
			dateInput: true
		});
		});
	$(document).ready(function () {
		// create DateTimePicker from input HTML element
		$("#fromdatetimepicker6").kendoDatePicker({
			format: "dd/MM/yyyy",
			
			dateInput: true
		});
		});
	$(document).ready(function () {
		// create DateTimePicker from input HTML element
		$("#fromdatetimepicker7").kendoDatePicker({
			format: "dd/MM/yyyy",
			
			dateInput: true
		});
		});
	$(document).ready(function () {
		// create DateTimePicker from input HTML element
		$("#fromdatetimepicker8").kendoDatePicker({
			format: "dd/MM/yyyy",
			
			dateInput: true
		});
		});
	$(document).ready(function () {
		// create DateTimePicker from input HTML element
		$("#fromdatetimepicker9").kendoDatePicker({
			format: "dd/MM/yyyy",
			
			dateInput: true
		});
		});

	$(document).ready(function () {
		// create DateTimePicker from input HTML element
		$("#fromdatetimepicker19").kendoDatePicker({
			format: "dd/MM/yyyy",
			
			dateInput: true
		});
		});


</script>
		<!-- For Add -->
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
						        if(img.width < 300 || img.height < 300)
						        {
						        	alert("Minimum image size should be 300px X 300px");
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
										maxSize : [800, 400],
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
		
	<!-- Update family--------------------------- -->		
<script>
			jQuery(function($) {
				function readURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							if ($('#target3').data('Jcrop')) {
							    $('#target3').data('Jcrop').destroy();
							    $('#target3').removeAttr('style');
							}
							
							var u = URL.createObjectURL(input.files[0]);
						    var img = new Image;
						    img.onload = function() {
						        if(img.width < 300 || img.height < 300)
						        {
						        	alert("Minimum image size should be 300px X 300px");
						        	$('#target3').attr('src', "");
						        	document.getElementById("imageadd3").value = null;
						        }
						        else
						        {
						        	$('#target3').css("min-height", "208px");
								    $('#target3').css("min-width", "337px");
									
									$('#target3').attr('src', e.target.result);
									$('#target3').Jcrop({
										aspectRatio : 1/ 1,
										boxWidth : 500,
										//boxHeight : 400,
										minSize : [100, 100],
										maxSize : [800, 400],
										setSelect : [ 100, 100, 400, 400 ],
										onChange : setCoordinates3,
										onSelect : setCoordinates3
									});
						        }
						    };
						        
						    img.src = u;
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
				$("#imageadd3").change(function() {
					readURL(this);
				});
				$("#imageadd3").click(function() {
					this.value = null;
				});
			});
			
			function setCoordinates3(c) {
				document.myForm3.x3.value = Math.round(c.x);
				document.myForm3.y3.value = Math.round(c.y);
				document.myForm3.w3.value = Math.round(c.w);
				document.myForm3.h3.value = Math.round(c.h);
			};
			
			function checkCoordinates3() {
				if (document.myForm3.x3.value == "" || document.myForm3.y3.value == "") {
					alert("Please select a crop region");
					return false;
				} else {
					return true;
				}
			};
		</script>	
	
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
										minSize : [100, 100],
										maxSize : [800, 400],
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