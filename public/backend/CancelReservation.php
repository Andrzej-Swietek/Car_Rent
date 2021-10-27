<?php
    require_once "DB.php";
    require_once "Headers.php";

    $id = $_GET["reservation_id"];
  
    $db = @new mysqli($host, $db_user, $db_password, $db_name);
    if ($db->connect_errno!=0) throw new Exception(mysqli_connect_errno());
    $select_query = "DELETE FROM Reservations WHERE ID=".$id;
    $db->query($select_query);
    $result = "success ID-$id-deleted-".$select_query;
    echo json_encode([$result]);