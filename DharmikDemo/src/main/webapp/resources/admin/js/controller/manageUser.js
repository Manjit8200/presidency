app.controller('UserCtrl', function($scope, $http, $window, $filter,$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;

	$scope.currentPage = 0;
	$scope.pageSize = 5;
	$scope.search = "";
	$scope.startindex = $scope.currentPage;
	$scope.pages = [5, 10, 20, 50, 100, 500,'All'];
	$scope.LastMemberId=0;

	var link = baseUrl+'getMemberByPage?startindex='+$scope.startindex+'&pagesize='+$scope.pageSize;    
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllRegisterMemberNameList = data;
	}).error(function(data, status, headers, config) {
		$scope.getAllRegisterMemberNameList = "Response Fail";
	});
	
	$scope.changepage = function(){
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

   // =====================================================Get MAster Tax JS =======================================================

	
	var link = baseUrl+'getMasterTaxName';  
	
				$http.get(link).success(function(data, status, headers, config) {
					$scope.getAllMasterTax = data;
					
					
				}).error(function(data, status, headers, config) {
					$scope.getAllMasterTax = "Response Fail";
				});
	
   // ===================================================== User Register JS =======================================================
$scope.masterMemberRegister="";
	


	
	var link = baseUrl+'getAllMemberName';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllMemberNameList = data;
		
		
	}).error(function(data, status, headers, config) {
		$scope.getAllMemberNameList = "Response Fail";
	});
	
	
	//----------------------------------------------------- Get getAllRegisterMemberName-----------------------------------------------------------------------
		

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
	

$scope.getRegisterMember = function(member_id){
	
	var link = baseUrl+'getRegisterMemberById?member_id='+member_id;;  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllMemberNameList = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllMemberNameList = "Response Fail";
	});
	
}

		//-------------------------------FamilyDetails	
		


//---{1.1}----------------------------------------------------- Add Data In dataBase -----------------------------------------------------------------------
	
	$scope.getAllMemberPlan = function(){
	var link = baseUrl+'getAllMemberName';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllMemberNameList = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllMemberNameList = "Response Fail";
	});
	
	};
	
	
		$scope.addMasterMemberRegister = function(){
			
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
		/*	else if (!$scope.masterMemberRegister.password) {			
				$scope.masterMemberRegisterpasswordError = 1;
				$scope.masterMemberRegisterpasswordMsg = "Enter Your Password";
				document.getElementById("password").focus();				
			}*/
			
			
	
			else {

				$scope.masterMemberRegister.valuex = valuex;
				$scope.masterMemberRegister.valuey = valuey;
				$scope.masterMemberRegister.valuew = valuew;
				$scope.masterMemberRegister.valueh = valueh;
				
		

				$scope.masterMemberRegister.image=getDataUrl(document.getElementById("target"));
				$scope.masterMemberRegister.image = $scope.masterMemberRegister.image.replace(/^data:image\/[a-z]+;base64,/, "");
		

				$scope.spin=1;
			var link = baseUrl+'addMasterMemberRegister';	
			
		
		
			$http({url: link, method: "POST", data:$scope.masterMemberRegister}).success(function(data, status, headers, config) {
				$scope.LastMemberId = data;	
			
				$scope.spin=0;
			
			  openClass('UserDetails','FamilyDetails', 'Paris');
				}).error(function(data, status, headers, config) {
					$scope.LastMemberId = "Response Fail";
					$scope.spin=0;
				});
			}

		}
		
		function getDataUrl(img) {
			   // Create canvas
			   const canvas = document.createElement('canvas');
			   const ctx = canvas.getContext('2d');
			   // Set width and height
			   canvas.width = img.width;
			   canvas.height = img.height;
			   // Draw the image
			   ctx.drawImage(img, 0, 0);
			   return canvas.toDataURL('image/jpeg');
			}
		// ------------------------Get Amount
		$scope.memberPayment= "";
		$scope.getRegisterMemberAmount = function(){
			
			var link = baseUrl+'getRegisterMemberAmount?member_id='+$scope.LastMemberId ;  
		

			$http.get(link).success(function(data, status, headers, config) {
				$scope.getAllMemberAmount = data;
				$scope.member_id=$scope.LastMemberId;
			

				document.getElementById("member_plan_amount").value = $scope.getAllMemberAmount.plan_amount;
				$scope.memberPayment.member_plan_amount = $scope.getAllMemberAmount.plan_amount;
				
				
				
			}).error(function(data, status, headers, config) {
				$scope.getAllMemberAmount = "Response Fail";
			});
			
		}	
		
		//-------------------------------FamilyDetails	
		$scope.getUpdateFamilyMember11 = function(){
			
			var link = baseUrl+'getMemberFamilyId?member_id='+$scope.LastMemberId;

			$http.get(link).success(function(data, status, headers, config) {
				$scope.familymember = data;
				
			}).error(function(data, status, headers, config) {
				$scope.familymember = "Response Fail";
			});
			
		}
		
		//---{1.0}----------------------------------------------------- SQUEANCE -----------------------------------------------------------------------
		
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
		
		
			
		
	$scope.typeschange11 = function() {
		var count1=0;
		var a = $scope.masterMemberRegister.membership_number;
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
				count1++;
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
					family = a +'F'+count1;
					$scope.family_membership_no = family;
					
				} else if(count >= 10 && count <= 99) {
					family = a +'F'+count1;
					$scope.family_membership_no = family;
					
				} else if(count >= 100 && count <= 999) {
					family = a +'F'+count1;
					$scope.family_membership_no= family;
					
				} else if(counmasterMemberRegister.membership_numbert >= 1000 && count <= 9999) {
					family = a +'F'+count1;
					$scope.family_membership_no = family;
					
				} else if(count >= 10000 && count <= 99999) {
					family = family + count1;
					
					$scope.family_membership_no = family;
				} else {
					$window.alert("Your membership number is not generated");
				}
				
				
			}).error(function(data, status, headers, config) {
				$scope.getlastmembersequence1 = "Response Fail";
			});
		}
