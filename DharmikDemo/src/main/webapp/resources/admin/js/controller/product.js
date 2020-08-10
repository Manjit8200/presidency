app.controller('ProductCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;

	$scope.formreset = function(){
		
		document.getElementById("myFormProduct").reset();
		}
	//---------------------------------------------------getAllCategoryName
	var link = baseUrl+'getAllCategoryName';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllCategoryNameList = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllCategoryNameList = "Response Fail";
	});
	
	//---------------------------------------------------getAllSubCategoryName	
var link = baseUrl+'getAllSubCategoryName';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllSubCategory = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllSubCategory = "Response Fail";
	});
	
	//---------------------------------------------------getAllTypeName	
	var link = baseUrl+'getAllTypeName';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAlltype = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAlltype = "Response Fail";
	});
	//---------------------------------------------------getAllLocation	
	var link = baseUrl+'getAllLocationName';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllLocation = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllLocation = "Response Fail";
	});	
	//---------------------------------------------------Add Tax Data	
	
	
	
	$scope.product="";
	$scope.addProductData = function(){
	
	if (!$scope.product.category_id) {		
	
			$scope.category_idError = 1;
			$scope.category_idMsg = "Select Category Name";
			document.getElementById("category_id").focus();	
			
		} 
	else if (!$scope.product.sub_category_id) {			
			$scope.sub_category_namecodeError = 1;
			$scope.sub_category_nameMsg = "Select SubCategory ";
			document.getElementById("sub_category_id").focus();				
		} 

		else if (!$scope.product.type_id) {			
			$scope.type_idcodeError = 1;
			$scope.type_idMsg = "Select Type ";
			document.getElementById("type_id").focus();				
		} 
		else if (!$scope.product.billing_group_id) {			
			$scope.billing_group_idcodeError = 1;
			$scope.billing_group_idMsg = "Select Billing Group ";
			document.getElementById("type_id").focus();				
		} 
		else if (!$scope.product.product_name) {			
			$scope.product_nameError = 1;
			$scope.product_nameMsg = "Enter Product Name ";
			document.getElementById("product_name").focus();				
		} 
		else if (!$scope.product.product_code) {			
			$scope.product_codeError = 1;
			$scope.product_codeMsg = "Enter Product Code ";
			document.getElementById("product_code").focus();				
		} 
		else if (!$scope.product.product_hsncode) {			
			$scope.product_hsncodecodeError = 1;
			$scope.product_hsncodeMsg = "Enter HSN Code ";
			document.getElementById("product_hsncode").focus();				
		} 
		
		else if (!$scope.product.price_type) {			
			$scope.price_typecodeError = 1;
			$scope.price_typeMsg = "Select Price type ";
			document.getElementById("price_type").focus();				
		} 
		else if (!$scope.product.subscription) {			
			$scope.subscriptioncodeError = 1;
			$scope.subscriptionMsg = "Enter subscription Price";
			document.getElementById("subscription").focus();				
		} 
		else if (!$scope.product.non_subscription) {			
			$scope.non_subscriptionError = 1;
			$scope.non_subscriptionMsg = "Enter non_subscription Price";
			document.getElementById("non_subscription").focus();				
		} 
		else if (!$scope.product.guest) {			
			$scope.guestError = 1;
			$scope.guestMsg = "Enter Guset Price ";
			document.getElementById("guest").focus();				
		} 
		else if (!$scope.product.visitor) {			
			$scope.visitorError = 1;
			$scope.visitorMsg = "Enter visitor Price ";
			document.getElementById("price_type").focus();				
		} 
		else if (!$scope.product.location_id) {			
			$scope.location_idError = 1;
			$scope.location_idMsg = "Select Location ";
			document.getElementById("location_id").focus();				
		} 
	
		
		
		
		
	else{
			var i;
		var link = baseUrl+'addProduct';	
	
		$scope.product.location_id = $scope.product.location_id.toString();
	
		$http({url: link, method: "POST", data: $scope.product}).success(function(data, status, headers, config) {
			$scope.product11 = data;	
		alert($scope.Taxtype.length);
		
			for(i=0;i<$scope.Taxtype.length;i++){
				
				var link = baseUrl+'addProductTax?product_id='+$scope.product11+'&tax_type='+$scope.Taxtype[i].tax_type+'&tax_value='+$scope.Taxtype[i].tax_value;		
	
					$http.post(link).success(function(data, status, headers, config) {
						$scope.addProductTaxData = data;

					}).error(function(data, status, headers, config) {
						 $scope.addProductTaxData = "Response Fail";
					});
				} 
			location.reload(true);
		 
			}).error(function(data, status, headers, config) {
				$scope.product = "Response Fail";
			});
			
	}		
			
		}



	
	//--------------------------------------------------- GET TAX ROW
	
	$scope.Taxtype = [];
	$scope.getTax = function(){

		
		for(var j=0;j<$scope.getAllMasterTax.length;j++){

	if($scope.getAllMasterTax[j].tax_type_id == $scope.tax_type){
		
		$scope.Taxtype.push({'tax_type_name':$scope.getAllMasterTax[j].tax_type_name,'tax_type':$scope.tax_type, 'tax_value':$scope.tax_value});		
			
	}
}
		$scope.tax_type="";
		$scope.tax_value="";
	}
	
	//----------------------------------------------------- Flag Function
	$scope.setflag = function(){
			
		$scope.category_idError = 0;
			$scope.sub_category_namecodeError = 0;	
			$scope.type_idcodeError = 0;
			$scope.billing_group_idcodeError = 0
			$scope.product_nameError = 0;
			$scope.product_codeError = 0;		
			$scope.product_hsncodecodeError = 0;			
			$scope.price_typecodeError = 0;	
			$scope.subscriptioncodeError = 0;	
			$scope.non_subscriptionError = 0;		
			$scope.guestError = 0;		
			$scope.visitorError = 0;		
			$scope.location_idError = 0;
			
		
			
			}

	
	var link = baseUrl+'getAllProductName';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllProductName = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllProductName = "Response Fail";
	});
	  // =====================================================getProduct By Id=======================================================
	
	$scope.getProductName = function(product_id){
		
		var location = new SlimSelect({
			select: '#location_id',
			});
	
		var link = baseUrl+'getProductById?product_id='+product_id;		

		$http.get(link).success(function(data, status, headers, config) {		
			
			$scope.product = data;	
			$scope.product_id=product_id;
			
		//	console.log($scope.product.location_id);
			$scope.location_name = $scope.product.location_id.split(',');
			alert($scope.location_name);
		$scope.product.location_id="";
			for(var i = 0; i < $scope.location_name.length; i++){
				
				location.set($scope.location_name[i]); 
			}
			
			
		}).error(function(data, status, headers, config) {
			$scope.product = "Response Fail";
		});
		
	};
	
	  // =====================================================get Product Tax=======================================================
		
	$scope.getProductTax = function(product_id){
		
		var link = baseUrl+'getAllProductTaxName?product_id='+product_id;	
		
	
		$http.get(link).success(function(data, status, headers, config) {		
			$scope.product_id=product_id;
				
			$scope.productTax = data;	
			
		
			
		}).error(function(data, status, headers, config) {
			$scope.productTax = "Response Fail";
		});
		
	};
	
	
	$scope.editProductData = function(product_id){
	
		/*if (!$scope.masterMemberPlan.plan_name) {			
			$scope.masterMemberPlanError = 1;
			$scope.masterMemberPlanMsg = "Enter Membership Plan";
			document.getElementById("plan_name").focus();	
			
		} else if (!$scope.masterMemberPlan.plan_amount) {			
			$scope.masterMemberPlanAmountError = 1;
			$scope.masterMemberPlanAmountMsg = "Enter Membership Amount";
			document.getElementById("plan_amount").focus();				
		} 
		
		else if (!$scope.masterMemberPlan.tenure_year) {			
			$scope.masterMembertenure_year = 1;
			$scope.masterMembertenure_yearMsg = "Select tenure Year";
			document.getElementById("tenure_year").focus();				
		}
		else if (!$scope.masterMemberPlan.redemption_amount) {			
			$scope.masterMemberRedemption_amountError = 1;
			$scope.masterMemberRedemption_amountMsg = "Enter Redemption Amount";
			document.getElementById("redemption_amount").focus();				
		}
		else if (!$scope.masterMemberPlan.redemption_validity) {			
			$scope.masterMemberRedemption_validityError = 1;
			$scope.masterMemberRedemption_validitytMsg = "Select redemption validity";
			document.getElementById("redemption_validity").focus();				
		}
		else if (!$scope.masterMemberPlan.foodvoucher_amount) {			
			$scope.masterMemberFoodvoucherAmountError = 1;
			$scope.masterMemberFoodvoucherAmountMsg = "Enter foodvoucher Amount";
			document.getElementById("foodvoucher_amount").focus();				
		}
		else if (!$scope.masterMemberPlan.foodvoucher_validity) {			
			$scope.masterMemberFoodvoucher_validityError = 1;
			$scope.masterMemberFoodvoucher_validityMsg = "Select foodvoucher validity";
			document.getElementById("foodvoucher_validity").focus();				
		}
		else{*/
		$scope.product.product_id=product_id;
		
		var link = baseUrl+'editProductName';	
		
		
		$http({url: link, method: "POST", data: $scope.product}).success(function(data, status, headers, config) {
	
			$scope.product_id=product_id;
			$scope.product = data;			
		  location.reload(true); 
			}).error(function(data, status, headers, config) {
				$scope.product = "Response Fail";
			});
		/*}*/
	};
	
	  // =====================================================deleteProduct=======================================================
		
	$scope.deleteProduct = function(product_id) {
		
		var link = baseUrl+'deleteProduct?product_id='+product_id;
		
		$http['delete'](link).success(function(data, status, headers, config) {
			$scope.product_id=product_id;
			$scope.productt = data;			
		  location.reload(true); 
			}).error(function(data, status, headers, config) {
				$scope.productt = "Response Fail";
			});
	};
	
	   // =====================================================Get MAster Tax JS =======================================================

	var link = baseUrl+'getMasterTaxName';  
	
				$http.get(link).success(function(data, status, headers, config) {
					$scope.getAllMasterTax = data;
					
					
				}).error(function(data, status, headers, config) {
					$scope.getAllMasterTax = "Response Fail";
				});
				
	//--------------------------------------------------- GET TAX ROW
				
				$scope.Taxtype = [];
				$scope.getTax = function(){

					
					for(var j=0;j<$scope.getAllMasterTax.length;j++){

				if($scope.getAllMasterTax[j].tax_type_id == $scope.tax_type){
					
					$scope.Taxtype.push({'tax_type_name':$scope.getAllMasterTax[j].tax_type_name,'tax_type':$scope.tax_type, 'tax_value':$scope.tax_value});		
						
				}
			}
					$scope.tax_type="";
					$scope.tax_value="";
				}
				
	  // =====================================================InsertProductTax =======================================================
	
	$scope.InsertProductTax = function(product_id) {
	
		var link = baseUrl+'InsertProductTax?product_id='+product_id+'&tax_type='+$scope.tax_type+'&tax_value='+$scope.tax_value;		
			
					$http.post(link).success(function(data, status, headers, config) {
						
						$scope.InsertProductTax11 = data;
						$scope.getProductTax(product_id);
						getProductTax(product_id);

					}).error(function(data, status, headers, config) {
						 $scope.InsertProductTax11 = "Response Fail";
					});
				
					
	}

	
	//--------------------------------------------------- Delete TAX ROW on Update Time
	$scope.deleteProductTax = function(product_tax_id) {
		
		var link = baseUrl+'deleteProductTax?product_tax_id='+product_tax_id;

		$http['delete'](link).success(function(data, status, headers, config) {
			$scope.deleteProductTax11 = data;	
			$scope.product_tax_id=product_tax_id;
		
			$scope.getProductTax($scope.product.product_id);
		
			}).error(function(data, status, headers, config) {
				$scope.deleteProductTax11 = "Response Fail";
			});
	};

