app.controller('MasterPlanCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;


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
			var link = baseUrl+'getAllMemberName';  
			
			$http.get(link).success(function(data, status, headers, config) {
				$scope.getAllMemberNameList = data;
				
			}).error(function(data, status, headers, config) {
				$scope.getAllMemberNameList = "Response Fail";
			});
			
		}
		
	};
	
	
	$scope.masterMemberPlan="";
		$scope.addMasterPlan = function(){
		
			if (!$scope.masterMemberPlan.plan_name) {			
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
	
	
			else {
			
			var link = baseUrl+'addMasterPlan';		
			
			$http({url: link, method: "POST", data: $scope.masterMemberPlan}).success(function(data, status, headers, config) {
				$scope.adduser = data;			
			  location.reload(true); 
				}).error(function(data, status, headers, config) {
					$scope.getState = "Response Fail";
				});
			}

		}
		
		$scope.setflag = function(){
			$scope.masterMemberPlanError = 0;
			$scope.masterMemberPlanAmountError = 0;
			$scope.masterMembertenure_year = 0;
			$scope.masterMemberRedemption_amountError = 0;
			$scope.masterMemberRedemption_validityError = 0;
			$scope.masterMemberFoodvoucherAmountError = 0;
			$scope.masterMemberFoodvoucher_validityError = 0;
		}
		
	
		$scope.getMasterPlan = function(plan_id){
			
			var link = baseUrl+'getAllMemberNameById?plan_id='+plan_id;		
			$http.get(link).success(function(data, status, headers, config) {			
				$scope.plan_id=plan_id;
				$scope.masterMemberPlan = data;							
			}).error(function(data, status, headers, config) {
				$scope.getAllMemberName = "Response Fail";
			});
			
		};
		
		$scope.editMasterMemberPlan = function(plan_id){
			
			if (!$scope.masterMemberPlan.plan_name) {			
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
			else{
			
			var link = baseUrl+'editMasterMemberPlan?plan_id='+plan_id;	
			
			
			$http({url: link, method: "POST", data: $scope.masterMemberPlan}).success(function(data, status, headers, config) {
				$scope.plan_id=plan_id;
				$scope.editMasterMemberPlan = data;			
			  location.reload(true); 
				}).error(function(data, status, headers, config) {
					$scope.editMasterMemberPlan = "Response Fail";
				});
			}
		};
		
		
		$scope.deleteMasterMemberPlan = function(plan_id) {
			var link = baseUrl+'deleteMasterMemberPlan?plan_id='+plan_id;
			
			$http['delete'](link).success(function(data, status, headers, config) {
				$scope.plan_id=plan_id;
				$scope.deleteMasterMemberPlan = data;			
			  location.reload(true); 
				}).error(function(data, status, headers, config) {
					$scope.deleteMasterMemberPlan = "Response Fail";
				});
		}
		
		
		
});