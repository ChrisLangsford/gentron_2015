<?php
include 'ConnectDB.php';
function GetAll ($table_name)
{
	$con = Connect();
	$query = "SELECT * FROM ".$table_name;
	$data = mysqli_query($con,$query);
	$rows = array();
	while($row = mysqli_fetch_array($data))
	{
		$rows[] = $row;
	}
	return $rows;
}

function GetLimit ($table_name,$limit)
{
	$con = Connect();
	$query = "SELECT * FROM ".$table_name." ORDER BY id DESC LIMIT ".$limit;
	$data = mysqli_query($con,$query);
	$rows = array();
	while($row = mysqli_fetch_array($data))
	{
		$rows[] = $row;
	}
	return $rows;
}

function GetOne ($table_name,$item)
{
	$con = Connect();
	$Query = "SELECT * FROM $table_name WHERE id='$item'";
	$data = mysqli_query($con,$Query);
	$row = mysqli_fetch_array($data);
	
	return $row;
}

function GetSpecial ($Query)
{
	$con = Connect();
	$data = mysqli_query($con,$Query);
	$rows = array();
	while($row = mysqli_fetch_array($data))
	{
		$rows[] = $row;
	}
	return $rows;
}

function SpecialSingle ($Query)
{
	$con = Connect();
	$data = mysqli_query($con,$Query);
	$row = mysqli_fetch_array($data);
	
	return $row;
}

function CUD ($query)
{
	$con = Connect();
	$data = mysqli_query($con,$query);	
}
?>