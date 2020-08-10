app.controller('CategoryCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;


	
	$scope.addInsertRow=[];
	$scope.addRow = function() {
		console.log($scope.videoId);
		
		$scope.addInsertRow.push({'CategoryName':$scope.categoryName, 'CategoryCode':$scope.categoryCode, 'Description':$scope.description});
		
		$scope.categoryName="";
		$scope.categoryCode="";
		$scope.description="";
	};

	$scope.category="";
	$scope.addCategory = function(){
	 
	if (!$scope.category.category_name) {		
	
			$scope.category_nameError = 1;
			$scope.category_nameMsg = "Enter  Category Name";
			document.getElementById("category_name").focus();	
			
		} else if (!$scope.category.category_code) {			
			$scope.category_codeError = 1;
			$scope.category_codeMsg = "Enter Category Code";
			document.getElementById("category_code").focus();				
		} 

		else{	
			var link = baseUrl+'addCategory';		
			
			$http({url: link, method: "POST", data: $scope.category}).success(function(data, status, headers, config) {
				$scope.addCategory = data;			
			  location.reload(true); 
				}).error(function(data, status, headers, config) {
					$scope.addCategory = "Response Fail";
				});
				
			}
		}
	$scope.setflag = function(){
			
			$scope.category_nameError = 0;
			$scope.category_codeError = 0;
			
			}
	$scope.categorylist = function(){
		var link = baseUrl+'getAllCategoryName';  
		
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getAllMemberNameList = data;
			
		}).error(function(data, status, headers, config) {
			$scope.getAllMemberNameList = "Response Fail";
		});
		
	}
$scope.getCategoryName = function(category_id){
		
		var link = baseUrl+'getCategoryById?category_id='+category_id;	

		$http.get(link).success(function(data, status, headers, config) {			
			$scope.category_id=category_id;
			$scope.category = data;							
		}).error(function(data, status, headers, config) {
			$scope.category = "Response Fail";
		});
		
	};
	


	$scope.editCategory = function(category_id){
		
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
		
		var link = baseUrl+'editCategoryName?category_id='+category_id;	
		
		
		$http({url: link, method: "POST", data: $scope.category}).success(function(data, status, headers, config) {
			$scope.category_id=category_id;
			$scope.category = data;			
		  location.reload(true); 
			}).error(function(data, status, headers, config) {
				$scope.category = "Response Fail";
			});
		/*}*/
	};
	
	$scope.deleteCategory= function(category_id) {
		var link = baseUrl+'deleteCategory?category_id='+category_id;
		
		$http['delete'](link).success(function(data, status, headers, config) {
			$scope.category_id=category_id;
			$scope.deleteCategory = data;			
		  location.reload(true); 
			}).error(function(data, status, headers, config) {
				$scope.deleteCategory = "Response Fail";
			});
	}
	
	
	
});

