<?php
 $link = mysql_connect("localhost","root","");
 mysql_select_db("PictoLike");
 error_reporting(0);

 $query = mysql_query("SELECT * FROM test_table WHERE owner_gender='".$_REQUEST['gender']."'");
 
 while ($row = mysql_fetch_array($query))
	$output[] = $row;
 echo json_encode($output);
 
 mysql_close();  
?>