<?php
//require_once('phpmailer/mail.php');
require_once('phpmailer/gmail.php');
require_once('db_connect.php');
$db = new DB_CONNECT;
$con = $db->connect();
// Get POST parameters
if(isset($_REQUEST)){
	switch($_REQUEST['action']){

		case 'getCode':															// If the primary authentication
		$SQL = 'SELECT COUNT(*) as `count_user`
		FROM `user`
		WHERE username=\''.$_REQUEST['username'].'\'
		AND email=\''.$_REQUEST['email'].'\'';
		$result = mysql_query($SQL);											// retrieve data from the database 
		$res_arr = mysql_fetch_assoc($result); 
		//echo $res_arr['count_user'].'<br>';
		if(!$res_arr['count_user']){											// if this user is not in database
			session_start();													// Start session
			$username 	= $_REQUEST['username'];
			$email 		= $_REQUEST['email'];
			$password 	= $_REQUEST['password'];
			$birthday	= $_REQUEST['birthday'];
			$gender = 0;
			if($_REQUEST['gender']=='male') $gender = 1;
			$SQL = " INSERT INTO `user` (username,email,password,birthday,gender) 
			VALUES ('$username','$email','$password','$birthday','$gender') ";
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

		case 'forgotPass':
		$SQL = 'SELECT COUNT(*) as `count_user`, username
		FROM `user`
		WHERE email=\''.$_REQUEST['email'].'\'';
		$result = mysql_query($SQL);											// retrieve data from the database 
		$res_arr = mysql_fetch_assoc($result); 
		//echo $res_arr['count_user'].'<br>';
		if($res_arr['count_user']){												// if this email in database
				$tmpPassword = getTmpPass();									// get new tmpPassword
				$email = $_REQUEST['email'];
				$mail->setFrom('pictolike@gmail.com', 'PictoLike Team');		// Send an email with a check character sequence 
				$mail->addAddress($email, 'PictoLike User');
				$mail->Subject = 'Forgot Password';
				$message = "Your temporary password: $tmpPassword for the account: $res_arr[username]
							change the temporary password after login. 
							Team PictoLike";
				$mail->msgHTML($message);
				$mail->AltBody = '';
				if ($mail->send()){
					$SQL = "UPDATE `user` SET `password` = '$tmpPassword' WHERE email = '$_REQUEST[email]'";
					$result = mysql_query($SQL);
					if($result){
						session_start();										// Start session
						$send_arr['SESSID']	= session_id();						// Set Session ID
						$send_arr['Message'] = 'Temporary password sent to your email (look you email) change the temporary password after login';
						echo json_encode($send_arr);
					} else {
						$send_arr['Message'] = 'ErrorDB: don\'t change you password';
						echo json_encode($send_arr);
					}
				} else {
					$send_arr['Message'] = 'Error: don\'t send password to you email';
					echo json_encode($send_arr);
				}
		}
		break;

		case 'chPass':
		$SQL = 'SELECT COUNT(*) as `count_user`
		FROM `user`
		WHERE username=\''.$_REQUEST['username'].'\'
		AND email=\''.$_REQUEST['email'].'\'
		AND `password`=\''.$_REQUEST['password'].'\'';
		$result = mysql_query($SQL);											// retrieve data from the database 
		$res_arr = mysql_fetch_assoc($result);
		if($res_arr['count_user']){
			if(isset($_REQUEST['SESSID'])){
				session_id($_REQUEST['SESSID']);								// Set Session ID
				session_start();
				if($_REQUEST['pass1'] == $_REQUEST['pass2']){					// Comparison with POST parameters If everything is in order shipping confirmation
					$email = $_REQUEST['email'];
					$mail->setFrom('pictolike@gmail.com', 'PictoLike Team');	// Send an email with a check character sequence 
					$mail->addAddress($email, 'PictoLike User');
					$mail->Subject = 'Change Password';
					$message = "Your password has been changed ($_REQUEST[pass1]). Team PictoLike";
					$mail->msgHTML($message);
					$mail->AltBody = '';
					if ($mail->send()){
						$send_arr['SESSID'] = session_id();						// Set Session ID
						$SQL = "UPDATE `user` SET `password` = '$_REQUEST[pass1]' WHERE email = '$_REQUEST[email]'";
						$result = mysql_query($SQL);
						if($result){
							$send_arr['Auth'] = 'false';
							$send_arr['Message'] = 'Change Password is successful. Relogin please.';
							echo json_encode($send_arr);						// shipping confirmation
						} else {
							$send_arr['Auth'] = 'true';
							$send_arr['Message'] = 'Change Password is unsuccessful.';
							echo json_encode($send_arr);
						}
					} else {
						$send_arr['Auth'] = 'true';
						$send_arr['Message'] = 'Email don\'t send.';
						echo json_encode($send_arr);
					}					
				} else {
					$send_arr['Auth'] = 'false';
					$send_arr['Message'] = 'Passwords do not match.';
					echo json_encode($send_arr);
				}
			} else {															// If the check does not match the sequence of characters stored in the database send a message 
				$send_arr['Auth'] = 'false';
				$send_arr['Message'] = 'No authentication';
				echo json_encode($send_arr);
			}
		}
		mysql_close($con);
		break;

		case 'testCode':														// If the reception receipt verifying the sequence of symbols 
		// retrieve data from the database 
		$SQL = 'SELECT COUNT(*) as `count_user`
		FROM `user`
		WHERE username=\''.$_REQUEST['username'].'\'
		AND email=\''.$_REQUEST['email'].'\'
		AND `password`=\''.$_REQUEST['password'].'\'';
		$result = mysql_query($SQL);											// retrieve data from the database 
		$res_arr = mysql_fetch_assoc($result); 
		//echo $res_arr['count_user'].'<br>';
		if($res_arr['count_user'] == 1){										// if this user in database
			if(isset($_REQUEST['SESSID'])){
				session_id($_REQUEST['SESSID']);								// Set Session ID
				session_start();
				if($_SESSION['CODE'] == $_REQUEST['CODE']){						// Comparison with POST parameters If everything is in order shipping confirmation
					$send_arr['SESSID'] = session_id();							// Set Session ID
					$send_arr['Auth'] = 'true';
					$send_arr['Message'] = 'Authentication is successful';
					echo json_encode($send_arr);								// shipping confirmation
				} else {
					$send_arr['Auth'] = 'false';
					$send_arr['Message'] = 'No authentication';
					echo json_encode($send_arr);
				}
				
			} else {															// If the check does not match the sequence of characters stored in the database send a message 
				$send_arr['Auth'] = 'false';
				$send_arr['Message'] = 'No authentication';
				echo json_encode($send_arr);
			}
		} else {
			$send_arr['Auth'] = 'false';
			$send_arr['Message'] = 'Error: DB_Error';
			echo json_encode($send_arr);
		}
		mysql_close($con);
		break;																	//End section confirmation parity symbol sequences
		
		case 'getAuth':															// If authentication 
		$SQL = 'SELECT COUNT(*) as `count_user`
		FROM `user`
		WHERE username=\''.$_REQUEST['username'].'\'
		
		AND `password`=\''.$_REQUEST['password'].'\'';							// -- AND email=\''.$_REQUEST['email'].'\'
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

function getCode(){																// Generated test sequence of characters
	return 'SECRET';															// test functional will be updated!
}

function getTmpPass(){
	return 'tempPassword';
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
/*

Get CODE
Request to server:			http://winded976.ddns.net/m_app/sign.php?action=getCode&username=hoofar10&email=hpourzand@gmail.com&password=1000&gender=male&birthday=1981-10-10
Response from server:		{"SESSID":"f071317a46585de416ebdb96efa491df","Auth":"true","Message":"Please input CODE (look you email)"}

Test CODE
Request to server:			http://winded976.ddns.net/m_app/sign.php?action=testCode&username=hoofar10&email=hpourzand@gmail.com&password=1000&CODE=SECRET&SESSID=f071317a46585de416ebdb96efa491df
Response from server:		{"SESSID":"f071317a46585de416ebdb96efa491df","Auth":"true","Message":"Authentication is successful"}

LogIn
Request to server:			http://winded976.ddns.net/m_app/sign.php?action=getAuth&username=hoofar10&password=1000
Response from server:		{"SESSID":"f071317a46585de416ebdb96efa491df","Auth":"true","count_Auth":1,"Message":"Welcome"}

Forgot Password
Request to server:			http://winded976.ddns.net/m_app/sign.php?action=forgotPass&email=hpourzand@gmail.com
Response from server:		{"SESSID":"f071317a46585de416ebdb96efa491df","Message":"Temporary password sent to your email (look you email) change the temporary password after login"}

Change Password
Request to server:			http://winded976.ddns.net/m_app/sign.php?action=chPass&username=hoofar&email=hpourzand@gmail.com&password=tempPassword&pass1=123&pass2=123&SESSID=f071317a46585de416ebdb96efa491df
Response from server:		{"SESSID":"f071317a46585de416ebdb96efa491df","Auth":"false","Message":"Change Password is successful. Relogin please."}

*/

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

//var_dump($_REQUEST);
?>