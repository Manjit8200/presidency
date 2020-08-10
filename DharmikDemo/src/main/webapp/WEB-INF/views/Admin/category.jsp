<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Category</title>

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


<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/css/bootstrap-clockpicker.css" />
<script src="<%=request.getContextPath() %>/resources/admin/js/bootstrap-clockpicker.js"></script>

<link href="<%=request.getContextPath() %>/resources/admin/css/toastr.min.css" rel="stylesheet">

<script	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/conf.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/category.js"></script>

	<script>
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

<body id="page-top" ng-app="prc" ng-controller="CategoryCtrl">

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
									aria-controls="collapseCardExample">
									<h6 class="m-0 font-weight-bold text-light">Add Category Details
									</h6>
								</a>
								<!-- Card Content - Collapse  class="collapse"-->
								<div class="collapse hide" id="collapseCardExample">
									<div class="card-body">


									<form class="" ng-submit="addCategory()">

							
						 <div class="form-group row">
								   
										
								<div class="col-lg-4"  >
									    	<label> Category Name<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter  Category Name" ng-model="category.category_name" ng-change="setflag()" id="category_name" name="category_name" type="text">
											<p class="errormsg" ng-show="category_nameError == 1">{{category_nameMsg}}</p>
								</div>
										
										
										<div class="col-lg-3">
											<label> Category Code  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Category Code" name="category_code" ng-change="setflag()" ng-model="category.category_code" id="category_code" type="text">
										<p class="errormsg" ng-show="category_codeError == 1">{{category_codeMsg}}</p>
										</div>
							
									<div class="col-lg-5"  >
									    	<label>Description<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter Description" name="category_desc" ng-model="category.category_desc" id="category_desc" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
											
							</div>
							
							<br>
										
											<div class="form-group row" style="margin-top:15px;">

												<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<button type="submit"  class="btn btn-md btn-success btn-block">
														Submit Category </button>
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
									<h6 class="m-0 font-weight-bold text-primary">All Category </h6>
								</div>




								<!-- Card Content -->
								<div class="card-body" ng-init="categorylist()">

									<div class="row">

										<div class="col-sm-12 col-md-12">
											<div class="table-responsive">
												<table class="table table-bordered" id="dataTable"
													width="100%" cellspacing="0">

													<thead>
														<tr>
															<th style="width: 5%">#</th>
															<th style="width: 20%">Category Name</th>
															
															<th style="width: 20%">Category code</th>
															<th style="width: 20%">Category Description</th>
														
															<th class="text-center">Del.</th>
														</tr>
													</thead>

												<tbody>


														<tr ng-repeat="item in getAllMemberNameList">
															<td  style="width: 5%">{{$index+1 }}</td>
															<td  data-toggle="modal" data-target="#myModal" ng-click='getCategoryName(item.category_id)' >{{item.category_name}}</td>
															
															<td data-toggle="modal" data-target="#myModal" ng-click='getCategoryName(item.category_id)' >{{item.category_code}}</td>
															<td data-toggle="modal" data-target="#myModal" ng-click='getCategoryName(item.category_id)'>{{item.category_desc}} </td>
														
														
														 	 <td> <center>
														<a ng-click="deleteCategory(item.category_id)" style="cursor: pointer;" class="btn btn-danger">
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

	<!-- Modal -->
	<div class="container">
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">Edit Location Details</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							
							</div>
							<form ng-submit="editCategory()">	
					
							<div class="modal-body">
								
										 <div class="form-group row">
			 
			 
								<div class="col-lg-4"  >
									    	<label> Category Name<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter  Category Name" ng-model="category.category_name" id="category_name" name="category_name" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
								</div>
										
										
										<div class="col-lg-4">
											<label> Category Code  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Category Code" name="category_code"  ng-model="category.category_code" id="category_code" type="text">
										
										</div>
							
									
											
							</div>
								<div class="row">
								<div class="col-lg-8"  >
									    	<label>Description<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter Description" name="category_desc" ng-model="category.category_desc" id="category_desc" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
																
								</div>

							
												
								
				
											
								        <div class="col-lg-12 mt-10">											
							  				<button type="submit" ng-disable="spin == 1" class="btn btn-primary btn-lg btn-block"><i ng-show="spin == 1" class="fa fa-spin fa-spinner" aria-hidden="true"></i> Update</button>
										</div>	
									
								
								
								
								</div>
							</form>					
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


	<!--***********************************-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
	<script>
			$('#myModal').on('hidden', function()
					{
						document.location.reload();
					})
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


</script>

</body>

</html>