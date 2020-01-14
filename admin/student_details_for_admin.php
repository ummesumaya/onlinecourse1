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
       	<?php 

// $con = mysqli_connect("localhost","root","","onlinecourse");


	if (isset($_GET['view_id'])) {
		$view_id = $_GET['view_id'];


?>
	<a href="change-password.php"><button class="btn btn-danger">Go Back</button></a>
  <h2>Bordered Table</h2>
  <p>The .table-bordered class adds borders to a table:</p>            
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>student id</th>
        <th>Option</th>
        <th>View</th>
      </tr>
    </thead>
    <tbody>
							
							 <tr>
								<td><?php echo $view_id ?></td>
								<td>
									<form action="" method="get">
										<input type="hidden" name="std_id" value="<?php echo $view_id; ?>">
										<select name="sems_id" id="">
											<?php 

											$select  = "SELECT * FROM semester";
											$rs = mysqli_query($con,$select);
											if($rs){

												while($rows = mysqli_fetch_assoc($rs)){
													$se_id = $rows['id'];
													$semester = $rows['semester'];

													?>

													<option value="<?php echo $se_id ?>"><?php echo $semester; ?></option>

													<?php 
													}
												}
											 ?>
											
										</select>
									
								</td>
								<td>
									<input type="submit" name='veiw' value="view">
								</td>
								</form>
							  </tr>
								
     
     
    </tbody>
  </table>

<?php 
}





 	if (isset($_GET['veiw'])) {
		echo $sems_id = $_GET['sems_id'];
		$std_id = $_GET['std_id'];


?>
  <h2>Bordered Table</h2>
  <p>The .table-bordered class adds borders to a table:</p>            
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>student id</th>
        <th>Total Credit</th>
        <th>Total Sub</th>
        <th>Go back</th>
      </tr>
    </thead>
    <tbody>
	<?php


// 	SELECT Orders.OrderID, Customers.CustomerName
// FROM Orders
// INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

					
								
								?>
							
							 <tr>
								<td><?php echo $std_id; ?></td>
								<?php 

									$ttl_sub = "SELECT courseenrolls.*,course.* FROM courseenrolls INNER JOIN course ON courseenrolls.course= course.id WHERE courseenrolls.studentRegno =$std_id AND courseenrolls.semester= $sems_id AND courseenrolls.status=1";
									$rs= mysqli_query($con,$ttl_sub);
									$num = mysqli_num_rows($rs);
									$total=0;
									while ($row = mysqli_fetch_assoc($rs)) {
										$credit =$row['courseUnit'];
										$total = $total+ $credit;
									}


								 ?>
								<td><?php echo $total; ?></td>
								<td><?php echo $num; ?></td>
								<td><a href="pending_course.php"><button class="btn btn-primary">Go Back</button></a></td>
							  </tr>
								
    </tbody>
  </table>

<?php 
}

 ?>


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