//---{1.2}------------------------------------------------------ Set Flag Function Member User Detais---------------------------------------		
		
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
		

		
 // =[2]===================================================== Family Details JS =======================================================

	
		$scope.MemberFamilyRegister=[];
		

		$scope.count1=1;
		var formData=new FormData();
		$scope.addRow = function() {
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
		
			
			var a = $scope.masterMemberRegister.membership_number;

			if (!$scope.member_family_first_name) {			
				$scope.masterMemberRegistermember_family_first_nameError = 1;
				$scope.masterMemberRegistemember_family_first_nameMsg = " Enter First Name";
				document.getElementById("member_family_first_name").focus();	
				
			}
			 if (!$scope.member_family_middle_name) {			
				$scope.member_family_middle_name="";			
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
			if (!$scope.member_family_address2) {			
				$scope.member_family_address2="";
			
			}
			if (!$scope.member_family_address1) {			
				$scope.member_family_address3="";
					
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
				$scope.family_membership_no = a +'F'+$scope.count1;
				
				$scope.count1++;
				
			$scope.MemberFamilyRegister.push({
				'family_membership_no':$scope.family_membership_no,
				'member_family_first_name':$scope.member_family_first_name, 
				'member_family_middle_name':$scope.member_family_middle_name, 
				'member_family_last_name':$scope.member_family_last_name, 
				'member_family_gender':$scope.member_family_gender,
				'member_family_type_of_relation':$scope.member_family_type_of_relation, 
				'member_family_date_of_birth':$scope.member_family_date_of_birth, 
				'member_family_blood_group':$scope.member_family_blood_group,			
				'member_family_image':$scope.member_family_image, 
				'member_family_email':$scope.member_family_email,
				'member_family_mobile_no':$scope.member_family_mobile_no, 
				'member_family_phone':$scope.member_family_phone, 
				'member_family_password':$scope.member_family_password,
				'member_family_address1':$scope.member_family_address1, 
				'member_family_address2':$scope.member_family_address2, 
				'member_family_address3':$scope.member_family_address3,
				'member_family_pincode':$scope.member_family_pincode, 
				'member_family_coutry_id':$scope.member_family_coutry_id, 
				'member_family_state_id':$scope.member_family_state_id,
				'member_family_city':$scope.member_family_city,
				'valuex':valuex,
				'valuey':valuey,
				'valuew':valuew,
				'valueh':valueh,
				
			
			});
			formData.append("image",imageadd1.files[0]);
				$scope.family_membership_no= a +'F'+$scope.count1;
				$scope.member_family_first_name="";
				$scope.member_family_middle_name="";
				$scope.member_family_last_name="";
				$scope.member_family_gender="";
				$scope.member_family_type_of_relation="";
				$scope.member_family_date_of_birth='day/month/year';
				$scope.member_family_blood_group="";
				$scope.member_family_image="";
				$scope.member_family_email="";
				$scope.member_family_mobile_no="";
				$scope.member_family_phone="";
				$scope.member_family_password="";
				$scope.member_family_address1="";
				$scope.member_family_address2="";
				$scope.member_family_address3="";
				$scope.member_family_pincode="";		
				$scope.member_family_state_id="";
				$scope.member_family_city="";
				$scope.member_family_image="";
	
				document.getElementById("target1").src ="#";
				 $('#target1').data('Jcrop').destroy();
				 document.getElementById("t1").innerHTML ="<img src='' id='target1' >";
				
			
		}

			var i;
		$scope.addMasterMemberFamilyRegister = function(){
			$scope.spin=1;
				$scope.MemberFamilyRegister.member_id =$scope.MemberLastId;
				for(i=0;i<$scope.MemberFamilyRegister.length;i++){
				var link = baseUrl+'addData?family_membership_no='+$scope.MemberFamilyRegister[i].family_membership_no+'&member_family_first_name='+$scope.MemberFamilyRegister[i].member_family_first_name+'&member_family_middle_name='+$scope.MemberFamilyRegister[i].member_family_middle_name+'&member_family_last_name='+$scope.MemberFamilyRegister[i].member_family_last_name+'&member_family_gender='+$scope.MemberFamilyRegister[i].member_family_gender+'&member_family_type_of_relation='+$scope.MemberFamilyRegister[i].member_family_type_of_relation+'&member_family_date_of_birth='+$scope.MemberFamilyRegister[i].member_family_date_of_birth+'&member_family_blood_group='+$scope.MemberFamilyRegister[i].member_family_blood_group+'&member_family_blood_group='+$scope.MemberFamilyRegister[i].member_family_aadhar_number+'&member_family_image='+$scope.MemberFamilyRegister[i].member_family_image+'&member_family_email='+$scope.MemberFamilyRegister[i].member_family_email+'&member_family_mobile_no='+$scope.MemberFamilyRegister[i].member_family_mobile_no+'& member_family_phone='+$scope.MemberFamilyRegister[i].member_family_phone+'&member_family_password='+$scope.MemberFamilyRegister[i].member_family_password+'&member_family_address1='+$scope.MemberFamilyRegister[i].member_family_address1+'&member_family_address2='+$scope.MemberFamilyRegister[i].member_family_address2+'&member_family_address3='+$scope.MemberFamilyRegister[i].member_family_address3+'&member_family_pincode='+$scope.MemberFamilyRegister[i].member_family_pincode+'&member_family_coutry_id='+$scope.MemberFamilyRegister[i].member_family_coutry_id+'&member_family_state_id='+$scope.MemberFamilyRegister[i].member_family_state_id+'&member_family_city='+$scope.MemberFamilyRegister[i].member_family_city+'&member_id1=0&valuex='+$scope.MemberFamilyRegister[i].valuex+'&valuey='+$scope.MemberFamilyRegister[i].valuey+'&valuew='+$scope.MemberFamilyRegister[i].valuew+'&valueh='+$scope.MemberFamilyRegister[i].valueh+'&index='+i;		
			

			
				$http({method: 'POST', url: link, headers: {'Content-Type': undefined}, data: formData, transformRequest: function(data, headersGetterFunction) {
					return data;
				}}).success(function(data, status, headers, config) {
				
						$scope.addMasterMemberFamilyRegister = data;
						$scope.spin=0;
						openClass('FamilyDetails','PersonalDetails', 'Tokyo');
						 $scope.MemberLastId =data;
						 	$scope.getUpdateFamilyMember11();
					}).error(function(data, status, headers, config) {
						 $scope.MemberLastId = "Response Fail";
					});
				
			} 

		}
		}
		
		
			$scope.setflag1 = function(){
					$scope.masterMemberRegistermember_family_first_nameError = 0;
					$scope.masterMemberRegistermember_family_middle_nameError = 0;
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
	// ---------------------------------------------------Add Nominee details
			
			$scope.addNomineeDetails = function(){
		
				var link = baseUrl+'addNomineeDetails?member_id1=0';		
		
			$http({url: link, method: "POST", data: $scope.memberNomineeDetails}).success(function(data, status, headers, config) {
				$scope.MemberLastId =data;	
				//openClass('NomineeDetails','PaymentDetails','Bharat');
				location.reload(true);
				
				}).error(function(data, status, headers, config) {
					$scope.MemberLastId =data;
				});
	
			}

	// =============================================Payment Add 	
				 $scope.editPaymentDetails = function(member_id){


					 $scope.memberPayment.member_id=member_id;
				var link = baseUrl+'editMemberPayment';

				
				$http({url: link, method: "POST", data: $scope.memberPayment}).success(function(data, status, headers, config) {
					
					$scope.memberPayment = data;
				
					$scope.member_id =member_id;
				//	window.location.href = baseUrl+"/managePrc/addUser";

					}).error(function(data, status, headers, config) {
						$scope.memberPayment = "Response Fail";
					});

				
}
				   		
   		$scope.memberPayemnt111 = function (){
   		
   		
   		 $scope.s =document.getElementById("member_total_amount").value;
   		 $scope.memberPayment.member_total_amount = $scope.s;
   		 $scope.memberPayment.member_plan_amount = $scope.getAllMemberAmount.plan_amount;
   	

   			var i;
		var link = baseUrl+'addMemberPayment';		
	

		$http({url: link, method: "POST", data: $scope.memberPayment}).success(function(data, status, headers, config) {
			$scope.memberPaymentlist = data;	
			
			for(i=0;i<$scope.Taxtype.length;i++){
				
				var link = baseUrl+'addMemberPaymentTax?member_id='+$scope.memberPaymentlist+'&tax_type='+$scope.Taxtype[i].tax_type+'&tax_value='+$scope.Taxtype[i].tax_value;		
		

					$http.post(link).success(function(data, status, headers, config) {
						$scope.addmemberPaymentTaxData = data;
						
  						location.reload(true); 
					}).error(function(data, status, headers, config) {
						 $scope.addmemberPaymentTaxData = "Response Fail";
					});
				} 
			
		  location.reload(true); 
			}).error(function(data, status, headers, config) {
				$scope.memberPaymentlist = "Response Fail";
			});
			
	}
	// =============================================Payment Calculation	
   		
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
	
				
	//====================================== Edit User ============================================
			
				$scope.getUpdateUser = function(member_id)
				{
					window.location.href = baseUrl+"managePrc/EditUser?member_id="+member_id;
					
				}
				
				//====================================== delete User ============================================
				
							
			$scope.deleteRegisterMember = function(member_id) {
		
		var link = baseUrl+'deleteMasterMemberRegister?member_id='+member_id;
	
		$http['delete'](link).success(function(data, status, headers, config) {
				$scope.masterMemberRegister= data;
				  location.reload(true); 
		 $scope.getUpdateFamilyMember($scope.member_id);
		

			}).error(function(data, status, headers, config) {
					$scope.masterMemberRegister = "Response Fail";
			});
	};	
	
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
	
	//--------------------------------------------------- Remove Family row
	
	$scope.removeAlbumImageRow = function(family_membership_no) {
		var index = -1;
		var comArr = eval( $scope.MemberFamilyRegister);

		for( var i = 0; i < comArr.length; i++ ) {
			if( comArr[i].family_membership_no === family_membership_no ) {	
				

				index = i;
				var a = $scope.masterMemberRegister.membership_number;	
				$scope.count1--;
				$scope.family_membership_no = a +'F'+$scope.count1;
				break;
			}
		}
		if( index === -1 ) {
			alert( "Something gone wrong" );
		}
		$scope.MemberFamilyRegister.splice(index, 1 );
		
	};
// ---------------------------------------------------calculation payment	


	$scope.TaxRow = function() {
	
		 $scope.amount = document.getElementById("member_plan_amount").value ; //1000
	     $scope.discount1 = document.getElementById("member_discount").value ; // 
	     
	      $scope.discount = ($scope.amount *  $scope.discount1)/100; // 100
	     
	     $scope.total =  $scope.amount - $scope.discount; //900
	
		var comArr = eval( $scope.Taxtype);
	    $scope.sum=0;
		for( var i = 0; i < comArr.length; i++ ) {
		  
			$scope.sum = $scope.sum + comArr[i].tax_value; 
		}	
		$scope.taxammount = ( $scope.amount * $scope.sum)/100;

		$scope.finaltotal = $scope.total + $scope.taxammount;
	  
	  document.getElementById("member_total_amount").value = $scope.finaltotal;
	  	
	}
	// ---------------------------------------------------Club Name Addd 

	
	$scope.addClubName = function(){	
	var link = baseUrl+'addMasterClubName';		
	
	$http({url: link, method: "POST", data: $scope.masterClubName}).success(function(data, status, headers, config) {
		$scope.masterClubNamelist = data;	
		$scope.getAllClub();
		$scope.masterClubName.club_name="";
		$('#myModal').modal('hide');
		
	
		}).error(function(data, status, headers, config) {
			$scope.masterClubNamelist = "Response Fail";
		
		});
}
	// ---------------------------------------------------Get All Club Name  

	$scope.getAllClub = function(){
		var link = baseUrl+'getAllMasterClubName';  

	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllMasterClub = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllMasterClub = "Response Fail";
	});
	}	
	// ---------------------------------------------------Choice Name Addd 

	
	$scope.addMasterChoice = function(){	
	var link = baseUrl+'addMasterChoice';		
	
	$http({url: link, method: "POST", data: $scope.masterChoice}).success(function(data, status, headers, config) {
		$scope.masterChoice = data;	
		$scope.getAllClub();
		$scope.getAllMasterChoiceName();
		$('#myModalChoice').modal('hide');
		
		}).error(function(data, status, headers, config) {
			$scope.masterChoice = "Response Fail";
		
		});
}
	// ---------------------------------------------------Get All Choice Name  

	$scope.getAllChoice = function(){	
var link = baseUrl+'getAllMasterChoice';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllMasterChoiceName = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllMasterChoiceName = "Response Fail";
	});
	}	
	
	//----------------------------------==============------- Personal Info------================----------------=
	
	// ?????????????????????????????????????????????????????????????????????????????????????????	

	
	$scope.addRowPersonalChoice = function() {
		
			var link = baseUrl+'addMemberPersonalChoice?members_family_id='+$scope.members_family_id+'&member_family_type_of_relation='+$scope.member_family_type_of_relation+'&member_family_choices='+$scope.member_family_choices;
			
	
				$http.post(link).success(function(data, status, headers, config) {
						$scope.addMemberPersonalInformation = data;
				

							$scope.getAllMemberChoices();
						 $scope.MemberLastId =data;
					}).error(function(data, status, headers, config) {
						 $scope.MemberLastId = "Response Fail";
					});
				} 



