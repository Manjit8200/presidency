app.controller('EditUserCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;

	
	
	var link = baseUrl+'getAllMemberName';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllMemberNameList = data;
		
		
	}).error(function(data, status, headers, config) {
		$scope.getAllMemberNameList = "Response Fail";
	});
	
	
	
//-------------------------------userDetails

	$scope.getUpdateMember = function(member_id){
		
		$scope.member_id=member_id;
		var link = baseUrl+'getRegisterMemberId?member_id='+member_id;  
	
		$http.get(link).success(function(data, status, headers, config) {
			$scope.masterMemberRegister = data;
		
		}).error(function(data, status, headers, config) {
			$scope.masterMemberRegister = "Response Fail";
		});
		
	}

	
	//-------------------------------FamilyDetails	
	$scope.getUpdateFamilyMember = function(member_id){
		
		var link = baseUrl+'getMemberFamilyId?member_id='+member_id;

		$http.get(link).success(function(data, status, headers, config) {
			$scope.familymember = data;
			
		}).error(function(data, status, headers, config) {
			$scope.familymember = "Response Fail";
		});
		
	}
	
	//-------------------------------FamilyDetailsBy Id	
$scope.getFamilyMemberById = function(members_family_id){
		
		var link = baseUrl+'getMemberFamilyById?members_family_id='+members_family_id;
		
		$http.get(link).success(function(data, status, headers, config) {
			$scope.familymemberdata = data;
			
			$scope.members_family_id=members_family_id;
		}).error(function(data, status, headers, config) {
			$scope.familymemberdata = "Response Fail";
		});
		
	};
	
//-------------------------------Edit userDetails
$scope.masterMemberRegister="";

$scope.calculatevalidity = function()
	{
		
		var joiningdate= document.getElementById("fromdatetimepicker").value;

		var joiningdate1 = joiningdate.split('/');
		
		var tenureplan = $scope.masterMemberRegister.tenure_year;
		
		var joindate = joiningdate1[0];
		var joinmonth = joiningdate1[1];
		var joinyear =joiningdate1[2];
		
		
		var joiningdate = joinyear + "-" + joinmonth + "-" + joindate;
	
		if(joindate != "" && joinmonth != "" && joinyear.length == 4 && tenureplan != "")
		{
			var date = new Date(joiningdate);
			
			date.setDate(date.getDate() + tenureplan * 365);
			

			$scope.masterMemberRegister.end_date = $filter('date')(date, 'dd/MM/yyyy');
		

		}	
		
		
	}

