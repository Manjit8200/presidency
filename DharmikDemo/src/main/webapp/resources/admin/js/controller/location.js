app.controller('LocationCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;
	$scope.BatchStartTime = "06:00";
	$scope.BatchEndTime = "07:00";
	$scope.currentPage = 0;
	$scope.pageSize = 5;
	$scope.search = "";
	$scope.startindex = $scope.currentPage;
	$scope.pages = [5, 10, 20, 50, 100, 500,'All'];
	
	var link = baseUrl+'getMasterMemberPlanByPage?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllMemberNameList = data;
	}).error(function(data, status, headers, config) {
		$scope.getAllMemberNameList = "Response Fail";
	});
	
	$scope.changepage = function(){
		if($scope.pageSize != "All"){
			var link = baseUrl+'getMasterMemberPlanByPage?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;    
			
			$http.get(link).success(function(data, status, headers, config) {
				$scope.getAllMemberNameList = data;
			}).error(function(data, status, headers, config) {
				$scope.getAllMemberNameList = "Response Fail";
			});
			
		}else{
			var link = baseUrl+'getAllLocationName';  
			
			$http.get(link).success(function(data, status, headers, config) {
				$scope.getAllMemberNameList = data;
				
			}).error(function(data, status, headers, config) {
				$scope.getAllMemberNameList = "Response Fail";
			});
			
		}
		
	};
	
	$scope.locationlist = function(){
		var link = baseUrl+'getAllLocationName';  
		
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getAllMemberNameList = data;
			
		}).error(function(data, status, headers, config) {
			$scope.getAllMemberNameList = "Response Fail";
		});
		
	}
	$scope.location="";
		$scope.addLocation = function(){
		
/*			if (!$scope.location.location_name) {			
				$scope.masterMemberPlanError = 1;
				$scope.masterMemberPlanMsg = "Enter Membership Plan";
				document.getElementById("plan_name").focus();	
				
			} else if (!$scope.location.location_code) {			
				$scope.masterMemberPlanAmountError = 1;
				$scope.masterMemberPlanAmountMsg = "Enter Membership Amount";
				document.getElementById("plan_amount").focus();				
			} 
			
			else if (!$scope.location.location_mobile_no) {			
				$scope.masterMembertenure_year = 1;
				$scope.masterMembertenure_yearMsg = "Select tenure Year";
				document.getElementById("tenure_year").focus();				
			}
			else if (!$scope.location.location_phone_no) {			
				$scope.masterMemberRedemption_amountError = 1;
				$scope.masterMemberRedemption_amountMsg = "Enter Redemption Amount";
				document.getElementById("redemption_amount").focus();				
			}
			
	
			else {
			*/
			var link = baseUrl+'addLocation';		
			
			$http({url: link, method: "POST", data: $scope.location}).success(function(data, status, headers, config) {
				$scope.addLocation = data;			
			  location.reload(true); 
				}).error(function(data, status, headers, config) {
					$scope.addLocation = "Response Fail";
				});
			}

	/*	}*/
		
		$scope.setflag = function(){
			$scope.masterMemberPlanError = 0;
			$scope.masterMemberPlanAmountError = 0;
			$scope.masterMembertenure_year = 0;
			$scope.masterMemberRedemption_amountError = 0;
			$scope.masterMemberRedemption_validityError = 0;
			$scope.masterMemberFoodvoucherAmountError = 0;
			$scope.masterMemberFoodvoucher_validityError = 0;
		}
		
	
		$scope.getLocationName = function(location_id){
			
			var link = baseUrl+'getLocationById?location_id='+location_id;		
			$http.get(link).success(function(data, status, headers, config) {			
				$scope.location_id=location_id;
				$scope.location = data;							
			}).error(function(data, status, headers, config) {
				$scope.location = "Response Fail";
			});
			
		};
		
		$scope.editMasterMemberPlan = function(location_id){
			
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
			
			var link = baseUrl+'editLocationName?location_id='+location_id;	
			
			
			$http({url: link, method: "POST", data: $scope.location}).success(function(data, status, headers, config) {
				$scope.location_id=location_id;
				$scope.location = data;			
			  location.reload(true); 
				}).error(function(data, status, headers, config) {
					$scope.location = "Response Fail";
				});
			/*}*/
		};
		
		
		$scope.deleteLocation = function(location_id) {
			var link = baseUrl+'deleteLocation?location_id='+location_id;
			
			$http['delete'](link).success(function(data, status, headers, config) {
				$scope.location_id=location_id;
				$scope.deleteLocation = data;			
			  location.reload(true); 
				}).error(function(data, status, headers, config) {
					$scope.deleteLocation = "Response Fail";
				});
		}
		
		
		
});