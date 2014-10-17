<?php
 //$link = mysql_connect("localhost","root","");
 //mysql_select_db("PictoLike");
 //error_reporting(0);

 require_once('db_connect.php');
 $db = new DB_CONNECT;
 $con = $db->connect();

 $filename=$_GET['filename'];
 $query = mysql_query($con,"SELECT imageobj FROM picto WHERE filename='$filename' limit 1"); 

 list($data) = mysql_fetch_row($query);  
 header("Content-type: image/png");
 echo $data;
 mysql_close($con);  
?>