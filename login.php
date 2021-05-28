<?php
include "connect.php";

$name = $_POST['name'];
$password = $_POST['password'];

$sql = "SELECT * FROM `user` WHERE username = '$name' ";

$check = mysqli_fetch_array(mysqli_query($conn,$sql));

  if(isset($check)){
    
     // Successfully Login Message.
     $fire = "SELECT * FROM `user` WHERE username = '$name' ";
 	$res = mysqli_query($conn,$fire);
 	if($res){
 		header("Content-Type: application/json");
 		$i = 0;
 		while($row = mysqli_fetch_assoc($res)){
 			$response[$i]['user_id'] = $row['user_id'];
 			$response[$i]['username'] = $row['username'];
 			$response[$i]['usermail'] = $row['usermail'];
 			$response[$i]['password'] = $row['password'];
 			$response[$i]['university'] = $row['university'];
 			$response[$i]['user_mobile'] = $row['user_mobile'];
 			$response[$i]['registrationdate'] = $row['registrationdate'];
 			$i++;
 		}
 		echo json_encode($response);
 	}
   
   }else{
   	 // Successfully Login Message.
     $onLoginNotSuccess = 'Invalid Username/Password';
     
     // Converting the message into JSON format.
     $SuccessMSG = json_encode($onLoginNotSuccess);
     
     // Echo the message.
     echo $SuccessMSG ; 
   
   }
?>