$scope.editMasterMemberRegister = function(member_id){
	
	$scope.masterMemberRegister.start_date=$("#fromdatetimepicker").val();

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
			
	if (!$scope.masterMemberRegister.plan_id) {			
				$scope.masterMemberRegisterplan_idError = 1;
				$scope.masterMemberRegisterplan_idMsg = "Select Membership Plan";
				document.getElementById("plan_id").focus();	
				
			}
			else if (!$scope.masterMemberRegister.tenure_year) {			
				$scope.masterMemberRegistertenureyear = 1;
				$scope.masterMemberRegisterTenureyearMsg = "Select tenure Year";
				document.getElementById("tenure_year").focus();				
			}
	
		
			else if (!$scope.masterMemberRegister.start_date || $scope.masterMemberRegister.start_date == 'day/month/year' ) {	
				
				$scope.masterMemberRegisterStartdateError = 1;
				$scope.masterMemberRegisterStart_dateMsg = "Date is requried ";
				document.getElementById("fromdatetimepicker").focus();				
			}
			else if (!$scope.masterMemberRegister.end_date) {			
				$scope.masterMemberRegisterEnddateError = 1;
				$scope.masterMemberRegisterMsg = "Date is requried";
				document.getElementById("fromdatetimepicker1").focus();				
			}
			else if (!$scope.masterMemberRegister.member_firstname) {			
				$scope.masterMemberRegistermember_firstnameError = 1;
				$scope.masterMemberRegistermember_firstnameMsg = "Enter First Namet";
				document.getElementById("member_firstname").focus();				
			}
			
			else if (!$scope.masterMemberRegister.member_lastname) {			
				$scope.masterMemberRegistermember_lastnameError = 1;
				$scope.masterMemberRegistermember_lastnameMsg = "Enter Last Name";
				document.getElementById("member_lastname").focus();				
			}
			else if (!$scope.masterMemberRegister.address_line_1) {			
				$scope.masterMemberRegisteraddress_line_1Error = 1;
				$scope.masterMemberRegisteraddress_line_1Msg = "Enter address";
				document.getElementById("address_line_1").focus();				
			}
			else if (!$scope.masterMemberRegister.member_country_id) {			
				$scope.masterMemberRegistermember_country_idError = 1;
				$scope.masterMemberRegistermember_country_idMsg = " Select Country";
				document.getElementById("member_country_id").focus();				
			}
			else if (!$scope.masterMemberRegister.member_state_id) {			
				$scope.masterMemberRegistermember_state_idError = 1;
				$scope.masterMemberRegistermember_state_idMsg = "Select State";
				document.getElementById("member_state_id").focus();				
			}
			else if (!$scope.masterMemberRegister.member_city) {			
				$scope.masterMemberRegistermember_cityError = 1;
				$scope.masterMemberRegistermember_cityMsg = "Enter City Name";
				document.getElementById("member_city").focus();				
			}
			else if (!$scope.masterMemberRegister.pincode) {			
				$scope.masterMemberRegisterpincodeError = 1;
				$scope.masterMemberRegisterpincodeMsg = "Enter pincode";
				document.getElementById("pincode").focus();				
			}
			else if (!$scope.masterMemberRegister.member_mobile_no) {			
				$scope.masterMemberRegistermember_mobile_noError = 1;
				$scope.masterMemberRegistermember_mobile_noMsg = "Enter member mobile no";
				document.getElementById("member_mobile_no").focus();				
			}
			else if (!$scope.masterMemberRegister.member_email) {			
				$scope.masterMemberRegistermember_emailError = 1;
				$scope.masterMemberRegistermember_emailMsg = " Enter Your Email";
				document.getElementById("member_email").focus();	
				
				
			}


	
			else {

				$scope.masterMemberRegister.valuex = valuex;
				$scope.masterMemberRegister.valuey = valuey;
				$scope.masterMemberRegister.valuew = valuew;
				$scope.masterMemberRegister.valueh = valueh;
				
				
				
				$scope.masterMemberRegister.image=getDataUrl(document.getElementById("target"));
				$scope.masterMemberRegister.image = $scope.masterMemberRegister.image.replace(/^data:image\/[a-z]+;base64,/, "");
				
			

	$scope.masterMemberRegister.member_id=member_id;
	
	$scope.spin=1;
	var link = baseUrl+'editMasterMemberRegister';
	
	
	$http({url: link, method: "POST", data: $scope.masterMemberRegister}).success(function(data, status, headers, config) {
	
		$scope.masterMemberRegister = data;
		

		$scope.member_id=member_id;
		$scope.spin=0;
	  location.reload(true); 
		}).error(function(data, status, headers, config) {
			$scope.masterMemberRegister = "Response Fail";
		});
}
};


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
		$scope.setflag = function(){
			
			$scope.masterMemberRegisterplan_idError = 0;
			$scope.masterMemberRegistertenureyear = 0;
			$scope.masterMemberRegisterStartdateError = 0;
			$scope.masterMemberRegisterEnddateError = 0;
			$scope.masterMemberRegistermember_firstnameError = 0;
			$scope.masterMemberRegistermember_middlenameError = 0;
			$scope.masterMemberRegistermember_lastnameError = 0;
			$scope.masterMemberRegisteraddress_line_1Error = 0;
			$scope.masterMemberRegistermember_country_idError = 0;
			$scope.masterMemberRegistermember_state_idError = 0;
			$scope.masterMemberRegistermember_cityError = 0;
			$scope.masterMemberRegisterpincodeError = 0;
			$scope.masterMemberRegistermember_mobile_noError = 0;
			$scope.masterMemberRegistermember_emailError = 0;
			$scope.masterMemberRegisterpasswordError = 0;
		}
		
		$scope.typeschange = function() {
			
			var link = baseUrl + 'getMasterMemberPlanType?plan_id='+$scope.masterMemberRegister.plan_id;			
			$http.get(link).success(function(data, status, headers, config) {
				$scope.getlastmembersequence1 = data;
				
				if($scope.getlastmembersequence1.sequence == 0) {
					$scope.getLastSequence1 = 0;
				} else {
					$scope.getLastSequence1 = $scope.getlastmembersequence1.sequence;
				}			
			
				var familyplan = $scope.familyplan;
				var count =  $scope.getLastSequence1 + 1;
				var typemem;
				var family = "";
				var d = new Date();
				var n = d.getFullYear();
				if($scope.getlastmembersequence1.plan_type){
					typemem = $scope.getlastmembersequence1.plan_type;
				}else{
					typemem = "PRC";
				}
				typemem=typemem+n;
				
				if(count >= 0 && count <= 9) {
					family = typemem + "0000" + count;
					$scope.masterMemberRegister.membership_number = family;
				} else if(count >= 10 && count <= 99) {
					family = typemem+ "000" + count;
					$scope.masterMemberRegister.membership_number = family;
				} else if(count >= 100 && count <= 999) {
					family = typemem+ "00" + count;
					$scope.masterMemberRegister.membership_number = family;
				} else if(count >= 1000 && count <= 9999) {
					family = typemem+ "0" + count;
					$scope.masterMemberRegister.membership_number = family;
				} else if(count >= 10000 && count <= 99999) {
					family = typemem + count;
					
					$scope.masterMemberRegister.membership_number = family;
				} else {
					$window.alert("Your membership number is not generated");
				}
				$scope.masterMemberRegister.sequence =count;
			}).error(function(data, status, headers, config) {
				$scope.getlastmembersequence1 = "Response Fail";
			});
		}
	//------------------------------- Edit FamilyDetails
	
