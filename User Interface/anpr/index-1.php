<!DOCTYPE html>
  <?php
  session_start();
  ?>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>ANPR</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="./bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="./dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
<body class="hold-transition skin-blue layout-top-nav">
<?php
if($_SESSION["name"]) {
?>
<div class="wrapper">

  <header class="main-header">
  <?php

    $con = mysqli_connect('127.0.0.1','root','');

    if(!$con)
      {
        
        echo "Not Connected To Server";
      }
      if(!mysqli_select_db($con,'openanpr'))
      {
        
        echo "Database Not Selected";
        
      
        }
  $sql = 'Select id,plate,make,color,type,path from cardata limit 1';

  $result = $con->query($sql);
  if ($result->num_rows > 0) {
 
      // output data of each row
  while($row = $result->fetch_assoc()) {

        // echo "Plate: " . $row["plate"]. "<br>". " Make: " . $row["make"]. "<br>". " Color: " . $row["color"]. "<br>";
       

    ?>
    <nav class="navbar navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a href="./index2.html" class="navbar-brand"><b>ANPR</b> Automatic Number Plate Recognition</a>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
            <i class="fa fa-bars"></i>
          </button>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
        
        </div>
        <!-- /.navbar-collapse -->
        <!-- Navbar Right Menu -->
        <div style="margin:10px" class="pull-right">
                    <a href="#" class="btn btn-default btn-flat">Sign out</a>
                  </div>
        <!-- /.navbar-custom-menu -->
      </div>
      <!-- /.container-fluid -->
    </nav>
  </header>
  <!-- Full Width Column -->
  <div class="content-wrapper">
    <div class="container">
      <!-- Content Header (Page header) -->
     
      <!-- Main content -->
      <section class="content">
      <div class="row">
        <div class="col-md-6">
            <div class="box box-solid">
              <div class="box-header with-border">
                <h3 class="box-title">Image</h3>
              </div>
              <!-- /.box-header -->
              <div class="box-body">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                
                  <div class="carousel-inner">
                    <div class="item active">
                    <?php
                      $image = "file:///".$row['path'];
                      $imageData = base64_encode(file_get_contents($image));
                      echo '<img width="100%" height="100%" src="data:image/jpeg;base64,'.$imageData.'">';
                      ?>
                  </div>
                    
                  </div>
                  
                </div>
              </div>
              <!-- /.box-body -->
            </div>
            <!-- /.box -->
          </div>
        <!-- /.content -->
        <div class="col-md-6">
        <div class="box">
            <div class="box-header">
              <h3 class="box-title">Car Details</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-striped">
                <tr>
                  <th style="width: 50%">License Plate</th>
                  
                  <td style="widht:50%"><?php echo $row["plate"] ?></td>
                  
                </tr>
                <tr>
                  <th style="width: 50%">Vehicle Color</th>
                  
                  <td style="widht:50%"><?php echo $row["color"] ?></td>
                  
                </tr>
                <tr>
                  <th style="width: 50%">Vehicle Make</th>
                  
                  <td style="widht:50%"><?php echo $row["make"] ?></td>
                  
                </tr>
                <tr>
                  <th style="width: 50%">Vehicle Make Model</th>
                  
                  <td style="widht:50%">Progress</td>
                  
                </tr>
                <tr>
                  <th style="width: 50%">Vehicle Type</th>
                  
                  <td style="widht:50%"><?php echo $row["type"] ?></td>
                  
                </tr>
                <tr>
                  <th style="width: 50%">Total Processing Time</th>
                  
                  <td style="widht:50%">Progress</td>
                  
                </tr>
               
              </table>
            </div>
            <!-- /.box-body -->
          </div> 
          
        </div>
      </div>
      <?php
      $sql = "UPDATE cardata SET is_read='1' WHERE id=$row[id]";
      if ($con->query($sql) === TRUE) {
        // echo "Record updated successfully";
      } else {
        // echo "Error updating record: " . $con->error;
      }

          }
          
        }

        ?>
    </section>
    <?php
      }
      else echo "<h1>Please login first .</h1>";
      ?>
    
  </div>
    <!-- /.container -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="container">
      <div class="pull-right hidden-xs">
        <b>Version</b> 3.0.0
      </div>
      <strong>Copyright &copy; 2019 <a href="https://www.xclusive-solutions.com">Xclusive Solutions</a>.</strong> All rights
      reserved.
    </div>
    <!-- /.container -->
  </footer>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="./bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="./bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="./dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="./dist/js/demo.js"></script>
</body>
</html>
