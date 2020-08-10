app.controller('CardCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;

	
	$scope.currentPage = 0;
	$scope.pageSize = 5;
	$scope.search = "";
	$scope.startindex = $scope.currentPage;
	$scope.pages = [5, 10, 20, 50, 100, 500,'All'];
	$scope.LastMemberId=0;
	$scope.getfamilyid="#";
	var link = baseUrl+'getMemberByPage?startindex='+$scope.startindex+'&pagesize='+$scope.pageSize;    
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllRegisterMemberNameList = data;
	}).error(function(data, status, headers, config) {
		$scope.getAllRegisterMemberNameList = "Response Fail";
	});
	
/*	$scope.changepage = function(){
		if($scope.pageSize != "All"){
			var link = baseUrl+'getMemberByPage?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;    
		
			$http.get(link).success(function(data, status, headers, config) {
				$scope.getAllRegisterMemberNameList = data;
				
			}).error(function(data, status, headers, config) {
				$scope.getAllRegisterMemberNameList = "Response Fail";
			});
			
		}else{
				var link = baseUrl+'getAllRegisterMemberName';  
	
				$http.get(link).success(function(data, status, headers, config) {
					$scope.getAllRegisterMemberNameList = data;
					
					
				}).error(function(data, status, headers, config) {
					$scope.getAllRegisterMemberNameList = "Response Fail";
				});
	
			
		}
		
	};
	*/
	var link = baseUrl+'getAllRegisterMemberName';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllRegisterMemberNameList = data;
		
		
	}).error(function(data, status, headers, config) {
		$scope.getAllRegisterMemberNameList = "Response Fail";
	});
	
$scope.getFamilyMemberById = function(members_family_id){
		
		var link = baseUrl+'getMemberFamilyById?members_family_id='+members_family_id;
		
		$http.get(link).success(function(data, status, headers, config) {
			$scope.familymemberdata = data;
			
			$scope.members_family_id=members_family_id;
		}).error(function(data, status, headers, config) {
			$scope.familymemberdata = "Response Fail";
		});
		
	};
	
	
	$scope.getUpdateFamilyMember = function(member_id){
		
		var link = baseUrl+'getMemberFamilyId?member_id='+member_id;
	
		$http.get(link).success(function(data, status, headers, config) {
			$scope.familymember = data;
			
		}).error(function(data, status, headers, config) {
			$scope.familymember = "Response Fail";
		});
		
	}
	
	

});