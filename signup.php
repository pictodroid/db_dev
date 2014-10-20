<?php
 $link = mysql_connect("localhost","root","");
 mysql_select_db("PictoLike", $link);
 
 // check if user exists
 $query = mysql_query("SELECT * FROM User WHERE username = '".$_REQUEST['username']."'", $link);
 $user_count = mysql_num_rows($query);
 if ($user_count > 0) {
	echo "user exists";
	mysql_close($link);
	return;
 }
 
 // add user
 
 //initialize columns that are not yet passed
 
 //
 //$_REQUEST['DOC_ACCOUNT']=== NULL;
 //$_REQUEST['PHONEID']
 //$_REQUEST['DOB_day']=== NULL;
 //$_REQUEST['DOB_month']=== NULL;
 //$_REQUEST['DOB_year']=== NULL;
 //$_REQUEST['totalNoOfViews']=== NULL;
 //$_REQUEST['totalNoOfLikes']=== NULL;
 // , '".$_REQUEST['DOC_ACCOUNT']."',  '".$_REQUEST['PHONEID']."' 
 
 $query = mysql_query("INSERT INTO User VALUES ( '".$_REQUEST['username']."','".$_REQUEST['email']."','".$_REQUEST['password']."','".$_REQUEST['birthday']."',
		      '".$_REQUEST['gender']."'
		      )", $link);
 $user_count = mysql_affected_rows();
 if ($user_count = 0) {
	echo "insert failed";
	mysql_close($link);
	return;
 }
 
 mysql_close();
 return true;
?>