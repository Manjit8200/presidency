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

<link href="<%=request.getContextPath() %>/resources/admin/css/toastr.min.css" rel="stylesheet">

<script	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/conf.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/manageUser.js"></script>

<script src="<%=request.getContextPath() %>/resources/admin/js/jquery.Jcrop.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/css/jquery.Jcrop.css"	type="text/css" />


<script src="<%=request.getContextPath() %>/resources/admin/js/slimselect.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/admin/css/slimselect.min.css" rel="stylesheet"></link>


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
<script>
function myFunction1() {
  var x = document.getElementById("collapseCardExample");
  if (x.style.display === "none") {
    x.style.display = "block";

	document.getElementById('UserDetails').classList.add("active");
  } else {
	 /*  document.getElementById('collapseCardExample').style.display = "none"; */
    x.style.display = "none";

}
</script>
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

<body id="page-top" ng-app="prc" ng-controller="UserCtrl">

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
	<div class="" id="collapseCardExample" >
	   <div class="" >
<!--===================================================== User Register Details ======================================================= -->            
	  <form class="" ng-submit="addMasterMemberRegister()" id="userDetails">
	    
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
											<select class="form-control select2 " style="width:100%;"ng-change="setflag() || calculatevalidity()" name="tenure_year" id="tenure_year"  ng-model="masterMemberRegister.tenure_year">
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
								<option value="2">Others</option>
								
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
										<input class="form-control" placeholder=" Enter Your City" ng-change="setflag()" ng-model="masterMemberRegister.member_city" id="member_city" type="text">
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
					<input class="form-control" placeholder=" Enter Your Phone Number" ng-model="masterMemberRegister.member_phone" id="member_phone" ng-change="setflag()"  type="number">
					<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
				</div>	
				<div class="col-lg-3 "  >
			    	<label> Mobile Number <span class="errormsg">*</span></label> 
						<input class="form-control" placeholder=" Enter Your Mobile Number" ng-model="masterMemberRegister.member_mobile_no" id="member_mobile_no" ng-change="setflag()"  type="number">
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
										<input type="file" id="imageadd" name="imageadd" ng-model="masterMemberRegister.member_image" class="form-control" style="height:40px"><br>
										<p style="font-size:15px; margin-top:-10px;">Upload minimum 300 * 300 size image </p>
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
					<button type="submit" ng-click="typeschange11()" ng-disabled="spin == 1" class="btn btn-success tablinks"><i ng-show="spin == 1" class="fa fa-spin fa-spinner" aria-hidden="true"></i> Save & Next</button>																						</div>
				
				</div>	
		</div>	
		</form>
<!-- ============================================= Family Details===================================== -->							
				
		<form class="" ng-submit="addMasterMemberFamilyRegister()">		
				<div id="Paris" class="tabcontent">
						<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
							<h3 class="box-title" style="color:#4A2818;"> Family Details</h3>
						</div>							
							<div class="box-body"> 		
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
											<p class="errormsg" ng-show="masterMemberRegistermember_family_middle_nameError == 1">{{masterMemberRegistermember_family_middle_nameMsg}}</p>
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
										<div class="col-md-3" >
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
										
										<div class="col-md-3" >
											<div class="form-group">
											<label>State <span class="errormsg">*</span></label> 
												<select class="form-control input-lg2" name="member_family_state_id" id="member_family_state_id" ng-model="member_family_state_id" ng-change="setflag1()">
													<option value=""> Select State</option>
													<option value="1"> Gujarat</option>
												</select>
												<p class="errormsg" ng-show="masterMemberRegistermember_family_state_idError == 1">{{masterMemberRegistermember_family_state_idMsg}}</p>
											</div>
										</div>
										<div class="col-md-3" >
											<div class="form-group">
											<label>City <span class="errormsg">*</span></label> 
												<input class="form-control" placeholder=" Enter Your City" ng-model="member_family_city" id="member_family_city" type="text" ng-change="setflag1()">
											</div>
											<p class="errormsg" ng-show="masterMemberRegistermember_family_cityError == 1">{{masterMemberRegistermember_family_cityMsg}}</p>
										</div>
										
								
								<div class="col-lg-3 "  >
									    	<label>Pincode <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Pincode" ng-model="member_family_pincode" id="member_family_pincode" type="number" ng-change="setflag1()">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_pincodeError == 1">{{masterMemberRegistermember_family_pincodeMsg}}</p>
										</div>
			</div>
							<div class="form-group row">

  									 
										<div class="col-lg-3 col-md-2 col-sm-6 col-xs-12">
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
										<div id="example" class="col-lg-3 demo-section k-content">
											<label>  Date of Birth <span class="errormsg">*</span></label>
											<input class="KendoDate" id="fromdatetimepicker3" title="fromdatetimepicker"3 ng-model="member_family_date_of_birth" style="width: 100%;"  ng-change="setflag1()">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_date_of_birthError == 1">{{masterMemberRegistermember_family_date_of_birthMsg}}</p>
										</div>
										<div class="col-lg-3 col-md-2 col-sm-6 col-xs-12">
											<label> Gender<span class="errormsg">*</span> </label> 
											<select class="form-control" ng-model="member_family_gender" id="member_family_gender" ng-change="setflag1()">
												<option value=""> Select Gender</option>
												<option value="1">Male</option>
													<option value="2">Female</option>					
											</select>							
										</div>
										<div class="col-lg-3 col-md-2 col-sm-6 col-xs-12">
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
										
									
									</div>
						
									<div class="form-group row">
										<div class="col-lg-3 "  >
									    	<label> Phone Number </label> 
											<input class="form-control" placeholder=" Enter Your Phone Number" ng-model="member_family_phone" id=" member_family_phone" type="number">
											<!-- <p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p> -->
										</div>
										<div class="col-lg-3 "  >
									    	<label> Mobile Number <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Mobile Number" ng-model="member_family_mobile_no" id=" member_family_mobile_no" type="number" ng-change="setflag1()">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_mobile_noError == 1">{{masterMemberRegistermember_family_mobile_noMsg}}</p>
										</div>
  									    <div class="col-lg-3" >
									    	<label>Email  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Email  " ng-model="member_family_email" id="member_family_email" type="email" ng-change="setflag1()">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_emailError == 1">{{masterMemberRegistermember_family_emailMsg}}</p>
										</div>
										<div class="col-lg-3 "  >
									    	<label> Password <span class="errormsg">*</span></label> 
											<input class="form-control " placeholder="  Enter Your Password" ng-model="member_family_password" id="courseTitle" type="password" ng-change="setflag1()">
											<p class="errormsg" ng-show="masterMemberRegistermember_family_passwordError == 1">{{masterMemberRegistermember_family_passwordMsg}}</p>
										</div>
									
										
										
									</div>
										<div class="form-group row">
					
										
										<div class="col-lg-3">
									<div class="form-group">
										<label> Image <font style="color: red;">*</font></label>
										<input type="file" id="imageadd1" name="imageadd1"ng-model="masterMemberRegister.member_family_image" class="form-control" style="height:40px"><br>
										<p style="font-size:15px; margin-top:-10px;">Upload minimum 400 * 400 size image </p>
									</div>
				</div>

											<div class="col-md-1">
													<div class="form-group"><br>
														<a ng-click="addRow()"class="btn btn-primary" style="color:white;"><span class="fa fa-plus" style="font-size: 14px;"></span>&nbsp;Add</a>
													</div>
											</div>
											
											<div class="row text-center">
								<div class="col-md-12" id="t1">
									<img src="" id="target1" />
									
								</div>
							</div>	
										  <!------------------------------------ Row Start -->
			
			
	     
							
											
																			
									</div>
								<hr>				
								<div class="form-group row">		
									<div class="table-responsive table-bordered">
											<table class="table">
												<thead>
												<tr>	
												<th>#</th>																
													<th>Name</th>
													<th>MemberShip No</th>
													<th>Date of Birth</th>
													<th>Delete</th>
												</tr>
												</thead>
														<tbody > 
	
														<tr ng-repeat="items in MemberFamilyRegister">
															<td style="width: 5%">{{$index + 1}}</td>
															<td style="width: 25%">{{items.member_family_first_name}} {{items.member_family_middle_name}}</td>
															
															<td style="width: 25%">{{items.family_membership_no}}</td>
															<td style="width: 30%">{{items.member_family_date_of_birth}}</td>
														
														<td>
														<a ng-click="removeAlbumImageRow(items.family_membership_no)" style="cursor: pointer;" class="btn btn-danger">
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
														<button type="submit" ng-click="getUpdateFamilyMember11()" ng-disabled="spin == 1" class="btn btn-success tablinks"><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Save & Next</button>
													
													</div>
												</div>								
									</div>								
			</div>		
			</form>		
				<!-- ================================ Personal Information ================================================ -->				
	

	<form >
			
			
			<div id="Tokyo" class="tabcontent">
		
						<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
							<h3 class="box-title" style="color:#4A2818;"> Personal Information</h3>
						</div>	
												
						<div class="box-body"> 	
						<div class="form-group row">
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<label> Status <span class="errormsg">*</span></label> 
											<select class="form-control" ng-model="member_profession" id="member_profession" >
												<option value="" selected>Select Status</option>
												<option value="1">Business</option>
													<option value="2">Profesional</option>
													<option value="3">Employed</option>
												<option value="4">Others</option>
											</select>
										
										</div>
										<div class="col-lg-3 " ng-show="status=='others'">
									    	<label>Other Status<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Other Status" ng-model="fullname" id="courseTitle" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>

										<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
											<label> Other Club Membership <span class="errormsg">*</span></label> 
											<select class="form-control" ng-model="member_other_Club_membership" id="member_other_Club_membership"  ng-change="getAllChoice() || getAllClub()">
												<option value="" selected> Other Club Membership </option>
												<option value="1">Yes</option>
												<option value="2">No</option>
												
											</select>
										</div>
						
					<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
						<label>Name Of Club</label> 
							<div class="form-group input-group ">
								<select class="form-control select2" style="width:90%;" ng-model="member_club_name" id="member_club_name" multiple>
									<option value="" selected>Select Your Club</option>
						<option ng-repeat="item in getAllMasterClub" value="{{item.club_name}}">{{item.club_name}}</option> 
					
								</select> <span class="input-group-btn">
									<button style="border-radius: 4px 4px 4px 4px;" title="Add new Batch" data-toggle="modal" data-target="#myModal"  class="btn btn-primary" type="button">
										<i class="fa fa-plus"></i>
									</button>
								</span>

							</div>
							<p class="errormsg" ng-show="batchIDError == 1">{{batchIDMsg}}</p>
						</div>
							
								
						</div>
						<div class="form-group row">
						
										<div id="example" class="col-lg-3 demo-section k-content" style="align:right">
											<label> Marriage Anniversary <span class="errormsg">*</span></label>
											<input  class="KendoDate" id="fromdatetimepicker8" title="fromdatetimepicker" ng-model="member_marriage_anniversary" style="width: 100%;" />
											<p class="errormsg" ng-show="startDateError == 1">{{startDateMsg}}</p>
										</div>
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<label> House Owned <span class="errormsg">*</span></label> 
												<select class="form-control" ng-model="member_house_owend " id="member_house_owend" >
													<option value="" selected>Select House Owned</option>
													<option value="1">Owned</option>
													<option value="2">Leased</option>
													<option value="3">Company</option>
													
												</select>
							</div>
						</div>
				<!-- // ----------------------------------------------------- comment choice------------------------------------------->	
						<!-- <div class="form-group row">

  									    <div class="col-lg-4 " >
									    	<label> Name of Member<span class="errormsg">*</span></label> 
										<select class="form-control" ng-model="members_family_id" id="members_family_id"  >
													
													<option value="" selected> Select Name</option>
								
											 <option ng-repeat="item2 in familymember" value="{{item2.members_family_id}}">{{item2.member_family_first_name}}</option> 
			
													
												</select>
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										<div class="col-lg-2 col-md-3 col-sm-6 col-xs-12">
											<label> Relation <span class="errormsg">*</span></label> 
											<select class="form-control" ng-model="member_family_type_of_relation" id="member_family_type_of_relation">
											<option value="" selected> Relationship</option>
												<option value="1">Spouse</option>
												<option value="2">Son</option>
												<option value="3">Daughter</option>
												<option value="4">Self</option>
											
												<option ng-repeat="item in getCurrency" value="{{item.currencyId}}">{{item.currencyCode}}</option>
											</select>
										
										</div>
									
										<div class="col-lg-5 col-md-4 col-sm-6 col-xs-12">
											<label> Choice<span class="errormsg">*</span> </label> 
											<div class="form-group input-group ">
											<select class="form-control select2" style="width:90%;" ng-model="member_family_choices" id="member_family_choices" multiple>
												<option value="" selected>Select choices</option>
												<option ng-repeat="iteme in getAllMasterChoiceName" value="{{iteme.choice_name}}">{{iteme.choice_name}}</option> 
						
											</select>	<span class="input-group-btn">
									<button style="border-radius: 0px 4px 4px 0px;" title="Add new Batch" data-toggle="modal" data-target="#myModalChoice"  class="btn btn-primary" type="button">
										<i class="fa fa-plus"></i>
									</button>
								</span>						
										</div>
							<p class="errormsg" ng-show="batchIDError == 1">{{batchIDMsg}}</p>
						</div>
										
										
						<div class="col-md-1">
													<div class="form-group"><br>
														<a ng-click="addRowPersonalChoice()  " class="btn btn-primary" style="color:white;"><span class="fa fa-plus" style="font-size: 14px;"></span>&nbsp;Add</a>
													</div>
										</div>
																	
									</div>
										<div class="form-group row">		
									<div class="table-responsive table-bordered">
											<table class="table">
												<thead>
												<tr>																	
													<th>#</th>
													<th>Name of Member</th>
													<th>Relationship</th>
													<th> Choice </th>
													<th>Delete</th>
												</tr>
												</thead>
												<tbody>	
													<tr ng-repeat="item in MemberChoice">
															<td style="width: 5%">{{$index + 1}}</td>
															<td style="width: 25%">{{item.member_family_first_name}} </td>
															
															<td style="width: 25%">{{item.family_name}}</td>
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
																
							</div>
							
							 --><br><br>
									<div class="row">									
										<div class="col-md-8 text-left">
														<strong ng-show="albumSubmitSuccess == 1" style="color: green;"><span class="fa fa-check-circle"></span> {{successMsg}}</strong>
														<strong ng-show="albumSubmitError == 1" style="color: red;"><span class="fa fa-times-circle"></span> {{errorMsg}}</strong>
							</div>
													<div class="col-md-10 text-left">
														<button onclick="openClass('PersonalDetails','FamilyDetails', 'Paris')" class="btn btn-success tablinks "><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Previous</button>
													</div>
													<div class="col-md-2 text-right">
														<button ng-click=" addRowPersonalInfo1()" type="submit" ng-disabled="spin == 1" class="btn btn-success"><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Save & Next</button>
													</div>
											</div>						
			</div>						
</div>
</form> 
<!-- ------------------------------------------------------------------------------------------------------------ -->
			<div id="India" class="tabcontent">
										<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
												<h3 class="box-title" style="color:#4A2818;"> Nominee Details </h3>
											</div>
						<form ng-submit="addNomineeDetails()">									
								<div class="box-body"> 						
  								 <div class="form-group row ">


  									    <div class="col-lg-4 " >
									    	<label>First Name <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter First Name  " ng-model="memberNomineeDetails.nominee_firstname" id="nominee_firstname" type="text">
											<p class="errormsg" ng-show="masterMemberRegisternominee_firstnameError == 1">{{masterMemberRegisternominee_firstnameMsg}}</p>
										</div>
										<div class="col-lg-4 c "  >
									    	<label> Middle Name </label> 
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
											<input class="form-control" placeholder=" Enter Your Pincode" ng-model="memberNomineeDetails.nominee_pincode" id="nominee_pincode" type="number">
											<p class="errormsg" ng-show="masterMemberRegisternominee_pincodeError == 1">{{masterMemberRegisternominee_pincodeMsg}}</p>
										</div>
					
						</div>
						
									<div class="form-group row">
									   <div class="col-lg-3" >
									    	<label>Phone Number </label> 
											<input class="form-control" placeholder=" Enter Your Phone Number" ng-model="memberNomineeDetails.nominee_phone" id="nominee_phone" type="number">
											
										</div>

  									    <div class="col-lg-3" >
									    	<label>Mobile self <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Enter Your Mobile Number  " ng-model="memberNomineeDetails.nominee_mobile_no" id="nominee_mobile_no" type="number">
											<p class="errormsg" ng-show="masterMemberRegisternominee_mobile_noError == 1">{{masterMemberRegisternominee_mobile_noMsg }}</p>
										</div>
										<div class="col-lg-3 "  >
									    	<label> Email  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="  Enter Your Email" ng-model="memberNomineeDetails.nominee_email" id="nominee_email" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										  
									</div>
									
									<div class="row">									
													<div class="col-md-10 text-left">
														<button onclick="openClass('NomineeDetails','PersonalDetails','Tokyo')" class="btn btn-success tablinks "><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Previous</button>
													</div>
												
													<div class="col-md-2 text-right">
														<button ng-click="getRegisterMemberAmount()" class="btn btn-success tablinks "><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Finish</button>
													</div>
													
											</div>	
		</div>								
		
	

</div>		
</form>
<!-- ====================================================== Payment Details -======================================= -->
<!-- 

<div id="Bharat" class="tabcontent">
	 
											<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
												<h3 class="box-title" style="color:#4A2818;"> Payment For Membership </h3>
											</div>
															
								<div class="box-body"> 						
 			<form >
								<div class="row form-group">
								
									<div class="col-lg-3"  >  ng-repeat="item in getAllMemberAmount"  value ="{{ item.plan_amount}}"
									    	<label> Member Ship Amount<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Member Ship Amount" ng-change="TaxRow()" ng-model="memberPayment.member_plan_amount" id="member_plan_amount" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
									
						
									<div class="col-lg-3"  >
									    	<label> Discount(if any) </label> 
											<input class="form-control" placeholder="Discount Amount" ng-change="TaxRow()" ng-model="memberPayment.member_discount" id="member_discount" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>	
										
									<div class="col-lg-3"  >
									    	<label> Currency </label> 
									    	
											<select class="form-control input-lg2" name="member_currency" id="member_currency" ng-model="memberNomineeDetails.member_currency" ng-change="getMembers()">
													<option value=""> Select State</option>
													<option value="1"> INR </option>
													<option value="2"> USD </option>
											</select>
											
									</div>	
										
										
										<div id="example" class="col-lg-4 demo-section k-content" >
											<label> Date <span class="errormsg">*</span></label>
											<input class="KendoDate" id="fromdatetimepicker10" title="StartDate" 	 ng-change="setflag()" ng-model="masterMemberRegister.start_date" style="width: 100%;" />
											<p class="errormsg" ng-show="masterMemberRegisterStartdateError == 1">{{masterMemberRegisterStart_dateMsg}}</p>
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
										
										
											<div class="col-md-1">
													<div class="form-group"><br>
														<a ng-click="getTax() || TaxRow() " class="btn btn-primary" style="color:white;"><span class="fa fa-plus" style="font-size: 14px;"></span>&nbsp;Add</a>
													</div>
											</div>	
										
							</div>	
									<div class="row">

										<div class="col-sm-12 col-md-12">
											<div class="table-responsive">
												<table class="table table-bordered" id="dataTable1"
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
															<tr ng-repeat="item in Taxtype">
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
							<div class="col-lg-3"  >
									    	<label>Total Member Ship Amount<span class="errormsg">*</span></label> 
											<input class="form-control"  placeholder="Total Member Ship Amount" ng-model="memberPayment.member_total_amount" id="member_total_amount" type="number">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>	
									<br>
									<div class="row">									
													<div class="col-md-9 text-left">
														<button onclick="openClass('PaymentDetails','NomineeDetails','India')" class="btn btn-success tablinks "><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Previous</button>
													</div>
												
													<div class="col-md-3 text-right">
														<button ng-click="memberPayemnt111()" class="btn btn-success tablinks "><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Finish </button>
													</div>
											</div>	
		</div>								
</form>
</div>
 -->
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
								<div class="row"> 
									<div class="col-lg-8 text-left" >
									<h6 class="m-0 font-weight-bold text-primary" style="font-size: 15px;">All Member </h6>
									</div>
									
									<div class="col-lg-4 text-right"  >
									
									<select class="select2 col-lg-4" id="Nt" ng-model="pageSize" Style="float:right" ng-change="changepage()">
									<!-- 	<option ng-repeat="item in pagess" value="{{item}}" > {{item}}</option> -->
									<option value="5">5 </option>
										<option value="10">10 </option>
										<option value="20">20 </option>
										<option value="All">All </option>	
									</select>
									</div>
								
								</div>
									
								</div>




								<!-- Card Content -->
								<div class="card-body">

									<div class="row">

										<div class="col-sm-12 col-md-12">
											<div class="table-responsive">
												<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

													<thead>
														<tr>
															<th style="width: 5%">#</th>
															<th style="width: 25%">User Name</th>													
															<th style="width: 25%">Enrollment No </th>
															<th style="width: 25%">Membership Plan</th>
															<th class="text-center">Del.</th>
														</tr>
													</thead>


													<tbody  >
														<tr ng-repeat="item in getAllRegisterMemberNameList"  style="cursor:pointer;cursor:hand">
															<td title="Edit Record" ng-click="getUpdateUser(item.member_id) || getUpdateMember(item.member_id)">{{$index+1}}</td>
															<td title="Edit Record" ng-click="getUpdateUser(item.member_id) || getUpdateMember(item.member_id)"data-toggle="modal" data-target="#editModal">{{item.member_firstname}} {{item.member_lastname}}</td>
															<td title="Edit Record" ng-click="getUpdateUser(item.member_id) || getUpdateMember(item.member_id)"data-toggle="modal" data-target="#editModal">{{item.plan_name}}</td>
															<td title="Edit Record" ng-click="getUpdateUser(item.member_id) || getUpdateMember(item.member_id)" data-toggle="modal" data-target="#editModal">{{item.membership_number}}</td>

<td class="text-center">
														<a ng-click="deleteRegisterMember(item.member_id)" style="cursor: pointer;" class="btn btn-danger">
															<i class="fa fa-trash" style="color:white;" aria-hidden="true" data-toggle="tooltip" title="Delete"></i>
														</a>	
													</td>
														<%-- 	<td class="text-center" >
																<!-- <button title="Delete Batch" type="button" class="btn btn-outline-default btn-sm view" data-toggle="modal" data-target="#deleteModal">
																<i class="fa fa-trash-o txt-danger"></i>
																 </button>
																  -->
														<a class="collapse-item" href="<%=request.getContextPath() %>/managePrc/category"> <i class="fa fa-trash-o txt-danger"></i> </a>
																  
															</td> --%>
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


	<!------------------------------------------------------------- name of club   Create Group Modal-->
			<div class="container">
			<form ng-submit="addClubName()"> 
				<div class="modal fade" id="myModal" role="dialog">
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
<!------------------------------------------------------------- name of club   Create Group Modal-->
			<div class="container">
				<form ng-submit="addMasterChoice()"> 	
				<div class="modal fade" id="myModalChoice" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
					
							<h4 class="modal-title">Name Of Choice </h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								
							</div>
							
							<div class="modal-body">
								<div class="row">
								
											<div class="col-lg-12">
											  <label >Choice Name <span class="star" >*</span></label>
											  <input type="text" class="form-control" name="club_name"  ng-model="masterChoice.choice_name" placeholder="Enter Choice Name" autocomplete="nope" required>								  
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
	
	<!-------------------------------------------------------------Edit Choice Modal-->
	
	<!-- 
	<div class="modal fade" id="editModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title txt-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit Group</h5>
						<button ng-click="setEmptyObject()" class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<form ng-submit="addGroup()">
					<div class="modal-body">
						<div class="row">
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<label>Group Name</label>
								<input class="form-control" placeholder="Group Name" id="groupname" ng-model="group.groupName" type="text" ng-change="setFlag()">
								<p class="errormsg" ng-show="errorGroupName == 1">{{msgGroupName}}</p>
							</div>
							<div class="col-lg-9 col-md-9 col-sm-6 col-xs-12">
								<label> Select Team Members </label>
								<div class="form-group">
									<select id="memberid1" multiple ng-model="memberid">
										<option ng-repeat="users in userNameList" value="{{users.userId}}">{{users.firstName}} {{users.lastName}}</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">						
						<button type="submit" class="btn btn-md btn-success btn-block">Update</button>	
					</div>
					</form>
				</div>
			</div>
		</div> -->
<!-- Bootstrap  JavaScript-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core  JavaScript-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<script src="<%=request.getContextPath() %>/resources/admin/js/sb-admin-2.min.js"></script>
	
	
	<script src="<%=request.getContextPath() %>/resources/admin/js/toastr.min.js"></script>


	<link
		href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css"
		rel="stylesheet" />

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
		
		
		
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
		<script>
			$('#myModal').on('hidden', function()
					{
						document.location.reload();
					})
		</script>
		
			<script>
			$('#myModalChoice').on('hidden', function()
					{
						document.location.reload();
					})
		</script>
	<script>
$('.select2').select2();
</script>





 
 <script>
 $(".KendoDate").bind("focus", function(){
		$(this).data("kendoDatePicker").open(); 
	});
	
	$(document).ready(function () {			 		         
		$("#fromdatetimepicker").kendoDatePicker({
       		format: "dd/MM/yyyy",
			value: new Date(),
			dateInput: true
         });
	 });
        
	$(document).ready(function () {
	// create DateTimePicker from input HTML element
	$("#fromdatetimepicker1").kendoDatePicker({
		format: "dd/MM/yyyy",
		
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
		$("#fromdatetimepicker10").kendoDatePicker({
			format: "dd/MM/yyyy",
			
			dateInput: true
		});
		});

</script>


</body>

</html>