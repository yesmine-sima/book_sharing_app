<?php


 include "connect.php";

$name = $_POST['name'];
$password = $_POST['password'];
$email = $_POST['email'];
$varsity = $_POST['varsity'];
$mobile = $_POST['mobile'];

$sql = "SELECT * FROM `user` WHERE username = '$name' ";

$check = mysqli_fetch_array(mysqli_query($conn,$sql));

  if(isset($check)){
    
     // Successfully Login Message.
     $onLoginSuccess = 'Login Matched';
     
     // Converting the message into JSON format.
     $SuccessMSG = json_encode($onLoginSuccess);
     
     // Echo the message.
     echo $SuccessMSG ; 
   
   } else{

   		 $sql2 = "INSERT INTO `user`(`username`, `password`,`usermail`,`university`,`user_mobile`) VALUES ('$name','$password', '$email','$varsity' ,'$mobile')";

            if (mysqli_query($conn, $sql2)) {
               // Successfully Login Message.
				     $reg = 'registered';
				     
				     // Converting the message into JSON format.
				     $SuccessMSGs = json_encode($reg);
				     
				     // Echo the message.
				     echo $SuccessMSGs ;
            }



   }



?>