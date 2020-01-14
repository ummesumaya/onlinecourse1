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
		  <div class="row">
		  	<div class="col-sm-2"></div>
		  	<div class="col-sm-8">
		  		<form class="form-inline" method="post" action="reg_cancel.php">
                <div class="form-group">
                  <label for="email">Enter Id:</label>
                  <input type="text" class="form-control"  name="std_id">
                </div>
                <div class="form-group">
                  <label for="email">Select Semester</label>
                  <select name="semester_id" id="" class="form-control">
                    <?php 

                        $select  = "SELECT * FROM semester";
                        $rs = mysqli_query($con,$select);
                        if($rs){

                            while($rows = mysqli_fetch_assoc($rs)){
                                $se_id = $rows['id'];
                                $semester = $rows['semester'];

                                ?>

                                <option value="<?php echo $se_id; ?>"><?php echo $semester; ?></option>

                                <?php 
                                }
                            }


                     ?>
                     
                  </select>
                </div>
                <input type="submit" name="search" class="btn btn-default" value="Search">
            </form>
		  	</div>
		  </div>
		  <div class="row" style="margin-top:10%;">
		  	


			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<table class="table table-bordered">
				    <thead>
				      <tr>
				        <th>Id</th>
				        <th>Course Name</th>
				        <th>Credit</th>
				        <th>Reg Fee</th>
				        <th>Action</th>
				      </tr>
				    </thead>
				    <tbody>
				    	<?php 
				    	if (isset($_POST['search'])) {
				    		$std_id = $_POST['std_id'];
				    		$semester_id = $_POST['semester_id'];
				    	
				    	$crs_nm_qry1 = "SELECT  reg_fee from student_payment where student_id = '$std_id' AND semester_id = $semester_id ";
								
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



				    	$select_qry = "SELECT courseenrolls.id,courseenrolls.studentRegno,course.courseName,course.courseUnit FROM courseenrolls INNER JOIN course ON courseenrolls.course = course.id WHERE courseenrolls.studentRegno = '$std_id' AND courseenrolls.semester= $semester_id AND courseenrolls.status=1 ";
				    	$rslts = mysqli_query($con,$select_qry);
				    	$num = mysqli_num_rows($rslts);
				    	if ($rslts && $num>0) {
				    		while ($rows = mysqli_fetch_assoc($rslts)) {
				    			$enrl_id = $rows['id'];
				    			$std_id = $rows['studentRegno'];
				    			$courseName = $rows['courseName'];
				    			$courseUnit = $rows['courseUnit'];

				    			?>

				    			 <tr>
							        <td><?php echo $std_id; ?></td>
							        <td><?php echo $courseName; ?></td>
							        <td><?php echo $courseUnit; ?></td>
							        <td><?php echo $relt_stts; ?></td>
							        <td><a href="?delet_reg=<?php echo $enrl_id; ?>"><button class="btn btn-danger">Delete</button></a></td>
							       
							      </tr>



				    			<?php
				    		
				    			
				    		}
				    	}
				    }


				    	 ?>

				    </tbody>

				  </table>
			</div>


			<?php


				if (isset($_GET['delet_reg'])) {
					$delet_reg = $_GET['delet_reg'];

					$del_qry = "DELETE FROM courseenrolls WHERE id= $delet_reg ";
					$del_rs =mysqli_query($con,$del_qry);
					if ($del_rs) {
						header("Localtion:reg_cancel.php");
					}
				}


			 ?>




		  </div>
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

