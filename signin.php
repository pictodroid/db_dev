<?php
 $link = mysql_connect("localhost","root","");
 mysql_select_db("PictoLike", $link);
 
 $query = mysql_query("SELECT * FROM User WHERE username = '".$_REQUEST['username']."' AND password= '".$_REQUEST['password']."'", $link);
	
 while ($row = mysql_fetch_assoc($query))
	$output[] = $row;
 echo json_encode($output);
 
 mysql_close();  
?>