$scope.editFamilyMemberRegister = function(members_family_id){
	    var valuex = document.getElementById("valuex3").value;
		var valuey = document.getElementById("valuey3").value;
		var valuew = document.getElementById("valuew3").value;
		var valueh = document.getElementById("valueh3").value;	
		
	
		
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
	$scope.familymemberdata.valuex = valuex;
	$scope.familymemberdata.valuey = valuey;
	$scope.familymemberdata.valuew = valuew;
	$scope.familymemberdata.valueh = valueh;
	
	

	$scope.familymemberdata.image=getDataUrl(document.getElementById("target3"));
	$scope.familymemberdata.image = $scope.familymemberdata.image.replace(/^data:image\/[a-z]+;base64,/, "");
	

	$scope.familymemberdata.members_family_id=$scope.members_family_id;
	$scope.spin=1;
	var link = baseUrl+'EditFamilyMember';

	
	$http({url: link, method: "POST", data: $scope.familymemberdata}).success(function(data, status, headers, config) {
	
		$scope.familymemberdata = data;

		$scope.getUpdateFamilyMember($scope.member_id);
		$scope.spin=0;
		$('#myModal11').modal('hide');

		document.getElementById("target3").src ="#";
		 $('#target3').data('Jcrop').destroy();
		 document.getElementById("updatefamily").innerHTML =" <img src='' id='target3' >";
		
		}).error(function(data, status, headers, config) {
			$scope.familymemberdata = "Response Fail";
		});

	

	
};


	$scope.AddFamilyMemberRegister = function(){

		var count=$scope.familymember.length;
		count++;
	$scope.family_membership_no= $scope.masterMemberRegister.membership_number +'F'+count;
	
	
	}

	$scope.AddNewFamilyMemberRegister = function(){
		
		
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
		
			 if (!$scope.member_family_address2) {			
				$scope.member_family_address2="";
			
			}
			 if (!$scope.member_family_address3) {			
				$scope.member_family_address3="";
					
			}
			 if (!$scope.member_family_middle_name) {			
				$scope.member_family_middle_name="";			
			}	
		
	
if (!$scope.member_family_first_name) {			
				$scope.masterMemberRegistermember_family_first_nameError = 1;
				$scope.masterMemberRegistemember_family_first_nameMsg = " Enter First Name";
				document.getElementById("member_family_first_name").focus();	
				
			}
		
			else if (!$scope.member_family_last_name) {				
				$scope.masterMemberRegistermember_family_last_nameError = 1;
				$scope.masterMemberRegistermember_family_last_nameMsg = " Enter Last Name ";
				document.getElementById("member_family_last_name").focus();				
			}
			else if (!$scope.member_family_address1) {			
				$scope.masterMemberRegistermember_family_address1Error = 1;
				$scope.masterMemberRegistermember_family_address1Msg = "Enter Your Address";
				document.getElementById("member_family_address1").focus();				
			}
		
			else if (!$scope.member_family_coutry_id) {			
				$scope.masterMemberRegistermember_family_coutry_idError = 1;
				$scope.masterMemberRegistermember_family_coutry_idMsg = "Select Country";
				document.getElementById("member_family_coutry_id").focus();				
			}
			else if (!$scope.member_family_state_id) {			
				$scope.masterMemberRegistermember_family_state_idError = 1;
				$scope.masterMemberRegistermember_family_state_idMsg = "Select State";
				document.getElementById("member_family_state_id").focus();				
			}
	
		
		
			else if (!$scope.member_family_city) {			
				$scope.masterMemberRegistermember_family_cityError = 1;
				$scope.masterMemberRegistermember_family_cityMsg = "Enter City Name";
				document.getElementById("member_family_city").focus();				
			}
			else if (!$scope.member_family_pincode) {			
				$scope.masterMemberRegistermember_family_pincodeError = 1;
				$scope.masterMemberRegistermember_family_pincodeMsg = "Enter pincode";
				document.getElementById("member_family_pincode").focus();				
			}
			else if (!$scope.member_family_type_of_relation) {			
				$scope.masterMemberRegistermember_family_type_of_relationError = 1;
				$scope.masterMemberRegistermember_family_type_of_relationMsg = "Select Relation";
				document.getElementById("member_family_type_of_relation").focus();				
			}
		  else if (!$scope.member_family_date_of_birth) {			
				$scope.masterMemberRegistermember_family_date_of_birthError = 1;
				$scope.masterMemberRegistermember_family_date_of_birthMsg = " Select Date of birth";
				document.getElementById("fromdatetimepicker3").focus();				
			}
			else if (!$scope.member_family_gender) {			
				$scope.masterMemberRegistermember_family_genderError = 1;
				$scope.masterMemberRegistermember_family_genderMsg = "Select Gender";
				document.getElementById("member_family_gender").focus();				
			}
		
			else if (!$scope.member_family_blood_group) {			
				$scope.masterMemberRegistermember_family_blood_groupError = 1;
				$scope.masterMemberRegistermember_family_blood_groupMsg = " Select blood group";
				document.getElementById("member_family_blood_group").focus();				
			}
			
			else if (!$scope.member_family_mobile_no) {			
				$scope.masterMemberRegistermember_family_mobile_noError = 1;
				$scope.masterMemberRegistermember_family_mobile_noMsg = "Enter Your Mobile Number";
				document.getElementById("member_family_mobile_no").focus();				
			}	
			else if (!$scope.member_family_email) {			
				$scope.masterMemberRegistermember_family_emailError = 1;
				$scope.masterMemberRegistermember_family_emailMsg = "Enter Your Email";
				document.getElementById("member_family_email").focus();				
			}
			else if (!$scope.member_family_password) {			
				$scope.masterMemberRegistermember_family_passwordError = 1;
				$scope.masterMemberRegistermember_family_passwordMsg = "Enter Your Password";
				document.getElementById("member_family_password").focus();		
		
			} 
			
	
			else{	
			var formData=new FormData();
			formData.append("image",imageadd1.files[0]);
			$scope.spin=1;
		var link = baseUrl+'addData1?family_membership_no='+$scope.family_membership_no+'&member_family_first_name='+$scope.member_family_first_name+'&member_family_middle_name='+$scope.member_family_middle_name+'&member_family_last_name='+$scope.member_family_last_name+'&member_family_gender='+$scope.member_family_gender+'&member_family_type_of_relation='+$scope.member_family_type_of_relation+'&member_family_date_of_birth='+$scope.member_family_date_of_birth+'&member_family_blood_group='+$scope.member_family_blood_group+'&member_family_blood_group='+$scope.member_family_aadhar_number+'&member_family_image='+$scope.member_family_image+'&member_family_email='+$scope.member_family_email+'&member_family_mobile_no='+$scope.member_family_mobile_no+'& member_family_phone='+$scope.member_family_phone+'&member_family_password='+$scope.member_family_password+'&member_family_address1='+$scope.member_family_address1+'&member_family_address2='+$scope.member_family_address2+'&member_family_address3='+$scope.member_family_address3+'&member_family_pincode='+$scope.member_family_pincode+'&member_family_coutry_id='+$scope.member_family_coutry_id+'&member_family_state_id='+$scope.member_family_state_id+'&member_family_city='+$scope.member_family_city+'&member_id1='+$scope.member_id+'&valuex='+valuex+'&valuey='+valuey+'&valuew='+valuew+'&valueh='+valueh;		

	$http({method: 'POST', url: link, headers: {'Content-Type': undefined}, data: formData, transformRequest: function(data, headersGetterFunction) {
		return data;
	}}).success(function(data, status, headers, config) {
				$scope.familymemberdata= data;
				 $scope.getUpdateFamilyMember($scope.member_id);
				 $scope.spin=0;
					$('#myModal').modal('hide');
					
					document.getElementById("target1").src ="#";
					 $('#target1').data('Jcrop').destroy();
					 document.getElementById("addfamily").innerHTML =" <img src='' id='target1' >";
					
			}).error(function(data, status, headers, config) {
				$scope.familymemberdata = "Response Fail";
			});
}
	};
	
		$scope.setflag1 = function(){
					$scope.masterMemberRegistermember_family_first_nameError = 0;
					
					$scope.masterMemberRegistermember_family_last_nameError = 0;
					$scope.masterMemberRegistermember_family_address1Error = 0;
					$scope.masterMemberRegistermember_family_coutry_idError = 0;
					$scope.masterMemberRegistermember_family_state_idError = 0;
					$scope.masterMemberRegistermember_family_pincodeError = 0;
					$scope.masterMemberRegistermember_family_cityError = 0;
					$scope.masterMemberRegistermember_family_type_of_relationError = 0;
					$scope.masterMemberRegistermember_family_date_of_birthError = 0;
					$scope.masterMemberRegister.member_family_gender = 0;
					$scope.masterMemberRegistermember_family_blood_groupError = 0;
					$scope.masterMemberRegistermember_family_mobile_noError = 0;
					$scope.masterMemberRegistermember_family_emailError = 0;
					$scope.masterMemberRegistermember_family_passwordError = 0;
			}

	$scope.deleteFamilyMember = function(members_family_id) {
		
		var link = baseUrl+'deleteFamilyMember?members_family_id='+members_family_id;
		
		$http['delete'](link).success(function(data, status, headers, config) {
				$scope.familymemberdata= data;
		 $scope.getUpdateFamilyMember($scope.member_id);
			}).error(function(data, status, headers, config) {
					$scope.familymemberdata = "Response Fail";
			});
	};
	
	//---------------------------------------------------------------------- Nomineee List--------------
	$scope.getmemberNomineeDetails = function(member_id){
		$scope.member_id=member_id;
		var link = baseUrl+'getAllNomineeMember?member_id='+member_id;;  

		$http.get(link).success(function(data, status, headers, config) {
			$scope.getAllNomineeMember = data;
			
		}).error(function(data, status, headers, config) {
			$scope.getAllNomineeMember = "Response Fail";
		});
		
	}	
	
	  //----------------------------------------------------------------------Add Nominee Details	
		
	$scope.addNomineeDetails = function(member_id){
		 $scope.memberNomineeDetails.member_id=member_id;
		
			var link = baseUrl+'addNomineeDetailsUpdate';		
		

		$http({url: link, method: "POST", data: $scope.memberNomineeDetails}).success(function(data, status, headers, config) {
			$scope.memberNomineeDetails =data;	
			$scope.member_id=member_id;
	
				$('#myModalNomineeAdd').modal('hide');
			openClass('NomineeDetails','PaymentDetails','Bharat');
			}).error(function(data, status, headers, config) {
				$scope.memberNomineeDetails =data;
			});

		}
	  //------------------------------- Edit Nominee Details	
	  
	  
	 $scope.editmemberNomineeDetails = function(nominee_id){


$scope.getAllNomineeMember.nominee_id=nominee_id;
	var link = baseUrl+'editNomineeMember';

	
	$http({url: link, method: "POST", data: $scope.memberNomineeDetails}).success(function(data, status, headers, config) {
	
		$scope.memberNomineeDetails = data;
		
		$('#myModalNomineeUpdate').modal('hide');
		
		}).error(function(data, status, headers, config) {
			$scope.familymemberdata = "Response Fail";
		});

	

	
};

	
//====================================================================Nomineee By Id--------------  
$scope.getmemberNomineeDetailsById = function(nominee_id){
	
	
	$scope.getAllNomineeMember.nominee_id=nominee_id;
	
	var link = baseUrl+'getNomineeMemberId?nominee_id='+nominee_id;;  

	$http.get(link).success(function(data, status, headers, config) {
		$scope.memberNomineeDetails = data;
		
	}).error(function(data, status, headers, config) {
		$scope.memberNomineeDetails = "Response Fail";
	});
	
}	
//Delete By Id--------------  	  

