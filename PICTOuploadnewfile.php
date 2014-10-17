<?php
 //$link = mysql_connect("localhost","root","");
 //mysql_select_db("PictoLike");
 //error_reporting(0);

 require_once('db_connect.php');
 $db = new DB_CONNECT;
 $con = $db->connect();

/*
 * Following code will create a new file 
 * All files details are read from HTTP Post Request
 */
 
// array for JSON response
$response = array();
 
// check for required fields
if (isset($_POST['username']) && isset($_POST['filename']) ) {
 
    $name = $_POST['username'];
    $filename = $_POST['filename'];
	$datecreated = $_POST['datecreated'];
	$locationcreated = $_POST['locationcreated'];

 
    // mysql inserting a new row
    $result = mysql_query($con,"INSERT INTO picto(username, filename,datecreated,locationcreated) VALUES('$username', '$filename','$datecreated','$locationcreated')");
 
    // check if row inserted or not
    if ($result) {
        // successfully inserted into database
        $response["success"] = 1;
        $response["message"] = "File successfully created.";
 
        // echoing JSON response
        echo json_encode($response);

    } else {
        // failed to insert row
        $response["success"] = 0;
        $response["message"] = "Oops! An error occurred.";
 
        // echoing JSON response
        echo json_encode($response);

    }
} else {
    // required field is missing
    $response["success"] = 0;
    $response["message"] = "Required field(s) is missing";
 
    // echoing JSON response
    echo json_encode($response);

}
mysql_close($con);
?>