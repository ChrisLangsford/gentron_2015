<?php
ob_start();
include('ConnectDB.php');
$query = mysqli_query($con,"SELECT EventID,EventName FROM event");
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Undaunted Central - Pictures Upload</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href = "../css/bootstrap.min.css" rel = "stylesheet">
    <script>
    	function ShowProgress()
		{
			document.getElementById('upload').style.visibility = '';
		}
    </script>
  </head>
  <!--This is where the body starts-->
  <body>
  <!--This is where the navigation starts-->
    <div class = "navbar navbar-inverse navbar-static-top">
      <div class = "container">
      <a href="index.html" class = "navbar-brand">Undaunted Central - Home</a>
          <button class = "navbar-toggle" data-toggle = "collapse" data-target = ".navHeaderCollapse">
            <span class = "icon-bar"></span>
            <span class = "icon-bar"></span>
            <span class = "icon-bar"></span>
          </button>
        <div class = "collapse navbar-collapse navHeaderCollapse">
          
        </div>
      </div>
    </div>
    <!--This is where the navigation ends-->
    
    <!--Content starts here-->
    <div class="container">
        <div class="row">
        <h4>Create Event:</h4>
            <form method="post" enctype="multipart/form-data">
            	<div class="form-group">
    					<label for="exampleInputEmail1" id="Event">Event Name</label>
    					<input type="text" class="form-control" id="EventName"  name="EventName" placeholder="Enter Event Name">
  				</div>
                <div class="col-lg-12">
                    <input type="submit" name="Create" value="Create" style="height:35px; float:right; width:100%"/>
                </div>
            </form>
        </div>
        <div class="row">
        <h4>Events:</h4>
            <table class="table table-striped table-hover ">
  			<thead>
    			<tr>
      				<th>#</th>
                      <th>Event Name</th>
                      <th></th>
    			</tr>
 			</thead>
          	<tbody>
            <?php
			$count = 1;
            	while($row = mysqli_fetch_array($query))
				{
				echo "<tr>";
                echo "<td>$count</td>";
                echo "<td>".$row['EventName']."</td>";
                echo "<td><form method='post'><input type='hidden' value='".$row['EventID']."' name='EventID'/><button type='submit' name='Delete' value='Delete'>Delete</button></form></td>";
    			echo "</tr>";
				$count++;
				}
			
			?>
            </tbody>
           	</table>
        </div>
        <hr />
        <div class="row">
        <h4>Upload Pictures:</h4>
        	<form method="post" enctype="multipart/form-data">
            	<div class="col-lg-2">
                	<label for="select" class="col-lg-2 control-label">Event</label>
      			</div>
                <div class="col-lg-10">
        			<select class="form-control" id="select" name="EventName">
          				<?php
							$query = mysqli_query($con,"SELECT EventID,EventName FROM event");
							while($row = mysqli_fetch_array($query))
							{
								echo "<option>".$row['EventName']."</option>";	
							}
						?>
        			</select>
        		</div>
                <br /><br />
                <div class="col-lg-2">
                	<label for="select" class="col-lg-2 control-label">Pictures</label>
      			</div>
                <div class="col-lg-10">
    				<input type="file" style="width:100%" name="files[]" id="file" multiple accept="image/*">
  				</div>
                <br /><br />
                <div class="col-lg-12">
                    <input type="submit" name="Confirm" value="Confirm" style="height:35px; float:right; width:100%" onClick="ShowProgress()"/>
                    <br />
                    <center><img src="../img/ajax-loader.gif" style="height:19px; visibility:hidden" id="upload"></center>
                </div>
            </form>
            </div>
        </div>
        <hr />
        <div class="row">
        	<div class="col-md-12">
            	<center>Established 13 July 2003<br />Founding Members:  Ben Vorster, Priscilla Vorster, Steve Booth and Frederick Brand</center>
            </div>
        </div>
    </div>
    <!--Content ends here-->
    
                <script src="../js/jquery.min.js"></script>
                <script src = "../js/bootstrap.js"></script>
               
        </body>
</html>

<?php
if(isset($_POST['Create']))
{
	$EventName = $_POST['EventName'];
	$insert = "INSERT INTO event (`EventName`) VALUES ('$EventName')";
	mysqli_query($con,$insert);	
	header("Location:Upload.php");	
}

if(isset($_POST['Delete']))
{
	$EventID = $_POST['EventID'];
	$delete = "DELETE FROM event WHERE EventID='$EventID'";
	mysqli_query($con,$delete);	
	header("Location:Upload.php");	
}

if(isset($_POST['Confirm']))
{

$event = $_POST['EventName'];
$valid_formats = array("jpg", "JPG");
$max_file_size = 1024*10000; //100 kb
$path = "../img/$event/"; // Upload directory

$count = 0;

if(isset($_POST) and $_SERVER['REQUEST_METHOD'] == "POST"){
	// Loop $_FILES to execute all files
	foreach ($_FILES['files']['name'] as $f => $name) {     
	    $number = rand(1,10000);
		$temp = explode(".",$name);
		$extension = end($temp);
		$e = "img/".$event."/".$number.'.'.$extension;
		$query = "INSERT INTO `picture` (`PictureUrl`, `EventName`) VALUES ('$e', '$event')";
		$data = mysqli_query ($con,$query);
			       
	    if(move_uploaded_file($_FILES["files"]["tmp_name"][$f],$path.$number.'.'.$extension)) 
		{
	    	$count++; // Number of successfully uploaded file
	    }
	}
}
header("Location:Upload.php");	
}
?>