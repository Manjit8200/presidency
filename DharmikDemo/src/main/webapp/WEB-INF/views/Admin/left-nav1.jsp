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
		
		window.location.href="<%=request.getContextPath() %>/managePrc/pos";
					
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
<br>
<!-- Divider -->
<hr class="sidebar-divider my-0">



<!--Tasks Nav Item - Pages Collapse Menu -->
<li class="nav-item">
<a class="nav-link" href="<%=request.getContextPath() %>/managePrc/pos"  onclick="refreshPage()">
<i class="fa fa-calendar" aria-hidden="true"></i>
<span onclick="refreshPage()"> POS   </span>
</a>
</li>









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