 <?php 

$con = mysqli_connect("localhost","root","","onlinecourse");
if (!$con) {
    echo "error";
}



if (isset($_POST['pay_tk'])) {
    $std_id = $_POST['std_id'];
    $rcpt = $_POST['rcpt'];
    $semester_id = $_POST['semester_id'];
    if ($_POST['p_method']=="tuition") {

        $tuition_fees = $_POST['tuition_fee'];

        $insert_query = "INSERT INTO student_payment(student_id,semester_id,tuition_fee,recept_serial) VALUES('$std_id',$semester_id,'$tuition_fees','$rcpt') ";

        $rs = mysqli_query($con,$insert_query);
        if ($rs) {
            header("Location:index.php");
        }else{
            echo "error";
        }

        
    }else{

         $reg_fees = $_POST['reg_fee'];
          $insert_query = "INSERT INTO student_payment(student_id,semester_id,reg_fee,recept_serial) VALUES('$std_id',$semester_id,'$reg_fees','$rcpt') ";

        $rs = mysqli_query($con,$insert_query);
         if ($rs) {
            header("Location:index.php");
        }else{
             echo "error";
        }

    }


    
}

?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Accountant</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />

</head>
<body>
 <div class="navbar navbar-inverse set-radius-zero">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                 <a class="navbar-brand" href="#" style="color:#fff; font-size:24px;4px; line-height:24px; ">

                   Online Course Registration Accounts Section
                </a>

            </div>

            <div class="left-div">
                <i class="fa fa-user-plus login-icon" ></i>
        </div>
        <div class="bttn" style="float: right;margin-top:-7%;">
           <a href="login.php"> <button class="btn btn-primary"> logout</button></a>
        </div>
            </div>
</div>

<div class="container">
    <div class="row" style="margin-top:2%; padding-bottom: 7%;">
        <div class="col-sm-3">
            
        </div>
        <div class="col-sm-6">
            <form method="post" action="index.php">
                <div class="form-group">
                  <label for="email">Enter Receptt No:</label>
                  <input type="text" class="form-control"  name="rcpt">
                </div>
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

                                <option value="<?php echo $se_id ?>"><?php echo $semester; ?></option>

                                <?php 
                                }
                            }


                     ?>
                     
                  </select>
                </div>
                <div class="form-group">
                       <label class="" for="">Select Option</label>
                        <select class="form-control" name="p_method" onchange="yesnoCheck(this);" id="">
                        <option>Select Option</option>
                        <option value="tuition">Tuition Fee</option>
                        <option value="reg">Registration Fee</option>
                        
                      </select>
                     </div>
                     <div class="form-group" id="ifYes" style="display: none;">
                        <label for="">Enter Tuition Fee:</label> 
                        <input type="text" class="form-control"  name="tuition_fee" /><br />
                    </div>
                    <div class="form-group" id="ifno" style="display: none;">
                        <label for="">Enter Reg Fee:</label> 
                        <input type="text" class="form-control"  name="reg_fee" /><br />
                    </div>  
                <input type="submit" name="pay_tk" class="btn btn-default" value="submit">
            </form>
        </div>
    </div>
</div>

       

</body>

 <script>
    function yesnoCheck(that) {
    if (that.value == "tuition") {
 // alert("check");
        document.getElementById("ifYes").style.display = "block";
    } else {
        document.getElementById("ifYes").style.display = "none";
    }

    if (that.value == "reg") {
 // alert("check");
        document.getElementById("ifno").style.display = "block";
    } else {
        document.getElementById("ifno").style.display = "none";
    }
}
</script>