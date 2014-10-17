<?php
 //$link = mysql_connect("localhost","root","");
 //mysql_select_db("PictoLike");
 //error_reporting(0);

 require_once('db_connect.php');
 $db = new DB_CONNECT;
 $con = $db->connect();

 $query = mysql_query($con,"SELECT username,filename,datecreated,locationcreated,noOfLikes,noOfViews FROM picto WHERE username='test1' and LENGTH(imageobj)>0"); 

  $rows = array();
  while($r = mysql_fetch_assoc($query)) {
    $rows[]=$r;
  }
  echo json_encode($rows);
 
 mysql_close($con);  
?>