$scope.deleteNominee = function(nominee_id) {
	
	var link = baseUrl+'deleteNomineeMember?nominee_id='+nominee_id;
	

	$http['delete'](link).success(function(data, status, headers, config) {
			$scope.memberNomineeDetails= data;
			 location.reload(true); 

		}).error(function(data, status, headers, config) {
				$scope.memberNomineeDetails = "Response Fail";
		});
};

	

// ---------------------------------------------------------------Payment List--------------
$scope.getmemberPaymentDetails = function(member_id){
	$scope.member_id=member_id;
	
	var link = baseUrl+'getAllMemberPaymentID?member_id='+member_id;;  

	$http.get(link).success(function(data, status, headers, config) {
		$scope.memberPayment11 = data;
		
	}).error(function(data, status, headers, config) {
		$scope.memberPayment11 = "Response Fail";
	});
	
}
	
//====================================================================Payment By Id--------------  
$scope.getmemberPaymentById = function(member_payment_id){
	
	
	$scope.memberPayment11.member_payment_id=member_payment_id;
	
	var link = baseUrl+'getAllMemberPaymentById?member_payment_id='+member_payment_id;;  


	$http.get(link).success(function(data, status, headers, config) {
		$scope.memberPayment = data;
		
	}).error(function(data, status, headers, config) {
		$scope.memberPayment = "Response Fail";
	});
	
}

