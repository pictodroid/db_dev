<?php
 
/*
 * Following code will create a new file 
 * All files details are read from HTTP Post Request
 */
 
// array for JSON response
$response = array();
 
// check for required fields
if (isset($_POST['username']) && isset($_POST['filename']) ) {
 
    $username = $_POST['username'];
    $filename = $_POST['filename'];
	$datecreated = $_POST['datecreated'];
	$locationcreated = $_POST['locationcreated'];
    $tmpName  = $_FILES['filecontent']['tmp_name'];
    $fp      = fopen($tmpName, 'r');
    $content = fread($fp, filesize($tmpName));
    $content = addslashes($content);
    fclose($fp);

    $imagedata = $_FILES['filecontent'];
	  
    // include db connect class
    require_once __DIR__ . '/db_connect.php';
 
    // connecting to db
    $db = new DB_CONNECT();
 
    // mysql inserting a new row
    $result = mysql_query("INSERT INTO picto(username, filename, datecreated, locationcreated,imageobj) VALUES('$username', '$filename', '$datecreated', '$locationcreated','$content')");
 
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
?>