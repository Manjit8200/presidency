app.controller('StafUser', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;


		//---------------------------------------------------getAllLocation	
	var link = baseUrl+'getAllLocationName';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllLocation = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllLocation = "Response Fail";
	});	
	
	//---------------------------------------------------addStafUser

	$scope.addStafUser = function(){
		
		
		var valuex = document.getElementById("valuex").value;
		var valuey = document.getElementById("valuey").value;
		var valuew = document.getElementById("valuew").value;
		var valueh = document.getElementById("valueh").value;	
		

		
		if(valuex == ''){
			valuex = 0;
		}
		if(valuey == ''){
			valuey = 0;
		}
		if(valuew == ''){
			valuew = 0;
		}
		if(valueh == ''){
			valueh = 0;
		}
		
		
		$scope.stafuser.valuex = valuex;
		$scope.stafuser.valuey = valuey;
		$scope.stafuser.valuew = valuew;
		$scope.stafuser.valueh = valueh;
		

$scope.stafuser.location_name=$scope.stafuser.location_name.toString();
	

		$scope.stafuser.image=getDataUrl(document.getElementById("target"));
		$scope.stafuser.image = $scope.stafuser.image.replace(/^data:image\/[a-z]+;base64,/, "");


		$scope.spin=1;
	var link = baseUrl+'addStafUser';	
	

	$http({url: link, method: "POST", data:$scope.stafuser}).success(function(data, status, headers, config) {
		
		$scope.stafuser = data;	
		$scope.spin=0;
		location.reload(true);
		}).error(function(data, status, headers, config) {
			$scope.stafuser = "Response Fail";
			$scope.spin=0;
		});
	}

		function getDataUrl(img) {
			   // Create canvas
			   const canvas = document.createElement('canvas');
			   const ctx = canvas.getContext('2d');
			   // Set width and height
			   canvas.width = img.width;
			   canvas.height = img.height;
			   alert(img.width);
			   // Draw the image
			   ctx.drawImage(img, 0, 0);
			   if(img.width == 0 && img.height==0){
				   return "";
			   }
			   return canvas.toDataURL('image/jpeg');
			}
	
	
	//---------------------------------------------------getAllStafUser
	var link = baseUrl+'getAllStafUser';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllStafUserList = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllStafUserList = "Response Fail";
	});
	
	  // =====================================================getStafUser By Id=======================================================
	
	$scope.getStafUser = function(stafuser_id){
		
		
		var location12 = new SlimSelect({
			select: '#location_list',
			});
		
		var link = baseUrl+'getStafUserById?stafuser_id='+stafuser_id;		

		$http.get(link).success(function(data, status, headers, config) {		
		
			$scope.stafuser_id=stafuser_id;
			$scope.stafuser1 = data;	
			
				$scope.clubname = $scope.stafuser1.location_name.split(",");
				
				$scope.stafuser1.location_name="";
		console.log($scope.clubname);
		
			for(var i = 0; i < $scope.clubname.length; i++){
	
				location12.set($scope.clubname[i]); 
			}
		
		}).error(function(data, status, headers, config) {
			$scope.stafuser1 = "Response Fail";
		});
		
	};
	
	  // =====================================================updateStafUser=======================================================
		
	$scope.updateStafUser = function(stafuser_id){
			var valuex = document.getElementById("valuex1").value;
			var valuey = document.getElementById("valuey1").value;
			var valuew = document.getElementById("valuew1").value;
			var valueh = document.getElementById("valueh1").value;			
			
			if(valuex == ''){
				valuex = 0;
			}
			if(valuey == ''){
				valuey = 0;
			}
			if(valuew == ''){
				valuew = 0;
			}
			if(valueh == ''){
				valueh = 0;
			}
		
	$scope.stafuser1.stafuser_id=stafuser_id;
		$scope.stafuser1.valuex = valuex;
				$scope.stafuser1.valuey = valuey;
				$scope.stafuser1.valuew = valuew;
				$scope.stafuser1.valueh = valueh;
				
				
			//	$scope.stafuser1.location_name=$scope.stafuser.location_name.toString();
		$scope.stafuser1.location_name=document.getElementById("location_list").value;
	
				$scope.stafuser1.image=getDataUrl(document.getElementById("target1"));
				$scope.stafuser1.image = $scope.stafuser1.image.replace(/^data:image\/[a-z]+;base64,/, "");
				alert($scope.stafuser1.image);
			
		var link = baseUrl+'editStafUser';	
		
		$http({url: link, method: "POST", data: $scope.stafuser1}).success(function(data, status, headers, config) {
	
			$scope.stafuser_id=stafuser_id;
			$scope.stafuser1 = data;			
		  location.reload(true); 
			}).error(function(data, status, headers, config) {
				$scope.stafuser1 = "Response Fail";
			});
		
	};

	
	  // =====================================================deleteProduct=======================================================
		
	$scope.deletestafuser = function(stafuser_id) {
		
		var link = baseUrl+'deleteStafUser?stafuser_id='+stafuser_id;
		alert(link);
		$http['delete'](link).success(function(data, status, headers, config) {
			$scope.stafuser_id=stafuser_id;
			$scope.stafuser = data;			
		  location.reload(true); 
			}).error(function(data, status, headers, config) {
				$scope.stafuser = "Response Fail";
			});
	};
		
	 
});