//====================================================================Delete Payment By Id--------------  


$scope.deletePayment = function(member_payment_id) {
	
	var link = baseUrl+'deleteMemberPayment?member_payment_id='+member_payment_id;



	$http['delete'](link).success(function(data, status, headers, config) {
			$scope.memberPayment= data;
			$scope.getmemberPaymentDetails($scope.member_id);

		}).error(function(data, status, headers, config) {
				$scope.memberPayment = "Response Fail";
		});
};



// =====================================================Get MAster Tax JS =======================================================

var link = baseUrl+'getMasterTaxName';  

$http.get(link).success(function(data, status, headers, config) {
	$scope.getAllMasterTax = data;
	
	
}).error(function(data, status, headers, config) {
	$scope.getAllMasterTax = "Response Fail";
});


//===================================================== get Member Payment tax=======================================================

$scope.getMemberTax = function(member_id){
	
	var link = baseUrl+'getAllMemberTaxName?member_id='+member_id;	
	

	$http.get(link).success(function(data, status, headers, config) {		
		$scope.member_id=member_id;
			
		$scope.memberTax = data;	
		$scope.TaxRow();
		
	
		
	}).error(function(data, status, headers, config) {
		$scope.memberTax = "Response Fail";
	});
	
};

//--------------------------------------------------- Delete TAX ROW on Update Time
$scope.deleteProductTax = function(member_tax_id) {
	
	var link = baseUrl+'deleteMemberTax?member_tax_id='+member_tax_id;

	$http['delete'](link).success(function(data, status, headers, config) {
		$scope.deleteProductTax12 = data;
		
	$scope.getMemberTax($scope.member_id);
	
		}).error(function(data, status, headers, config) {
			$scope.deleteProductTax12 = "Response Fail";
		});
};

