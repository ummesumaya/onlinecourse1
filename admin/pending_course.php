<?php 
session_start();
include('includes/config.php');

 ?>




<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Admin | Semester</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
</head>

<body>
<?php include('includes/header.php');?>
    <!-- LOGO HEADER END-->
<?php if($_SESSION['alogin']!="")
{
 include('includes/menubar.php');
}
 ?>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
       <div class="container">
       	<a href="change-password.php"><button class="btn btn-danger">Go Back</button></a>
  <h2>Bordered Table</h2>
  <p>The .table-bordered class adds borders to a table:</p>            
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>student id</th>
        <th>course name</th>
        <th>Registration Fee</th>
        <th>Aprove</th>
        <th>UnAprove</th>
        <th>View</th>
      </tr>
    </thead>
    <tbody>
	<?php

// $con = mysqli_connect("localhost","root","","onlinecourse");
						$select  = "SELECT * FROM courseenrolls WHERE status=0";
						$rs = mysqli_query($con,$select);
						if($rs){
							while($rows = mysqli_fetch_assoc($rs)){
								$crs_name = $rows['course'];
								$studentRegno = $rows['studentRegno'];
								$semester = $rows['semester'];
								
								$crs_nm_qry = "SELECT  courseName from course where id = $crs_name";
								
								$crs_rslt_hmm = mysqli_query($con,$crs_nm_qry);
								$crs_rslt = mysqli_fetch_array($crs_rslt_hmm);

								$crs_nm_qry1 = "SELECT  reg_fee from student_payment where student_id = '$studentRegno' AND semester_id = $semester ";
								
								$crs_rslt_hmm1 = mysqli_query($con,$crs_nm_qry1);
								if ($crs_rslt_hmm1) {

								$crs_rslt1 = mysqli_fetch_array($crs_rslt_hmm1);
								$stts = $crs_rslt1['reg_fee'];
								if ($stts<2000) {
									$relt_stts = "Unpaid";
								}else{
									$relt_stts = "Paid";
								}
									
								}else{
									$relt_stts = "Unpaid";
								}
								
								
								?>
							
							 <tr>
								<td><?php echo $rows['studentRegno']; ?></td>
								<td><?php echo $crs_rslt['courseName']; ?></td>
								<td><?php echo $relt_stts; ?></td>
								<td><a href="?ce_id=<?php echo $rows['id']; ?>"><button class="btn btn-primary">Aprove</button></a></td>
								<td><a href="?rej_ce_id=<?php echo $rows['id']; ?>"><button class="btn btn-primary">UnAprove</button></a></td>
								<td><a target="_blank" href="student_details_for_admin.php?view_id=<?php echo $rows['studentRegno']; ?>"><button class="btn btn-primary">View</button></a></td>
							  </tr>
								
								
							<?php }
						}
						


	?>
	
	<?php 
	if(isset($_GET['ce_id'])){
		$ce_id =$_GET['ce_id'];
		
		$update = "Update courseenrolls set status=1 where id = $ce_id";
		$rrr = mysqli_query($con,$update);
		
		if($rrr){
			header("Location:pending_course.php");
		}
		
		
	}
		if(isset($_GET['rej_ce_id'])){
		$rej_ce_id =$_GET['rej_ce_id'];
		
		$updates = "Update courseenrolls set status=2 where id =  $rej_ce_id";
		$rrss = mysqli_query($con,$updates);
		if($rrss){
			header("Location:pending_course.php");
		}
		
		
	}
	
	
	
	?>
     
     
    </tbody>
  </table>
</div>





        </div>
    <!-- CONTENT-WRAPPER SECTION END-->
  <?php include('includes/footer.php');?>
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
</body>
</html>

