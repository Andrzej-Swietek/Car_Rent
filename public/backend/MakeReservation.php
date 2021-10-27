<?php
    require_once "DB.php";
    require_once "Headers.php";
    
    $json = json_decode( file_get_contents('php://input'),true );
    $startDate = $json["startDate"];
    $endDate = $json["endDate"];
    $user = (int)$json["user"]+ 0;
    $car = (int)$json["car_id"]+ 0;
    $time = $json["time"];
    $db = @new mysqli($host, $db_user, $db_password, $db_name);
    if ($db->connect_errno!=0) throw new Exception(mysqli_connect_errno());

    $q = "INSERT INTO `Reservations` VALUES(NULL,$user,$car,'$endDate','$startDate','Pending','$time');";
    $db->query($q);
    $db->close();
    echo json_encode($json);