// =============================================Payment Add TAX	

	
	$scope.memberPayemnttax = function (member_id){
	

		var link = baseUrl+'addMemberPaymentTax?member_id='+$scope.member_id+'&tax_type='+$scope.tax_type+'&tax_value='+$scope.tax_value;		

			$http.post(link).success(function(data, status, headers, config) {
				$scope.addmemberPaymentTaxData = data;
				
				$scope.getMemberTax(member_id);
		
		
	}).error(function(data, status, headers, config) {
		$scope.addmemberPaymentTaxData = "Response Fail";
	});
	
}
	// ---------------------------------------------------calculation payment	



	$scope.TaxRow = function() {


		 $scope.amount = document.getElementById("member_plan_amount").value ; //1000
	     $scope.discount1 = document.getElementById("member_discount").value ; // 
	     
	      $scope.discount = ($scope.amount *  $scope.discount1)/100; // 100
	     
	     $scope.total =  $scope.amount - $scope.discount; //900

	     var comArr = eval( $scope.memberTax);
		    $scope.sum=0;
			for( var i = 0; i < comArr.length; i++ ) {
			  
				$scope.sum = $scope.sum + comArr[i].tax_value; 
			}
			
		$scope.taxammount = ( $scope.amount * $scope.sum)/100;
		

		$scope.finaltotal = $scope.total + $scope.taxammount;
		
		
		  
	  document.getElementById("member_total_amount").value = $scope.finaltotal;
	  
	
		
	};
	
	
	
	  //-------------------------------  editMemberPayment Details	
	  
	  
	 $scope.editPaymentDetails = function(member_payment_id){


		 $scope.memberPayment.member_payment_id=$scope.memberPayment11.member_payment_id;
		
	     var link = baseUrl+'editMemberPayment';
	     
	
	$http({url: link, method: "POST", data: $scope.memberPayment}).success(function(data, status, headers, config) {
		
		$scope.memberPayment = data;


		$scope.member_payment_id =member_payment_id;
	//  window.location.href = baseUrl+"/managePrc/addUser";
		location.reload(true); 
		}).error(function(data, status, headers, config) {
			$scope.memberPayment = "Response Fail";
		});

	

	
};



