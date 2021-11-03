<?php
    require_once "DB.php";
    require_once "Headers.php";
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST');
    header("Access-Control-Allow-Headers: X-Requested-With");
    
    $id = $_GET["id"];
    $role = $_GET["perm"];
       
    $db = @new mysqli($host, $db_user, $db_password, $db_name);
    if ($db->connect_errno!=0) throw new Exception(mysqli_connect_errno());
    $edit_query = "UPDATE users SET Role='".$role."' WHERE ID=".$id;

    $result = $db->query($edit_query);
    
    $db->close();

    echo json_encode("{success:ok,id:$id,role:$role}");