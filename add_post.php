<?php
 include "connect.php";

 	define('UPLOAD_DIR', 'images/');
	$image = $_POST['image'];
    $name = $_POST['name'];
    $bookName = $_POST['bookName'];
    $value = $_POST['category'];

 	$authorName = $_POST['authorName'];
 	$bookPrice= $_POST['bookPrice'];
 	$bookCond= $_POST['bookCond'];
 	$postCond = $_POST['postCond'];
 	$postDes= $_POST['postDes'];
 	$meetLoc= $_POST['meetLoc'];
 	$userID= $_POST['userID'];
 	$bookLang= $_POST['bookLang'];





 	
 	$image = str_replace('data:image/png;base64,', '', $image);
	$image = str_replace(' ', '+', $image);
    $realImage = base64_decode($image);
    $file = UPLOAD_DIR . uniqid() . '.png';
 
    file_put_contents($file, $realImage);

    if($value=="Academic General")
    {
    	$sql2 = "INSERT INTO `book_post`(`bookName`, `bookPhoto`, `authorName`, `bookPrice`, `bookCond`, `postCond`, `postDes`, `meetLoc`, `userID`, `catID`, `bookLang`) VALUES ('$bookName','$file','$authorName','$bookPrice' ,'$bookCond','$postCond','$postDes','$meetLoc','$userID','5','$bookLang')";

            if (mysqli_query($conn, $sql2)) {
               // Successfully Login Message.
				     $reg = 'Post Submit Successfully ';
				     
				     // Converting the message into JSON format.
				     $SuccessMSGs = json_encode($reg);
				     
				     // Echo the message.
				     echo $SuccessMSGs ;
            }
    }
    else if($value=="Academic Engg")
    {

    	$sql2 = "INSERT INTO `book_post`(`bookName`, `bookPhoto`, `authorName`, `bookPrice`, `bookCond`, `postCond`, `postDes`, `meetLoc`, `userID`, `catID`, `bookLang`) VALUES ('$bookName','$file','$authorName','$bookPrice' ,'$bookCond','$postCond','$postDes','$meetLoc','$userID','5','$bookLang')";

            if (mysqli_query($conn, $sql2)) {
               // Successfully Login Message.
				     $reg = 'Post Submit Successfully ';
				     
				     // Converting the message into JSON format.
				     $SuccessMSGs = json_encode($reg);
				     
				     // Echo the message.
				     echo $SuccessMSGs ;
            }

    }
 




?>