//--------------------------------------------------- Delete TAX ROW
	
	$scope.removeRow = function(tax_type) {
		var index = -1;
		var comArr = eval( $scope.Taxtype);
	
		for( var i = 0; i < comArr.length; i++ ) {
		
			if( comArr[i].tax_type === tax_type ) {	
		
				index = i;
				break;
			}
		}
		if( index === -1 ) {
			alert( "Something gone wrong" );
		}
		$scope.Taxtype.splice(index, 1 );
	};
	
	
	//---------------------------------------------------addBillingGroup
	$scope.addBillingGroup = function (){

	$scope.spin=1;
	var link = baseUrl+'addBillingGroup';	

   $http({url: link, method: "POST", data:$scope.billingGroup}).success(function(data, status, headers, config) {
	$scope.billingGroupdata = data;	
	$scope.getAllBillingGroup();
	$('#myModalBilling').modal('hide');
	document.getElementById("billing").reset();
	$scope.spin=0;

  
	}).error(function(data, status, headers, config) {
		$scope.billingGroupdata = "Response Fail";
		$scope.spin=0;
	});
}
	
	
	//---------------------------------------------------getAllBillingGroup
	$scope.getAllBillingGroup = function (){
	var link = baseUrl+'getAllBillingGroup';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllBillingGroupName = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllBillingGroupName = "Response Fail";
	});
	}
});