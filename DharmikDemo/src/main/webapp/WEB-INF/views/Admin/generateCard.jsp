<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Master Plan</title>

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
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/manageUser.js"></script>

	<script>
	$(function () {
	    //Initialize Select2 Elements
	    $(".select2").select2();
	});

</script>
<style>
 .table td{
    padding: .50rem !important;
    vertical-align: top;
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

</head>

<body id="page-top" ng-app="prc" ng-controller="UserCtrl">

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
									<h6 class="m-0 font-weight-bold text-light"> Generate Card
									</h6>
								</a>
								<!-- Card Content - Collapse  class="collapse"-->
							
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
									<h6 class="m-0 font-weight-bold text-primary" style="font-size: 15px;">All User Member Name</h6>
									</div>
									
									<div class="col-lg-4 text-right"  >
									
									<select class="select2 col-lg-4" id="Nt" ng-model="pageSize" Style="float:right" ng-change="changepage()">
										<option ng-repeat="item in pages" value="{{item}}" > {{item}}</option>
										
									</select>
									</div>
								
								</div>
									
									
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
															<th style="width: 25%">User Name</th>
															<th style="width: 25%">Mership Member</th>
															
															
														
															<th style="width: 25%">Membership Number</th>
														</tr>
													</thead>
<tbody  >
														<tr ng-repeat="item in getAllRegisterMemberNameList"  style="cursor:pointer;cursor:hand">
															<td title="Edit Record" data-toggle="modal" data-target="#myModal" ng-click='getRegisterMember(item.member_id)' >{{$index+1}}</td>
															<!-- <td title="Edit Record" data-toggle="modal" data-target="#myModal" ng-click='getRegisterMember(item.member_id)'>{{item.member_id}} </td> -->
															<td title="Edit Record" data-toggle="modal" data-target="#myModal" ng-click='getRegisterMember(item.member_id)'>{{item.member_firstname}} {{item.member_lastname}}</td>
															<td title="Edit Record" data-toggle="modal" data-target="#myModal" ng-click='getRegisterMember(item.member_id)'>{{item.plan_name}}</td>
															<td title="Edit Record" data-toggle="modal" data-target="#myModal" ng-click='getRegisterMember(item.member_id)'>{{item.membership_number}}</td>


															
														</tr>

													
													</tbody>

		</table>
											</div>
										</div>
									</div>

									<hr class="mt-0">

									<div class="row">

										<div class="col-sm-12 col-md-5">
											<div class="hint-text">Showing <b>{{startindex+1}}-{{getAllMemberNameList.length+startindex}}</b> out of <b>{{allcounts.activityCount}}</b> entries</div>
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
								<h4 class="modal-title">Membership Card</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							
							</div>
							<div class="modal-body">
								
				<form ng-submit="getRegisterMember()">	
											 

							
									
									
									<table style="border:1px solid #c5c4c4;width:50%;" align="center">
									 <tr>
									 
									 <th> 
										 <span style="font-weight: bold;font-size: 20px;">&nbsp;&nbsp; {{ getAllMemberNameList.membership_number}}  </span>	 <br>
																			
										<span style="font-weight: bold;font-size: 20px;"> &nbsp;&nbsp; {{ getAllMemberNameList.member_firstname}} 	&nbsp;{{ getAllMemberNameList.member_lastname}} </span> 
										<span style="font-weight: bold;font-size: 20px;"> &nbsp;&nbsp; {{ getAllMemberNameList.membership_qrcode}} 	&nbsp;{{ getAllMemberNameList.membership_barcode}} </span> 
										
											 <input type="image" style="width: 36%;float: right;" src="<%=request.getContextPath()%>/resources/admin/img/logo-kadji.png"> 
								 	 
										 </th>
									 </tr>
									
									 
									
									
									</table>
												
								
				
											
								       
							</form>			
								
								
								
								</div>
											
						</div>
					</div>
				</div>
			</div>			
		</div><br>


	<!-- Create Group Modal-->
	<!-- Modal -->
	<div class="modal fade" id="CreateGroupModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Create New
						Group</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">в</span>
					</button>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
							<label> Group Name </label>
							<div class="form-group input-group ">
								<input type="text" class="form-control"
									placeholder="Group Name "> <span
									class="input-group-btn">
									<button style="border-radius: 0px 4px 4px 0px;"
										class="btn btn-primary" type="button">ADD</button>
								</span>
							</div>
						</div>
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

	<!-- Page level plugins -->
	<!--<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>-->

	<!-- Page level custom scripts -->
	<!--<script src="js/demo/datatables-demo.js"></script>-->



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