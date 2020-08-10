<html>
<head> 
<style>
 
.sidebar .sidebar-brand .sidebar-brand-text {
    float: left;
    margin-left: -211px !important;
    }
     
   .sidebar .sidebar-brand .sidebar-brand-icon img {
    max-width: 70% !important;
   margin-left: 10px !important;
}
  
</style>

<script type="text/javascript">
	function refreshPage(){
		
		window.location.href="<%=request.getContextPath() %>/managePrc/addUser";
					
	}
</script>
</head>

<body><ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion toggled"
			id="accordionSidebar">
<!-- Sidebar - Brand -->
<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath() %>/managePrc/dashboard">


<div class="sidebar-brand-icon">

<img src="<%=request.getContextPath() %>/resources/admin/img/logo-kadji.png" >

</div>

<!-- <div class="sidebar-brand-text" style="white-space: nowrap;"> <br>  <br> <br>Presidency Club</div> -->
</a>

<!-- Divider -->
<hr class="sidebar-divider my-0">



<!--Tasks Nav Item - Pages Collapse Menu -->
<li class="nav-item">
<a class="nav-link" href="<%=request.getContextPath() %>/managePrc/addUser"  onclick="refreshPage()">
<i class="fa fa-calendar" aria-hidden="true"></i>
<span onclick="refreshPage()"> MemberShip   </span>
</a>
</li>
<hr class="sidebar-divider">

<%-- <li class="nav-item">
<a class="nav-link" href="<%=request.getContextPath() %>/managePrc/plan">
<i class="fa fa-clock-o" aria-hidden="true"></i>
<span> User Plan   </span>
</a>
</li> --%>
<li class="nav-item">
<a class="nav-link" href="<%=request.getContextPath() %>/managePrc/plan_master" >
<i class="fa fa-tasks" aria-hidden="true"></i>
<span >  MemberShip Plan   </span>
</a>
</li>
<hr class="sidebar-divider my-0">


<%-- 
<li class="nav-item">
<a class="nav-link" href="<%=request.getContextPath() %>/managePrc/transaction">
<i class="fa fa-tasks" aria-hidden="true"></i>
<span> Transaction   </span>
</a>
</li> --%>

<%-- 
<li class="nav-item">
<a class="nav-link" href="<%=request.getContextPath() %>/managePrc/benefits">
<i class="fa fa-tasks" aria-hidden="true"></i>
<span>   Member Benifits    </span>
</a>
</li>
 --%>

<!-- =======================================   Sub List +====================================================== -->
<!--Tasks Nav Item - Pages Collapse Menu -->
 <li class="nav-item">
<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#tasks" aria-expanded="true" aria-controls="tasks">
<i class="fa fa-thumb-tack"></i>
<span>Product</span>
</a>
<div id="tasks" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
<div class="bg-white py-2 collapse-inner rounded">

<a class="collapse-item" href="<%=request.getContextPath() %>/managePrc/product">

<span>  Add Product    </span>
</a>
<a class="collapse-item" href="<%=request.getContextPath() %>/managePrc/category"> Add Category </a>
<a class="collapse-item" href="<%=request.getContextPath() %>/managePrc/sub_category"> Add Sub-category </a>
<a class="collapse-item" href="<%=request.getContextPath() %>/managePrc/type">Add Type  </a>
</div>
</div>
</li>

<hr class="sidebar-divider my-0">

 <li class="nav-item">
<a class="nav-link" href="<%=request.getContextPath() %>/managePrc/generateCard">
<i class="fa fa-tasks" aria-hidden="true"></i>
<span>  Generate Card   </span>
</a>
</li>


<hr class="sidebar-divider my-0">

 <li class="nav-item">
<a class="nav-link" href="<%=request.getContextPath() %>/managePrc/location">
<i class="fa fa-tasks" aria-hidden="true"></i>
<span>  Add Location   </span>
</a>
</li>

<hr class="sidebar-divider my-0">

 <li class="nav-item">
<a class="nav-link" href="<%=request.getContextPath() %>/managePrc/stafuser">
<i class="fa fa-tasks" aria-hidden="true"></i>
<span>  Staf Users  </span>
</a>
</li>

 
<hr class="sidebar-divider my-0">

 <li class="nav-item">
<a class="nav-link" href="<%=request.getContextPath() %>/managePrc/pos">
<i class="fa fa-tasks" aria-hidden="true"></i>
<span>  Pos </span>
</a>
</li>

 
<!-- Divider -->
<!-- <hr class="sidebar-divider"> -->


<!--Company Nav Item - Pages Collapse Menu -->
<%-- <li class="nav-item">
<a class="nav-link" href="<%=request.getContextPath() %>/ManageYWM/add-schedule">
<i class="fa fa-calendar" aria-hidden="true"></i>
<span> Add Schedule  </span>
</a>
</li>
 --%>


<!-- Divider -->
<!-- <hr class="sidebar-divider"> -->

<!--Users Nav Item - Pages Collapse Menu -->
<%-- <li class="nav-item">
<a class="nav-link" href="<%=request.getContextPath() %>/ManageYWM/add-course">
<i class="fa fa-tasks" aria-hidden="true"></i>
<span> Add Course </span>
</a>
</li> --%>


<!-- Divider -->
<!-- <hr class="sidebar-divider"> -->

<!--Users Nav Item - Pages Collapse Menu -->
<%-- <li class="nav-item">
<a class="nav-link" href="<%=request.getContextPath() %>/ManageYWM/transactions">
<i class="fa fa-credit-card" aria-hidden="true"></i>
<span> Transactions </span>
</a>
</li>  --%>

<!-- Divider -->
<hr class="sidebar-divider"> 

<!--Users Nav Item - Pages Collapse Menu -->
<%-- <li class="nav-item">
<a class="nav-link" href="<%=request.getContextPath() %>/ManageYWM/manage_Album">
<i class="fa fa-picture-o" aria-hidden="true"></i>
<span> Albums </span>
</a>
</li> 
 --%>
<!-- Divider -->
			

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline mt-15">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>
		</ul>
    
</body>


</html>