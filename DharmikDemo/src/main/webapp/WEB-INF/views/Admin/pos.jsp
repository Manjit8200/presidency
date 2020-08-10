<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Point of sales</title>

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



<%-- <script src="<%=request.getContextPath() %>/resources/admin/js/slimselect.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/admin/css/slimselect.min.css" rel="stylesheet"></link> --%>


<!--***ckeditor****-->
<script src="https://cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>


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
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/addPlan.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/select2.full.min.js"></script>
<script >
$(function () {
    //Initialize Select2 Elements
    $(".select2").select2();
});

</script>

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

<body id="page-top" ng-app="prc" ng-controller="PlanCtrl">

	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Sidebar -->
			<!--/Left Navigation START-->
			<%@include file="left-nav1.jsp" %>
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
									aria-controls="collapseCardExample">
									<h6 class="m-0 font-weight-bold text-light">Manage POS
									</h6>
								</a>
								<!-- Card Content - Collapse  class="collapse"-->
								<div class="" id="collapseCardExample">
									<div class="card-body">


									<form class="" ng-submit="addPlan()">

										
								   <div class="form-group row">
										<div class="col-lg-5">
									    	<label>Location <span class="errormsg">*</span></label> 
											<select class="form-control select2 input-lg2 "  name="foodvoucher_validity" id="entitlement"  ng-model="masterMemberPlan.foodvoucher_validity" >
													<option value="" selected> Select Location </option>
													<option value="1"> Main Gate</option>
													<option value="2"> Golf Course</option>
													<option value="3"> Admin Office</option>
													<option value="4"> Badminton</option>
													<option value="5"> Tennis</option>
													<option value="6"> Swmming Pool</option>
													<option value="7">Pro shop</option>
												
								
													 
												</select>
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>	
				
 										</div>
 										
 										<div  class="form-group row">
 										
 										<div class="col-lg-5">
											<label> Scan QrCode of Member / Family Member / Guest  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Scan QrCode" name="plan_amount"  ng-model="scanmember" id="plan_amount" type="text">
										
										</div>
										
										<div class="col-lg-5">
											<label> Search Member / Family Member / Guest <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Search" name="gst" ng-model="membersearch"  id="gst" type="text">
										
										</div>
										
									<!-- 		<div class="col-lg-5">
											<label> Scan QRCode of Visitor <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Scan QRCode of Visitor" name="plan_amount"  ng-model="scanvisitor" id="plan_amount" type="number">
										
										</div>
										
										<div class="col-lg-5" ng-show="scansearch==vis">
											<label> Search Visitor <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Search Visitor " name="gst" ng-model="scansearch"  id="gst" type="number">
										
										</div> -->
										
										<div class="col-md-2">
													<div class="form-group"><br>
														<a ng-click="addAlbumImageRow()" class="btn btn-primary col-xl-12" ng-model="vis" style="color:white;white-space: nowrap;"> VISITOR</a>
													</div>
										</div>
 										
 										</div>
 										
 										
 							<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
									<h3 class="box-title" style="color:#4A2818;"> Product / Service Details </h3>
							</div>
							
								<div class="row">

										<div class="col-sm-12 col-md-12">
											<div class="table-responsive">
												<table class="table table-bordered" id="dataTable"
													width="100%" cellspacing="0">

													<thead>
														<tr style="text-align: center;">
															<th style="width: 5%">#</th>
															<th style="width: 70%">Item Description</th>
															<th style="width: 15%"> Quantity </th>															
															<th style="width: 10%" >Add.</th>
														</tr>
													</thead>


													<tbody>


														<tr >
															<td style="width: 5%">1</td>
															<td style="width: 70%">Golf Cart (Weekend/Holiday)</td>
															<td style="width: 15%"> 10 </td>															
															<td style="width: 10%;color:#FF8000;text-align: center;" ><i class="fa fa-plus-square" aria-hidden="true"></i></td>
														</tr>
															<tr >
															<td style="width: 5%">2</td>
															<td style="width: 70%">Golf Test</td>
															<td style="width: 15%"> 1 </td>															
															<td style="width: 10%;color:#FF8000;text-align: center;" ><i class="fa fa-plus-square" aria-hidden="true"></i></td>
														</tr>
														<tr >
															<td style="width: 5%">3</td>
															<td style="width: 70%">Driving Range - Bucket of Balls</td>
															<td style="width: 15%"> 5 </td>															
															<td style="width: 10%;color:#FF8000;text-align: center;" ><i class="fa fa-plus-square" aria-hidden="true"></i></td>
														</tr>
														<tr >
															<td style="width: 5%">4</td>
															<td style="width: 70%">GDriving Range Green Fees</td>
															<td style="width: 15%"> 4 </td>															
															<td style="width: 10%;color:#FF8000;text-align: center;" ><i class="fa fa-plus-square" aria-hidden="true"></i></td>
														</tr>
														
													</tbody>

												</table>
											</div>
										</div>
									</div>
								<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
									<h3 class="box-title" style="color:#4A2818;"> Payment Details </h3>
							</div>
							
								<div class="form-group row">
								
										<div class="col-lg-12">
									    	<label>Payment Options <span class="errormsg">*</span></label> 
											<select class="form-control  "  name="foodvoucher_validity" id="entitlement"  ng-model="mk" >
													<option value="" selected> Select Payment Options </option>
													<option value="1"> UnPaid</option>
													<option value="2"> Cash</option>
													<option value="3"> Credit card</option>
													<option value="4"> Debit card</option>
													<option value="5"> Foc</option>
											 
												</select>
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>	
				
 									</div>
								
								
									<hr>
								
		
							
					

											<div class="form-group row" style="margin-top:15px;">

												<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<button type="submit" ng-disable="batchSpin == 1" class="btn btn-md btn-success btn-block">
														Submit  <i ng-show="batchSpin == 1" class="fa fa-spinner fa-pulse"></i></button>
												</div>

											</div>



										</form>


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









<!-- Create Group Modal-->


			


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
	<script>
	$('#myModal').on('hidden', function()
			{
				document.location.reload();
			})
</script>
<script>
$('.select2').select2();
</script>
<script type="text/javascript">
$('.clockpicker').clockpicker({
    placement: 'bottom',
    align: 'left',
    donetext: 'Done',
    autoclose: true,
    	afterDone: function() {
            console.log("after done");
        }
});
</script>
<script>
$(document).ready(function () {
	// create DateTimePicker from input HTML element
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


</script>
</body>

</html>
