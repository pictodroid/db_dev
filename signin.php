<?php
 //$link = mysql_connect("localhost","root","");
 //mysql_select_db("PictoLike");
 //error_reporting(0);

 require_once('db_connect.php');
 $db = new DB_CONNECT;
 $con = $db->connect();
 
 $query = mysql_query($con,"SELECT * FROM User WHERE username = '".$_REQUEST['username']."' AND password= '".$_REQUEST['password']."'");
 	
 while ($row = mysql_fetch_assoc($query))
	$output[] = $row;
 echo json_encode($output);
 
mysql_close($con);  
?>