<?php
    require_once "DB.php";
    require_once "Headers.php";

    $db = @new mysqli($host, $db_user, $db_password, $db_name);
    if ($db->connect_errno!=0) throw new Exception(mysqli_connect_errno());
    $select_query = "SELECT DISTINCT CarCondition FROM Cars";
    $result = $db->query($select_query);
    $array = [];
    while( $row = $result->fetch_assoc() ){
        $v = $row["CarCondition"];
        $array[] = $v;
    }

    $db->close();
    echo json_encode($array);