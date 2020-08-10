app.controller('TypeCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;



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
$scope.type="";
	$scope.addType = function(){
	if (!$scope.type.category_id) {		
	
			$scope.category_idError = 1;
			$scope.category_idMsg = "Select Category Name";
			document.getElementById("category_id").focus();	
			
		} 
		else if (!$scope.type.sub_category_id) {			
			$scope.sub_category_namecodeError = 1;
			$scope.sub_category_nameMsg = "Select SubCategory ";
			document.getElementById("sub_category_id").focus();				
		} 
		else if (!$scope.type.type_name) {			
			$scope.type_nameError = 1;
			$scope.type_nameMsg = "Enter type name ";
			document.getElementById("type_name").focus();				
		} 
	 else if (!$scope.type.type_code) {			
			$scope.type_codeError = 1;
			$scope.type_codeMsg = "Enter type code";
			document.getElementById("type_code").focus();				
		} 
		
		else{
		
		var link = baseUrl+'addType';		
		
		$http({url: link, method: "POST", data: $scope.type}).success(function(data, status, headers, config) {
			$scope.type = data;			
		  location.reload(true); 
			}).error(function(data, status, headers, config) {
				$scope.type = "Response Fail";
			});
		  }
		}
	$scope.setflag = function(){
			
			$scope.category_idError = 0;
			$scope.sub_category_namecodeError = 0;
			$scope.type_nameError = 0;
			$scope.type_codeError = 0;
			
			}

	$scope.typelist = function(){
		var link = baseUrl+'getAllTypeName';  
		
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getAlltypeNameList = data;
			
		}).error(function(data, status, headers, config) {
			$scope.getAlltypeNameList = "Response Fail";
		});
		
	}
	
$scope.getTypeName = function(type_id){
		
		var link = baseUrl+'getTypeById?type_id='+type_id;	

		$http.get(link).success(function(data, status, headers, config) {			
			$scope.type_id=type_id;
			$scope.type = data;							
		}).error(function(data, status, headers, config) {
			$scope.type = "Response Fail";
		});
		
	};
	
	
	$scope.type="";
	$scope.editType = function(type_id){
		if (!$scope.type.category_id) {		
	
			$scope.category_idError = 1;
			$scope.category_idMsg = "Select Category Name";
			document.getElementById("category_id").focus();	
			
		} 
		else if (!$scope.type.sub_category_id) {			
			$scope.sub_category_namecodeError = 1;
			$scope.sub_category_nameMsg = "Select SubCategory ";
			document.getElementById("sub_category_id").focus();				
		} 
		else if (!$scope.type.type_name) {			
			$scope.type_nameError = 1;
			$scope.type_nameMsg = "Enter type name ";
			document.getElementById("type_name").focus();				
		} 
	 else if (!$scope.type.type_code) {			
			$scope.type_codeError = 1;
			$scope.type_codeMsg = "Enter type code";
			document.getElementById("type_code").focus();				
		} 
		
		else{
		
		
		var link = baseUrl+'editTypeName?type_id='+type_id;	
		
		
		$http({url: link, method: "POST", data: $scope.type}).success(function(data, status, headers, config) {
			$scope.type_id=type_id;
			$scope.type = data;			
		  location.reload(true); 
			}).error(function(data, status, headers, config) {
				$scope.type = "Response Fail";
			});
		}
	};
		
	$scope.deleteType= function(type_id) {
		var link = baseUrl+'deleteType?type_id='+type_id;
		
		$http['delete'](link).success(function(data, status, headers, config) {
			$scope.type_id=type_id;
			$scope.type = data;			
		  location.reload(true); 
			}).error(function(data, status, headers, config) {
				$scope.type = "Response Fail";
			});
	}
	
	

	
});