<?php
// local host, ID, Password, Database
$conn = mysqli_connect('localhost', 'root', 'root', 'CultureDiary');
header('Content-Type: charset=utf-8');
$userid = ($_POST['id']); 
$password = ($_POST['password']); 
$password = md5($password);
$username = ($_POST['name']);
$sql= "insert into user (userid, passwd, username) values ('$userid','$password','$username')";
if (mysqli_query($conn, $sql)) { 
echo ' Insert Done!! ';
} else {
echo mysqli_error($conn); 
}
mysqli_close($conn); ?>