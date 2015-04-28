<?php
include('ConnectDB.php');
$Event = $_GET['Event'];
$GETMERCH = "SELECT PictureUrl FROM picture WHERE EventName='".$Event."'";
$GETMERCHDATA = mysqli_query($con,$GETMERCH);
$DataAll = array();
	while($row = mysqli_fetch_array($GETMERCHDATA))
	{
	$row_dataAll = array(
   	'URL' => $row['PictureUrl']
   );
	array_push($DataAll, $row_dataAll);
	}
	
	echo json_encode($DataAll);
?>