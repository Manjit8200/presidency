<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Add Product</title>

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

<script src="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.26.0/slimselect.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.26.0/slimselect.min.css" rel="stylesheet"></link>

<link href="<%=request.getContextPath() %>/resources/admin/css/toastr.min.css" rel="stylesheet"><%-- 
<script src="<%=request.getContextPath() %>/resources/admin/js/slimselect.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/admin/css/slimselect.min.css" rel="stylesheet"></link> --%>
<script	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/conf.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/product.js"></script>

	
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

<body id="page-top" ng-app="prc" ng-controller="ProductCtrl">

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
									<h6 class="m-0 font-weight-bold text-light">Add Product Details
									</h6>
								</a>
								<!-- Card Content - Collapse  class="collapse"-->
								<div class="collapse hide" id="collapseCardExample">
									<div class="card-body">


									<form class="" ng-submit="addProductData()" id="myFormProduct">

							
								   <div class="form-group row">
 						<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
							<label>Category Name  <span class="errormsg">*</span></label>
							<div class="form-group input-group ">
								<select class="form-control"  name="tenure_year" id="entitlement"  ng-change="setflag() || getAllBillingGroup()" ng-model="product.category_id">
													<option value="" selected> Select Category </option>
											<option ng-repeat="item in getAllCategoryNameList" value="{{item.category_id}}">{{item.category_name}}</option> 
										
													
									</select>

							</div>
							<p class="errormsg" ng-show="category_idError == 1">{{category_idMsg}}</p>
						</div>

										
								
						<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
							<label>Sub-Category Name  <span class="errormsg">*</span></label>
							<div class="form-group input-group ">
								<select class="form-control"  name="sub_category_id" id="sub_category_id" ng-change="setflag()" ng-model="product.sub_category_id">
													<option value="" selected> Select Sub-Category </option>
													<option ng-repeat="items in getAllSubCategory" value="{{items.sub_category_id}}">{{items.sub_category_name}}</option>
													
									</select>

							</div>
							<p class="errormsg" ng-show="sub_category_namecodeError == 1">{{sub_category_nameMsg}}</p>
						</div>
						
						<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
							<label>Type Name  <span class="errormsg">*</span></label>
							<div class="form-group input-group ">
								<select class="form-control"  name="type_id" id="type_id" ng-change="setflag()" ng-model="product.type_id">
													<option value="" selected> Select Type  </option>
										<option ng-repeat="item1 in getAlltype" value="{{item1.type_id}}">{{item1.type_name}}</option> 
																				
									</select>
							</div>
							<p class="errormsg" ng-show="type_idcodeError == 1">{{type_idMsg}}</p>
						</div>
												<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
							<label>Billing Group  <span class="errormsg">*</span></label>
							<div class="form-group input-group ">
								<select class="form-control"  name="billing_group_id" id="billing_group_id" ng-change="setflag()"  ng-model="product.billing_group_id">
													<option value="" selected> Select Billing Group  </option>
													<option ng-repeat="items in getAllBillingGroupName" value="{{items.billing_group_id}}">{{items.billing_group__name}}</option>
																					
									</select>
									 <span class="input-group-btn">
									<button style="border-radius: 4px 4px 4px 4px;" title="Add new Batch" data-toggle="modal" data-target="#myModalBilling"  class="btn btn-primary" type="button">
										<i class="fa fa-plus"></i>
									</button>
								</span>
							</div>
							<p class="errormsg" ng-show="billing_group_idcodeError == 1">{{billing_group_idMsg}}</p>
						</div>
								
							
									
								</div>

								<div class="row form-group">
										
									<div class="col-lg-3"  >
									    	<label>Product Title <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter Product Title" ng-change="setflag()" ng-model="product.product_name" id="product_name" name="product_name" type="text">
											<p class="errormsg" ng-show="product_nameError == 1">{{product_nameMsg}}</p>
										</div>
									<div class="col-lg-2">
									    	<label>Product Code  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter Product Code" ng-change="setflag()" ng-model="product.product_code" id="product_code" name="product_code" type="text">
											<p class="errormsg" ng-show="product_codeError == 1">{{product_codeMsg}}</p>
										</div>
						
										
										<div class="col-lg-2"  >
									    	<label>HSN Code<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter HSN Code" ng-change="setflag()" ng-model="product.product_hsncode" id="product_hsncode" name="product_hsncode" type="text">
											<p class="errormsg" ng-show="product_hsncodecodeError == 1">{{product_hsncodeMsg}}</p>
										</div>
										<div class="col-lg-5">
									    	<label>Description </label> 
											<input class="form-control" placeholder="Enter Description" ng-model="product.product_desc" id="product_desc"  name="product_desc" type="text">
										
										</div>
										
								</div>
						 <hr>		
					<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
									<h3 class="box-title" style="color:#4A2818;"> Price Details </h3>
							</div>
											
								<div class="row form-group">
										
									<div class="col-lg-3"  >
									    	<label>Price <span class="errormsg">*</span></label> 
											<select class="form-control"  name="price_type" id="price_type"  ng-change="setflag()" ng-model="product.price_type">
													<option value="" selected> Select price   </option>
													<option value="1"> Inclusive</option>
													<option value="2"> Exclusive</option>
																					
									</select>
											<p class="errormsg" ng-show="price_typecodeError == 1">{{price_typeMsg}}</p>
										</div>
									<div class="col-lg-2">
									    	<label>Subscription  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Subscription  " ng-change="setflag()" ng-model="product.subscription" id="subscription" name="subscription" type="number">
											<p class="errormsg" ng-show="subscriptioncodeError == 1">{{subscriptionMsg}}</p>
										</div>
						
										
										<div class="col-lg-2"  >
									    	<label>Non Subscription<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Non Subscription " ng-change="setflag()" ng-model="product.non_subscription" id="totalAmount" type="number">
											<p class="errormsg" style="white-space:nowrap;"ng-show="non_subscriptionError == 1">{{non_subscriptionMsg}}</p>
										</div>
										<div class="col-lg-2">
									    	<label>Guest <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Guest Amount" ng-change="setflag()" ng-model="product.guest" id="guest" name="guest" type="number">
											<p class="errormsg" ng-show="guestError == 1">{{guestMsg}}</p>
										</div>
										<div class="col-lg-2">
									    	<label>Visitor <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Visitor Amount" ng-change="setflag()" ng-model="product.visitor" id="visitor" name="visitor" type="number">
											<p class="errormsg" ng-show="visitorError == 1">{{visitorMsg}}</p>
										</div>
								</div>
								 <hr>
					<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
									<h3 class="box-title" style="color:#4A2818;"> Location </h3>
							</div>	
									   <div class="form-group row">
										<div class="col-lg-5">
									    	<label>Location <span class="errormsg">*</span></label> 
											
											<select class="form-control select2" style="width:100%;"ng-change="setflag()" placeholder="Select" style="border:1px solid #d1d3e2;" name="location_id" id="location_id" multiple  ng-model="product.location_id" >
													<option value="" selected> Select Location </option>
													<option ng-repeat="item2 in getAllLocation" value="{{item2.location_name}}">{{item2.location_name}}</option>
												
								                   	
													 
												</select>
											<p class="errormsg" ng-show="location_idError == 1">{{location_idMsg}}</p>
										</div>	
							</div>		
								<hr>
						<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
									<h3 class="box-title" style="color:#4A2818;"> Tax Information </h3>
							</div>		
									
							<div class="form-group row">

  									    <div class="col-lg-3 " >
									    	<label>Tax Type <span class="errormsg">*</span></label> 
											<select class="form-control input-lg2" nid="tax_type" ng-model="tax_type" >
													<option value="" selected> Select GST Type</option>
										 <option ng-repeat="item2 in getAllMasterTax" value="{{item2.tax_type_id}}">{{item2.tax_type_name}}</option>		
											</select>
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										
										<div class="col-lg-3"  >
									    	<label>Tax Value<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter GST Value*" ng-model="tax_value" id="totalAmount" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										
										
											<div class="col-md-2">
													<div class="form-group"><br>
														<a ng-click="getTax() || TaxRow() " class="btn btn-primary" style="color:white;"><span class="fa fa-plus" style="font-size: 14px;"></span>&nbsp;Add</a>
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
								
											<div class="form-group row" style="margin-top:15px;">

												<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<button type="submit"  class="btn btn-md btn-success btn-block">
														Submit </button>
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
									<h6 class="m-0 font-weight-bold text-primary">All Products</h6>
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
															<th style="width: 20%">Product </th>
															<th style="width: 20%">Category </th>
															
															<th style="width: 20%">Sub-Category Name</th>
															<th style="width: 20%">Type Name</th>
															
														
															<th class="text-center">Del.</th>
														</tr>
													</thead>


													<tbody>

													<tr ng-repeat="item in getAllProductName">
															<td  style="width: 5%">{{$index+1 }}</td>
															<td data-toggle="modal" data-target="#myModal" ng-click="getProductName(item.product_id) || getProductTax(item.product_id)">{{item.product_name}} </td>
														
															<td  data-toggle="modal" data-target="#myModal" ng-click="getProductName(item.product_id) || getProductTax(item.product_id) " >{{item.category_name}}</td>
															
															<td data-toggle="modal" data-target="#myModal" ng-click="getProductName(item.product_id) || getProductTax(item.product_id) " >{{item.sub_category_name}}</td>
															<td data-toggle="modal" data-target="#myModal" ng-click="getProductName(item.product_id) || getProductTax(item.product_id) " >{{item.type_name}} </td>
														
														 	<td> <center>
														<a ng-click="deleteProduct(item.product_id)" style="cursor: pointer;" class="btn btn-danger">
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
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">Edit Product Details</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							
							</div>
							<div class="modal-body">
								
					<form class="" ng-submit="editProductData(product_id)">

							
								   <div class="form-group row">
 						<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
							<label>Category Name  <span class="errormsg">*</span></label>
							<div class="form-group input-group ">
								<select class="form-control"  name="tenure_year" id="entitlement"  ng-change="setflag()" ng-model="product.category_id">
													<option value="" selected> Select Category </option>
											<option ng-repeat="item in getAllCategoryNameList" value="{{item.category_id}}">{{item.category_name}}</option> 
										
													
									</select>

							</div>
							<p class="errormsg" ng-show="category_idError == 1">{{category_idMsg}}</p>
						</div>

										
								
						<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
							<label>Sub-Category Name  <span class="errormsg">*</span></label>
							<div class="form-group input-group ">
								<select class="form-control"  name="sub_category_id" id="sub_category_id" ng-change="setflag()" ng-model="product.sub_category_id">
													<option value="" selected> Sub-Category </option>
													<option ng-repeat="items in getAllSubCategory" value="{{items.sub_category_id}}">{{items.sub_category_name}}</option>
													
									</select>

							</div>
							<p class="errormsg" ng-show="sub_category_namecodeError == 1">{{sub_category_nameMsg}}</p>
						</div>
						
						<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
							<label>Type Name  <span class="errormsg">*</span></label>
							<div class="form-group input-group ">
								<select class="form-control"  name="type_id" id="type_id" ng-change="setflag()" ng-model="product.type_id">
													<option value="" selected> Select Type  </option>
										<option ng-repeat="item1 in getAlltype" value="{{item1.type_id}}">{{item1.type_name}}</option> 
																				
									</select>
							</div>
							<p class="errormsg" ng-show="type_idcodeError == 1">{{type_idMsg}}</p>
						</div>
												<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
							<label>Billing Group  <span class="errormsg">*</span></label>
							<div class="form-group input-group ">
								<select class="form-control"  name="billing_group_id" id="billing_group_id" ng-change="setflag()"  ng-model="product.billing_group_id">
													<option value="" selected> Billing Group  </option>
													<option value="1"> Group 1</option>
													<option value="2"> Group 2</option>
													<option value="3"> Group 3</option>
													<option value="4"> Group 4</option>											
									</select>
							</div>
							<p class="errormsg" ng-show="billing_group_idcodeError == 1">{{billing_group_idMsg}}</p>
						</div>
								
							
									
								</div>

								<div class="row form-group">
										
									<div class="col-lg-3"  >
									    	<label>Product Title <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter Product Title" ng-change="setflag()" ng-model="product.product_name" id="product_name" name="product_name" type="text">
											<p class="errormsg" ng-show="product_nameError == 1">{{product_nameMsg}}</p>
										</div>
									<div class="col-lg-3">
									    	<label>Product Code  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Product Code" ng-change="setflag()" ng-model="product.product_code" id="product_code" name="product_code" type="text">
											<p class="errormsg" ng-show="product_codeError == 1">{{product_codeMsg}}</p>
										</div>
						
										
										<div class="col-lg-2"  >
									    	<label>HSN Code<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="HSN Code" ng-change="setflag()" ng-model="product.product_hsncode" id="product_hsncode" name="product_hsncode" type="text">
											<p class="errormsg" ng-show="product_hsncodecodeError == 1">{{product_hsncodeMsg}}</p>
										</div>
										<div class="col-lg-4">
									    	<label>Description </label> 
											<input class="form-control" placeholder="Enter Description" ng-model="product.product_desc" id="product_desc"  name="product_desc" type="text">
										
										</div>
										
								</div>
						 <hr>		
					<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
									<h3 class="box-title" style="color:#4A2818;"> Price Details </h3>
							</div>
											
								<div class="row form-group">
										
									<div class="col-lg-4"  >
									    	<label>Price <span class="errormsg">*</span></label> 
											<select class="form-control"  name="price_type" id="price_type"  ng-change="setflag()" ng-model="product.price_type">
													<option value="" selected> Select price   </option>
													<option value="1"> Inclusive</option>
													<option value="2"> Exclusive</option>
																					
									</select>
											<p class="errormsg" ng-show="price_typecodeError == 1">{{price_typeMsg}}</p>
										</div>
									<div class="col-lg-4">
									    	<label>Subscription  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Subscription  " ng-change="setflag()" ng-model="product.subscription" id="subscription" name="subscription" type="number">
											<p class="errormsg" ng-show="subscriptioncodeError == 1">{{subscriptionMsg}}</p>
										</div>
						<div class="col-lg-4"  >
									    	<label>Non Subscription<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Non Subscription " ng-change="setflag()" ng-model="product.non_subscription" id="totalAmount" type="number">
											<p class="errormsg" style="white-space:nowrap;"ng-show="non_subscriptionError == 1">{{non_subscriptionMsg}}</p>
										</div>
										
										
								</div>
								<div class="row form-group">
								
										<div class="col-lg-4">
									    	<label>Guest <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Guest Amount" ng-change="setflag()" ng-model="product.guest" id="guest" name="guest" type="number">
											<p class="errormsg" ng-show="guestError == 1">{{guestMsg}}</p>
										</div>
										<div class="col-lg-4">
									    	<label>Visitor <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Visitor Amount" ng-change="setflag()" ng-model="product.visitor" id="visitor" name="visitor" type="number">
											<p class="errormsg" ng-show="visitorError == 1">{{visitorMsg}}</p>
										</div>
									</div>	
								 <hr>
					<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
									<h3 class="box-title" style="color:#4A2818;"> Location </h3>
							</div>	
									   <div class="form-group row">
										<div class="col-lg-5">
									    	<label>Location <span class="errormsg">*</span></label> 
											<div class="form-group input-group">
												<select id="location_id" ng-model="product.location_id" ng-options="obj.location_name as obj.location_name for obj in getAllLocation" ng-change="setDays(daysEdit)" multiple>
												</select>
											</div>
											<!-- <select class="form-control " style="width:100%;"ng-change="setflag()" ng-options="obj.location_name as obj.location_name for obj in getAllLocation" placeholder="Select" style="border:1px solid #d1d3e2;" name="location_id" id="location_id" multiple  ng-model="product.location_id" >
													 
												</select> -->
												
												
									
											<p class="errormsg" ng-show="location_idError == 1">{{location_idMsg}}</p>
										</div>	
				
 										</div>	
 										<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
									<h3 class="box-title" style="color:#4A2818;"> Tax Information </h3>
							</div>
 										
 									<div class="form-group row">

  									    <div class="col-lg-3 " >
									    	<label>Tax Type <span class="errormsg">*</span></label> 
											<select class="form-control input-lg2" name="eventDrop" id="eventDrop" ng-model="tax_type" >
													<option value="" selected> Select GST Type</option>
												 <option ng-repeat="item2 in getAllMasterTax" value="{{item2.tax_type_id}}">{{item2.tax_type_name}}</option>
			
												</select>
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										
										<div class="col-lg-3"  >
									    	<label>Tax Value<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter GST Value*" ng-model="tax_value" id="totalAmount" type="text">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										
										
										  
  											<div class="col-md-2">
													<div class="form-group"><br>
														<a ng-click="InsertProductTax(product_id) "  class="btn btn-primary" style="color:white;"><span class="fa fa-plus" style="font-size: 14px;"></span>&nbsp;Add</a>
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

														<tr ng-repeat="item4 in productTax" >
														
															<td style="width: 5%">{{$index + 1}}</td>
															<td style="width: 25%"> {{item4.tax_type_name}} </td>
															
															<td style="width: 25%"> {{item4.tax_value}} </td>
															
														 	<td> <center>
														<a ng-click="deleteProductTax(item4.product_tax_id)" style="cursor: pointer;" class="btn btn-danger">
															<i class="fa fa-trash" style="color:white;" aria-hidden="true" data-toggle="tooltip" ></i>
														</a>	</center></td>
														</tr>

													
													</tbody>

												</table>
											</div>
										</div>
									</div>		
										<div class="form-group row" style="margin-top:15px;">

												<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<button type="submit"  class="btn btn-md btn-success btn-block">
														Update  </button>
												</div>

											</div>



										</form>


					</div>
						
								
								
								</div>
											
						</div>
					</div>
				</div>
		

