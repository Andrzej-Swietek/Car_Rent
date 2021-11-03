<?php
    require_once "DB.php";
    require_once "Headers.php";
  try {
 
    $db = @new mysqli($host, $db_user, $db_password, $db_name);
    if ($db->connect_errno!=0) throw new Exception(mysqli_connect_errno());
    $select_query = "SELECT Reservations.ID, Reservations.DateStart, Reservations.DateEnd, Reservations.Status, Reservations.Time, Cars.Brand, Cars.Model, Cars.Year,Cars.CarCondition, Cars.Image, Cars.Price FROM `Reservations` LEFT JOIN users ON Id_user = users.ID LEFT JOIN Cars ON Id_car = Cars.ID WHERE Reservations.Status='Accepted'"; 
    
    $result = $db->query($select_query);
    $array = [];
    while( $row = $result->fetch_assoc() )
        $array[] = $row;
    
    $db->close();
    echo json_encode($array);


  }catch(Exception $e) {
        echo "ERR";
  }