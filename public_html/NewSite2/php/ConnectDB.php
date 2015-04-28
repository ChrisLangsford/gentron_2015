<?php
function Connect()
{
	$host="localhost"; // Host name 
	$username="btsbcoza_admin"; // Mysql username 
	$password="Cl@ndest1ne"; // Mysql password 
	$db_name="btsbcoza_btsb";
 
	$con = mysqli_connect("$host", "$username", "$password", $db_name)or die("cannot connect");	

	return $con;
}

?>