// ?????????????????????????????????????????????name of club ,status????????????????????????????????????????????		

	$scope.addRowPersonalInfo1 = function() {
		
	
		var link = baseUrl+'addMemberPersonalInformation1?member_profession='+$scope.member_profession+'&member_other_Club_membership='+$scope.member_other_Club_membership+'&member_club_name='+$scope.member_club_name+'&member_marriage_anniversary='+$scope.member_marriage_anniversary+'&member_house_owend='+$scope.member_house_owend;		


		$http.post(link).success(function(data, status, headers, config) {
			$scope.addMemberPersonalInformation1 = data;
			
		  openClass('PersonalDetails','NomineeDetails', 'India');	
	
		}).error(function(data, status, headers, config) {
			 $scope.addMemberPersonalInfo = "Response Fail";
		});
	} 

		$scope.getFamilyRelation = function(){
		
			var link = baseUrl+'getMemberFamilyRelation';  
			
			$http.get(link).success(function(data, status, headers, config) {
				$scope.getAllMemberRelationNameList = data;
				
			}).error(function(data, status, headers, config) {
				$scope.getAllMemberRelationNameList = "Response Fail";
			});
			
			
		}
		
		
		//-------------------------------MemberChoice
		
		$scope.getAllMemberChoices = function(){
		
			var link = baseUrl+'getAllMemberChoice?member_id='+$scope.LastMemberId;


			$http.get(link).success(function(data, status, headers, config) {
				$scope.MemberChoice = data;
			

			}).error(function(data, status, headers, config) {
				$scope.MemberChoice = "Response Fail";
			});
			
		}
		
		
		
		
});