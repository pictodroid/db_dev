<?php
/**
 * This example shows sending a message using PHP's mail() function.
 */

require 'phpmailer/PHPMailerAutoload.php';

//Create a new PHPMailer instance
$mail = new PHPMailer;

$mail->SMTPDebug = 2;

$mail->isSMTP();
?>