<?php
 $link = mysql_connect("localhost","root","");
 mysql_select_db("PictoLike");
// error_reporting(0);

 $query = mysql_query("SELECT username,filename,datecreated,locationcreated,noOfLikes,noOfViews FROM picto WHERE username='test1' and LENGTH(imageobj)>0"); 

  $rows = array();
  while($r = mysql_fetch_assoc($query)) {
    $rows[]=$r;
  }
  echo json_encode($rows);
 
 mysql_close();  
?>