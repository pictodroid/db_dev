<?php
//require_once('phpmailer/mail.php');
require_once('phpmailer/gmail.php');
require_once('db_connect.php');
$db = new DB_CONNECT;
$con = $db->connect();

/* for simple mail */
/*//Set who the message is to be sent from
$mail->setFrom('from@example.com', 'First Last');
//Set an alternative reply-to address
$mail->addReplyTo('replyto@example.com', 'First Last');
//Set who the message is to be sent to
$mail->addAddress('whoto@example.com', 'John Doe');
//Set the subject line
$mail->Subject = 'PHPMailer mail() test';
//Read an HTML message body from an external file, convert referenced images to embedded,
//convert HTML into a basic plain-text alternative body
$mail->msgHTML(file_get_contents('contents.html'), dirname(__FILE__));
//Replace the plain text body with one created manually
$mail->AltBody = 'This is a plain-text message body';
//Attach an image file
$mail->addAttachment('images/phpmailer_mini.png');*/

//var_dump($_REQUEST);
// Get POST parameters
if(isset($_REQUEST)){
	switch($_REQUEST['action']){

		case 'getCode':															// If the primary authentication
		$SQL = 'SELECT COUNT(*) as `count_user`
		FROM `user`
		WHERE username=\''.$_REQUEST['username'].'\'
		AND email=\''.$_REQUEST['email'].'\'';
		$result = mysql_query($SQL);											// retrieve data from the database 
		$res_arr = mysql_fetch_assoc($result); echo $res_arr['count_user'].'<br>';
		if(!$res_arr['count_user']){											// if this user is not in database
			session_start();													// Start session
			$username 	= $_REQUEST['username'];
			$email 		= $_REQUEST['email'];
			$password 	= $_REQUEST['password'];
			$birthday	= $_REQUEST['birthday'];
			$gender = 0;
			if($_REQUEST['gender']=='male') $gender = 1;
			$SQL = " INSERT INTO `user` (username,email,password,birthday,gender) 
			VALUES ('$username','$email','','$birthday','$gender') ";
			$result = mysql_query($SQL);
			if($result){
				$_SESSION['CODE'] = getCode();									// Generated test sequence of characters
				$mail->setFrom('pictolike@gmail.com', 'PictoLike Team');		// Send an email with a check character sequence 
				$mail->addAddress($email, 'PictoLike User');
				$mail->Subject = 'user authentication';
				$mail->msgHTML($_SESSION['CODE']);
				$mail->AltBody = '';
				if (!$mail->send()){											// If no email sent to send an error message
					$send_arr['Auth'] 		= 'false';							// (with a request to check and correct the email)
		    		$send_arr['Message'] = 'Error sending CODE, please check email. Error: '.$mail->ErrorInfo;
				} else {														// If the email has been sent to the client to send the message
					$_SESSION['username'] 	= $username;
					$_SESSION['birthday'] 	= $birthday;
					$_SESSION['gender'] 	= $gender;
		   			$send_arr['SESSID'] 	= session_id();						// Set Session ID
		   			$send_arr['Auth'] = 'true';
		   			$send_arr['Message'] = 'Please input CODE (look you email)';
				}
				echo json_encode($send_arr);
			}
		} else {
			$send_arr['Auth'] = 'false';
			$send_arr['Message'] = 'User with this combination of name and email already exists, change the name and (or) an email.';
			echo json_encode($send_arr);
		}
		break;																	// End section primary user authentication
		/* for gmail */ 
		//$mail->setFrom('pictolike@gmail.com', 'PictoLike Team'); /*[2:52:38] Pourzand: Password51*/ //Set who the message is to be sent from
		//$mail->addReplyTo('replyto@example.com', 'First Last');						//Set an alternative reply-to address
		//$mail->addAddress('hpourzand@gmail.com', 'PictoLike User');	//hpourzand@gmail.com 	//Set who the message is to be sent to
		//$mail->addAddress('hoofar@pictolike.com', 'PictoLike User');
		//$mail->Subject = 'user authentication';											//Set the subject line
		//Read an HTML message body from an external file, convert referenced images to embedded,
		//convert HTML into a basic plain-text alternative body
		//$mail->msgHTML(file_get_contents('contents.html'), dirname(__FILE__));
		//$mail->msgHTML('SECRET_CODE_NEW');
		//$mail->AltBody = '';															//Replace the plain text body with one created manually
		//$mail->addAttachment('images/phpmailer_mini.png');							//Attach an image file
		/*send the message, check for errorss
		if (!$mail->send()) {
		    echo "Mailer Error: " . $mail->ErrorInfo;
		} else {
		    echo "Message sent!";
		}*/
// If the reception receipt verifying the sequence of symbols 
		case 'testCode':
// retrieve data from the database 

// Comparison with POST parameters 

// Set Session ID 

// If everything is in order shipping confirmation 

// If the check does not match the sequence of characters stored in the database send a message 

//End section confirmation parity symbol sequences 
		break;
		
		case 'getAuth':															// If authentication 
		$SQL = 'SELECT COUNT(*) as `count_user`
		FROM `user`
		WHERE username=\''.$_REQUEST['username'].'\'
		AND email=\''.$_REQUEST['email'].'\'
		AND `password`=\''.$_REQUEST['password'].'\'';
		$result = mysql_query($SQL);											// retrieve data from the database
		$res_arr = mysql_fetch_assoc($result);
		if(isset($_REQUEST['SESSID'])){
			session_id($_REQUEST['SESSID']);
		}
		session_start();														// Start session
		if(isset($_SESSION['count_Auth'])){										// Comparison with POST parameters
				$count_Auth = $_SESSION['count_Auth'];
			} else {
				$count_Auth = 1;
			}
		$send_arr['SESSID'] = session_id();										// Set Session ID
		if($count_Auth <= 5){
			if(isset($res_arr['count_user']) and $res_arr['count_user']){		// If everything is in order shipping confirmation
				$send_arr['Auth'] = 'true';
				$send_arr['count_Auth'] = $count_Auth;
				$send_arr['Message'] = 'Welcome'; 
				echo json_encode($send_arr);
			} else {															// If no authentication is turn on the counter 
				$count_Auth++;													// of unsuccessful attempts 
				$_SESSION['count_Auth'] = $count_Auth;
				$send_arr['Auth'] = 'false';
				$send_arr['count_Auth'] = $count_Auth;
				$send_arr['Message'] = 'No authentication';
				echo json_encode($send_arr);
			}
		} else {
			$send_arr['Auth'] = 'false';
			$send_arr['count_Auth'] = $count_Auth;
			$send_arr['Message'] = 'Account is blocked for 5 minutes';
			echo json_encode($send_arr);
		}
		//var_dump($res_arr);
		// If the count is greater than 5 lock the session for 5 minutes 
		mysql_close($con);
		break;																	// End section authentication 
	}
}

// Functions 

// Access database 
// Set Session ID 

function getCode(){																// Generated test sequence of characters
	return 'SECRET';															// test functional will be updated!
}

// Check the user name for uniqueness 
// Authentication 
// Send an email with a check character sequence 
// preparing and sending messages to the client 

// Variables for protocol Client <-> Server
/*
$username
$email
$password (min (6?) charset)
$birthday (YYYY-MM-DD)
$gender
*/

?>