//----------------------------------------------------------------------Add Payment Details	
$scope.memberPayemntadd = function (){
	

	 $scope.memberPayment.member_id=$scope.member_id;
		var i;
		
var link = baseUrl+'addMemberPaymentUpdatetime';		



$http({url: link, method: "POST", data: $scope.memberPayment}).success(function(data, status, headers, config) {
	$scope.memberPayment = data;	
	
	for(i=0;i<$scope.Taxtype1.length;i++){
		
		var link = baseUrl+'addMemberPaymentTax?member_id='+$scope.memberPayment+'&tax_type='+$scope.Taxtype1[i].tax_type+'&tax_value='+$scope.Taxtype1[i].tax_value;		

			$http.post(link).success(function(data, status, headers, config) {
				$scope.addmemberPaymentTaxData = data;
			
				$scope.getmemberPaymentById(member_payment_id);
					location.reload(true); 
			}).error(function(data, status, headers, config) {
				 $scope.addmemberPaymentTaxData = "Response Fail";
			});
		} 
	

	}).error(function(data, status, headers, config) {
		$scope.product = "Response Fail";
	});
	
}
$scope.Taxtype1 = [];
$scope.getTax1 = function(){


for(var j=0;j<$scope.getAllMasterTax.length;j++){
		
		if($scope.getAllMasterTax[j].tax_type_id == $scope.tax_type){
			
			$scope.Taxtype1.push({'tax_type_name':$scope.getAllMasterTax[j].tax_type_name,'tax_type':$scope.tax_type, 'tax_value':$scope.tax_value});		
				
		}
		}
			$scope.tax_type="";
			$scope.tax_value="";
		}
		

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


		$scope.TaxRow1 = function() {
			
			 $scope.amount = document.getElementById("member_plan_amount1").value ; //1000
		     $scope.discount1 = document.getElementById("member_discount1").value ; // 
		     
		      $scope.discount = ($scope.amount *  $scope.discount1)/100; // 100
		     
		     $scope.total =  $scope.amount - $scope.discount; //900
	

			var comArr = eval( $scope.Taxtype1);
		    $scope.sum=0;
			for( var i = 0; i < comArr.length; i++ ) {
			  
				$scope.sum = $scope.sum + comArr[i].tax_value; 
			}
			
			$scope.taxammount = ( $scope.amount * $scope.sum)/100;
			

			$scope.finaltotal = $scope.total + $scope.taxammount;
	  
		  document.getElementById("member_total_amount1").value = $scope.finaltotal;
		  
		
			
		}
		
		
