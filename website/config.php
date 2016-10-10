<?php

//-----------------------------------------
// Fill in your MySQL server details here
//-----------------------------------------
$MySQL_Address 	= "127.0.0.1";
$MySQL_Username 	= "root";
$MySQL_Password		= "";
$MySQL_Database		= "jban";

//-----------------------------------------
// Fill in your ban table name here
//-----------------------------------------
$MySQL_Table		= "samp_ban";

//-----------------------------------------
// Fill in your server information
//-----------------------------------------
$Server_Name = 'My Server';

$OrderReplace = array("ban_timestamp", "user_banned", "user_banner", "ban_reason", "ban_timestamp", "ban_timeleft");

$data = mysql_connect($MySQL_Address, $MySQL_Username, $MySQL_Password);

if(!$data) die('[jBan]: MySQL connection error, please check your database settings');

mysql_select_db($MySQL_Database);

?>