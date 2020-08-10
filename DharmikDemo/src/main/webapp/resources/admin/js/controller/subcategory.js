
app.controller('SubCategoryCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;

$scope.subcategory="";
	$scope.addSubCategory = function(){
	
	
	if (!$scope.subcategory.category_id) {		
	
			$scope.category_idError = 1;
			$scope.category_idMsg = "Select Category Name";
			document.getElementById("category_id").focus();	
			
		} else if (!$scope.subcategory.sub_category_name) {			
			$scope.sub_category_namecodeError = 1;
			$scope.sub_category_nameMsg = "Enter SubCategory ";
			document.getElementById("sub_category_name").focus();				
		} 
	else if (!$scope.subcategory.sub_category_code) {			
			$scope.sub_category_codecodeError = 1;
			$scope.sub_category_codeMsg = "Enter SubCategory code";
			document.getElementById("sub_category_code").focus();				
		} 
		else{	
	
	
		var link = baseUrl+'addSubCategory';		
		
		$http({url: link, method: "POST", data: $scope.subcategory}).success(function(data, status, headers, config) {
			$scope.subcategory = data;			
		  location.reload(true); 
			}).error(function(data, status, headers, config) {
				$scope.subcategory = "Response Fail";
			});
			
			}
		}
		
		$scope.setflag = function(){
			
			$scope.category_idError = 0;
			$scope.sub_category_namecodeError = 0;
			$scope.sub_category_codecodeError = 0;
			
			}

	$scope.subcategorylist = function(){
		var link = baseUrl+'getAllSubCategoryName';  
		
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getAllSubCategoryNameList = data;
			
		}).error(function(data, status, headers, config) {
			$scope.getAllSubCategoryNameList = "Response Fail";
		});
		
	}
	

		var link = baseUrl+'getAllCategoryName';  
		
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getAllCategoryNameList = data;
			
		}).error(function(data, status, headers, config) {
			$scope.getAllCategoryNameList = "Response Fail";
		});
		

$scope.getSubCategoryName = function(sub_category_id){
		
		var link = baseUrl+'getSubCategoryById?sub_category_id='+sub_category_id;	
		
		$http.get(link).success(function(data, status, headers, config) {
			$scope.subcategory = data;
			$scope.subcategory.sub_category_id=sub_category_id;
		

		}).error(function(data, status, headers, config) {
			$scope.category = "Response Fail";
		});
		
	};
	
	
	$scope.subcategory="";
	$scope.editCategory = function(sub_category_id){
		
	if (!$scope.subcategory.category_id) {		
	
			$scope.category_idError = 1;
			$scope.category_idMsg = "Select Category Name";
			document.getElementById("category_id").focus();	
			
		} else if (!$scope.subcategory.sub_category_name) {			
			$scope.sub_category_namecodeError = 1;
			$scope.sub_category_nameMsg = "Enter SubCategory ";
			document.getElementById("sub_category_name").focus();				
		} 
	else if (!$scope.subcategory.sub_category_code) {			
			$scope.sub_category_codecodeError = 1;
			$scope.sub_category_codeMsg = "Enter SubCategory code";
			document.getElementById("sub_category_code").focus();				
		} 
		else{
		
		var link = baseUrl+'editSubCategoryName?sub_category_id='+sub_category_id;	
		
		
		$http({url: link, method: "POST", data: $scope.subcategory}).success(function(data, status, headers, config) {
			$scope.sub_category_id=sub_category_id;
			$scope.subcategory = data;	
			
		  location.reload(true); 
			}).error(function(data, status, headers, config) {
				$scope.subcategory = "Response Fail";
			});
		}
	};
		
	$scope.deleteSubCategory= function(sub_category_id) {
		var link = baseUrl+'deleteSubcategory?sub_category_id='+sub_category_id;
		
		$http['delete'](link).success(function(data, status, headers, config) {
			$scope.sub_category_id=sub_category_id;
			$scope.subcategory = data;			
		  location.reload(true); 
			}).error(function(data, status, headers, config) {
				$scope.subcategory = "Response Fail";
			});
	}
	
	

	
});