//===================================================== get Member Personal Info=======================================================

$scope.getMemberPersonalInfo = function(member_id){
		var location = new SlimSelect({
			select: '#member_club_name',
			});
			
			
	var link = baseUrl+'getAllMemberInfo?member_id='+member_id;	
	

	$http.get(link).success(function(data, status, headers, config) {		
		$scope.member_id=member_id;
			
		$scope.memberInfo = data;	
		$scope.clubname = $scope.memberInfo.member_club_name.split(",");
		$scope.memberInfo.member_club_name="";
		
			for(var i = 0; i < $scope.clubname.length; i++){
				
				location.set($scope.clubname[i]); 
			}
			
	}).error(function(data, status, headers, config) {
		$scope.memberInfo = "Response Fail";
	});
	
};

	  //------------------------------- Edit editPersonalInfo() 	
	  
	  
	 $scope.editPersonalInfo = function(member_id){
$scope.memberInfo.member_id=member_id;
$scope.memberInfo.member_club_name=$scope.memberInfo.member_club_name.toString();
	

	var link = baseUrl+'editMemberInfo';

	
	$http({url: link, method: "POST", data: $scope.memberInfo}).success(function(data, status, headers, config) {
	
		$scope.memberInfoDetails = data;
	location.reload(true);
		}).error(function(data, status, headers, config) {
			$scope.memberInfoDetails = "Response Fail";
		});

	

	
};


	// ---------------------------------------------------Get All Club Name  
		var link = baseUrl+'getAllMasterClubName';  

	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllMasterClub = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllMasterClub = "Response Fail";
	});
	
	$scope.getAllClub = function(){
		var link = baseUrl+'getAllMasterClubName';  

	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllMasterClub = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllMasterClub = "Response Fail";
	});
	}	
		
	$scope.addClubName = function(){	
	var link = baseUrl+'addMasterClubName';		
	
	$http({url: link, method: "POST", data: $scope.masterClubName}).success(function(data, status, headers, config) {
		$scope.masterClubNamelist = data;	
		$scope.getAllClub();
		$scope.masterClubName.club_name="";
		$('#myModal97').modal('hide');
		
	
		}).error(function(data, status, headers, config) {
			$scope.masterClubNamelist = "Response Fail";
		
		});
}
	
});




	


		