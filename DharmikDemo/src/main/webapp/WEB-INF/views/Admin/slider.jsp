<!DOCTYPE html>
<html lang="en">
	<head>
		<title>ADD INDIVIDUAL MEMBER | GBGC</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>		
		<script src="http://jcrop-cdn.tapmodo.com/v0.9.12/js/jquery.Jcrop.js"></script>
		<link rel="stylesheet" href="http://jcrop-cdn.tapmodo.com/v0.9.12/css/jquery.Jcrop.css"	type="text/css" />
		
	</head>
	<body ng-app="prc" ng-controller="memberCtrl" >
		
														<div class="row">
															<div class="col-md-6">
																<div class="panel panel-default">
																	<div style="padding: 5px 0px 0px 0px;" class="panel-body">
																		<div><h4 style="text-transform: uppercase; margin-top: 0px; margin-bottom: 0px;"> Profile Picture </h4></div>
																	</div>
																	<div class="panel-body">
																		<div class="row">
																			<div class="col-md-12">
																				<div class="form-group">
																					<input type="file" id="profile" name="profile" ng-model="profile" class="form-control">
																				</div>
																			</div>
																		</div>
																		<div class="row" align="center">
																			<div class="col-md-12">
																				<img src="" id="target" />
																				<form name="myForm">
																					<input type="hidden" name="x" id="valuex" ng-model="valuex" />
																					<input type="hidden" name="y" id="valuey" ng-model="valuey" />
																					<input type="hidden" name="w" id="valuew" ng-model="valuew" />
																					<input type="hidden" name="h" id="valueh" ng-model="valueh" />
																				</form>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															</div>
															
										
								
		<script>
			//For Add
			jQuery(function($) {
				function readURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							if ($('#target').data('Jcrop')) {
							    $('#target').data('Jcrop').destroy();
							    $('#target').removeAttr('style');
							}
							
							var u = URL.createObjectURL(input.files[0]);
						    var img = new Image;
						    img.onload = function() {
						        if(img.width < 100 || img.height < 100)
						        {
						        	alert("Minimum image size should be 100px X 100px");
						        	$('#target').attr('src', "");
						        	document.getElementById("profile").value = null;
						        }
						        else
						        {
						        	$('#target').css("min-height", "100px");
								    $('#target').css("min-width", "100px");
									
									$('#target').attr('src', e.target.result);
									$('#target').Jcrop({
										aspectRatio : 1 / 1,
										boxWidth : 500,
										boxHeight : 400,
										minSize : [100, 100],
										setSelect : [ 100, 100, 400, 400 ],
										onChange : setCoordinates,
										onSelect : setCoordinates
									});
						        }
						    };
						        
						    img.src = u;
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
				$("#profile").change(function() {
					readURL(this);
				});
				$("#profile").click(function() {
					this.value = null;
				});
			});
			
			function setCoordinates(c) {
				//alert("x " + c.x + " y " + c.y);
				//alert("w " + c.w + " h " + c.h);
				document.myForm.x.value = Math.round(c.x);
				document.myForm.y.value = Math.round(c.y);
				document.myForm.w.value = Math.round(c.w);
				document.myForm.h.value = Math.round(c.h);
			};
			
			function checkCoordinates() {
				if (document.myForm.x.value == "" || document.myForm.y.value == "") {
					alert("Please select a crop region");
					return false;
				} else {
					return true;
				}
			};
		</script>
		
		
	</body>
</html>
