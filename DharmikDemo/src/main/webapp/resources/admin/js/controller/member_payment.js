app.controller('ProductCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;
   
   
   		
   		$scope.memberPayemnt = function (){
   		
   			var i;
		var link = baseUrl+'addMemberPayment';		
		
		$http({url: link, method: "POST", data: $scope.memberPayment}).success(function(data, status, headers, config) {
			$scope.memberPayment = data;	
			
			for(i=0;i<$scope.addInsertRow.length;i++){
				
				var link = baseUrl+'addMemberPaymentTax?member_id='+$scope.product+'&tax_type='+$scope.addInsertRow[i].tax_type+'&tax_value='+$scope.addInsertRow[i].tax_value;		
			
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
			
			$scope.addInsertRow=[];
	$scope.addRow = function() {
	
		
		$scope.addInsertRow.push({'tax_type':$scope.tax_type, 'tax_value':$scope.tax_value});		
			
			
		$scope.tax_type="";
		$scope.tax_value="";
		
	};
	
	
   
   
   
   });