<!-- ----------------------------------------------------Billing Group Modal-->
			<div class="container">
			<form id="billing">
				<div class="modal fade" id="myModalBilling" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
							<h4 class="modal-title">Add Billing Group</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								
							</div>
							<div class="modal-body">
								<div class="form-group row ">
								
											<div class="col-lg-6">
											  <label >Billing Group Title <span class="star" style="color:red">*</span></label>
											  <input type="text" class="form-control" name="firstName"  ng-model="billingGroup.billing_group__name" placeholder="Enter Billing Group Title" autocomplete="nope" required>								  
											</div>
											<div class="col-lg-6">
											  <label >Billing Group Code </label>
											  <input type="text" class="form-control" name="firstName"  ng-model="billingGroup.billing_group_code" placeholder="Enter Billing Group Code" autocomplete="nope" >								  
											</div>
							</div>
							<div class="form-group row">
								
											<div class="col-lg-6">
											  <label >HSN / SAC </label>
											  <input type="text" class="form-control" name="firstName"  ng-model="billingGroup.billing_group_hsn" placeholder="Enter HSN / SAC" autocomplete="nope" >								  
											</div>
											<div class="col-lg-6">
											  <label >Billing Group Title </label>
											  <input type="text" class="form-control" name="firstName"  ng-model="billingGroup.billing_group_title " placeholder="Enter GST Rate" autocomplete="nope" >								  
											</div>
							</div>
							<div class="form-group row">
								
											<div class="col-lg-12">
											  <label >Description</label>
											  <input type="text" class="form-control" name="firstName"  ng-model="billingGroup.billing_group_desc" placeholder="Enter Description" autocomplete="nope" >								  
											</div>
											
							</div>
							<br>
							<hr>
								
								<div class="row">									
												
											<div class="col-lg-12 ">
														<button ng-click="addBillingGroup()" class="btn btn-success tablinks "><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Save </button>
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
	<script>
$('.select2').select2();
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

	<link
		href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css"
		rel="stylesheet" />

	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

<script>

$(document).ready(function () {
	/* $(".select2").select2(); */
	// create DateTimePicker from input HTML element
	$("#fromdatetimepicker").kendoDatePicker({
		format: "dd/MM/yyyy",
		value: new Date(),
		dateInput: true
	});

	$("#fromdatetimepicker1").kendoDatePicker({
		format: "dd/MM/yyyy",
		
		dateInput: true
	});

	$("#fromdatetimepicker2").kendoDatePicker({
		format: "dd/MM/yyyy",
		
		dateInput: true
	});

	$("#fromdatetimepicker3").kendoDatePicker({
		format: "dd/MM/yyyy",
		
		dateInput: true
	});
	
	});

</script>

</body>

</html>